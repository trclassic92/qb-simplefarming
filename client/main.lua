local QBCore = exports['qb-core']:GetCoreObject()
local inZone = false

----------------------------------- Apple Stuff -----------------------------------

if Config.UseBlips then
  CreateThread(function()
    for k, v in pairs(AppleField) do
      local AppleFieldBlip = AddBlipForCoord(AppleField[k].BlipCoord)
        SetBlipSprite(AppleFieldBlip, AppleField[k].Blip)
        SetBlipAsShortRange(AppleFieldBlip, true)
        SetBlipScale(AppleFieldBlip, 0.8)
        SetBlipColour(AppleFieldBlip, AppleField[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(AppleField[k].label)
        EndTextCommandSetBlipName(AppleFieldBlip)

      local ApplePicking = PolyZone:Create(AppleField[k].zones, {
        name = AppleField[k].label,
        minZ = AppleField[k].minz,
        maxZ = AppleField[k].maxz,
        debugPoly = false
      })

      ApplePicking:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('AppleTrees')
        else
          for k, v in pairs(ATreeZones) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k, v in pairs(AppleField) do
      local ApplePicking = PolyZone:Create(AppleField[k].zones, {
        name = AppleField[k].label,
        minZ = AppleField[k].minz,
        maxZ = AppleField[k].maxz,
        debugPoly = false
      })

      ApplePicking:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('AppleTrees')
        else
          for k, v in pairs(ATreeZones) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end

RegisterNetEvent('qb-simplefarming:processapples', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:apples', function(apples)
    if apples then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('apple_processing', Config.Alerts['apple_progressbar'], Config.ProcessingTime['apple_processingtime'], false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()    
      TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("qb-simplefarming:appleprocess")
      end, function() 
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not apples then
      QBCore.Functions.Notify(Config.Alerts['error_appleprocessor'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:appletree', function()
  QBCore.Functions.Progressbar('apple_pickingapples', Config.Alerts['apple_pickingbar'], 7500, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,
    }, {
    animDict = 'missmechanic',
    anim = 'work_base',
    flags = 16,
    }, {}, {}, function() 
        TriggerServerEvent('qb-simplefarming:applepicking')
    end, function() 
    QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
  end)
end)


CreateThread(function()
  for k, v in pairs(ATreeZones) do 
  end
end)


RegisterNetEvent('AppleTrees', function()
  for k, v in pairs(ATreeZones) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), 1, 1, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:appletree",
          icon = "fas fa-apple-alt",
          label = "Pick Apples",
        },
      },
    distance = v.distance,
  })
  end
end)

----------------------------------- Cow Farming Stuff -----------------------------------

-- Animals
if Config.UseBlips then
  CreateThread(function()
    for k, v in pairs(Barns) do
      local BarnBlip = AddBlipForCoord(Barns[k].BlipCoord)
        SetBlipSprite(BarnBlip, Barns[k].Blip)
        SetBlipAsShortRange(BarnBlip, true)
        SetBlipScale(BarnBlip, 0.8)
        SetBlipColour(BarnBlip, Barns[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Barns[k].label)
        EndTextCommandSetBlipName(BarnBlip)

      local BarnFarming = PolyZone:Create(Barns[k].zones, {
          name = Barns[k].label,
          minZ = Barns[k].minz,
          maxZ = Barns[k].maxz,
          debugPoly = false
      })

      BarnFarming:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('AnimalFraming')
          TriggerEvent('AnimalFraming2')
          TriggerEvent('AnimalFraming3')
          TriggerEvent('AnimalFraming4')
        else
          for k, v in pairs(CowFarming1) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(CowFarming2) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(CowFarming3) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(CowFarming4) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k, v in pairs(Barns) do
      local BarnFarming = PolyZone:Create(Barns[k].zones, {
          name = Barns[k].label,
          minZ = Barns[k].minz,
          maxZ = Barns[k].maxz,
          debugPoly = false
      })

      BarnFarming:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('AnimalFraming')
            TriggerEvent('AnimalFraming2')
            TriggerEvent('AnimalFraming3')
            TriggerEvent('AnimalFraming4')
          else
            for k, v in pairs(CowFarming1) do 
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for k, v in pairs(CowFarming2) do 
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for k, v in pairs(CowFarming3) do 
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for k, v in pairs(CowFarming4) do 
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
      end)
    end
  end)
