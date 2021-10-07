fx_version 'cerulean'
game 'gta5'

author 'Flixzy#7946'
description 'Dimension System for FiveM using Routing Buckets. - ESX Version'
version '0.0.1 - BETA'

shared_scripts {
    '@es_extended/locale.lua',
    '@es_extended/imports.lua',
    'Locales/*.lua'
}

client_scripts {
    'Config.lua',
    'Client/*.lua'
}

server_scripts {
    'Config.lua',
    'Server/*.lua'
}
