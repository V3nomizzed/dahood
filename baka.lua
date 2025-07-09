local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local invisible = false

local function setInvisible(state)
    local character = player.Character
    if not character then return end

    for _, obj in pairs(character:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("MeshPart") then
            obj.Transparency = state and 1 or 0
            obj.CanCollide = not state
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            obj:Destroy()  -- verhindert Gesicht
        elseif obj:IsA("Accessory") then
            obj:Destroy() -- entfernt z. B. Hüte komplett
        elseif obj:IsA("Shirt") or obj:IsA("Pants") then
            if state then obj:Destroy() end -- auch Kleidung optional zerstören
        end
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.P then
        invisible = not invisible
        setInvisible(invisible)
    end
end)