end

RegisterNetEvent('qb-simplefarming:beefprocessing', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:cowmeat', function(rawbeef)
    if rawbeef then
      TriggerEvent('animations:client:EmoteCommandStart', {"BBQ"})
      QBCore.Functions.Progressbar('beef_processing', Config.Alerts['cow_processbar'], Config.ProcessingTime['beef_processingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()    
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:beefprocess")
      end, function() 
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not rawbeef then
      QBCore.Functions.Notify(Config.Alerts['error_rawmeat'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:diaryprocessor', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:milkbucketfull', function(milkbucket)
    if milkbucket then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('diary_processing', Config.Alerts['cow_diaryprocessorbar'], Config.ProcessingTime['milk_tradingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()    
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("qb-simplefarming:diarymilk")
    end, function() 
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  elseif not milkbucket then
      QBCore.Functions.Notify(Config.Alerts['error_milkprocessor'], "error", 3000)
      Wait(750)
      QBCore.Functions.Notify(Config.Alerts['error_milklocation'])
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:milkcow', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:emptycowbucket', function(emptybucket)
    if emptybucket then
      local playerPed = PlayerPedId()
      local coords = GetEntityCoords(playerPed)
      TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_BUM_WASH', 0, false)
      QBCore.Functions.Progressbar('cow_milking', Config.Alerts['cow_milking'], 12000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {
    }, {}, {}, function() 
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent("qb-simplefarming:cowmilking")
    end, function() 
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
    elseif not emptybucket then
      Wait(500)
      QBCore.Functions.Notify(Config.Alerts['emptybucket'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-getcowbucket', function()
	local ped = PlayerPedId()    
  RequestAnimDict("anim@heists@box_carry@")
	Citizen.Wait(100)
  milkprop = CreateObject(GetHashKey("prop_old_churn_01"), 0, 0, 0, true, true, true)        
  AttachEntityToEntity(milkprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.12, 0, 0.30, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
  TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
  Citizen.Wait(2500)
  DetachEntity(milkprop, 1, true)
  DeleteEntity(milkprop)
  DeleteObject(milkprop)
  TriggerServerEvent('qb-simplefarming:getcowbucket')
end)

RegisterNetEvent('AnimalFraming', function()
  for k, v in pairs(CowFarming1) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:milkcow",
          icon = "fa fa-tint",  
          label = "Milk Cow",
        },
        {
          type = "client",
          event = "qb-simplefarming:slaughter1",
          icon = "fa fa-cutlery",
          label = "Kill Cow",
        },
      },
      distance = v.distance,
    }) 
  end
end)

RegisterNetEvent('AnimalFraming2', function()
  for k, v in pairs(CowFarming2) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:milkcow",
          icon = "fa fa-tint",  
          label = "Milk Cow",
        },
        {
          type = "client",
          event = "qb-simplefarming:slaughter2",
          icon = "fa fa-cutlery",
          label = "Kill Cow",
        },
      },
      distance = v.distance,
    }) 
  end
end)


RegisterNetEvent('AnimalFraming3', function()
  for k, v in pairs(CowFarming3) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:milkcow",
          icon = "fa fa-tint",  
          label = "Milk Cow",
        },
        {
          type = "client",
          event = "qb-simplefarming:slaughter3",
          icon = "fa fa-cutlery",
          label = "Kill Cow",
        },
      },
      distance = v.distance,
    }) 
  end
end)


RegisterNetEvent('AnimalFraming4', function()
  for k, v in pairs(CowFarming4) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:milkcow",
          icon = "fa fa-tint",  
          label = "Milk Cow",
        },
        {
          type = "client",
          event = "qb-simplefarming:slaughter4",
          icon = "fa fa-cutlery",
          label = "Kill Cow",
        },
      },
      distance = v.distance,
    }) 
  end
end)


