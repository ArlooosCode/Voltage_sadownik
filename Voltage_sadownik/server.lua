-----------------------------------------
---      Sadownik by Wiertarkov       ---
-----------------------------------------

ESX = nil
TriggerEvent('esx:getShtestaredObjtestect', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'sadownik', 'sadownik', 'society_sadownik', 'society_sadownik', 'society_sadownik', {type = 'public'})

ESX.RegisterServerCallback('esx_sadownik:getitemy', function(source, cb)	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local pieniadze = xPlayer.getMoney()
	local jablko = xPlayer.getInventoryItem('sadjablko').count 
	local pomarancza = xPlayer.getInventoryItem('sadpomarancza').count
	local sok = xPlayer.getInventoryItem('sadsok').count
	cb(pieniadze, jablko, pomarancza, sok)
end)

RegisterServerEvent('sadownik_addItem')
AddEventHandler('sadownik_addItem', function(item, ilosc, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	if xPlayer.canCarryItem(item, ilosc) then
		xPlayer.addInventoryItem(item, ilosc)
	else
		xPlayer.showNotification('Nie możesz więcej unieść')
	end
end)

RegisterServerEvent('sadownik_removeItem')
AddEventHandler('sadownik_removeItem', function(item, ilosc, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	xPlayer.removeInventoryItem(item, ilosc)
end)

RegisterServerEvent('sadownik_addKasa')
AddEventHandler('sadownik_addKasa', function(ilosc, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	xPlayer.addMoney(ilosc)
end)

RegisterServerEvent('sadownik_removeKasa')
AddEventHandler('sadownik_removeKasa', function(ilosc, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	xPlayer.removeMoney(ilosc)
end)

ESX.RegisterServerCallback('esx_mrp:canCarryItem', function(source, cb, item, count)	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.canCarryItem(item, count) then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_sadownik:startwyplata')
AddEventHandler('esx_sadownik:startwyplata', function(detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	local sadowniksok = xPlayer.getInventoryItem('sadsok').count
	local societyAccount
	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_sadownik', function(account)
		societyAccount = account
	end)

	local wyplata = math.floor(Config.wyplatakasa * sadowniksok)
	local wyplatafirma = math.floor(wyplata * Config.procent / 100)
	xPlayer.removeInventoryItem('sadsok', sadowniksok)

	MySQL.Async.fetchAll('SELECT sadkursy FROM users WHERE identifier = @identifier',{
	['@identifier'] = xPlayer.identifier
	}, function(result)	
		if result[1] ~= nil then
			local wynik = result[1]
			local twojstarypijany = wynik.sadkursy
			xPlayer.addMoney(wyplata)
			if twojstarypijany <= 149 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 0<br>Otrzymałeś 0$ premii',
				})
			elseif twojstarypijany >= 150 and twojstarypijany <= 299 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 1<br>Otrzymałeś 150$ premii',
				})
				xPlayer.addMoney(150)
			elseif twojstarypijany >= 300 and twojstarypijany <= 599 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 2<br>Otrzymałeś 300$ premii',
				})
				xPlayer.addMoney(300)
			elseif twojstarypijany >= 600 and twojstarypijany <= 999 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 3<br>Otrzymałeś 600$ premii',
				})
				xPlayer.addMoney(600)
			elseif twojstarypijany >= 1000 and twojstarypijany <= 1499 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 4<br>Otrzymałeś 1000$ premii',
				})
				xPlayer.addMoney(1000)
			elseif twojstarypijany >= 1500 and twojstarypijany <= 2099 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 5<br>Otrzymałeś 1500$ premii',
				})
				xPlayer.addMoney(1500)
			elseif twojstarypijany >= 2100 and twojstarypijany <= 2799 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 6<br>Otrzymałeś 2100$ premii',
				})
				xPlayer.addMoney(2100)
			elseif twojstarypijany >= 2800 and twojstarypijany <= 3599 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 7<br>Otrzymałeś 2800$ premii',
				})
				xPlayer.addMoney(2800)
			elseif twojstarypijany >= 3600 and twojstarypijany <= 4499 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 8<br>Otrzymałeś 3600$ premii',
				})
				xPlayer.addMoney(3600)
			elseif twojstarypijany >= 4500 and twojstarypijany <= 5499 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 9<br>Otrzymałeś 4500$ premii',
				})
				xPlayer.addMoney(4500)
			elseif twojstarypijany >= 5500 then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 10<br>Otrzymałeś 5500$ premii',
				})
				xPlayer.addMoney(5500)
			end
			
			Wait(500)
			
			MySQL.Async.execute('UPDATE users SET sadkursy = @sadkursy WHERE identifier = @identifier', {
				['@identifier'] = xPlayer.identifier,
				['@sadkursy'] = twojstarypijany + 1
			})
		end
	end)
	
	Wait(100)

	societyAccount.addMoney(wyplatafirma)
end)

ESX.RegisterServerCallback('esx_sadownik:getStockItems', function(source, cb)
	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_sadownik_black', function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_sadownik', function(store)
		weapons = store.get('weapons')
		if weapons == nil then
			weapons = {}
		end
	end)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_sadownik', function(inventory)
		for i=1, #inventory.items, 1 do
			if inventory.items[i].count > 0 then
				table.insert(items, inventory.items[i])
			end
		end	
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)

