--[[
    Author: interpreterK
    Used & tested with Synapse X
]]

if fireclickdetector == nil then
    warn("Your exploit wont work with this script.")
end
for _,v in next, workspace:GetChildren() do
    if v:IsA("Model") and v.Name:find("Cart") then
        local s = v:FindFirstChild("stop")
        local c = s and s:FindFirstChildOfClass("ClickDetector")
        if c then
            fireclickdetector(c)
        end
    end
end