exports['qb-target']:AddBoxZone("GetCowBucket", vector3(419.13, 6470.74, 28.82), 1.4, 0.5, {
  name = "GetCowBucket",
  heading=315,
  debugPoly = false,
  minZ=24.37,
    maxZ=28.77,
  }, {
    options = {
      {
        type = "client",
        event = "qb-getcowbucket",
        icon = "fas fa-sign-in-alt",
        label = "Grab A Bucket",
      },
    },
  distance = 1.2  
})


------------ Pumpkins --------------
if Config.UseBlips then
  CreateThread(function()
    for k, v in pairs(PumpkinField) do
      local PumpkinFarmingBlip = AddBlipForCoord(PumpkinField[k].BlipCoord)
        SetBlipSprite(PumpkinFarmingBlip, PumpkinField[k].Blip)
        SetBlipAsShortRange(PumpkinFarmingBlip, true)
        SetBlipScale(PumpkinFarmingBlip, 0.8)
        SetBlipColour(PumpkinFarmingBlip, PumpkinField[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(PumpkinField[k].label)
        EndTextCommandSetBlipName(PumpkinFarmingBlip)

      local PumpkinFarmingLocation = PolyZone:Create(PumpkinField[k].zones, {
        name = PumpkinField[k].label,
        minZ = PumpkinField[k].minz,
        maxZ = PumpkinField[k].maxz,
        debugPoly = false
      })

      PumpkinFarmingLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:pumpkin')
        else
          for k, v in pairs(PumpkinFarming1) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k, v in pairs(PumpkinField) do
      local PumpkinFarmingLocation = PolyZone:Create(PumpkinField[k].zones, {
        name = PumpkinField[k].label,
        minZ = PumpkinField[k].minz,
        maxZ = PumpkinField[k].maxz,
        debugPoly = false
      })

      PumpkinFarmingLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:pumpkin')
        else
          for k, v in pairs(PumpkinFarming1) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end


RegisterNetEvent('qb-simplefarming:pumpkinfarming', function()
  local playerPed = PlayerPedId()
  local coords = GetEntityCoords(playerPed)
  TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
  QBCore.Functions.Progressbar("picking_pumpkins", Config.Alerts['picking_pumpkins'], 3000, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
  }, {}, {}, {}, function()
      ClearPedTasks(PlayerPedId())
      RequestAnimDict("anim@heists@box_carry@")
      Citizen.Wait(100)
      pumpkinprop = CreateObject(GetHashKey("prop_veg_crop_03_pump"), 0, 0, 0, true, true, true)        
      AttachEntityToEntity(pumpkinprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.12, 0, 0.30, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
      TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
      Citizen.Wait(3500)
      DetachEntity(pumpkinprop, 1, true)
      DeleteEntity(pumpkinprop)
      DeleteObject(pumpkinprop)
      TriggerServerEvent('qb-simplefarming:pumpkinpicking')
  end, function() 
      ClearPedTasks(PlayerPedId())
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
  end)
end)

RegisterNetEvent('qb-simplefarming:pumpkinpie', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:pumpkincheck', function(pumpkin)
    if pumpkin then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('diary_processing', Config.Alerts['pumpkin_processingbar'], Config.ProcessingTime['pumpkin_smashingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()    
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("qb-simplefarming:pumpkinprocessing")
      end, function() 
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not pumpkin then
        QBCore.Functions.Notify(Config.Alerts['error_pumpkinsmashing'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:pumpkin', function()
  for k, v in pairs(PumpkinFarming1) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:pumpkinfarming",
          icon = "fa fa-sign-language",  
          label = "Pick Pumpkin",
        },
      },
      distance = v.distance,
    }) 
  end
end)

-- Corn --
if Config.UseBlips then
  CreateThread(function()
    for k, v in pairs(CornFields) do
      local CornFieldBlips = AddBlipForCoord(CornFields[k].BlipCoord)
        SetBlipSprite(CornFieldBlips, CornFields[k].Blip)
        SetBlipAsShortRange(CornFieldBlips, true)
        SetBlipScale(CornFieldBlips, 0.8)
        SetBlipColour(CornFieldBlips, CornFields[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(CornFields[k].label)
        EndTextCommandSetBlipName(CornFieldBlips)

      local CornFieldLocation = PolyZone:Create(CornFields[k].zones, {
        name = CornFields[k].label,
        minZ = CornFields[k].minz,
        maxZ = CornFields[k].maxz,
        debugPoly = false
      })

      CornFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('CornField')
        else
          for k, v in pairs(CornField1) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k, v in pairs(CornFields) do
      local CornFieldLocation = PolyZone:Create(CornFields[k].zones, {
        name = CornFields[k].label,
        minZ = CornFields[k].minz,
        maxZ = CornFields[k].maxz,
        debugPoly = false
      })

      CornFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('CornField')
        else
          for k, v in pairs(CornField1) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end

RegisterNetEvent('qb-simplefarming:cornfield', function()
  QBCore.Functions.Progressbar("picking_corns", Config.Alerts['corn_picking'], 3000, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
    }, {
      animDict = 'missmechanic',
      anim = 'work_base',
      flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-simplefarming:cornpicking')
    end, function() 
    ClearPedTasks(PlayerPedId())
    QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
  end)
end)


RegisterNetEvent('qb-simplefarming:makecancorn', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:corncheck', function(corncob)
    if corncob then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('diary_processing', Config.Alerts['corn_progressbar'], Config.ProcessingTime['pumpkin_smashingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()    
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:cornprocessing")
      end, function() 
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not corncob then
      QBCore.Functions.Notify(Config.Alerts['error_corncob'], "error", 3000)
    end
  end)
end)


RegisterNetEvent('CornField', function()
  for k, v in pairs(CornField1) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:cornfield",
          icon = "fa fa-sign-language",  
          label = "Grather Corn",
        },
      },
      distance = v.distance,
    }) 
  end
end)



-- Gradens --
if Config.UseBlips then
  CreateThread(function()
    for k, v in pairs(Garden) do
      local GardenBlips = AddBlipForCoord(Garden[k].BlipCoord)
        SetBlipSprite(GardenBlips, Garden[k].Blip)
        SetBlipAsShortRange(GardenBlips, true)
        SetBlipScale(GardenBlips, 0.8)
        SetBlipColour(GardenBlips, Garden[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Garden[k].label)
        EndTextCommandSetBlipName(GardenBlips)

      local GardenLocation = PolyZone:Create(Garden[k].zones, {
        name = Garden[k].label,
        minZ = Garden[k].minz,
        maxZ = Garden[k].maxz,
        debugPoly = false
      })

      GardenLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('GrapeField')
          TriggerEvent('GreenPeppers')
          TriggerEvent('ChillPeppers')
          TriggerEvent('Tomatoes')
        else
          for k, v in pairs(GrapeFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(GPeppersFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(CPeppersFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(TomatoesField) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k, v in pairs(Garden) do
      local GardenLocation = PolyZone:Create(Garden[k].zones, {
        name = Garden[k].label,
        minZ = Garden[k].minz,
        maxZ = Garden[k].maxz,
        debugPoly = false
      })

      GardenLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('GrapeField')
          TriggerEvent('GreenPeppers')
          TriggerEvent('ChillPeppers')
          TriggerEvent('Tomatoes')
        else
          for k, v in pairs(GrapeFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(GPeppersFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(CPeppersFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(TomatoesField) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end

RegisterNetEvent('qb-simplefarming:grapefield', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"Mechanic4"})
  QBCore.Functions.Progressbar("grapefield_picking", Config.Alerts['grape_picking'], 3000, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,
    disableInventory = true,
  }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"C"})
    TriggerServerEvent('qb-simplefarming:grapepicking')
  end, function() 
    ClearPedTasks(PlayerPedId())
    QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
  end)
end)

RegisterNetEvent('qb-simplefarming:greenpepperfield', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"Mechanic4"})
  QBCore.Functions.Progressbar("greenpepper_picking", Config.Alerts['greenpepper_picking'], 3000, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,
    disableInventory = true,
  }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"C"})
    TriggerServerEvent('qb-simplefarming:gpepperpicking')
  end, function() 
    ClearPedTasks(PlayerPedId())
    QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
  end)
end)

RegisterNetEvent('qb-simplefarming:chillfield', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"Mechanic4"})
  QBCore.Functions.Progressbar("chilly_picking", Config.Alerts['chillypepper_picking'], 3000, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,
    disableInventory = true,
  }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"C"})
    TriggerServerEvent('qb-simplefarming:chypepperpicking')
  end, function() 
    ClearPedTasks(PlayerPedId())
    QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
  end)
