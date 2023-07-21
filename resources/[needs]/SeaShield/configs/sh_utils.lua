_G.SEASHIELD = SEASHIELD or {}

SEASHIELD.LOGO_URL = "https://media.discordapp.net/attachments/880115508752572426/880115577778237520/shields.png?width=676&height=676"
SEASHIELD.DATA_TRANSLATION = {
    NOTCONNECTED = 'Player Not Connected',
    FIRSTMESSAGE_DEFERRALS = 'Checking your account...',
    INVALID_LICENSE_ROCKSTAR = 'Your Rockstar license is invalid',
    TWOMESSAGE_DEFERRALS = 'Welcome %s on Exelity !',
    SCREENSHOT = 'Click here to see the screenshot',
    NOARG = 'Missing argument',
    BANID = 'Your Ban ID',
    DAY = 'day(s)',
    HOURS = 'hour(s)',
    MINUTES = 'minute(s)',
    REASON = 'Reason',
    PERMANENTBAN = 'You have been permanently banned from the server',
    BANNED = 'You have been banned from our server',
    AUTHOR = 'Author',
    BANEXPIRE = 'Your ban expire in',
    BANMSG = 'You have been banned for',
    -- BAN DATA
    ANTIGODMOD = 'Anti God mode',
    DAMAGEMODIFIER = 'Damage Modifier ( type : %s multiplier : %s )',
    ANTIINVISIBLE = 'Anti Invisible',
    ANTIGIVEWEAPON_ESX = 'Anti Give Weapon ESX',
    BLACKLISTWEAPON = 'Blacklist Weapon',
    ANTISTOP_EULEN = 'Tried to stop %s', -- %s = ressource name
    SPAMTRIGGER = 'Spam Trigger %s',-- %s = trigger name
    BLACKLIST_TRIGGER = 'Blacklist Trigger %s',-- %s = trigger name
    MASSDELETE_VEHICLE = 'Mass Delete Vehicle',
    VEHICLE_MAXSPEED = 'Max Speed vehicle',
    ANTI_EULEN = 'Eulen Detected',
    ANTI_EULEN_NOT_BANNED = 'This player probably uses eulen',
    SEASHIELD_TRIGGER = 'Use SeaShield Trigger',
    ANTI_CRASH_PLAYER = 'Tried to crash another Player',
    ANTI_CRASH_SERVER = 'Tried to crash server',
    ANTI_PLAYER_MODEL = 'Anti Player Model',
    BLACKLIST_CRASH = 'Blacklist crash ( %s )', -- %s = crash reason
}

function SEASHIELD.TRANSLATION(data)
    return SEASHIELD.DATA_TRANSLATION[data] or 'Invalid Translation ('..data..')'
end