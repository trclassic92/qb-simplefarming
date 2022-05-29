local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-simpefarming:sellItems', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Config.Sell[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Sell[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price)
        TriggerClientEvent('QBCore:Notify', src, "You have sold your items")
    else
		TriggerClientEvent('QBCore:Notify', src, "You do not have the items to sell here!")
	end
end)
------------------------------- Apple Stuff ----------------------------

RegisterServerEvent('qb-simplefarming:applepicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(1,3)
    Player.Functions.AddItem('apple', amount, false, info)
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['apple_pickingfront'] ..amount.. Config.Alerts['apple_pickingend'])
end)


RegisterServerEvent('qb-simplefarming:appleprocess', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local apple = Player.Functions.GetItemByName('apple')
    if not apple then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_appleprocessor'])
        return false
    end

    local amount = apple.amount
    if amount >= 1 then
        amount = Config.AppleProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('apple', amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['apple'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['apple_processing'])
    print(Config.Alerts['apple_processing'])
    local amount = Config.AppleJuice
    Wait(750)
    Player.Functions.AddItem('apple_juice', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['apple_juice'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['apple_trader'])
end)

QBCore.Functions.CreateCallback('qb-simplefarming:apples', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("apple") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


------------------------------- Cow Farming Stuff ----------------------------

QBCore.Functions.CreateCallback('qb-simplefarming:weapon_knife', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("weapon_knife") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:cowmeat', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_beef") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:emptycowbucket', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("emptycowbucket") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


QBCore.Functions.CreateCallback('qb-simplefarming:milkbucketfull', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("milkbucket") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-simplefarming:cowmilking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cow_milkbucket = math.random(1,3)
    Player.Functions.RemoveItem('emptycowbucket', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milkbucket'], "remove")
    Wait(1000)
    Player.Functions.AddItem('milkbucket', cow_milkbucket)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milkbucket'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Gathered  " ..cow_milkbucket.. " buckets of milk.")
end)


RegisterServerEvent('qb-simplefarming:cowkilling', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cowraw_meat1 = math.random(2,4)
    Player.Functions.AddItem('raw_beef', cowraw_meat1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_beef'], "add")
    Player.Functions.AddItem('cow_leather', 1, info)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cow_leather'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Gathered  " ..cowraw_meat1.. " amount of raw meat. You Also skinned the cow for 1 leather")
end)

RegisterServerEvent('qb-simplefarming:beefprocess', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local rawbeef = Player.Functions.GetItemByName('raw_beef')
    if not rawbeef then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_rawmeat'])
        return false
    end

    local amount = rawbeef.amount
    if amount >= 1 then
        amount = Config.BeefProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('raw_beef', amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_beef'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['cow_processing'])
    local amount = Config.CowMeat
    Wait(750)
    Player.Functions.AddItem('beef', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['beef'], "add")
end)

RegisterServerEvent('qb-simplefarming:getcowbucket', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    Player.Functions.AddItem('emptycowbucket', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['emptycowbucket'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed A Bucket")
end)

RegisterServerEvent('qb-simplefarming:diarymilk', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local milkbucket = Player.Functions.GetItemByName('milkbucket')
    if not milkbucket then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_milkprocessor'])
        return false
    end

    local amount = milkbucket.amount
    if amount >= 1 then
        amount = Config.MilkProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('milkbucket', amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milkbucket'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['milk_processing'])
    local amount = Config.Milk
    Wait(750)
    Player.Functions.AddItem('milk', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['milk_trader'])
end)

------------------------------- Pumpkin Farming ----------------------------

RegisterServerEvent('qb-simplefarming:pumpkinpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pumpkinfarming = 1
    Player.Functions.AddItem('rawpumpkin', pumpkinfarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rawpumpkin'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Picked up " ..pumpkinfarming.. " Pumpkin")
end)

RegisterServerEvent('qb-simplefarming:pumpkinprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pumpkin = Player.Functions.GetItemByName('rawpumpkin')
    if not pumpkin then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_milkprocessor'])
        return false
    end

    local amount = pumpkin.amount
    if amount >= 1 then
        amount = Config.PumpkinProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('rawpumpkin', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rawpumpkin'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pumpkin_processing'])
    local amount = Config.PumpkinBoxes
    Wait(750)
    Player.Functions.AddItem('pumpkinpiebox', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pumpkinpiebox'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pumpkin_trader'])
end)

QBCore.Functions.CreateCallback('qb-simplefarming:pumpkincheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("rawpumpkin") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

------------------------------- Corn Farming ----------------------------

QBCore.Functions.CreateCallback('qb-simplefarming:corncheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("corncob") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-simplefarming:cornpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cornfarming = math.random(1,3)
    Player.Functions.AddItem('corncob', cornfarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['corncob'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..cornfarming.. " Corn Cobs")
end)

RegisterServerEvent('qb-simplefarming:cornprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local corn = Player.Functions.GetItemByName('corncob')
    if not corn then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_corncob'])
        return false
    end

    local amount = corn.amount
    if amount >= 1 then
        amount = Config.CornProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('corncob', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['corncob'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['corn_processing'])
    local amount = Config.CornProcessed
    Wait(750)
    Player.Functions.AddItem('canofcorn', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['canofcorn'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['corn_processed'])
end)



------------------------------- Garden ----------------------------

QBCore.Functions.CreateCallback('qb-simplefarming:grapecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("grapes") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


QBCore.Functions.CreateCallback('qb-simplefarming:greenpeppercheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("greenpepper") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


QBCore.Functions.CreateCallback('qb-simplefarming:chillycheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("chillypepper") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


QBCore.Functions.CreateCallback('qb-simplefarming:tomatoescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("tomato") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-simplefarming:grapepicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local grapepicking = math.random(1,2)
    Player.Functions.AddItem('grapes', grapepicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['grapes'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..grapepicking.. " Grapes")
end)

RegisterServerEvent('qb-simplefarming:grapeprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local grapes = Player.Functions.GetItemByName('grapes')
    if not grapes then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_grape'])
        return false
    end

    local amount = grapes.amount
    if amount >= 1 then
        amount = Config.GrapeProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('grapes', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['grapes'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['grape_processing'])
    local amount = Config.GrapeProcessed
    Wait(750)
    Player.Functions.AddItem('grapejuice', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['grapejuice'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['grape_processed'])
end)

-- Green Peppers

RegisterServerEvent('qb-simplefarming:gpepperpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local gpepperpicking = math.random(1,3)
    Player.Functions.AddItem('greenpepper', gpepperpicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['greenpepper'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..gpepperpicking.. " Green Peppers")
end)

-- Chilly Peppers

RegisterServerEvent('qb-simplefarming:chypepperpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local chypepperpicking = math.random(1,3)
    Player.Functions.AddItem('chillypepper', chypepperpicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['chillypepper'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..chypepperpicking.. " Chilly Peppers")
end)

RegisterServerEvent('qb-simplefarming:makinghotsauce', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pepper = Player.Functions.GetItemByName('chillypepper')
    if not pepper then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_chilly'])
        return false
    end

    local amount = pepper.amount
    if amount >= 1 then
        amount = Config.ChillyProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('chillypepper', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['chillypepper'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['chilly_processing'])
    local amount = Config.ChillyProcessed
    Wait(750)
    Player.Functions.AddItem('hotsauce', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['hotsauce'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['chilly_processed'])
end)

-- Tomatoes

RegisterServerEvent('qb-simplefarming:tomatoespicking', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local tompicking = math.random(1,3)
    Player.Functions.AddItem('tomato', tompicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tomato'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..tompicking.. " Red Tomatoes")
end)

RegisterServerEvent('qb-simplefarming:tomatoesprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local tom = Player.Functions.GetItemByName('tomato')
    if not tom then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_tomatoes'])
        return false
    end

    local amount = tom.amount
    if amount >= 1 then
        amount = Config.TomatoesProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('tomato', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tomato'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['tomatoes_processing'])
    local amount = Config.TomatoesProcessed
    Wait(750)
    Player.Functions.AddItem('tomatopaste', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tomatopaste'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['tomatoes_processed'])
end)

-- Pig

QBCore.Functions.CreateCallback('qb-simplefarming:soybeancheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("soybeans") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:rawbacon', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_bacon") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:rawham', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_ham") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:rawpork', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_pork") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:rawsausage', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_sausage") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-simplefarming:baconprocessed', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local bacon = Player.Functions.GetItemByName('raw_bacon')
    if not bacon then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_bacon'])
        return false
    end

    local amount = bacon.amount
    if amount >= 1 then
        amount = Config.BaconProcesing
    else
      return false
    end

    if not Player.Functions.RemoveItem('raw_bacon', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_bacon'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['bacon_processing'])
    local amount = Config.BaconProcessed
    Wait(750)
    Player.Functions.AddItem('cooked_bacon', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cooked_bacon'], "add")
end)

RegisterServerEvent('qb-simplefarming:hamprocessed', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local ham = Player.Functions.GetItemByName('raw_ham')
    if not ham then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_ham'])
        return false
    end

    local amount = ham.amount
    if amount >= 1 then
        amount = Config.HamProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('raw_ham', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_ham'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['ham_processing'])
    local amount = Config.HamProcessing
    Wait(750)
    Player.Functions.AddItem('cooked_ham', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cooked_ham'], "add")
end)

RegisterServerEvent('qb-simplefarming:porkprocessed', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pork = Player.Functions.GetItemByName('raw_pork')
    if not pork then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_pork'])
        return false
    end

    local amount = pork.amount
    if amount >= 1 then
        amount = Config.PorkProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('raw_pork', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_pork'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pork_cooking'])
    local amount = Config.PorkProcessed
    Wait(750)
    Player.Functions.AddItem('cooked_pork', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cooked_pork'], "add")
end)

RegisterServerEvent('qb-simplefarming:sausageprocessed', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local sausage = Player.Functions.GetItemByName('raw_sausage')
    if not sausage then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_sausage'])
        return false
    end

    local amount = sausage.amount
    if amount >= 1 then
        amount = Config.SausageProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('raw_sausage', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_sausage'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['sausage_processing'])
    local amount = Config.SausageProcessed
    Wait(750)
    Player.Functions.AddItem('cooked_sausage', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cooked_sausage'], "add")
end)

RegisterServerEvent('qb-simplefarming:pigfood', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local price = Config.FoodPrice
    local pigfoodamount = Config.PigFood
    Player.Functions.RemoveMoney("cash", price)
    TriggerClientEvent('QBCore:Notify', source, "Bought pig food for $" ..price.. " Enjoy!")
    Player.Functions.AddItem('soybeans', pigfoodamount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['soybeans'], "add")
    TriggerClientEvent('QBCore:Notify', source, "The farmer gave you " ..pigfoodamount.. " of Soy Beans", "success")
end)

RegisterServerEvent('qb-simplefarming:feedingpiglit', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local soybean = Player.Functions.GetItemByName('soybeans')
    if not soybean then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_soybean'])
        return false
    end

    local amount = soybean.amount
    if amount >= 1 then
        amount = 1
    else
      return false
    end

    if not Player.Functions.RemoveItem('soybeans', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error.soybean'])
        return false
    end
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['soybeans'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['stress'])
    TriggerClientEvent('qb-simplefarming:relievestress', source)
end)

RegisterNetEvent('qb-simplefarming:slayreward', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local rawbacon = math.random(1, 6)
    local rawham = math.random(1, 4)
    local rawpork = math.random(2, 3)
    local rawsausage = math.random(1, 10)
    Player.Functions.AddItem('raw_bacon', rawbacon)
    Player.Functions.AddItem('raw_ham', rawham)
    Player.Functions.AddItem('raw_pork', rawpork)
    Player.Functions.AddItem('raw_sausage', rawsausage)
    Player.Functions.AddItem('pig_leather', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_bacon'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_ham'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_pork'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_sausage'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pig_leather'], "add")
    TriggerClientEvent('QBCore:Notify', source, "You gathered " ..rawbacon.. " raw bacon " ..rawham.. " raw ham " ..rawpork.. " raw pork " ..rawsausage.. " raw sausage with some leather")
end)

--- Useable Items

QBCore.Functions.CreateUseableItem("apple", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("apple_juice", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("beef", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("milk", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("slicedpie", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("corncob", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("canofcorn", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("grapes", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("grapejuice", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("greenpepper", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("chillypepper", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hotsauce", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("tomato", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("tomatopaste", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cooked_bacon", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cooked_sausage", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cooked_pork", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cooked_ham", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print("^0\n ------------------------------------------------------------------------------------------------------------------------------\n ^1\n  ██████╗ ██████╗       ███████╗██╗███╗   ███╗██████╗ ██╗     ███████╗███████╗ █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗ ██████╗ \t \n ██╔═══██╗██╔══██╗      ██╔════╝██║████╗ ████║██╔══██╗██║     ██╔════╝██╔════╝██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║██╔════╝ \r \n ██║   ██║██████╔╝█████╗███████╗██║██╔████╔██║██████╔╝██║     █████╗  █████╗  ███████║██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ███╗\t \n ██║▄▄ ██║██╔══██╗╚════╝╚════██║██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝  ██╔══╝  ██╔══██║██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║   ██║\t \n ╚██████╔╝██████╔╝      ███████║██║██║ ╚═╝ ██║██║     ███████╗███████╗██║     ██║  ██║██║  ██║██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝\t \n  ╚══▀▀═╝ ╚═════╝       ╚══════╝╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ \t \n    \n   \n                   ^1Discord ^5 --> ^0https://discord.gg/zRCdhENsHG                         ^1Author^5: ^0TRClassic#0001 \n \n------------------------------------------------------------------------------------------------------------------------------ \n ")
end)