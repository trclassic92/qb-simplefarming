Config = Config or {}

Config.UseBlips = true                                 -- True / false option for toggling farm blips

Config.PedModel = "a_m_m_farmer_01"                    -- Ped model  https://wiki.rage.mp/index.php?title=Peds
Config.PedHash = 0x94562DD7                            -- Hash numbers for ped model

-- Blips
FoodProcessor = {
    targetZone = vector3(2853.98, 4557.02, 46.15),      -- qb-target vector
    targetHeading = 5,                                  -- qb-target box zone
    coords = vector4(2853.98, 4557.02, 46.15, 25.64),   -- Move Location (Ped and blip)
    SetBlipSprite = 568,                                -- Blip Icon (https://docs.fivem.net/docs/game-references/blips/)
    SetBlipDisplay = 6,                                 -- Blip Behavior (https://docs.fivem.net/natives/?_0x9029B2F3DA924928)
    SetBlipScale = 0.65,                                -- Blip Size
    SetBlipColour = 35,                                 -- Blip Color
    BlipLabel = "Food Processor",                       -- Blip Label
    minZ = 43.95,                                       -- qb-target Min
    maxZ = 47.95,                                       -- qb-target Max
}
DairyProcessor = {
    targetZone = vector3(2567.92, 4684.44, 33.05),
    targetHeading = 330,
    coords = vector4(2567.92, 4684.44, 33.05, 47.10),
    SetBlipSprite = 568,
    SetBlipDisplay = 6,
    SetBlipScale = 0.65,
    SetBlipColour = 32,
    BlipLabel = "Dairy Processor",
    minZ = 32.05,
    maxZ = 35.00,
}
Seller = {
    targetZone = vector3(760.4, -3194.97, 6.07),
    targetHeading = 265.82,
    coords = vector4(760.4, -3194.97, 6.07 - 1.00, 265.82),
    SetBlipSprite = 642,
    SetBlipDisplay = 6,
    SetBlipScale = 0.65,
    SetBlipColour = 17,
    BlipLabel = "Farm Seller",
    minZ = 4,
    maxZ = 7,
}

-- Pig Farm (Food)

Config.PigFood = 5                                      -- Food Amount (Pig Food)
Config.FoodPrice = 5                                    --  Pig Farm Food Price
PigFarmer = vector4(2166.11, 5003.84, 40.39, 312.56)    -- Ped Location
PigFarmerTargetZone = vector3(2166.11, 5003.84, 40.39)  -- QB-Target location
PigFarmerTzHeading = 305                                -- QB-Target Heading
PigFarmerMinZ = 40				                    	-- QB-Target MinZ
PigFarmerMaxZ = 42				                    	-- QB-Target MaxZ

-- Processing Items
Config.AppleProcessing = 3                              -- Trading Amount
Config.BeefProcessing = 2
Config.BaconProcesing = 3
Config.HamProcessing = 2
Config.PorkProcessing = 1
Config.SausageProcessing = 2
Config.MilkProcessing = 2
Config.PumpkinProcessing = 1
Config.CornProcessing = 2
Config.GrapeProcessing = 3
Config.ChillyProcessing = 3
Config.TomatoesProcessing = 4

-- Processed Items
Config.AppleJuice = 1                                   -- Received Amount
Config.BaconProcessed = 3
Config.HamProcessed = 2
Config.PorkProcessed = 1
Config.SausageProcessed = 2
Config.CowMeat = 2
Config.Milk = 4
Config.PumpkinBoxes = 3
Config.CornProcessed = 1
Config.GrapeProcessed = 1
Config.ChillyProcessed = 1
Config.TomatoesProcessed = 1

-- Processing time
Config.ProcessingTime = {
    ["apple_processingtime"] = 5000,                    -- MS = Seconds (5000 ms = 5 seconds)
    ["beef_processingtime"] = 10000,
    ["bacon_processingtime"] = 10000,
    ["ham_processingtime"] = 10000,
    ["pork_processingtime"] = 10000,
    ["sausage_processingtime"] = 10000,
    ["milk_tradingtime"] = 7500,
    ["pumpkin_smashingtime"] = 7500,
    ["grape_processingtime"] = 7500,
    ["chillypepper_processingtime"] = 7500,
    ["tomatoes_processingtime"] = 7500,
}


-- Sell Items
Config.Sell = {
    ["apple"] = {
        ["price"] = math.random(5, 15)                  -- Seller Price
    },
    ["apple_juice"] = {
        ["price"] = math.random(25, 35)
    },
    ["milkbucket"] = {
        ["price"] = math.random(25, 35)
    },
    ["raw_beef"] = {
        ["price"] = math.random(25, 35)
    },
    ["beef"] = {
        ["price"] = math.random(25, 35)
    },
    ["milk"] = {
        ["price"] = math.random(25, 35)
    },
    ["rawpumpkin"] = {
        ["price"] = math.random(25, 35)
    },
    ["pumpkinpiebox"] = {
        ["price"] = math.random(25, 35)
    },
    ["slicedpie"] = {
        ["price"] = math.random(25, 35)
    },
    ["corncob"] = {
        ["price"] = math.random(25, 35)
    },
    ["canofcorn"] = {
        ["price"] = math.random(25, 35)
    },
    ["grapes"] = {
        ["price"] = math.random(25, 35)
    },
    ["grapejuice"] = {
        ["price"] = math.random(25, 35)
    },
    ["greenpepper"] = {
        ["price"] = math.random(25, 35)
    },
    ["chillypepper"] = {
        ["price"] = math.random(25, 35)
    },
    ["hotsauce"] = {
        ["price"] = math.random(25, 35)
    },
    ["tomato"] = {
        ["price"] = math.random(25, 35)
    },
    ["tomatopaste"] = {
        ["price"] = math.random(25, 35)
    },
    ["raw_bacon"] = {
        ["price"] = math.random(25, 35)
    },
    ["raw_sausage"] = {
        ["price"] = math.random(25, 35)
    },
    ["raw_pork"] = {
        ["price"] = math.random(25, 35)
    },
    ["raw_ham"] = {
        ["price"] = math.random(25, 35)
    },
    ["cooked_bacon"] = {
        ["price"] = math.random(25, 35)
    },
    ["cooked_sausage"] = {
        ["price"] = math.random(25, 35)
    },
    ["cooked_pork"] = {
        ["price"] = math.random(25, 35)
    },
    ["cooked_ham"] = {
        ["price"] = math.random(25, 35)
    },
    ["pig_leather"] = {
        ["price"] = math.random(25, 35)
    },
    ["cow_leather"] = {
        ["price"] = math.random(25, 35)
    }
    
}


-- Alert Notification
Config.Alerts = {
    ['cancel'] = 'Cancelled',
    ['weapon'] = 'You don\'t have a knife to do this',
    ['itemamount'] = 'You are trying to process a amount that is invalid try again!',

    ['apple_pickingbar'] = 'Picking Apples',
    ['apple_progressbar'] = 'Making Juice',
	['apple_pickingfront'] = 'You picked ',
    ['apple_pickingend'] = ' apples from the tree',
    ['apple_processing'] = 'You are processing ' ..Config.AppleProcessing.. ' amount of apples',
    ['apple_trader'] = 'Received ' ..Config.AppleJuice.. ' apple juice from the framer',
    ['error_appleprocessor'] = 'Hm, It seems like you don\'t have any apples to process... Come back later!',

    ['cow_milking'] = 'Milking The Cow',
    ['emptybucket'] = 'You don\'t have a empty bucket',
    ['killing_cow'] = 'Slaughtering Cow',
    ['error_rawmeat'] = 'Hm, It looks like you don\'t have any raw meat to process... Come back later!',
    ['cow_processbar'] = 'Cooking cow beef',
    ['cow_processing'] = 'You cooked ' ..Config.BeefProcessing.. ' raw cow beef',
    ['cow_diaryprocessorbar'] = 'Trading Raw Milk',
    ['milk_processing'] = 'You are processing ' ..Config.MilkProcessing.. ' buckets of raw milk',
    ['milk_trader'] = 'Received ' ..Config.Milk.. ' Bottles of milk',
    ['error_milkprocessor'] = 'It looks like you don\'t have any buckets of milk..',
    ['error_milklocation'] = 'Go to the Paleto Barn and milk the cows then come back!',

    ['picking_pumpkins'] = 'Picking Up Pumpkin',
    ['pumpkin_processingbar'] = 'Smashing Pumpkins',
    ['pumpkin_processing'] = 'Smashed ' ..Config.PumpkinProcessing,
    ['pumpkin_trader'] = 'Made ' ..Config.PumpkinBoxes.. ' Boxes of pumpkin pie',
    ['error_pumpkinsmashing'] = 'You don\'t have any pumpkins to smash',

    ['corn_picking'] = 'Picking Corn',
    ['corn_progressbar'] = 'Making Can Corn',
    ['corn_processing'] = 'Removed ' ..Config.CornProcessing.. ' corn',
    ['corn_processed'] = 'Made ' ..Config.CornProcessed.. ' Can\'s of corn',
    ['error_corncob'] = 'Seems like you don\'t have any corn cobs to process... Come Back Later!',

    ['grape_picking'] = 'Picking Grapes',
    ['grape_progressbar'] = 'Straining Grapes',
    ['grape_processing'] = 'Strained ' ..Config.GrapeProcessing.. ' grapes',
    ['grape_processed'] = 'Made ' ..Config.GrapeProcessed.. ' bottles of juice',
    ['error_grape'] = 'Hm, It seems like you don\'t have any grapes to process... Come back later!',

    ['greenpepper_picking'] = "Picking GreenPeppers",

    ['chillypepper_picking'] = 'Picking ChillyPeppers',
    ['chilly_hotsauce'] = 'Making Hot Sauce',
    ['chilly_processing'] = 'Crushed ' ..Config.ChillyProcessing.. ' chilly Peppers',
    ['chilly_processed'] = 'Made ' ..Config.ChillyProcessed.. ' hot sauce bottle\'s',
    ['error_chilly'] = 'Hm, It seems like you don\'t have any chilly peppers to process... Come back later!',

    ['tomatoes_picking'] = 'Picking Tomatoes',
    ['tomatoes_progressbar'] = 'Smashing Tomatoes',
    ['tomatoes_processing'] = 'Squeezed ' ..Config.TomatoesProcessing.. ' tomatoes',
    ['tomatoes_processed'] = 'Made ' ..Config.TomatoesProcessed.. ' jars of tomatopaste',
    ['error_tomatoes'] = 'Hm, It seems like you don\'t have any tomatoes to process... Come back later!',


    ['bacon_progressbar'] = 'Cooking Bacon',
    ['bacon_processing'] = 'You cooked ' ..Config.BaconProcessed.. ' pieces of bacon',
    ['error_bacon'] = 'Don\'t have any bacon to cook',

    ['ham_progressbar'] = 'Cooking Ham',
    ['ham_processing'] = 'You cooked ' ..Config.HamProcessed.. ' slices of ham',
    ['error_ham'] = 'Don\'t have any ham to cook',

    ['pork_progressbar'] = 'Cooking Pork',
    ['pork_cooking'] = 'You cooked ' ..Config.PorkProcessed.. ' slabs of pork',
    ['error_pork'] = 'Don\'t have any pork to cook',

    ['sausage_progressbar'] = 'Cooking Sausage',
    ['sausage_processing'] = 'You cooked ' ..Config.SausageProcessed.. ' pieces of sausages',
    ['error_sausage'] = 'Don\'t have any sausage to cook',

    ['killing_pig'] = 'Slaughtering Pig',
    ['pig_reward'] = 'Received items for killing the pig',

    ['error.soybean'] = 'You don\'t have any soybeans to feed the pigs',
    ['stress'] = 'Your Stress Was Relieved',
}