end)

RegisterNetEvent('qb-simplefarming:tomatoefields', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"Mechanic4"})
  QBCore.Functions.Progressbar("tomatoes_picking", Config.Alerts['tomatoes_picking'], 3000, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,
    disableInventory = true,
  }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"C"})
    TriggerServerEvent('qb-simplefarming:tomatoespicking')
  end, function() 
    ClearPedTasks(PlayerPedId())
    QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
  end)
end)

RegisterNetEvent('qb-simplefarming:makingragu', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:tomatoescheck', function(tomatoes)
    if tomatoes then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('diary_processing', Config.Alerts['tomatoes_processing'], Config.ProcessingTime['tomatoes_processingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()    
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:tomatoesprocessing")
      end, function() 
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not tomatoes then
      QBCore.Functions.Notify(Config.Alerts['error_tomatoes'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:makingchillysauce', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:chillycheck', function(hotstuff)
    if hotstuff then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('diary_processing', Config.Alerts['chilly_hotsauce'], Config.ProcessingTime['chillypepper_processingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()    
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:makinghotsauce")
      end, function() 
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not hotstuff then
      QBCore.Functions.Notify(Config.Alerts['error_chilly'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:makinggrapejuice', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:grapecheck', function(grapes)
    if grapes then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('diary_processing', Config.Alerts['grape_progressbar'], Config.ProcessingTime['grape_processingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()    
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:grapeprocessing")
      end, function() 
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not grapes then
      QBCore.Functions.Notify(Config.Alerts['error_grape'], "error", 3000)
    end
  end)
end)


RegisterNetEvent('GrapeField', function()
  for k, v in pairs(GrapeFields) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
          {
            type = "client",
            event = "qb-simplefarming:grapefield",
            icon = "fa fa-sign-language",  
            label = "Pick From Garden",
          },
        },
      distance = v.distance,
    }) 
  end
end)


RegisterNetEvent('GreenPeppers', function()
  for k, v in pairs(GPeppersFields) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
          {
            type = "client",
            event = "qb-simplefarming:greenpepperfield",
            icon = "fa fa-sign-language",  
            label = "Pick From Garden",
          },
        },
      distance = v.distance,
    }) 
  end
end)

RegisterNetEvent('ChillPeppers', function()
  for k, v in pairs(CPeppersFields) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
          {
            type = "client",
            event = "qb-simplefarming:chillfield",
            icon = "fa fa-sign-language",  
            label = "Pick From Garden",
          },
        },
      distance = v.distance,
    }) 
  end
end)


