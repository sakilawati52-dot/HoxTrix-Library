local HoxTrix = {}

function HoxTrix:CreateWindow(title)
    -- 1. Core CoreGui Setup (Aman untuk Executor)
    local ScreenGui = Instance.new("ScreenGui")
    if gethui then
        ScreenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = game:CoreGui
    else
        ScreenGui.Parent = game:CoreGui
    end
    ScreenGui.Name = "HoxTrix_UI"
    
    -- 2. Main Windows Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 520, 0, 360)
    MainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true -- Memperbolehkan menu digeser
    MainFrame.Parent = ScreenGui
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 9)
    MainCorner.Parent = MainFrame
    
    -- 3. Top Bar (Judul & Tombol Close)
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    
    local TopCorner = Instance.new("UICorner")
    TopCorner.CornerRadius = UDim.new(0, 9)
    TopCorner.Parent = TopBar
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -50, 1, 0)
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.Text = title or "HoxTrix Engine"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 15
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Parent = TopBar
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(240, 80, 80)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 22
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Parent = TopBar
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- 4. Sidebar Container (Tempat Tab)
    local Sidebar = Instance.new("Frame")
    Sidebar.Position = UDim2.new(0, 8, 0, 48)
    Sidebar.Size = UDim2.new(0, 130, 1, -56)
    Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = MainFrame
    
    local SideCorner = Instance.new("UICorner")
    SideCorner.CornerRadius = UDim.new(0, 6)
    SideCorner.Parent = Sidebar
    
    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Padding = UDim.new(0, 5)
    TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabListLayout.Parent = Sidebar
    
    -- 5. Content Container (Tempat isi Fitur)
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Position = UDim2.new(0, 144, 0, 48)
    ContentContainer.Size = UDim2.new(1, -152, 1, -56)
    ContentContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Parent = MainFrame
    
    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 6)
    ContentCorner.Parent = ContentContainer

    -- LOGIKA PEMBUATAN ELEMEN
    local Window = {}
    local isFirstTab = true
    
    function Window:CreateTab(tabName)
        -- Halaman Konten Kontainer
        local TabPage = Instance.new("ScrollingFrame")
        TabPage.Name = tabName .. "_Page"
        TabPage.Size = UDim2.new(1, -10, 1, -10)
        TabPage.Position = UDim2.new(0, 5, 0, 5)
        TabPage.BackgroundTransparency = 1
        TabPage.BorderSizePixel = 0
        TabPage.ScrollBarThickness = 3
        TabPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabPage.Visible = isFirstTab
        TabPage.Parent = ContentContainer
        
        local PageLayout = Instance.new("UIListLayout")
        PageLayout.Padding = UDim.new(0, 6)
        PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        PageLayout.Parent = TabPage
        
        -- Otomatis memperluas canvas scrolling frame saat item bertambah
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabPage.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 10)
        end)
        
        -- Tombol Navigasi di Sidebar
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(0, 120, 0, 32)
        TabButton.BackgroundColor3 = isFirstTab and Color3.fromRGB(70, 80, 240) or Color3.fromRGB(35, 35, 40)
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.Font = Enum.Font.GothamMedium
        TabButton.TextSize = 13
        TabButton.Parent = Sidebar
        
        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 5)
        BtnCorner.Parent = TabButton
        
        if isFirstTab then isFirstTab = false end
        
        -- Fungsi Ganti Tab saat diklik
        TabButton.MouseButton1Click:Connect(function()
            for _, page in ipairs(ContentContainer:GetChildren()) do
                if page:IsA("ScrollingFrame") then page.Visible = false end
            end
            for _, btn in ipairs(Sidebar:GetChildren()) do
                if btn:IsA("TextButton") then btn.BackgroundColor3 = Color3.fromRGB(35, 35, 40) end
            end
            TabPage.Visible = true
            TabButton.BackgroundColor3 = Color3.fromRGB(70, 80, 240)
        end)
        
        local TabElements = {}
        
        -- FITUR: CREATE BUTTON
        function TabElements:CreateButton(text, callback)
            local callback = callback or function() end
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, -10, 0, 36)
            Button.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            Button.Text = "  " .. text
            Button.TextColor3 = Color3.fromRGB(240, 240, 240)
            Button.Font = Enum.Font.Gotham
            Button.TextSize = 13
            Button.TextXAlignment = Enum.TextXAlignment.Left
            Button.Parent = TabPage
            
            local ElementCorner = Instance.new("UICorner")
            ElementCorner.CornerRadius = UDim.new(0, 5)
            ElementCorner.Parent = Button
            
            Button.MouseButton1Click:Connect(function()
                pcall(callback)
            end)
        end
        
        -- FITUR: CREATE TOGGLE
        function TabElements:CreateToggle(text, default, callback)
            local callback = callback or function() end
            local toggled = default or false
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(1, -10, 0, 36)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            ToggleFrame.Parent = TabPage
            
            local ElementCorner = Instance.new("UICorner")
            ElementCorner.CornerRadius = UDim.new(0, 5)
            ElementCorner.Parent = ToggleFrame
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Size = UDim2.new(1, -60, 1, 0)
            ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
            ToggleLabel.Text = text
            ToggleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.TextSize = 13
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Parent = ToggleFrame
            
            local ToggleSwitch = Instance.new("TextButton")
            ToggleSwitch.Size = UDim2.new(0, 24, 0, 24)
            ToggleSwitch.Position = UDim2.new(1, -34, 0.5, -12)
            ToggleSwitch.BackgroundColor3 = toggled and Color3.fromRGB(0, 200, 120) or Color3.fromRGB(60, 60, 65)
            ToggleSwitch.Text = ""
            ToggleSwitch.Parent = ToggleFrame
            
            local SwitchCorner = Instance.new("UICorner")
            SwitchCorner.CornerRadius = UDim.new(0, 5)
            SwitchCorner.Parent = ToggleSwitch
            
            ToggleSwitch.MouseButton1Click:Connect(function()
                toggled = not toggled
                ToggleSwitch.BackgroundColor3 = toggled and Color3.fromRGB(0, 200, 120) or Color3.fromRGB(60, 60, 65)
                pcall(callback, toggled)
            end)
        end
        
        return TabElements
    end
    
    return Window
end

return HoxTrix
