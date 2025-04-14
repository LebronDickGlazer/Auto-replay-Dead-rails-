-- LocalScript: Put this in StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local VirtualInputManager = game:GetService("VirtualInputManager")
local gui = player:WaitForChild("PlayerGui")
local camera = workspace.CurrentCamera

-- Calculate the screen click position based on relative UDim2
local function getClickPosition()
    local screenSize = camera.ViewportSize
    local x = screenSize.X * 0.5
    local y = screenSize.Y * 0.663999975
    return Vector2.new(x, y)
end

-- Simulate a real mouse click at that position
local function simulateClickAt(position)
    VirtualInputManager:SendMouseButtonEvent(position.X, position.Y, 0, true, game, 0)
    VirtualInputManager:SendMouseButtonEvent(position.X, position.Y, 0, false, game, 0)
end

-- Repeat until the UI is active
while true do
    task.wait(1)

    local button = gui:FindFirstChild("PlayAgainButton", true)
    if button and button.Visible then
        print("Simulating real click at relative position...")
        local clickPos = getClickPosition()
        simulateClickAt(clickPos)
	end
