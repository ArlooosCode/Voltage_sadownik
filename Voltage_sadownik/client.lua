-----------------------------------------
---      Sadownik by Wiertarkov       ---
-----------------------------------------

ESX                             = nil
local PlayerData                = {}
local JobBlips                  = {}
local jablkopaka                = false
local pomaranczapaka 			= false
local napisjablko               = false
local napispomarancza			= false
local napissok           	 	= false
local napiswyplata              = false
local bossmenu                  = false
local vaultmenu                 = false
local wyplata23                 = false
local CzyJest                   = false
local ubranierobocze			= false
local autorobocze 				= false
local sokpaka					= false
local plate						= nil
local getauto					= false
local odrzuconejablko			= false

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShtestaredObjtestect', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	blips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	deleteBlips()
	blips()
end)

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
		RemoveBlip(JobBlips[i])
		JobBlips[i] = nil
		end
	end
end

CreateThread(function()		
	local blip = AddBlipForCoord(390.42, 6493.38, 27.43)
	SetBlipSprite (blip, 85)
	SetBlipDisplay(blip, 4)
	SetBlipColour (blip, 2)
	SetBlipScale (blip, 1.0)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Sad")
	EndTextCommandSetBlipName(blip)
end)

function blips()		
    if PlayerData.job ~= nil and PlayerData.job.name == 'sadownik' then
		for k,v in pairs(Config.szatnia)do
			if v.Type == 365 then
				local blip2 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip2, 366)
				SetBlipDisplay(blip2, 4)
				SetBlipScale  (blip2, 0.8)
				SetBlipColour (blip2, 1)
				SetBlipAsShortRange(blip2, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip2)
				table.insert(JobBlips, blip2)
			end
		end

		for k,v in pairs(Config.jablko)do
			if v.Type == 402 then
				local blip3 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip3, 501)
				SetBlipDisplay(blip3, 4)
				SetBlipScale  (blip3, 0.8)
				SetBlipColour (blip3, 25)
				SetBlipAsShortRange(blip3, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip3)
				table.insert(JobBlips, blip3)
			end
		end

		for k,v in pairs(Config.pomarancza)do
			if v.Type == 402 then
				local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip4, 501)
				SetBlipDisplay(blip4, 4)
				SetBlipScale  (blip4, 0.8)
				SetBlipColour (blip4, 51)
				SetBlipAsShortRange(blip4, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip4)
				table.insert(JobBlips, blip4)
			end
		end
		
		for k,v in pairs(Config.sok)do
			if v.Type == 402 then
				local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip4, 499)
				SetBlipDisplay(blip4, 4)
				SetBlipScale  (blip4, 0.8)
				SetBlipColour (blip4, 18)
				SetBlipAsShortRange(blip4, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip4)
				table.insert(JobBlips, blip4)
			end
		end
		
		for k,v in pairs(Config.dostawa)do
			if v.Type == 365 then
				local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip4, 500)
				SetBlipDisplay(blip4, 4)
				SetBlipScale  (blip4, 0.8)
				SetBlipColour (blip4, 25)
				SetBlipAsShortRange(blip4, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip4)
				table.insert(JobBlips, blip4)
			end
		end
	end
end

function szatnia()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
		TriggerEvent('skinchanger:getSkin', function(skin)	
			if (skin.tshirt_1 == 1 and skin.torso_1 == 7 and skin.sex == 0) or (skin.tshirt_1 == 15 and skin.torso_1 == 121 and skin.sex == 1) then
				ubranierobocze = false
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)		
			else
				ubranierobocze = true
				if skin.sex == 0 then
					--[[local clothesSkin = { --lato
						['tshirt_1'] = 15, ['tshirt_2'] = 0,
						['torso_1'] = 5, ['torso_2'] = 10,
						['arms'] = 67, ['arms_2'] = 0,
						['pants_1'] = 6, ['pants_2'] = 5,
						['shoes_1'] = 5, ['shoes_2'] = 2
					}]]--
					local clothesSkin = { --zima
						['tshirt_1'] = 1, ['tshirt_2'] = 1,
						['torso_1'] = 7, ['torso_2'] = 6,
						['arms'] = 68, ['arms_2'] = 0,
						['pants_1'] = 9, ['pants_2'] = 6,
						['shoes_1'] = 25, ['shoes_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)	
				else
					local clothesSkin = {
						['tshirt_1'] = 15, ['tshirt_2'] = 0,
						['torso_1'] = 121, ['torso_2'] = 2,
						['arms'] = 52,
						['pants_1'] = 32, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)	
				end		
			end
		end)
	end)
