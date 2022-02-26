fx_version 'cerulean'
game 'gta5'

author 'TRClassic#0001'
description 'Farming script for QBCore'
version '1.0.0'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

server_scripts {'server/*.lua'}

shared_scripts {'config.lua'}

dependencies {
    'PolyZone',
    'qb-menu',
    'qb-target'
}
