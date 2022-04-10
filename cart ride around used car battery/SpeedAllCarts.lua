--[[
    Author: interpreterK
    Used & tested with Synapse X
]]

local Speed = 100
local Reverse = false

if fireclickdetector == nil then
    warn("Your exploit wont work with this script.")
end
Speed = (Speed < 1 and 1) or Speed / 2
for _,v in next, workspace:GetChildren() do
    if v:IsA("Model") and v.Name:find("Cart") then
        local f = Reverse and v:FindFirstChild("backward") or v:FindFirstChild("forward")
        local c = f and f:FindFirstChildOfClass("ClickDetector")
        if c then
            coroutine.wrap(function()
                for i = 1, Speed do
                    fireclickdetector(c)
                end
            end)()
        end
    end
end