end

function pobierzpojazdsluzbowy()
	if not getauto then
		ESX.TriggerServerCallback('esx_sadownik:getitemy', function (pieniadze, jablko, pomarancza, sok)
			if pieniadze >= 100 then
				local model = 'bison3'
				autopozycja1 = {x = 404.77, y = 6491.83, z = 26.67}
				if ESX.Game.IsSpawnPointClear(autopozycja1, 6.0) then
					ESX.Game.SpawnVehicle(model, autopozycja1, 87.31, function(vehicle)
						TaskWarpPedIntoVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1),  vehicle,  -1)
						plate = 'SADOW' .. math.random(100, 900)
						getauto = true
						SetVehicleNumberPlateText(vehicle, plate)
						TriggerEvent('ls:dodajklucze', GetVehicleNumberPlateText(vehicle))
						TriggerServerEvent('sadownik_removeKasa', 100, PlayerData.protect)
						TriggerEvent("pNotify:SendNotification", {text = "Pojazd (Nr. rej. "..plate..") został pobrany!<br>Kaucja 100$ została pobrana!"})
					end)
				else
					TriggerEvent("pNotify:SendNotification", {text = "Miejsce poboru zajęte!"})
				end		
			else
				local ilebrakujepobierz = math.floor(100 - pieniadze)
				TriggerEvent("pNotify:SendNotification", {text = "Masz niewystarczająco gotówki aby opłacić kaucję!<br>Brakuje ci "..ilebrakujepobierz.."$"})
			end
		end)
	else
		ESX.ShowNotification('Niedawno pobrałeś pojazd służbowy!')
	end
end

function zwrocpojazdsluzbowy(plate)
	vehiclerobocze = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false)
	tablica = GetVehicleNumberPlateText(vehiclerobocze)
	if (IsVehicleModel(vehiclerobocze, GetHashKey('bison3'))) then
		ESX.Game.DeleteVehicle(vehiclerobocze)
		Wait(500)
		if plate == tablica then
			TriggerServerEvent('sadownik_addKasa', 100, PlayerData.protect)
			TriggerEvent("pNotify:SendNotification", {text = "Pojazd został zwrócony!<br>Kaucja 100$ została zwrócona!"})
		else
			TriggerEvent("pNotify:SendNotification", {text = "Pojazd został zwrócony!<br>Kaucja nie została zwrócona!"})
		end
	else
		TriggerEvent("pNotify:SendNotification", {text = "To nie jest pojazd służbowy!"})
	end
end

RegisterNetEvent('sadownik:freezePlayer')
AddEventHandler('sadownik:freezePlayer', function(freeze)
	FreezeEntityPosition(Citizen.InvokeNative(0x43A66C31C68491C0, -1), freeze)
end)

function animka3()
	local dict = "amb@prop_human_movie_bulb@base"
		RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(Citizen.InvokeNative(0x43A66C31C68491C0, -1), dict, "base", 8.0, 8.0, 10000, 1, 0, false, false, false)
end

function animka2()
	local dict = "amb@prop_human_bum_bin@idle_b"
		RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(Citizen.InvokeNative(0x43A66C31C68491C0, -1), dict, "idle_d", 8.0, 8.0, 10000, 1, 0, false, false, false)
end

function animka4()
	local dict = "amb@prop_human_bum_bin@idle_b"
		RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(Citizen.InvokeNative(0x43A66C31C68491C0, -1), dict, "idle_d", 8.0, 8.0, 6000, 1, 0, false, false, false)
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end

