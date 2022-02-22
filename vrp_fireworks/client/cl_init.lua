local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-- ===== CONNECTION/CONEXÃO =====
src = {}
Tunnel.bindInterface("vrp_fireworks",src)
vSERVER = Tunnel.getInterface("vrp_fireworks")
local cfg = module("vrp_fireworks","config/config")

local shots = 0

RegisterNetEvent("fireworks:synchronizeClient")
AddEventHandler("fireworks:synchronizeClient", function(x, y, z, trigger)
	TriggerEvent("fireworks:"..trigger, x, y, z)
end)

RegisterNetEvent("fireworks:locSynchronizeClient")
AddEventHandler("fireworks:locSynchronizeClient", function(loc, secs)
	TriggerEvent("fireworks:locStart", loc, secs)
end)

RegisterNetEvent('fireworks:case')
AddEventHandler('fireworks:case', function( shotsEntry )
	if GetVehiclePedIsIn(PlayerPedId()) < 1 then
		shots = shotsEntry
		if shots > 0 then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.5, -1.02))
			RequestAnimDict('anim@mp_fireworks')
			while not HasAnimDictLoaded('anim@mp_fireworks') do
				Wait(1)
			end
			TaskPlayAnim(ped, 'anim@mp_fireworks', 'place_firework_3_box', 8.0, -1, -1, 0, 0, 0, 0, 0)
			Wait(1500)
			ClearPedSecondaryTask(ped)
			TriggerServerEvent("fireworks:synchronizeServer", x, y, z, 'caseStart')
		end
	end
end)

RegisterNetEvent("fireworks:caseStart")
AddEventHandler("fireworks:caseStart", function(x, y, z)
	local objectName = GetHashKey(cfg.objects.case)
	local prop = CreateObject(objectName, x, y, z, false, false, true)
	SetEntityHeading(prop, GetEntityHeading(ped))
	PlaceObjectOnGroundProperly(prop)
	RequestNamedPtfxAsset(cfg.particles.case)
	RequestNamedPtfxAsset(cfg.particles.caseExtra)
	while not HasNamedPtfxAssetLoaded(cfg.particles.case) or not HasNamedPtfxAssetLoaded(cfg.particles.caseExtra)do
		Wait(1)
	end
	Wait(5000)
	for i=1,shots do
		local timeStep = math.random(200, 2000)
		UseParticleFxAssetNextCall(cfg.particles.case)
		local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", x, y, z, 0.0, 0.0, 0.0, 2.8, false, false, false)
		Wait(900)
		UseParticleFxAssetNextCall(cfg.particles.caseExtra)
		local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_air_burst", x, y, z+70.0, 0.0, 0.0, 0.0, 1.0, false, false, false)
		Wait(timeStep)
	end
	Wait(10000)
	DeleteObject(prop)
end)

RegisterNetEvent('fireworks:battery')
AddEventHandler('fireworks:battery', function( shotsEntry )
	if GetVehiclePedIsIn(PlayerPedId()) < 1 then
		shots = shotsEntry
		if shots > 0 then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.5, -1.02))
			RequestAnimDict('anim@mp_fireworks')
			while not HasAnimDictLoaded('anim@mp_fireworks') do
				Wait(1)
			end
			TaskPlayAnim(ped, 'anim@mp_fireworks', 'place_firework_3_box', 8.0, -1, -1, 0, 0, 0, 0, 0)
			Wait(1500)
			ClearPedSecondaryTask(ped)
			TriggerServerEvent("fireworks:synchronizeServer", x, y, z, 'batteryStart')
		end
	end
end)

RegisterNetEvent("fireworks:batteryStart")
AddEventHandler("fireworks:batteryStart", function(x, y, z)
	local objectName = GetHashKey(cfg.objects.battery)
	local prop = CreateObject(objectName, x, y, z, false, false, true)
	SetEntityHeading(prop, GetEntityHeading(ped))
	PlaceObjectOnGroundProperly(prop)
	RequestNamedPtfxAsset(cfg.particles.battery)
	while not HasNamedPtfxAssetLoaded(cfg.particles.cone) do
		Wait(1)
	end
	Wait(5000)
	for i=1,shots do
		local timeStep = math.random(100, 500)
		UseParticleFxAssetNextCall(cfg.particles.battery)
		local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_starburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false)
		Wait(timeStep)
	end
	Wait(10000)
	DeleteObject(prop)
end)

