<p align="center">
  <!-- Ganti 00000000c23481fa8e39c0f7b63d8b32 dengan link gambar logomu, atau taruh file logo.png di repo lalu isi dengan: logo.png -->
  <img src="logo.png" alt="HoxTrix Logo" width="180" height="180">
</p>

<h1 align="center">🚀 HoxTrix UI Library</h1>

<p align="center">
  <img src="https://img.shields.io/github/languages/top/sakilawati52-dot/HoxTrix-Library?color=blue" alt="Top Language">
  <img src="https://img.shields.io/github/license/sakilawati52-dot/HoxTrix-Library?color=green" alt="License">
</p>

**HoxTrix** adalah UI Library modern, ringan, dan responsif berbasis Luau (Roblox Lua) yang dirancang khusus untuk pembuatan *exploit script hub*. Menampilkan desain *dark mode* yang minimalis, navigasi tab yang mulus, serta performa yang dioptimalkan agar aman dan lancar saat dieksekusi di berbagai mobile maupun PC executor seperti **Delta, Vega X, Wave, Fluxus**, dan lainnya.

---

## ✨ Fitur Utama
* 📱 **Universal Support:** Kompatibel dengan `gethui` dan perlindungan GUI CoreGui standar.
* 🛡️ **Safe & Draggable:** Menu utama dapat digeser (*draggable*) dengan aman tanpa *glitch*.
* 🗂️ **Dynamic Sidebar Tabs:** Pergantian tab instan dengan penyesuaian warna indikator yang dinamis.
* ⚡ **Auto-scaling Content:** Halaman konten otomatis bertambah panjang (*scrolling canvas*) saat elemen bertambah.
* 🛠️ **Essential UI Elements:** Dilengkapi dengan komponen dasar siap pakai seperti *Buttons* dan *Toggles*.

---

## 💻 Cara Penggunaan (Bootstring)

Gunakan kode di bawah ini di dalam executor kamu untuk langsung memuat **HoxTrix Library**:

```lua
local HoxTrixLib = loadstring(game:HttpGet("[https://raw.githubusercontent.com/sakilawati52-dot/HoxTrix-Library/refs/heads/main/Main.lua](https://raw.githubusercontent.com/sakilawati52-dot/HoxTrix-Library/refs/heads/main/Main.lua)"))()

-- Mulai membuat skrip kamu di bawah ini





-- 1. Inisialisasi Library
local HoxTrixLib = loadstring(game:HttpGet("[https://raw.githubusercontent.com/sakilawati52-dot/HoxTrix-Library/refs/heads/main/Main.lua](https://raw.githubusercontent.com/sakilawati52-dot/HoxTrix-Library/refs/heads/main/Main.lua)"))()

-- 2. Membuat Window Utama
local Window = HoxTrixLib:CreateWindow("HoxTrix Hub v1.0")

-- 3. Membuat Tab Kategori
local MainTab = Window:CreateTab("Fitur Utama")
local MiscTab = Window:CreateTab("Lainnya")

-- 4. Menambahkan Tombol (Button)
MainTab:CreateButton("Teleport ke Safe Zone", function()
    print("Mengeksekusi perintah teleportasi...")
    -- Masukkan kode logika game kamu di sini
end)

-- 5. Menambahkan Sakelar (Toggle)
MainTab:CreateToggle("Auto Farm Koin", false, function(state)
    _G.AutoFarm = state
    while _G.AutoFarm do
        print("Sedang farming...")
        task.wait(1) -- Jeda waktu aman agar tidak crash
    end
end)

-- 6. Menambahkan Tombol di Tab Lainnya
MiscTab:CreateButton("Server Rejoin", function()
    local ts = game:GetService("TeleportService")
    local p = game.Players.LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