RegisterNetEvent('prop:paletasadownik')
AddEventHandler('prop:paletasadownik', function()
	local ad = "anim@heists@box_carry@"
	local anim = "idle"
	local player = PlayerPedId()

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			usunpropboxowocowx()
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)			
			boxowocow = Citizen.InvokeNative(0x509D5878EB39E842, GetHashKey("prop_crate_float_1"), 0, 0, 0, true, true, false)
			owoce = Citizen.InvokeNative(0x509D5878EB39E842, GetHashKey("apa_mp_h_acc_fruitbowl_01"), 0, 0, 0, true, true, false)
			AttachEntityToEntity(boxowocow, Citizen.InvokeNative(0x43A66C31C68491C0, -1), GetPedBoneIndex(Citizen.InvokeNative(0x43A66C31C68491C0, -1), 28422), 0.0, -0.4, -0.2, 0, 0, 0, true, true, false, true, 1, true)
			AttachEntityToEntity(owoce, boxowocow, GetPedBoneIndex(Citizen.InvokeNative(0x43A66C31C68491C0, -1), 28422), 0.0, 0.0, 0.1, 0, 0, 0, true, true, false, true, 1, true)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
		end
	end
end)

RegisterNetEvent('prop:pudelkosok')
AddEventHandler('prop:pudelkosok', function()
	local ad = "anim@heists@box_carry@"
	local anim = "idle"
	local player = PlayerPedId()

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			usunpropboxowocowx()
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			soki = Citizen.InvokeNative(0x509D5878EB39E842, GetHashKey("prop_coolbox_01"), 0, 0, 0, true, true, true)
			AttachEntityToEntity(soki, Citizen.InvokeNative(0x43A66C31C68491C0, -1), GetPedBoneIndex(Citizen.InvokeNative(0x43A66C31C68491C0, -1), 28422), 0, -0.2, -0.2, 0, 0, 0, true, true, false, true, 1, true)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
		end
	end
end)

function usunboxowocowx()
    DeleteEntity(boxowocow)
    DeleteEntity(owoce)
    DeleteEntity(soki)
    ClearPedSecondaryTask(PlayerPedId())
    boxowocow = nil
    owoce = nil
    soki = nil
end

function usunpropboxowocowx()
    DeleteEntity(boxowocow)
    DeleteEntity(owoce)
    DeleteEntity(soki)
end

RegisterNetEvent('sadownik:odrzuconejablko')
AddEventHandler('sadownik:odrzuconejablko', function()
	odrzuconejablko = true
	TriggerEvent('sadownik:freezePlayer', true)	
	animka2()
	Wait(10000)
	TriggerEvent('sadownik:freezePlayer', false)
	Wait(1000)
	odrzuconejablko = false
end) 

RegisterNetEvent('sadownik:jablko')
AddEventHandler('sadownik:jablko', function()
	napisjablko = true
	TriggerEvent('sadownik:freezePlayer', true)					
	animka3()					
	Wait(10000)
	TriggerEvent('prop:paletasadownik')
	jablkopaka = true
	TriggerEvent('sadownik:freezePlayer', false)
	ESX.ShowNotification('Wrzuć paletę na pake pojazdu służbowego')
	Wait(2500)
	napisjablko = false
end)

RegisterNetEvent('sadownik:pomarancza')
AddEventHandler('sadownik:pomarancza', function()
	napispomarancza = true
	TriggerEvent('sadownik:freezePlayer', true)					
	animka3()					
	Wait(10000)
	TriggerEvent('prop:paletasadownik')
	pomaranczapaka = true
	TriggerEvent('sadownik:freezePlayer', false)
	ESX.ShowNotification('Wrzuć paletę na pake pojazdu służbowego')
	Wait(2500)
	napispomarancza = false
end)

RegisterNetEvent('sadownik:wyplata')
AddEventHandler('sadownik:wyplata', function()
	napiswyplata = true
	TriggerEvent('sadownik:freezePlayer', true)		
	Wait(6300)
	TriggerEvent('sadownik:freezePlayer', false)
	Wait(2500)
	napiswyplata = false
end)

