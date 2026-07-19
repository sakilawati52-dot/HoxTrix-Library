# 📖 HoxTrix Library Documentation

## Installation

```lua
local HoxTrix = loadstring(game:HttpGet("https://raw.githubusercontent.com/sakilawati52-dot/HoxTrix-Library/refs/heads/main/Main.lua"))()
```

---

# Create Window

```lua
local Window = HoxTrix:CreateWindow("HoxTrix Hub v1.0")
```

Membuat window utama.

---

# Create Tab

```lua
local MainTab = Window:CreateTab("Main")
local MiscTab = Window:CreateTab("Misc")
```

Membuat tab baru.

---

# Create Button

```lua
MainTab:CreateButton("Teleport Safe Zone", function()

    print("Teleporting...")

end)
```

Membuat tombol.

---

# Create Toggle

```lua
MainTab:CreateToggle("Auto Farm", false, function(state)

    _G.AutoFarm = state

    while _G.AutoFarm do
        print("Farming...")
        task.wait(1)
    end

end)
```

Membuat Toggle.

---

# Full Example

```lua
local HoxTrix = loadstring(game:HttpGet("https://raw.githubusercontent.com/sakilawati52-dot/HoxTrix-Library/refs/heads/main/Main.lua"))()

local Window = HoxTrix:CreateWindow("HoxTrix Hub")

local Main = Window:CreateTab("Main")
local Misc = Window:CreateTab("Misc")

Main:CreateButton("Teleport", function()

    print("Teleport")

end)

Main:CreateToggle("Auto Farm", false, function(state)

    _G.AutoFarm = state

    while _G.AutoFarm do
        print("Farming...")
        task.wait()
    end

end)

Misc:CreateButton("Rejoin", function()

    local TS = game:GetService("TeleportService")

    TS:Teleport(game.PlaceId, game.Players.LocalPlayer)

end)
```

---

# API

## Library

```lua
HoxTrix:CreateWindow(title)
```

## Window

```lua
Window:CreateTab(name)
```

## Tab

```lua
Tab:CreateButton(name, callback)

Tab:CreateToggle(name, default, callback)
```

---

# License

Copyright © HoxTrix Library.

Free to use for personal Roblox projects.