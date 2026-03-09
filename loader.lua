--- Womp Womp 💦
local Exec = string.lower(identifyexecutor and identifyexecutor() or "")
if Exec == "" or (string.find(Exec, "solara") or string.find(Exec, "xeno")) then
    game:GetService("Players").LocalPlayer:Kick("[Aurora Loader] \n Executor not supported.\n \n Join: https://discord.gg/projectaurora if u need support")
    return
end

local LocalPlayer = game.GetService(game, "Players").LocalPlayer
local Kick = LocalPlayer.Kick
if not xpcall then
    return Kick(LocalPlayer, "[Aurora Loader] \n Executor not supported.\n \n [Error 01 - Tf?] \n Join: https://discord.gg/projectaurora if u need support")
end
xpcall(function()
    if type(getgenv) ~= "function" then return error("[Aurora Loader] \n Executor not supported.\n \n [Error 02 - Missing Getgenv] \n Join: https://discord.gg/projectaurora if u need support") end
    local GlobalEnv = getgenv()
    if type(GlobalEnv) ~= "table" then return error("[Aurora Loader] \n Executor not supported.\n \n [Error 03 - Missing Getgenv] \n Join: https://discord.gg/projectaurora if u need support") end 
    local getconnections = GlobalEnv.getconnections
    if type(getconnections) ~= "function" then return error("[Aurora Loader] \n Executor not supported.\n \n [Error 04 - Missing GetConnections] \n Join: https://discord.gg/projectaurora if u need support") end
    local conns = getconnections(game.GetService(game, "RunService").RenderStepped)
    if type(conns) ~= "table" or #conns == 0 then return error("[Aurora Loader] \n Executor not supported.\n \n [Error 05 - Missing GetConnections] \n Join: https://discord.gg/projectaurora if u need support") end
    local Passed = false
    for i, v in next, conns do
        if v.Disable then
            Passed = true
            break
        end
    end
    if not Passed then return error("[Aurora Loader] \n Executor not supported.\n \n [Error 06 - Missing GetConnections] \n Join: https://discord.gg/projectaurora if u need support") end

    return loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/62cee44fa4b2a83752a4ea9e8eef7081.lua"))()
end, function(...)
    Kick(LocalPlayer, ...)
end)