RegisterNetEvent('sadownik:sok')
AddEventHandler('sadownik:sok', function()
	napissok = true
	TriggerEvent('sadownik:freezePlayer', true)
	animka4()					
	Wait(6300)
	TriggerEvent('prop:pudelkosok')
	sokpaka = true
	TriggerEvent('sadownik:freezePlayer', false)
	Wait(2500)
	napissok = false
end)

function procent(time)
	TriggerEvent('sadownik:procenty')
	TimeLeft = 0
	repeat
	TimeLeft = TimeLeft + 1
	Citizen.Wait(time)
	until(TimeLeft == 100)
	CzyJest = false
end

RegisterNetEvent('sadownik:procenty')
AddEventHandler('sadownik:procenty', function()
	CzyJest = true
	while (CzyJest) do
		Citizen.Wait(7)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		DrawText3D(coords.x, coords.y, coords.z, '~b~'.. TimeLeft .. '%', 0.4)
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(7)
		local autorobocze1 = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), true)
		tablica = GetVehicleNumberPlateText(autorobocze1)
		if IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
			if plate == tablica then
				autorobocze = true
			else
				autorobocze = false
			end
		else
			Citizen.Wait(2500)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if getauto then
			Wait(60 * 1000 * 15)
			getauto = false
		end
	end
end)

