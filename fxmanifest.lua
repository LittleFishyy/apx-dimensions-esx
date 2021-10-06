fx_version 'cerulean'
game 'gta5'

author 'Flixzy#7946'
description 'Dimension System for FiveM using Routing Buckets.'
version '0.0.1 - BETA'

shared_scripts {
    '@core/locale.lua',
    '@core/imports.lua',
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