return function()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local gui = player:WaitForChild("PlayerGui")
    local camera = workspace.CurrentCamera

    local function getClickPosition()
        local screenSize = camera.ViewportSize
        local x = screenSize.X * 0.5
        local y = screenSize.Y * 0.663999975
        return Vector2.new(x, y)
    end

    local function simulateClickAt(position)
        VirtualInputManager:SendMouseButtonEvent(position.X, position.Y, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(position.X, position.Y, 0, false, game, 0)
    end

    while true do
        task.wait(1)
        local button = gui:FindFirstChild("PlayAgainButton", true)
        if button and button.Visible then
            print("Simulating real click at relative position...")
            local clickPos = getClickPosition()
            simulateClickAt(clickPos)
        end
    end
end