CreateThread(function()
	local timer = GetGameTimer()
	while true do
		Citizen.Wait(7)
			
			local coords = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1))
			
				if #(coords - vec3(431.76010131836, 6470.9184570313, 28.773387908936)) <= 10.0 and not odrzuconejablko then
					DrawMarker(1, 431.76010131836, 6470.9184570313, 28.773387908936 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 4.0, 4.0, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
					if #(coords - vec3(431.76010131836, 6470.9184570313, 28.773387908936)) <= 2.5 then
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby zebrać ~b~odrzucone jabłka z magazynu')
						ESX.ShowFloatingHelpNotification('~b~ ODRZUCONE JABŁKA', vec3(431.76010131836, 6470.9184570313, 28.773387908936))
						if odrzuconejablko == false then
							if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									startodrzuconejablko()	
								timer = GetGameTimer() + 500
							end
						end	
					end
				end

				if PlayerData.job ~= nil and PlayerData.job.name == 'sadownik' then		
					
					work_truck = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), true)
					local trunk = GetWorldPositionOfEntityBone(work_truck, GetEntityBoneIndexByName(work_truck, "platelight"))
					plyCoords = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false)
					if jablkopaka == true or pomaranczapaka == true or sokpaka == true then
						dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, trunk.x , trunk.y, trunk.z)
						if dist <= 2.0 then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~wrzucić ~s~ pudełko do pojazdu')
							ESX.ShowFloatingHelpNotification('~b~ WRZUĆ PUDEŁKO', vec3(trunk.x , trunk.y, trunk.z))
							DrawMarker(1, trunk.x, trunk.y, trunk.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if IsControlJustReleased(0, 38) then
								usunboxowocowx()
								jablkopaka = false
								pomaranczapaka = false
								sokpaka = false
							end
							timer = GetGameTimer() + 500
						end
					end		

					if IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
						
						if #(coords - vec3(404.19, 6491.41, 28.11)) <= 10.0 then
							DrawMarker(27, 404.19, 6491.41, 28.35 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.5, 3.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(404.19, 6491.41, 28.11)) <= 2.0 then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~schować ~s~pojazd')
							ESX.ShowFloatingHelpNotification('~b~ ZWROT POJAZDU', vec3(404.19, 6491.41, 28.11))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									zwrocpojazdsluzbowy(plate)
										
									timer = GetGameTimer() + 500
								end
							end
						end
					end
					
					if not IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
						if #(coords - vec3(282.20, 6506.10, 30.17)) <= 10.0 and napisjablko == false and ubranierobocze == true then
							DrawMarker(1, 282.20, 6506.10, 30.17 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(282.20, 6506.10, 30.17)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zrywać ~s~jabłka')
								ESX.ShowFloatingHelpNotification('~b~ ZRYWANIE JABŁEK', vec3(282.20, 6506.10, 30.17))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startjablko()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(273.53, 6507.00, 30.46)) <= 10.0 and napisjablko == false and ubranierobocze == true then
							DrawMarker(1, 273.53, 6507.00, 30.46 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(273.53, 6507.00, 30.46)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zrywać ~s~jabłka')
								ESX.ShowFloatingHelpNotification('~b~ ZRYWANIE JABŁEK', vec3(273.53, 6507.00, 30.46))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startjablko()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(264.01, 6505.66, 30.72)) <= 10.0 and napisjablko == false and ubranierobocze == true then
							DrawMarker(1, 264.01, 6505.66, 30.72 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(264.01, 6505.66, 30.72)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zrywać ~s~jabłka')
								ESX.ShowFloatingHelpNotification('~b~ ZRYWANIE JABŁEK', vec3(264.01, 6505.66, 30.72))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startjablko()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(256.23, 6503.57, 30.91)) <= 10.0 and napisjablko == false and ubranierobocze == true then
							DrawMarker(1, 256.23, 6503.57, 30.91 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(256.23, 6503.57, 30.91)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zrywać ~s~jabłka')
								ESX.ShowFloatingHelpNotification('~b~ ZRYWANIE JABŁEK', vec3(256.23, 6503.57, 30.91))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startjablko()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(246.78, 6502.60, 31.10)) <= 10.0 and napisjablko == false and ubranierobocze == true then
							DrawMarker(1, 246.78, 6502.60, 31.10 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(246.78, 6502.60, 31.10)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zrywać ~s~jabłka')
								ESX.ShowFloatingHelpNotification('~b~ ZRYWANIE JABŁEK', vec3(246.78, 6502.60, 31.10))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startjablko()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(236.85, 6501.55, 31.25)) <= 10.0 and napispomarancza == false and ubranierobocze == true then
							DrawMarker(1, 236.85, 6501.55, 31.25 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(236.85, 6501.55, 31.25)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zrywać ~s~pomarańcze')
								ESX.ShowFloatingHelpNotification('~b~ ZRYWANIE POMARAŃCZY', vec3(236.85, 6501.55, 31.25))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startpomarancza()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(227.98, 6501.00, 31.36)) <= 10.0 and napispomarancza == false and ubranierobocze == true then
							DrawMarker(1, 227.98, 6501.00, 31.36 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(227.98, 6501.00, 31.36)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zrywać ~s~pomarańcze')
								ESX.ShowFloatingHelpNotification('~b~ ZRYWANIE POMARAŃCZY', vec3(227.98, 6501.00, 31.36))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startpomarancza()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(220.05, 6498.96, 31.43)) <= 10.0 and napispomarancza == false and ubranierobocze == true then
							DrawMarker(1, 220.05, 6498.96, 31.43 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(220.05, 6498.96, 31.43)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zrywać ~s~pomarańcze')
								ESX.ShowFloatingHelpNotification('~b~ ZRYWANIE POMARAŃCZY', vec3(220.05, 6498.96, 31.43))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startpomarancza()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(209.99, 6497.82, 31.49)) <= 10.0 and napispomarancza == false and ubranierobocze == true then
							DrawMarker(1, 209.99, 6497.82, 31.49 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(209.99, 6497.82, 31.49)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zrywać ~s~pomarańcze')
								ESX.ShowFloatingHelpNotification('~b~ ZRYWANIE POMARAŃCZY', vec3(209.99, 6497.82, 31.49))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startpomarancza()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(201.68, 6496.87, 31.51)) <= 10.0 and napispomarancza == false and ubranierobocze == true then
							DrawMarker(1, 201.68, 6496.87, 31.51 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(201.68, 6496.87, 31.51)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zrywać ~s~pomarańcze')
								ESX.ShowFloatingHelpNotification('~b~ ZRYWANIE POMARAŃCZY', vec3(201.68, 6496.87, 31.51))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startpomarancza()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
					
						if #(coords - vec3(-354.02, 6066.19, 31.54)) <= 10.0 and napissok == false and ubranierobocze == true then
							DrawMarker(1, -354.02, 6066.19, 31.54 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(-354.02, 6066.19, 31.54)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~przerobić ~s~owoce na sok')
								ESX.ShowFloatingHelpNotification('~b~ PRZERABIANIE OWOCÓW', vec3(-354.02, 6066.19, 31.54))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startsok()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
									
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(2743.81, 4415.88, 48.67)) <= 10.0 and napiswyplata == false and ubranierobocze == true then				
							DrawMarker(1, 2743.81, 4415.88, 48.67 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(2743.81, 4415.88, 48.67)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~sprzedać ~s~soki')
								ESX.ShowFloatingHelpNotification('~b~ SPRZEDAŻ SOKÓW', vec3(2743.81, 4415.88, 48.67))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startwyplata()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
					
						if #(coords - vec3(406.14, 6526.21, 27.78)) <= 10.0 then
							DrawMarker(1, 406.14, 6526.21, 27.78 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(406.14, 6526.21, 27.78)) <= 2.0 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zmienić ~s~strój')
								ESX.ShowFloatingHelpNotification('~b~ SZATNIA', vec3(406.14, 6526.21, 27.78))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									procent(1)
									szatnia()
										
									timer = GetGameTimer() + 500
								end
							end
						end

						if #(coords - vec3(408.32, 6498.50, 27.81)) <= 10.0 then
							DrawMarker(1, 408.32, 6498.50, 27.81 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(408.32, 6498.50, 27.81)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~wyciągnąć ~s~pojazd')
								ESX.ShowFloatingHelpNotification('~b~ GARAŻ', vec3(408.32, 6498.50, 27.81))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if ubranierobocze == true then
										pobierzpojazdsluzbowy()
									else
										ESX.ShowNotification('Przebierz się w strój roboczy!')
									end
								end
							end
						end

						if PlayerData.job.grade_name == 'boss' then
							if #(coords - vec3(416.15, 6520.81, 27.78)) <= 10.0 then
								DrawMarker(1, 416.15, 6520.81, 27.78 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
								if #(coords - vec3(416.15, 6520.81, 27.78)) <= 2.0 then
									ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zarządzać ~s~firmą')
									ESX.ShowFloatingHelpNotification('~b~ BIURO', vec3(416.15, 6520.81, 27.78))
									if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
										bossmenu = true
										openbossmenusad()
										--[[local opcje = {
											wash = false,
										}
										TriggerEvent('esx_society:openBostestsMenu', 'sadownik', function(data, menu)
											menu.close()								
										end, opcje)]]
										
										timer = GetGameTimer() + 500
									end
								end
							end
							
							if #(coords - vec3(417.02, 6528.72, 27.80)) <= 10.0 then
								DrawMarker(1, 417.02, 6528.72, 27.80 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
								if #(coords - vec3(417.02, 6528.72, 27.80)) <= 2.0 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~otworzyć ~s~schowek')
								ESX.ShowFloatingHelpNotification('~b~ SCHOWEK', vec3(417.02, 6528.72, 27.80))
									if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
										vaultmenu = true
										OpenVaultMenu()
										
										timer = GetGameTimer() + 500
									end	
								end
							end
						end
						
						if #(coords - vec3(416.15, 6520.81, 27.78)) >= 2.0 then
							if bossmenu == true then
								ESX.UI.Menu.CloseAll()
								bossmenu = false
							end
						end
						
						if #(coords - vec3(417.02, 6528.72, 27.80)) >= 2.0 then
							if vaultmenu == true then
								ESX.UI.Menu.CloseAll()
								vaultmenu = false
							end
						end
					end
				end
			--end	
	end
end)


function openbossmenusad()
	local elements = {
		{label = 'Zarządzanie Firmą', value = 'boss_actions'},
		{label = 'Lista Kursów', value = 'kursy_actions'}
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sadownik',
	{
		title    = 'Sadownik menu',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBostestsMenu', 'sadownik', function(data, menu)
				menu.close()
			end)
		elseif data.current.value == 'kursy_actions' then
			ESX.TriggerServerCallback('esx_sadownik:getEmployees', function(employees)
				local elements2 = {
					head = {'Imie i nazwisko', 'Stopień', 'Ilość kursów'},
					rows = {}
				}
				
				for i=1, #employees, 1 do
					local gradeLabel = (employees[i].job.grade_label == '' and employees[i].job.label or employees[i].job.grade_label)

					table.insert(elements2.rows, {
						data = employees[i],
						cols = {
							employees[i].name,
							gradeLabel,
							employees[i].kursy
						}
					})
				end
					
				ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'employee_list_', elements2, function(data, menu)
					local employee = data.data
				end, function(data, menu)
					menu.close()
					openbossmenuzlom()
				end)
			end)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'boss_actions'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}
	end)
end

function startodrzuconejablko()
	ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
		if can then
			TriggerEvent('sadownik:odrzuconejablko')
			procent(100)
			TriggerServerEvent('sadownik_addItem', 'jablko', 5, PlayerData.protect)
		else
			ESX.ShowNotification('Nie możesz więcej unieść')
		end
	end, 'jablko', 5)
end

function startjablko()
	ESX.TriggerServerCallback('esx_sadownik:getitemy', function (pieniadze, jablko, pomarancza, sok)
		if jablkopaka == false then
			ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
				if can then
					TriggerEvent('sadownik:jablko')
					procent(100)
					TriggerServerEvent('sadownik_addItem', 'sadjablko', 10, PlayerData.protect)
					if GetRandomIntInRange(1, 100) <= 5 then
						losowanko = math.random(1,2)
						if losowanko == 1 then
							ziololosuj = math.random(1, 3)
							komunikat = ziololosuj == 1 and 'Znalazłeś dziwny worek obok drzewa...' or 'Znalazłeś dziwne worki obok drzewa...'
							ESX.ShowNotification(komunikat)
							TriggerServerEvent('sadownik_addItem', 'weedpack', ziololosuj, PlayerData.protect)
						elseif losowanko == 2 then
							kasalosuj = math.random(50, 150)
							komunikat = 'Znalazłeś kilka banknotów obok drzewa...'
							ESX.ShowNotification(komunikat)
							TriggerServerEvent('sadownik_addKasa', kasalosuj, PlayerData.protect)
						end
					end
				else
					ESX.ShowNotification('Nie możesz więcej unieść')
				end
			end, 'sadjablko', 10)
		else
			ESX.ShowNotification('Najpierw odłóż tę paletę z jabłkami!')
		end
	end)
end

function startpomarancza()
	ESX.TriggerServerCallback('esx_sadownik:getitemy', function (pieniadze, jablko, pomarancza, sok)
		if pomaranczapaka == false then
			ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
				if can then
					TriggerEvent('sadownik:pomarancza')
					procent(100)
					TriggerServerEvent('sadownik_addItem', 'sadpomarancza', 10, PlayerData.protect)
					if GetRandomIntInRange(1, 100) <= 5 then
						losowanko = math.random(1,2)
						if losowanko == 1 then
							ziololosuj = math.random(1, 3)
							komunikat = ziololosuj == 1 and 'Znalazłeś dziwny worek obok drzewa...' or 'Znalazłeś dziwne worki obok drzewa...'
							ESX.ShowNotification(komunikat)
							TriggerServerEvent('sadownik_addItem', 'weedpack', ziololosuj, PlayerData.protect)
						elseif losowanko == 2 then
							kasalosuj = math.random(50, 150)
							komunikat = 'Znalazłeś kilka banknotów obok drzewa...'
							ESX.ShowNotification(komunikat)
							TriggerServerEvent('sadownik_addKasa', kasalosuj, PlayerData.protect)
						end
					end
				else
					ESX.ShowNotification('Nie możesz więcej unieść')
				end
			end, 'sadpomarancza', 10)
		else
			ESX.ShowNotification('Najpierw odłóż tę paletę z poarańczami!')
		end
	end)
