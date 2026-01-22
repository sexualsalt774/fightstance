local wasMeleeBlocking = false
CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        if GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_UNARMED") then
            local isMeleeBlocking = IsControlPressed(0, 25)
            if wasMeleeBlocking and not isMeleeBlocking then
                if not IsPedWalking(ped) and not IsPedRunning(ped) and not IsPedSprinting(ped) then
                    local coords = GetEntityCoords(ped)
                    SetEntityCoords(ped, coords.x, coords.y, coords.z - 0.9999, false, false, false, false) -- remove t pose secretly
                    Wait(69) -- magic number no break
                end
            end
            wasMeleeBlocking = isMeleeBlocking
        else
            wasMeleeBlocking = false
        end
    end
end)