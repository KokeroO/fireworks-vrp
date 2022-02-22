fx_version 'cerulean'
game 'gta5'

author 'KokeroO - Discord:Kokero#3996'
description 'Fireworks vRP is a script that, through the organization of objects, particles and effects, tries to bring the immersion of fireworks to the server.'
version '1.0.0'

client_scripts {
	'@vrp/lib/utils.lua',
	'config/config.lua',
	'client/*.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server/*.lua'
}