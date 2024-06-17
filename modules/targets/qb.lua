local peds
return {
    AddHook = function(Peds)
        peds = Peds
        local targetOpts ={{
            event = 'Renewed-Banking:client:openBankUI',
            icon = 'fas fa-money-check',
            label = locale('view_bank'),
            atm = false
        }}
        exports['qb-target']:AddTargetEntity(peds, { options = targetOpts, distance = 4.5 })
        exports['qb-target']:AddTargetModel(Config.atms,{
            options = {{
                event = "Renewed-Banking:client:openBankUI",
                icon = "fas fa-money-check",
                label = locale('view_bank'),
                atm = true
            }},
            distance = 2.5
        })
    end,
    RemoveHook = function()
        exports['qb-target']:RemoveTargetModel(Config.atms, locale('view_bank'))
        exports['qb-target']:RemoveTargetEntity(peds, locale('view_bank'))
    end
}