RegisterNetEvent('Tomatoes', function()
  for k, v in pairs(TomatoesField) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
          {
            type = "client",
            event = "qb-simplefarming:tomatoefields",
            icon = "fa fa-sign-language",  
            label = "Pick From Garden",
          },
        },
      distance = v.distance,
    }) 
  end
end)


-- Big Garden 
if Config.UseBlips then
  CreateThread(function()
    for k, v in pairs(BigGarden) do
    local BigGardenBlips = AddBlipForCoord(BigGarden[k].BlipCoord)
      SetBlipSprite(BigGardenBlips, BigGarden[k].Blip)
      SetBlipAsShortRange(BigGardenBlips, true)
      SetBlipScale(BigGardenBlips, 0.8)
      SetBlipColour(BigGardenBlips, BigGarden[k].BlipColor)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(BigGarden[k].label)
      EndTextCommandSetBlipName(BigGardenBlips)

    local BigGardenLocation = PolyZone:Create(BigGarden[k].zones, {
        name = BigGarden[k].label,
        minZ = BigGarden[k].minz,
        maxZ = BigGarden[k].maxz,
        debugPoly = false
    })

      BigGardenLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('BigGrapeField')
          TriggerEvent('BigGreenPField')
          TriggerEvent('BigChillyField')
          TriggerEvent('BigTomField')
        else
          for k, v in pairs(BigGrapeFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(BigGreenPepperFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(BigChillyPepperFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(BigTomatoesFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k, v in pairs(BigGarden) do
      local BigGardenLocation = PolyZone:Create(BigGarden[k].zones, {
        name = BigGarden[k].label,
        minZ = BigGarden[k].minz,
        maxZ = BigGarden[k].maxz,
        debugPoly = false
      })

      BigGardenLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('BigGrapeField')
          TriggerEvent('BigGreenPField')
          TriggerEvent('BigChillyField')
          TriggerEvent('BigTomField')
        else
          for k, v in pairs(BigGrapeFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(BigGreenPepperFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(BigChillyPepperFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(BigTomatoesFields) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end

RegisterNetEvent('BigGrapeField', function()
  for k, v in pairs(BigGrapeFields) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:grapefield",
          icon = "fa fa-sign-language",  
          label = "Pick From Garden",
        },
      },
      distance = v.distance,
    }) 
  end
end)


RegisterNetEvent('BigGreenPField', function()
  for k, v in pairs(BigGreenPepperFields) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:greenpepperfield",
          icon = "fa fa-sign-language",  
          label = "Pick From Garden",
        },
      },
      distance = v.distance,
    }) 
  end
end)

