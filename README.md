This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0
International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg

# qb-simplefarming
Farming script for QBCore

Included
- Easy to use config
- The ability to change notification language
- Icons (100x100)
- Map (ymap)
- Toggle Blips Option (Config)

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/BerkieBb/qb-target)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [qb-smallresources](https://github.com/qbcore-framework/qb-smallresources)
- [PolyZone](https://github.com/mkafrin/PolyZone)

## Items (qb-core/shared/item.lua)
```
	["apple"] 							= {["name"] = "apple",  	     		["label"] = "Apple",	 		["weight"] = 25, 		["type"] = "item", 		["image"] = "apple.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["apple_juice"] 					= {["name"] = "apple_juice",  	     	["label"] = "Apple Juice",	 	["weight"] = 100, 		["type"] = "item", 		["image"] = "apple_juice.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["emptycowbucket"] 					= {["name"] = "emptycowbucket",  	    ["label"] = "Empty Bucket",	 	["weight"] = 25, 		["type"] = "item", 		["image"] = "emptybucket.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["milkbucket"] 						= {["name"] = "milkbucket",  	     	["label"] = "Milk Bucket",	 	["weight"] = 75, 		["type"] = "item", 		["image"] = "milkbucket.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_beef"] 						= {["name"] = "raw_beef",  	     		["label"] = "Raw Beef",	 		["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_beef.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["beef"] 							= {["name"] = "beef",  	     			["label"] = "Beef",	 		    ["weight"] = 25, 		["type"] = "item", 		["image"] = "beef.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["milk"] 							= {["name"] = "milk",  	     			["label"] = "Milk",	 		    ["weight"] = 50, 		["type"] = "item", 		["image"] = "milk.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["rawpumpkin"] 						= {["name"] = "rawpumpkin",  	     	["label"] = "Raw Pumpkin",	    ["weight"] = 50, 		["type"] = "item", 		["image"] = "raw_pumpkin.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["pumpkinpiebox"] 					= {["name"] = "pumpkinpiebox",  	    ["label"] = "Box of Pie",	    ["weight"] = 25, 		["type"] = "item", 		["image"] = "pumpkinpiebox.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = {accept = {'weapon_knife'}, reward = 'slicedpie', anim = {['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@', ['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = '', ['timeOut'] = 7500,}}, ["description"] = ""},
	["slicedpie"] 						= {["name"] = "slicedpie",  	  		["label"] = "Slice of Pie",	    ["weight"] = 10, 		["type"] = "item", 		["image"] = "slicedpie.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["corncob"] 						= {["name"] = "corncob",  	  			["label"] = "Corn Cob",	    	["weight"] = 15, 		["type"] = "item", 		["image"] = "corncob.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["canofcorn"] 						= {["name"] = "canofcorn",  	  		["label"] = "Can Of Corn",	    ["weight"] = 15, 		["type"] = "item", 		["image"] = "canofcorn.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["grapes"] 							= {["name"] = "grapes",  	  			["label"] = "Grapes",	   		["weight"] = 15, 		["type"] = "item", 		["image"] = "grapes.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["grapejuice"] 						= {["name"] = "grapejuice",  	  		["label"] = "Grape Juice",	    ["weight"] = 15, 		["type"] = "item", 		["image"] = "grapejuice.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["greenpepper"] 					= {["name"] = "greenpepper",  	  		["label"] = "Green Pepper",	    ["weight"] = 15, 		["type"] = "item", 		["image"] = "greenpepper.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["chillypepper"] 					= {["name"] = "chillypepper",  	  		["label"] = "Chilly Pepper",	["weight"] = 15, 		["type"] = "item", 		["image"] = "chillypepper.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["hotsauce"] 						= {["name"] = "hotsauce",  	  			["label"] = "Hot Sauce",	    ["weight"] = 15, 		["type"] = "item", 		["image"] = "hotsauce.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tomato"] 						= {["name"] = "tomato",  	  			["label"] = "tomato",	    	["weight"] = 15, 		["type"] = "item", 		["image"] = "tomato.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tomatopaste"] 					= {["name"] = "tomatopaste",  	  		["label"] = "tomato Paste",	["weight"] = 25, 		["type"] = "item", 		["image"] = "tomatopaste.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["soybeans"] 						= {["name"] = "soybeans",  	  			["label"] = "Soy Beans",	    ["weight"] = 10, 		["type"] = "item", 		["image"] = "soybeans.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_bacon"] 						= {["name"] = "raw_bacon",  	  		["label"] = "Raw Bacon",	    ["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_bacon.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_sausage"] 					= {["name"] = "raw_sausage",  	  		["label"] = "Raw Sausage",	    ["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_sausage.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_pork"] 						= {["name"] = "raw_pork",  	  			["label"] = "Raw Pork",	  	  	["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_pork.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_ham"] 						= {["name"] = "raw_ham",  	  			["label"] = "Raw Ham",	  	  	["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_ham.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["cooked_bacon"] 					= {["name"] = "cooked_bacon",  	  		["label"] = "Cooked Bacon",	    ["weight"] = 25, 		["type"] = "item", 		["image"] = "cooked_bacon.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["cooked_sausage"] 					= {["name"] = "cooked_sausage",  	  	["label"] = "Cooked Sausage",	["weight"] = 25, 		["type"] = "item", 		["image"] = "cooked_sausage.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["cooked_pork"] 					= {["name"] = "cooked_pork",  	  		["label"] = "Cooked Pork",	    ["weight"] = 25, 		["type"] = "item", 		["image"] = "cooked_pork.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["cooked_ham"] 						= {["name"] = "cooked_ham",  	  		["label"] = "Cooked Ham",	    ["weight"] = 25, 		["type"] = "item", 		["image"] = "cooked_ham.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["pig_leather"]						= {["name"] = "pig_leather",  	  		["label"] = "Pig Skin",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "pig_leather.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["cow_leather"]						= {["name"] = "cow_leather",  	  		["label"] = "Cow Skin",	  		["weight"] = 50, 		["type"] = "item", 		["image"] = "cow_leather.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
```

## qb-smallresources/config.lua
- ConsumeablesEat
```
    ["apple"] = math.random(10, 20),
    ["beef"] = math.random(35, 50),
    ["slicedpie"] = math.random(10, 20),
    ["corncob"] = math.random(25, 40),
    ["canofcorn"] = math.random(35, 50),
    ["grapes"] = math.random(10, 20),
    ["greenpepper"] = math.random(10, 20),
    ["chillypepper"] = math.random(10, 20),
    ["tomato"] = math.random(10, 20),
    ["tomatopaste"] = math.random(25, 40),
    ["cooked_bacon"] = math.random(35, 50),
    ["cooked_sausage"] = math.random(35, 50),
    ["cooked_pork"] = math.random(35, 50),
    ["cooked_ham"] = math.random(35, 50),
```
- ConsumeablesDrink
```
    ["apple_juice"] = math.random(25, 45),
    ["grapejuice"] = math.random(25, 45),
    ["hotsauce"] = math.random(10, 15),
```

## QB-Target and menu is all done within the config of qb-simplefarming/config.lua

## Preview's
![Preview Screenshot](https://forum.cfx.re/uploads/default/original/4X/5/e/b/5ebc74391935523b26adb582ecd8137ce98e10ef.jpeg)
![Preview Screenshot](https://forum.cfx.re/uploads/default/original/4X/f/d/5/fd5cac4e3b35cbb008ba53d024f98153954e6887.jpeg)
![Preview Screenshot](https://forum.cfx.re/uploads/default/original/4X/b/7/4/b746f9ab921c1ecda7839f20881bc69a41abadd8.jpeg)
![Preview Screenshot](https://forum.cfx.re/uploads/default/original/4X/a/f/6/af673ae283e9baaddbfb9c10460b1924fa22ccde.jpeg)

## Discord
- [Join Discord](https://discord.gg/zRCdhENsHG)

## Support
- [Ko-fi Link](https://ko-fi.com/trclassic)