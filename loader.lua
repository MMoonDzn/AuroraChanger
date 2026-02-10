--- Womp Womp 💦
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
else
    game.Players.LocalPlayer:Kick("[LOADER] Unsupported Executor - Missing getconnections")
end