end

function startsok()
	ESX.TriggerServerCallback('esx_sadownik:getitemy', function (pieniadze, jablko, pomarancza, sok)
		if jablko >= 5 then
			if pomarancza >= 5 then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						TriggerEvent('sadownik:sok')
						procent(57)			
						TriggerServerEvent('sadownik_removeItem', 'sadjablko', 5, PlayerData.protect)
						TriggerServerEvent('sadownik_removeItem', 'sadpomarancza', 5, PlayerData.protect)
						TriggerServerEvent('sadownik_addItem', 'sadsok', 5, PlayerData.protect)
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'sadsok', 5)
			else
				ESX.ShowNotification('Masz niewystarczająco pomarańczy!')
			end
		else
			ESX.ShowNotification('Masz niewystarczająco jabłek!')
		end
	end)
end

function startwyplata()
	ESX.TriggerServerCallback('esx_sadownik:getitemy', function (pieniadze, jablko, pomarancza, sok)
		if sok >= 1 then
			TriggerEvent('sadownik:wyplata')
			procent(57)			
			TriggerServerEvent('esx_sadownik:startwyplata', PlayerData.protect)
		else
			ESX.ShowNotification('Nie posiadasz soku!')
		end
	end)
end

function OpenVaultMenu()
	
    local elements = {
      {label = "Weź przedmiot", value = 'get_stock'},
      {label = "Włóź przedmiot", value = 'put_stock'}
    }
    

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault',
      {
        title    = "Sejf",
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'put_stock' then
           OpenPutStocksMenu()
        end

        if data.current.value == 'get_stock' then
           OpenGetStocksMenu()
        end

      end,
      
      function(data, menu)

        menu.close()
      end
    )

