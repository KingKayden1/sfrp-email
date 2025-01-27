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