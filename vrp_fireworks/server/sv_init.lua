local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-- ===== CONNECTION/CONEXÃO =====
vRPN = {}
Tunnel.bindInterface("vrp_fireworks",vRPN)
vCLIENT = Tunnel.getInterface("vrp_fireworks")

local cfg = module("vrp_fireworks","config/config")

RegisterCommand("fireworks",function(source,args)
	if vRPN.checkPermission(source) then
		if args[1] == "case" and tonumber(args[2]) >= 10 and tonumber(args[2]) <= 50 then
			TriggerClientEvent("fireworks:case", source, tonumber(args[2]))
		elseif args[1] == "battery" and tonumber(args[2]) >= 20 and tonumber(args[2]) <= 100 then
			TriggerClientEvent("fireworks:battery", source, tonumber(args[2]))
		elseif args[1] == "cone" then
			TriggerClientEvent("fireworks:cone", source)
		elseif args[1] == "rocket" then
			TriggerClientEvent("fireworks:rocket", source, tonumber(args[2]))
		elseif args[1] == "loc" and tonumber(args[3]) >= 10 and tonumber(args[3]) <= 120 then
			TriggerClientEvent("fireworks:loc", source, args[2], tonumber(args[3]))
		elseif args[1] == "over" then
			TriggerClientEvent("fireworks:over", source)
		elseif args[1] == "fromabove" then
			TriggerClientEvent("fireworks:fromAbove", source)
		end
	end
end)

RegisterServerEvent("fireworks:synchronizeServer")
AddEventHandler("fireworks:synchronizeServer", function(x, y, z, trigger)
	TriggerClientEvent("fireworks:synchronizeClient", -1, x, y, z, trigger)
end)

RegisterServerEvent("fireworks:locSynchronizeServer")
AddEventHandler("fireworks:locSynchronizeServer", function( loc, secs )
	TriggerClientEvent("fireworks:locSynchronizeClient", -1, loc, secs )
end)

function vRPN.checkPermission(source)
	local user_id = vRP.getUserId(source)
	for k,v in ipairs(cfg.permissions) do
		if vRP.hasPermission(user_id, v) then
			return true
		end
	end
	return false
end