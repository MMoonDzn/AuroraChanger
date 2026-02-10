--- Womp Womp 💦
if identifyexecutor() == "Solara" or identifyexecutor() == "Xeno" then
    game:GetService("Players").LocalPlayer:Kick("[Aurora Loader] \n Executor not supported.\n \n Join: https://discord.gg/projectaurora if u need support")
    setclipboard("https://discord.gg/projectaurora")
    return
end

local lplr = game:GetService("Players").LocalPlayer
local olderror = error
getgenv().error = function(...) lplr:Kick(...) end
error = getgenv().error
local function Verify()
    if type(getconnections) ~= "function" then
        return false
    end

    local event = Instance.new("BindableEvent")
    local fired = false

    event.Event:Connect(function()
        fired = true
    end)

    local success, connections = pcall(getconnections, event.Event)

    if not success or type(connections) ~= "table" or #connections == 0 then
        return false
    end

    local connection = connections[1]
    if type(connection.Disconnect) ~= "function" then
        return false
    end

    connection:Disconnect()
    event:Fire()

    return fired == false
end

if Verify() then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/62cee44fa4b2a83752a4ea9e8eef7081.lua"))()
    getgenv().error = olderror
    error = olderror
else
    lplr:Kick("[LOADER] Unsupported Executor - Missing getconnections")
end
