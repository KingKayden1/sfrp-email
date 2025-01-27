
# SFRP-Emailer
SFRP-Emailer is a simple emailing script that uses JPR-Phonesystem and GKS-Phone. I am currently working on more I just dont own LB-Phone and QB-Phone is giving me an aneurysm so I will be releasing without it 

- Edits are not allowed without giving credit to me
- SFRP-Emailer is a very simple and easy script to use that just emails a player when you do the command 
``` 
/phoneemail 

```

# How To Set Up
- Download the zip file
- Unzip the .zip file
- Put It In Your Resources
- Change The Config To Suit You


Heres a preview of the config
```
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


```
client.lua
```
QBCore = exports['qb-core']:GetCoreObject()
local lib = exports.ox_lib
PhoneData = {
    MetaData = {},
    isOpen = false,
    PlayerData = nil,
    Chats = {},
    Mails = {}
}

RegisterCommand('phoneemail', function()
    if Config.Phone == 'jpr' then
        TriggerServerEvent('jpr-phonesystem:server:sendEmail', {
            subject = Config.Subject, -- Subject
            message = Config.Message, -- Content
            sender = Config.Sender, -- Submitted by
            event = {}, -- Optional 
        })
    elseif Config.Phone == 'gks' then
        if Config.GKS == 'v2' then
            local waitingDelivery = { location = { x = 0, y = 0, z = 0 }, name = "Test Location" }
            local MailData = {
              sender = Config.Sender,
              image = '/html/img/icons/mail.png',
              subject = Config.Subject,
              message = Config.Message,
              button = {}
            }
            exports["gksphone"]:SendNewMail(MailData)

            ------

            RegisterNetEvent("gksphone:client:mailtest", function (data)
                debugprint("gksphone:client:mailtest")
                print(data.name)  -- Test Location
                print(data.location) -- { x = 0, y = 0, z = 0 }
            end)
        elseif Config.GKS == 'v1' then
            local MailData = {
                sender = Config.Sender,
                image = '/html/static/img/icons/mail.png',
                subject = Config.Subject,
                message = Config.Message
              }
              exports["gksphone"]:SendNewMail(MailData)
        end
    elseif Config.Phone == 'qb' then
        if Config.Notify == 'qb' then
            QBCore.Functions.Notify('Sorry, Were Working On QB Core ATM, Please Stay With Us', 'primary', 4000)
        elseif Config.Notify == 'ox' then
            exports.ox_lib:notify({
                title = Config.title,
                description = Config.description,
                type = Config.type,
            })
        end
    end
end)
```

# Features
- QBCore Notifications
- Ox_Lib Notifications
- JPR-Phonesystem
- GKS Phone (i think)

# Upcoming Features
- QB-Phone
- LB-Phone
- More Advanced script

