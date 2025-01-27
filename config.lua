Config = {}

Config.Phone = 'jpr'  -- this is the phone system that you use. options are jpr, and gks

Config.Subject = 'Config'  --  this is the subject that the email is attached to

Config.Message = 'StarFallRP...          You can change the text in the config.lua'  -- this is the message that is displayed when the command is ran

Config.Sender = 'StarFallRP' -- this is who the email is coming from

Config.GKS = 'v1'    -- only matters if config.phone is set to gks

---------------------------

Config.Notify = 'ox'

Config.title = 'Sorry'

Config.description = 'QB-Core Isn\'t Available ATM, Try Again Later'

Config.type = 'info'



-----------------
-- DONT TOUCH----
-----------------
Config.PhoneApplications = {
    ['mail'] = {
        app = 'mail',
        color = '#ff002f',
        icon = 'fas fa-envelope-open-text',
        tooltipText = 'Mail',
        job = false,
        blockedjobs = {},
        slot = 6,
        Alerts = 0,
    },
}