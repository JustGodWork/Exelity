fx_version('bodacious')
game('gta5')

server_scripts({
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',

	'locale.lua',
	'locales/fr.lua',

	'config.lua',
	'config.weapons.lua',

	'server/common.lua',
	'server/classes/groups.lua',
	'server/classes/player.lua',
	'server/functions.lua',
	'server/paycheck.lua',
	'server/main.lua',
	'server/Sv_ServerData.lua',
	'server/commands.lua',

	'common/modules/Logs.lua',
	'common/modules/math.lua',
	'common/modules/table.lua',
	'common/functions.lua',
	'server/anticheat/**/*.lua',
	'server/PVP/pvp.lua',
	'server/PVP/leaderboard.lua'
})

client_scripts({
	'locale.lua',
	'locales/fr.lua',

	'config.lua',
	'config.weapons.lua',

	'client/common.lua',
	'client/entityiter.lua',
	'client/functions.lua',
	'client/wrapper.lua',
	'client/main.lua',
	'client/Cl_ServerData.lua',

	'client/modules/death.lua',
	'client/modules/scaleform.lua',
	'client/modules/streaming.lua',
	'client/modules/carkill.lua',

	'common/modules/Logs.lua',
	'common/modules/math.lua',
	'common/modules/table.lua',
	'common/functions.lua'
})

ui_page('html/ui.html')

files({
	'locale.js',
	'html/ui.html',

	'html/css/app.css',

	'html/js/mustache.min.js',
	'html/js/wrapper.js',
	'html/js/app.js',

	'html/fonts/pdown.ttf',
	'html/fonts/bankgothic.ttf',

	'html/img/cash.png',
	'html/img/accounts/black_money.png',
	'html/img/accounts/bank.png'
})


files {
    "lscreen/index.html",
    "lscreen/main.css",
    "lscreen/fonts/Gilroy-Light.otf",
    "lscreen/img/background.png",
    "lscreen/music/song.mp3",
    "lscreen/main.js"
}

loadscreen "lscreen/index.html"








