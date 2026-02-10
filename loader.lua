--- Womp Womp 💦
if identifyexecutor() == "Solara" or identifyexecutor() == "Xeno" then
    game:GetService("Players").LocalPlayer:Kick("[Aurora Loader] \n Executor not supported.\n \n Join: https://discord.gg/projectaurora if u need support")
    setclipboard("https://discord.gg/projectaurora")
    return
end

local LocalPlayer = game.GetService(game, "Players").LocalPlayer
local Kick = LocalPlayer.Kick
if not xpcall then
    return Kick(LocalPlayer, "tf?")
end
xpcall(function()
    if type(getgenv) ~= "function" then return error("missing genv") end
    local GlobalEnv = getgenv()
    if type(GlobalEnv) ~= "table" then return error("missing genv") end 
    local getconnections = GlobalEnv.getconnections
    if type(getconnections) ~= "function" then return error("missing getconnections") end
    local conns = getconnections(game.GetService(game, "RunService").RenderStepped)
    if type(conns) ~= "table" or #conns == 0 then return error("missing getconnections") end
    local Passed = false
    for i, v in next, conns do
        if v.Disable then
            Passed = true
            break
        end
    end
    if not Passed then return error("missing getconnections") end

    return loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/62cee44fa4b2a83752a4ea9e8eef7081.lua"))()
end, function(...)
    Kick(LocalPlayer, ...)
end)