RegisterNetEvent('fireworks:rocket')
AddEventHandler('fireworks:rocket', function( shotsEntry )
	if GetVehiclePedIsIn(PlayerPedId()) < 1 then
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.5, -0.80))
		RequestAnimDict('anim@mp_fireworks')
		while not HasAnimDictLoaded('anim@mp_fireworks') do
			Wait(1)
		end
		TaskPlayAnim(ped, 'anim@mp_fireworks', 'place_firework_1_rocket', 8.0, -1, -1, 0, 0, 0, 0, 0)
		Wait(1500)
		ClearPedSecondaryTask(ped)
		TriggerServerEvent("fireworks:synchronizeServer", x, y, z, 'rocketStart')
	end
end)

RegisterNetEvent("fireworks:rocketStart")
AddEventHandler("fireworks:rocketStart", function(x, y, z)
	local objectName = GetHashKey(cfg.objects.rocket)
	local prop = CreateObject(objectName, x, y, z, false, false, true)
	SetEntityHeading(prop, GetEntityHeading(ped))
	PlaceObjectOnGroundProperly(prop)
	Wait(8000)
	RequestModel("mp_s_m_armoured_01")
	while not HasModelLoaded("mp_s_m_armoured_01") do
		Citizen.Wait(1)
		RequestModel("mp_s_m_armoured_01")
	end

	local ped = CreatePed("PED_TYPE_SWAT", GetHashKey("mp_s_m_armoured_01"), x, y, z, true, false)
	FreezeEntityPosition(ped,true)
	SetEntityInvincible(ped,false)

	GiveWeaponToPed(ped, GetHashKey("WEAPON_FIREWORK"), 0, true, true)
	SetEntityVisible(ped,false,false)
	SetPedInfiniteAmmo(ped, false, GetHashKey("WEAPON_FIREWORK") )
	TaskShootAtCoord(ped, x, y, z+15, 300, GetHashKey("FIRING_PATTERN_SINGLE_SHOT"))
	Wait(200)
	DeleteObject(prop)
	Wait(3000)
	DeletePed(ped)
end)

RegisterNetEvent('fireworks:cone')
AddEventHandler('fireworks:cone', function()
	if GetVehiclePedIsIn(PlayerPedId()) < 1 then
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.5, -1.02))
		RequestAnimDict('anim@mp_fireworks')
		while not HasAnimDictLoaded('anim@mp_fireworks') do
			Wait(1)
		end
		TaskPlayAnim(ped, 'anim@mp_fireworks', 'place_firework_4_cone', 8.0, -1, -1, 0, 0, 0, 0, 0)
		Wait(1500)
		ClearPedSecondaryTask(ped)
		TriggerServerEvent("fireworks:synchronizeServer", x, y, z, 'coneStart')
	end
end)

RegisterNetEvent("fireworks:coneStart")
AddEventHandler("fireworks:coneStart", function(x, y, z)
	local objectName = GetHashKey(cfg.objects.cone)
	local prop = CreateObject(objectName, x, y, z, false, false, true)
	SetEntityHeading(prop, GetEntityHeading(ped))
	PlaceObjectOnGroundProperly(prop)
	RequestNamedPtfxAsset(cfg.particles.cone)
	while not HasNamedPtfxAssetLoaded(cfg.particles.cone) do
		Wait(1)
	end
	Wait(8000)
	UseParticleFxAssetNextCall(cfg.particles.cone)
	local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.5, false, false, false)
	UseParticleFxAssetNextCall(cfg.particles.cone)
	local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false)
	Wait(5000)
	UseParticleFxAssetNextCall(cfg.particles.cone)
	local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.5, false, false, false)
	UseParticleFxAssetNextCall(cfg.particles.cone)
	local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false)
	Wait(5000)
	UseParticleFxAssetNextCall(cfg.particles.cone)
	local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.5, false, false, false)
	UseParticleFxAssetNextCall(cfg.particles.cone)
	local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false)
	Wait(5000)
	UseParticleFxAssetNextCall(cfg.particles.cone)
	local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.5, false, false, false)
	UseParticleFxAssetNextCall(cfg.particles.cone)
	local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false)
	Wait(5000)
	UseParticleFxAssetNextCall(cfg.particles.cone)
	local particle = StartParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false)
	Wait(10000)
	DeleteObject(prop)
end)

RegisterNetEvent('fireworks:loc')
AddEventHandler('fireworks:loc', function( loc, secs )
	if cfg.locs[loc] then
		if loc and secs <= 120 then
			ClearPedSecondaryTask(ped)
			TriggerServerEvent("fireworks:locSynchronizeServer", loc, secs)
		end
	end
end)

