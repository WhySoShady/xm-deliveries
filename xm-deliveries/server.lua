local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('xm-deliveries:server:jobfinished', function(account, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    print("player grabbed")
    if pcall(Player.Functions.AddMoney(account, amount, 'job')) then
        print("$")
    else
        print(":(")
    end
end)