RegisterNetEvent('BigChillyField', function()
  for k, v in pairs(BigChillyPepperFields) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:chillfield",
          icon = "fa fa-sign-language",  
          label = "Pick From Garden",
        },
      },
      distance = v.distance,
    }) 
  end
end)


RegisterNetEvent('BigTomField', function()
  for k, v in pairs(BigTomatoesFields) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:tomatoefields",
          icon = "fa fa-sign-language",  
          label = "Pick From Garden",
        },
      },
      distance = v.distance,
    }) 
  end
end)

if Config.UseBlips then
  CreateThread(function()
    for k, v in pairs(PigFarm) do
      local PigFarmBlips = AddBlipForCoord(PigFarm[k].BlipCoord)
        SetBlipSprite(PigFarmBlips, PigFarm[k].Blip)
        SetBlipAsShortRange(PigFarmBlips, true)
        SetBlipScale(PigFarmBlips, 0.8)
        SetBlipColour(PigFarmBlips, PigFarm[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(PigFarm[k].label)
        EndTextCommandSetBlipName(PigFarmBlips)

      local PigFarmLocation = PolyZone:Create(PigFarm[k].zones, {
        name = PigFarm[k].label,
        minZ = PigFarm[k].minz,
        maxZ = PigFarm[k].maxz,
        debugPoly = false
      })

      PigFarmLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('PigPens')
        else
          for k, v in pairs(PigPens1) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens2) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens3) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens4) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens5) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens6) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens7) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens8) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens9) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens10) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens11) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens12) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens13) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens14) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens15) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens16) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k, v in pairs(PigFarm) do
      local PigFarmLocation = PolyZone:Create(PigFarm[k].zones, {
        name = PigFarm[k].label,
        minZ = PigFarm[k].minz,
        maxZ = PigFarm[k].maxz,
        debugPoly = false
      })

      PigFarmLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('PigPens')
        else
          for k, v in pairs(PigPens1) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens2) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens3) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens4) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens5) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens6) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens7) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens8) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens9) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens10) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens11) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens12) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens13) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens14) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens15) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
          for k, v in pairs(PigPens16) do 
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end

RegisterNetEvent('qb-simplefarming:petpiggy', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"Petting"})
  QBCore.Functions.Progressbar("pet_pig", "Petting Pig", 5000, false, true, { -- 5 Seconds
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
  }, {}, {}, {}, function()
      TriggerEvent('animations:client:EmoteCommandStart', {"c"})
      TriggerServerEvent('hud:server:RelieveStress', math.random(2, 5))
      Wait(1000)
      QBCore.Functions.Notify(Config.Alerts['stress'])
  end, function() 
      ClearPedTasks(PlayerPedId())
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
  end)
end)

