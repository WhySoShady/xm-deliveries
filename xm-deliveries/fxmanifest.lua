fx_version 'cerulean'

game 'gta5'
version "Release 1.0.0"

author 'xim.gz'

dependencies { 'xim-lib' }

client_scripts {
    "client.lua",
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
}

server_scripts {
    'server.lua',
}

shared_scripts {
    "config.lua",
    '@xm-lib/functions.lua'
}