RegisterServerEvent('esx_sadownik:getStockItem')
AddEventHandler('esx_sadownik:getStockItem', function(type, itemName, count, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end

	if xPlayer ~= nil then
		if type == 'item_standard' then
			local sourceItem = xPlayer.getInventoryItem(item)
			TriggerEvent('esx_addoninventory:getSharedInventory', 'society_sadownik', function(inventory)
				local item = inventory.getItem(itemName)
				local sourceItem = xPlayer.getInventoryItem(itemName)

				if count > 0 and item.count >= count then
					
					if xPlayer.canCarryItem(itemName, count) then
						inventory.removeItem(itemName, count)
						xPlayer.addInventoryItem(itemName, count)
						TriggerClientEvent('esx:showNotification', xPlayer.source, "Pobrałeś x"..count..' '..item.label)					
					else
						xPlayer.showNotification('Nie możesz więcej unieść')
					end
				else
					TriggerClientEvent('esx:showNotification', xPlayer.source, "Nieprawidłowa ilość")
				end
			end)

		elseif type == 'item_account' then

			TriggerEvent('esx_addonaccount:getSharedAccount', "society_sadownik_black", function(account)
				local AccountMoney = account.money

				if AccountMoney >= count then
					account.removeMoney(count)
					xPlayer.addAccountMoney(itemName, count)
					--sendToDiscordsadownik('LSE | Playboy', xPlayer.name ..' wyciągnął z sejfu '.. itemName .. ' w ilości '.. count..'$' ,8421504)
				else
					TriggerClientEvent('esx:showNotification', _source, "Nieprawidłowa ilość")
				end
			end)

		elseif type == 'item_weapon' then

			TriggerEvent('esx_datastore:getSharedDataStore', 'society_sadownik', function(store)
				local storeWeapons = store.get('weapons') or {}
				local weaponName   = nil
				local ammo         = nil

				if not xPlayer.hasWeapon(itemName) then
					for i=1, #storeWeapons, 1 do
						if storeWeapons[i].name == itemName then
							weaponName = storeWeapons[i].name
							ammo       = storeWeapons[i].ammo
							table.remove(storeWeapons, i)
							break
						end
					end
					store.set('weapons', storeWeapons)
					xPlayer.addWeapon(weaponName, ammo)
				else
					xPlayer.showNotification('Posiadas już tą broń')
				end
			end)
		end
	end
end)

RegisterServerEvent('esx_sadownik:putStockItems')
AddEventHandler('esx_sadownik:putStockItems', function(type, itemName, count, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end

	if xPlayer ~= nil then
		if type == 'item_standard' then
			local playerItemCount = xPlayer.getInventoryItem(itemName).count

			TriggerEvent('esx_addoninventory:getSharedInventory', 'society_sadownik', function(inventory)
				local item = inventory.getItem(itemName)
				local playerItemCount = xPlayer.getInventoryItem(itemName).count

				if item.count >= 0 and count <= playerItemCount then
					xPlayer.removeInventoryItem(itemName, count)
					inventory.addItem(itemName, count)
					--sendToDiscordsadownik('LSE | Playboy', xPlayer.name ..' zdeponował do sejfu '.. item.label .. ' w ilości '.. count ,16744192)
				else
					TriggerClientEvent('esx:showNotification', xPlayer.source, "Nieprawidłowa ilość")
				end
				TriggerClientEvent('esx:showNotification', xPlayer.source, "Schowałeś x"..count..' '..item.label)
			end)

		elseif type == 'item_account' then

			local playerAccountMoney = xPlayer.getAccount(itemName).money
			if playerAccountMoney >= count and count > 0 then
				xPlayer.removeAccountMoney(itemName, count)
				--sendToDiscordsadownik('LSE | Playboy', xPlayer.name ..' zdeponował do sejfu '.. itemName .. ' w ilości '.. count..'$',8421504)

				TriggerEvent('esx_addonaccount:getSharedAccount', "society_sadownik_black", function(account)
					account.addMoney(count)
				end)
			else
				TriggerClientEvent('esx:showNotification', _source, "Nieprawidłowa ilość")
			end

		elseif type == 'item_weapon' then

			TriggerEvent('esx_datastore:getSharedDataStore', "society_sadownik", function(store)
				local storeWeapons = store.get('weapons') or {}

				table.insert(storeWeapons, {
					name = itemName,
					ammo = count
				})

				store.set('weapons', storeWeapons)
				xPlayer.removeWeapon(itemName, count)
				--sendToDiscordsadownik('LSE | Playboy', xPlayer.name ..' zdeponował do sejfu '.. itemName .. ' z ilością naboi '.. count ,16711680)
			end)
		end
	end
end)

ESX.RegisterServerCallback('esx_sadownik:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local blackMoney = xPlayer.getAccount('black_money').money
		local items      = xPlayer.inventory

		cb({
			blackMoney = blackMoney,
			items      = items,
			weapons    = xPlayer.getLoadout()
		})
	end
end)