RegisterNetEvent("fireworks:locStart")
AddEventHandler("fireworks:locStart", function(loc, secs)
	RequestModel("mp_s_m_armoured_01")
	while not HasModelLoaded("mp_s_m_armoured_01") do
		Citizen.Wait(1)
		RequestModel("mp_s_m_armoured_01")
	end
	local peds = {}
	for k,v in ipairs(cfg.locs[loc]) do
		local ped = CreatePed("PED_TYPE_SWAT", GetHashKey("mp_s_m_armoured_01"), v.pedx, v.pedy, v.pedz, v.pedh, false)
		table.insert(peds, ped)
		FreezeEntityPosition(ped,true)
		SetEntityInvincible(ped,false)
		GiveWeaponToPed(ped, GetHashKey("WEAPON_FIREWORK"), 20, true, true)
		SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREWORK") )
		SetEntityVisible(ped,false,false)
		TaskShootAtCoord(ped, v.shotx+math.random() * 20, v.shoty+math.random() * 20, v.shotz+math.random() * 20, secs*1000, GetHashKey("FIRING_PATTERN_FULL_AUTO"))
		AddRelationshipGroup("allies")
		SetPedRelationshipGroupHash(ped, GetHashKey("allies"))
		Wait(math.random(100, 1000))
	end	
	Citizen.Wait((secs+1)*1000)
	for k,v in ipairs(peds) do
		DeletePed(v)
	end
end)

RegisterNetEvent('fireworks:over')
AddEventHandler('fireworks:over', function()
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.5, -1.02))
	ClearPedSecondaryTask(ped)
	TriggerServerEvent("fireworks:synchronizeServer", x,y,z, 'overStart')
end)

RegisterNetEvent("fireworks:overStart")
AddEventHandler("fireworks:overStart", function(x,y,z)
	RequestModel("mp_s_m_armoured_01")
	while not HasModelLoaded("mp_s_m_armoured_01") do
		Citizen.Wait(1)
		RequestModel("mp_s_m_armoured_01")
	end
	local peds = {}
	for i=1,5 do
		local ped = CreatePed("PED_TYPE_SWAT", GetHashKey("mp_s_m_armoured_01"), x+math.random() * 10,y+math.random() * 10,z+35, true, false)
		table.insert(peds, ped)
		FreezeEntityPosition(ped,true)
		SetEntityInvincible(ped,false)
		GiveWeaponToPed(ped, GetHashKey("WEAPON_FIREWORK"), 20, true, true)
		SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREWORK") )
		SetEntityVisible(ped,false,false)
		TaskShootAtCoord(ped, x+math.random() * 10,y+math.random() * 10,z+40, 20*1000, GetHashKey("FIRING_PATTERN_FULL_AUTO"))
		AddRelationshipGroup("allies")
		SetPedRelationshipGroupHash(ped, GetHashKey("allies"))
		Wait(math.random(100, 1000))
	end
	Citizen.Wait(20000)
	for k,v in ipairs(peds) do
		DeletePed(v)
	end
end)

RegisterNetEvent('fireworks:fromAbove')
AddEventHandler('fireworks:fromAbove', function()
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.5, -1.02))
	ClearPedSecondaryTask(ped)
	TriggerServerEvent("fireworks:synchronizeServer", x,y,z, 'fromAboveStart')
end)

RegisterNetEvent("fireworks:fromAboveStart")
AddEventHandler("fireworks:fromAboveStart", function(x,y,z)
	RequestModel("mp_s_m_armoured_01")
	while not HasModelLoaded("mp_s_m_armoured_01") do
		Citizen.Wait(1)
		RequestModel("mp_s_m_armoured_01")
	end
	local peds = {}
	for i=1,20 do
		local ped = CreatePed("PED_TYPE_SWAT", GetHashKey("mp_s_m_armoured_01"), x+math.random() * 10,y+math.random() * 10,z+40, true, false)
		table.insert(peds, ped)
		FreezeEntityPosition(ped,true)
		SetEntityInvincible(ped,false)
		GiveWeaponToPed(ped, GetHashKey("WEAPON_FIREWORK"), 20, true, true)
		SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREWORK") )
		SetEntityVisible(ped,false,false)
		TaskShootAtCoord(ped, x+math.random() * 10,y+math.random() * 10,z+30, 20*1000, GetHashKey("FIRING_PATTERN_FULL_AUTO"))
		AddRelationshipGroup("allies")
		SetPedRelationshipGroupHash(ped, GetHashKey("allies"))
		Wait(math.random(100, 1000))
	end
	Citizen.Wait(20000)
	for k,v in ipairs(peds) do
		DeletePed(v)
	end
end)