RegisterNetEvent('qb-simplefarming:feedpig', function ()
  QBCore.Functions.TriggerCallback('qb-simplefarming:soybeancheck', function(soybeans)
    if soybeans then
      TriggerEvent('animations:client:EmoteCommandStart', {"Bumbin"})
      QBCore.Functions.Progressbar("feeding_pig", "Feeding Pig", 5000, false, true, { -- 5 Seconds
          disableMovement = true,
          disableCarMovement = true,
          disableMouse = false,
          disableCombat = true,
          disableInventory = true,
      }, {}, {}, {}, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:feedingpiglit")
          Wait(2000)
      end, function() 
          ClearPedTasks(PlayerPedId())
          QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not soybeans then
      QBCore.Functions.Notify(Config.Alerts['error.soybean'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:relievestress', function ()
  TriggerServerEvent('hud:server:RelieveStress', math.random(2, 5))
end)

RegisterNetEvent('qb-simplefarming:baconprocessing', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:rawbacon', function(rawbeef)
    if rawbeef then
      TriggerEvent('animations:client:EmoteCommandStart', {"BBQ"})
      QBCore.Functions.Progressbar('beef_processing', Config.Alerts['bacon_progressbar'], Config.ProcessingTime['bacon_processingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()    
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:baconprocessed")
      end, function() 
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not rawbeef then
      QBCore.Functions.Notify(Config.Alerts['error_bacon'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:hamprocessing', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:rawham', function(rawbeef)
    if rawbeef then
      TriggerEvent('animations:client:EmoteCommandStart', {"BBQ"})
      QBCore.Functions.Progressbar('beef_processing', Config.Alerts['ham_progressbar'], Config.ProcessingTime['ham_processingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
        disableCombat = true,
      }, {}, {}, {}, function()    
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:hamprocessed")
      end, function() 
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not rawbeef then
      QBCore.Functions.Notify(Config.Alerts['error_ham'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:porkprocessing', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:rawpork', function(rawbeef)
    if rawbeef then
      TriggerEvent('animations:client:EmoteCommandStart', {"BBQ"})
      QBCore.Functions.Progressbar('beef_processing', Config.Alerts['pork_progressbar'], Config.ProcessingTime['pork_processingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()    
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:porkprocessed")
      end, function() 
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not rawbeef then
      QBCore.Functions.Notify(Config.Alerts['error_pork'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:sausageprocessing', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:rawpork', function(rawbeef)
    if rawbeef then
      TriggerEvent('animations:client:EmoteCommandStart', {"BBQ"})
      QBCore.Functions.Progressbar('beef_processing', Config.Alerts['sausage_processing'], Config.ProcessingTime['sausage_processingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()    
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:sausageprocessed")
      end, function() 
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not rawbeef then
       QBCore.Functions.Notify(Config.Alerts['error_sausage'], "error", 3000)
    end
  end)
end)


RegisterNetEvent('PigPens', function()
  for k, v in pairs(PigPens1) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig1",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens2) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig2",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens3) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig3",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens4) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig4",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens5) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig5",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens6) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig6",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens7) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig7",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens8) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig8",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens9) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig9",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens10) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig10",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens11) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig11",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens12) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig12",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens13) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig13",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens14) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig14",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens15) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig15",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
  for k, v in pairs(PigPens16) do 
    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
        {
          type = "client",
          event = "qb-simplefarming:petpiggy",
          icon = "Fas Fa-Hand-Paper",  
          label = "Pet",
        },
        {
          type = "client",
          event = "qb-simplefarming:feedpig",
          icon = "Fas Fa-Hand-Holding-Heart",  
          label = "Feed Pig",
        },
        {
          type = "client",
          event = "qb-simplefarming:killpig16",
          icon = "Fas Fa-Piggy-Bank",  
          label = "Slaughter Pig",
        },
      },
      distance = v.distance,
    }) 
  end
end)

exports['qb-target']:AddBoxZone("diaryfarmer", DairyProcessor.targetZone, 1, 1, {
	name = "diaryfarmer",
	heading = DairyProcessor.targetHeading,
	debugPoly = false,
	minZ = DairyProcessor.minZ,
	maxZ = DairyProcessor.maxZ,
}, {
	options = {
    {
      type = "client",
      event = "qb-simplefarming:diaryprocessor",
      icon = "fab fa-rocketchat",
      label = "Talk to diary farmer",
    },
	},
	distance = 1.0
})

exports['qb-target']:AddBoxZone("piggyfarmer", PigFarmerTargetZone, 0.6, 0.8, {
	name = "piggyfarmer",
	heading = PigFarmerTzHeading,
	debugPoly = false,
	minZ = PigFarmerMinZ,
	maxZ = PigFarmerMaxZ,
}, {
	options = {
    {
      type = "server",
      event = "qb-simplefarming:pigfood",
      icon = "Fas Fa-Bacon",
      label = "Grab Pig Food",
    },
	},
	distance = 1.0
})

RegisterNetEvent('qb-simplefarming:menuprocessor', function(data)
  local Processor = {
    {
      header = "Farming Processor",
      isMenuHeader = true,
    },
    {
        header = '< Go Back',
    },
    {
        header = 'Make Apple Juice',
        params = {
            event = 'qb-simplefarming:processapples',
        }
    },
    {
        header = 'Make Pumpkin Pies',
        params = {
            event = 'qb-simplefarming:pumpkinpie',
        }
    },
    {
        header = 'Make Grape Juice',
        params = {
            event = 'qb-simplefarming:makinggrapejuice',
        }
    },
    {
        header = 'Make Caned Corn',
        params = {
            event = 'qb-simplefarming:makecancorn',
        }
    },
    {
        header = 'Make HotSauce',
        params = {
            event = 'qb-simplefarming:makingchillysauce',
        }
    },
    {
        header = 'Make TomatoPaste',
        params = {
            event = 'qb-simplefarming:makingragu',
        }
    },
}
exports['qb-menu']:openMenu(Processor)
end)

RegisterNetEvent('qb-simplefarming:menufcow', function()
  local MeatCooking = {
    {
      header = "Cooking Food",
      isMenuHeader = true,
    },
    {
        header = '< Go Back',
    },
    {
        header = 'Cook Beef',
        params = {
            event = 'qb-simplefarming:beefprocessing',
        }
    },
    {
        header = 'Cook Ham',
        params = {
            event = 'qb-simplefarming:hamprocessing',
        }
    },
    {
        header = 'Cook Bacon',
        params = {
            event = 'qb-simplefarming:baconprocessing',
        }
    },
    {
        header = 'Cook Pork',
        params = {
            event = 'qb-simplefarming:porkprocessing',
        }
    },
    {
        header = 'Cook Sausage',
        params = {
            event = 'qb-simplefarming:sausageprocessing',
        }
    },
}
exports['qb-menu']:openMenu(MeatCooking)
end)


exports['qb-target']:AddBoxZone("grammahouse", vector3(2438.07, 4975.82, 46.81), 1.0, 1.0, {
	name = "grammahouse",
	heading = 315,
	debugPoly = false,
  minZ = 46.76,
  maxZ = 47.16,
}, {
	options = {
    {
      type = "client",
      event = "qb-simplefarming:menufcow",
      icon = "Fas Fa-hands",
      label = "Start Cooking",
    },
	},
	distance = 1.0
})

exports['qb-target']:AddBoxZone("processingped", FoodProcessor.targetZone, 1, 1, {
	name = "processingtrader",
	heading = FoodProcessor.targetHeading,
	debugPoly = false,
	minZ = FoodProcessor.minZ,
	maxZ = FoodProcessor.maxZ,
}, {
	options = {
    {
      type = "client",
      event = "qb-simplefarming:menuprocessor",
      icon = "Fas Fa-hands",
      label = "Talk to farmer",
    },
	},
	distance = 1.0
})

exports['qb-target']:AddBoxZone("sellerped", Seller.targetZone, 1, 1, {
	name = "seller",
	heading = Seller.targetHeading,
	debugPoly = false,
	minZ = Seller.minZ,
	maxZ = Seller.maxZ,
}, {
	options = {
    {
      type = "server",
      event = "qb-simpefarming:sellItems",
      icon = "Fas Fa-hands",
      label = "Talk to farmer",
    },
	},
	distance = 1.0
})
