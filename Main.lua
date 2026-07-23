# Viethub-pro-
Petapeta 
-- HASH IDENTIFIER BYPASS: 58bdb0048fc9c2f6aef7fba1cd1192639f2fc5ff
local p, tg = game:GetService("Players").LocalPlayer, "HashTag"
local pGui = p:WaitForChild("PlayerGui")
if pGui:FindFirstChild("PetaHashMenu") then pGui viethubpro:Destroy() end

local sg = Instance.new("ScreenGui", pGui) sg.Name, sg.ResetOnSpawn = "PetaHashMenu", false
local fr = Instance.new("Frame", sg) fr.Size, fr.Position, fr.BackgroundColor3, fr.Active, fr.Draggable = UDim2.new(0,160,0,140), UDim2.new(0.1,0,0.3,0), Color3.fromRGB(15,15,20), true, true
local tl = Instance.new("TextLabel", fr) tl.Size, tl.Text, tl.TextColor3, tl.BackgroundColor3, tl.Font, tl.TextSize = UDim2.new(1,0,0,25), "PETA HASH PRO", Color3.fromRGB(0,255,150), Color3.fromRGB(5,5,10), 3, 12

getgenv().TextESP, getgenv().AutoPick, getgenv().SpeedNhanh = false, false, false

local function cBtn(txt, pos, val)
    local b = Instance.new("TextButton", fr) b.Size, b.Position, b.BackgroundColor3, b.TextColor3, b.Font, b.TextSize = UDim2.new(0,140,0,32), pos, Color3.fromRGB(35,35,40), Color3.fromRGB(255,255,255), 3, 11
    b.Text = txt..": TẮT"
    b.MouseButton1Click:Connect(function()
        getgenv()[val] = not getgenv()[val]
        b.Text = txt..(getgenv()[val] and ": BẬT" or ": TẮT")
        b.BackgroundColor3 = getgenv()[val] and Color3.fromRGB(0,140,70) or Color3.fromRGB(35,35,40)
    end)
end

cBtn("Định Vị Chữ", UDim2.new(0,10,0,32), "TextESP")
cBtn("Auto Nhặt Đồ", UDim2.new(0,10,0,68), "AutoPick")
cBtn("Tăng Tốc Chạy", UDim2.new(0,10,0,104), "SpeedNhanh")

local function tag(part, text, color)
    if not part or part:FindFirstChild(tg) or part.Parent:FindFirstChild(tg) then return end
    local bb = Instance.new("BillboardGui", part) bb.Name, bb.AlwaysOnTop, bb.Size, bb.MaxDistance = tg, true, UDim2.new(0,90,0,18), 60
    local l = Instance.new("TextLabel", bb) l.Size, l.Text, l.TextColor3, l.BackgroundTransparency, l.Font, l.TextSize, l.TextStrokeTransparency = UDim2.new(1,0,1,0), text, color, 1, 3, 10, 0
end

-- VÒNG LẶP XỬ LÝ ĐỊNH VỊ VÀ AUTO NHẶT RIÊNG BIỆT
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local hrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") and v.Parent then
                        local dist = (hrp.Position - v.Position).Magnitude
                        if dist <= 60 then
                            local n, pn = v.Name:lower(), v.Parent.Name:lower()
                            local pr = v:FindFirstChildOfClass("ProximityPrompt") or v.Parent:FindFirstChildOfClass("ProximityPrompt")
                            
                            -- XỬ LÝ ĐỊNH VỊ CHỮ (BẬT/TẮT RIÊNG BẰNG NÚT 1)
                            if getgenv().TextESP then
                                if n:match("peta") or n:match("ghost") or pn:match("peta") then
                                    tag(v, "⚠️ [QUÁI PETAPETA]", Color3.fromRGB(255,0,0))
                                elseif pr or n:match("key") or n:match("chia") or pn:match("key") or n:match("ofuda") or n:match("doll") or n:match("safe") or n:match("ket") or n:match("chest") or n:match("ruong") then
                                    local lt, lc = "⭐ [NHIỆM VỤ]", Color3.fromRGB(0,255,150)
                                    if n:match("key") or n:match("chia") or pn:match("key") then lt, lc = "🔑 [CHÌA KHÓA]", Color3.fromRGB(0,190,255)
                                    elseif n:match("safe") or n:match("ket") or pn:match("safe") then lt, lc = "🔐 [KÉT SẮT]", Color3.fromRGB(255,165,0)
                                    elseif n:match("chest") or n:match("ruong") or pn:match("chest") then lt, lc = "📦 [RƯƠNG ĐỒ]", Color3.fromRGB(160,90,40) end
                                    tag(v, lt, lc)
                                end
                            else
                                if v:FindFirstChild(tg) then v[tg]:Destroy() end
                            end

                            -- XỬ LÝ TỰ ĐỘNG NHẶT ĐỒ (BẬT/TẮT RIÊNG BẰNG NÚT 2)
                            if getgenv().AutoPick and pr and dist <= 15 then
                                if n:match("key") or n:match("chia") or pn:match("key") or n:match("ofuda") or n:match("doll") or n:match("safe") or n:match("ket") or n:match("chest") or n:match("ruong") or pr then
                                    fireproximityprompt(pr)
                                end
                            end
                        else
                            if v:FindFirstChild(tg) then v[tg]:Destroy() end
                        end
                    end
                end
            end
        end)
    end
end)

-- DUY TRÌ TỐC ĐỘ DI CHUYỂN
game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        if p.Character then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = getgenv().SpeedNhanh and 38 or 16
            end
        end
    end)
end)

