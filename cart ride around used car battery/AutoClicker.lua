--[[
    Hold -> Q / Active
    Release -> Q / Stop

    Execute: "_G.AutoClick = false" in a new script to stop this script,
    "_G.StepCount = #" to modify current step count in a new script.

    Author: interpreterK
    Used & tested with Synapse X
]]

local StepCount = 10 -- Modify how many clicks you want to register every frame per second. (1000 = Overkill)
--[[
    x = FPS
    StepCount * x
    
    StepCount=50 * FPS=144 = 7200 clicks per second
]]

if fireclickdetector == nil then
    warn("Your exploit wont work with this script.")
end
if _G.AutoClick then
    print("AutoClick script is already present. Use \"_G.AutoClick = false\" to deactivate if you think this is a mistake.")
    return
end
Step =  (_G.StepCount < 1 and 1) or _G.StepCount
_G.StepCount = StepCount

local RS = game:GetService("RunService")
local Players = game:GetService("Players")
local Mouse = Players.LocalPlayer:GetMouse()

local AutoClick = false

Mouse.KeyDown:Connect(function(k)
    if k == "q" then
        AutoClick = true
    end
end)
Mouse.KeyUp:Connect(function(k)
    if k == "q" then
        AutoClick = false
    end
end)

_G.AutoClick = true
local rStep
rStep = RS.RenderStepped:Connect(function(deltaTime)
    if AutoClick then
        local t = Mouse.Target
        local c = t and t:FindFirstChildOfClass("ClickDetector")
        if c then
            for i = 1, Step do
                fireclickdetector(c)
            end
        end
    end
    if not _G.AutoClick then
        rStep:Disconnect()
        script:Destroy()
    end
end)