end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_sadownik:getPlayerInventory', function(inventory)
		local elements = {}

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = "Brudne pieniądze: <span style='color: yellow;'>"..ESX.Math.GroupDigits(inventory.blackMoney).."$",
				type  = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = weapon.label..' ['..weapon.ammo..']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end



		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Sejf",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)

			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('esx_sadownik:putStockItems', data.current.type, data.current.value, data.current.ammo, PlayerData.protect)

				ESX.SetTimeout(300, function()
					OpenPutStocksMenu()
				end)
			else
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
					title = "Ilość"
				}, function(data2, menu2)
					local count = tonumber(data2.value)

					if count == nil then
						ESX.ShowNotification("Nieprawidłowa ilość")
					else
						menu2.close()
						menu.close()
						TriggerServerEvent('esx_sadownik:putStockItems', data.current.type, data.current.value, count, PlayerData.protect)
						Citizen.Wait(500)
						OpenPutStocksMenu()
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end


function OpenGetStocksMenu()

	ESX.TriggerServerCallback('esx_sadownik:getStockItems', function(inventory)
		local elements = {}
		local menutitle = "Sejf"

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = "Brudne pieniądze: <span style='color: yellow;'>"..ESX.Math.GroupDigits(inventory.blackMoney).."$",
				type = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name)..' ['..weapon.ammo..']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end



		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Sejf",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)

			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('esx_sadownik:getStockItem', data.current.type, data.current.value, data.current.ammo, PlayerData.protect)
				ESX.SetTimeout(300, function()
					OpenGetStocksMenu()
				end)
			else
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
					title = "Ilość"
				}, function(data2, menu2)
					local count = tonumber(data2.value)

					if count == nil then
						ESX.ShowNotification("Nieprawidłowa ilość")
					else
						menu2.close()
						menu.close()
						TriggerServerEvent('esx_sadownik:getStockItem', data.current.type, data.current.value, count, PlayerData.protect)
						Citizen.Wait(500)
						OpenGetStocksMenu()
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenChangingRoomMenu()

	ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
		local elements = {}

		for i=1, #dressing, 1 do
			table.insert(elements, {
				label = dressing[i],
				value = i
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing',
		{
			title    = 'GARDEROBA',
			align    = 'bottom-right',
			elements = elements
		}, function(data2, menu2)

			TriggerEvent('skinchanger:getSkin', function(skin)
				ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
					TriggerEvent('skinchanger:loadClothes', skin, clothes)
					TriggerEvent('esx_skin:setLastSkin', skin)

					TriggerEvent('skinchanger:getSkin', function(skin)
						TriggerServerEvent('esx_skin:save', skin)
					end)
				end, data2.current.value)
			end)

			end, function(data2, menu2)
				menu2.close()
		end)
	end)
end

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()
	AddTextComponentString(text)
	DrawText(_x, _y)
	local factor = (string.len(text)) / 270
	--DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
end