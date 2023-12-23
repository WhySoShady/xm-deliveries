local QBCore = exports['qb-core']:GetCoreObject()
local has = nil

-- Functions 
local function Job()
    if has == nil then
        has = true
        QBCore.Functions.Notify("Delivery Started", "success", 5000)
        local loc = Config.Locations[math.random(1, #Config.Locations)]
        
        local wp = XM:CreateMissionPoint(loc.location[1], loc.location[2], loc.location[3], 1, 66)
        local z = CircleZone:Create(vector3(loc.zone[1], loc.zone[2], loc.zone[3]), 1, {
            name = "deliver",
            debugPoly = false,
        })
        local zIs = false
        local timer = 300
        local counter = 0
        XM:Subtitle("Time remaining: ~r~".. timer .."s", 61)
        while timer > 0 do
            Wait(0)
            counter = counter + 1
            if counter == 60 then
                counter = 0
                timer = timer - 1
            end
            XM:Subtitle("Time remaining: ~r~".. timer .."s", 61)
            DrawMarker(27, loc.zone[1], loc.zone[2], (loc.zone[3])-0.9, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 112, 0.8, false, false, 2, true)
            local player= PlayerPedId()
            local coord = GetEntityCoords(player)
            zIs = z:isPointInside(coord)
            if zIs then
                SetBlipRoute(wp, false)
                RemoveBlip(wp)
                QBCore.Functions.Notify("Delivery Completed", "success", 5000)
                has = nil
                z:destroy()
                TriggerServerEvent('xm-deliveries:server:jobfinished', Config.Account, loc.payout)
                QBCore.Functions.Notify("You recieved $".. loc.payout, "success", 5000)
                return
            end
        end
        QBCore.Functions.Notify("You failed to deliver the package", "error", 5000)
        SetBlipRoute(wp, false)
        RemoveBlip(wp)
        z:destroy()
        has = nil
        return
    else
        QBCore.Functions.Notify("Delivery Already Started", "error", 5000)
    end
end

Citizen.CreateThread(function()
    local hash = XM:Hasher("a_m_m_salton_03")
    if Config.Blip then
        XM:NewBlip(221.44, 112.8, 93.46, "Shady Deliveries", 477)
    end
    local ped = XM:CreatePed(hash, 221.44, 112.8, (93.46), 210.55, true, true, "WORLD_HUMAN_HANG_OUT_STREET")
    if Config.ThirdEye then
        exports["qb-target"]:AddTargetEntity(ped, {
            options = {
                {
                    num     = 1,
                    icon    = "fa-solid fa-user",
                    label   = "Begin Delivery",
                    action  = function(Ped)
                        
                        if IsPedAPlayer(Ped) then
                            return false
                        end
                        Job()
                    end,
                    canInteract = function(Ped)

                        if IsPedAPlayer(Ped) then
                            return false
                        end
                        return true
                        
                    end,
                },
            },
        })
    end
end)