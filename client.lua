local pedModel = "a_m_m_business_01"
function spawnPed()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local forwardVector = GetEntityForwardVector(playerPed)
    local spawnCoords = vector3(playerCoords.x + forwardVector.x * 3.0, playerCoords.y + forwardVector.y * 3.0, playerCoords.z)
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(500)
    end
    local ped = CreatePed(4, pedModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, GetEntityHeading(playerPed), true, true)
    SetEntityInvincible(ped, false)
    SetEntityCanBeDamaged(ped, true)
    SetPedCanRagdoll(ped, true)
    TaskCombatPed(ped, playerPed, 0, 16)
    SetPedConfigFlag(ped, 32, true)
end
RegisterCommand("__fightanim_spawn_ped", function()
    spawnPed()
end, false)
