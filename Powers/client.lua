
-- Variables
-- Do not touch
local SuperKick = false
local SuperKicktwo = false
local SuperJump = false
local FastRun = false
local FastSwim = false
local InfStamina = false
local NoRagdoll = false

-- Activate Command
TriggerEvent( "chat:addSuggestion", "/p118", "CLASSIFIED-P - Toggle & Disable" );
RegisterCommand("p118",function(source, args)
    TriggerServerEvent("powers", source)
end)

RegisterNetEvent("Powers:SuperKick")
AddEventHandler("Powers:SuperKick", function()
 SuperKick = not SuperKick
 if SuperKick then 
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"),950.9) 
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"),1200.9) 
     notify("~g~Powers-Activated")
 else
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 1.49) 
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"), 1.49) 
    notify("~r~Powers-Deactivated")
 end
end)

RegisterNetEvent("Powers:SuperJump")
AddEventHandler("Powers:SuperJump", function()
 SuperJump = not SuperJump
 if SuperJump then 
     print("~g~SuperJump-Activated")
 else
    print("~r~SuperJump-Deactivated")
 end
end)

RegisterNetEvent("Powers:FastRun")
AddEventHandler("Powers:FastRun", function()
 FastRun = not FastRun
 if FastRun then 
    SetPedMoveRateOverride(PlayerId(),10.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),10.49)
     print("~g~FastRun-Activated")
 else
    SetPedMoveRateOverride(PlayerId(),10.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    print("~r~FastRun-Deactivated")
 end
end)

RegisterNetEvent("Powers:FastSwim")
AddEventHandler("Powers:FastSwim", function()
 FastSwim = not FastSwim
 if FastSwim then 
    SetSwimMultiplierForPlayer(PlayerId(), 1.49)
     print("~g~FastSwim-Activated")
 else
    SetSwimMultiplierForPlayer(PlayerId(), 1.0)
    print("~r~FastSwim-Deactivated")
 end
end)

RegisterNetEvent("Powers:InfStamina")
AddEventHandler("Powers:InfStamina", function()
 InfStamina = not InfStamina
 if InfStamina then 
     print("~g~InfStamina-Activated")
 else
     print("~r~InfStamina-Deactivated")
 end
end)

--RegisterNetEvent("Powers:NoRagdoll")
--AddEventHandler("Powers:NoRagdoll", function()
 --NoRagdoll = not NoRagdoll
 --if NoRagdoll then 
   -- setRagdoll(true)
   -- ragdol = false
    -- notify("~g~NoRagdoll-Activated")
 --else
   -- setRagdoll(false)
    --ragdol = true
    --notify("~r~NoRagdoll-Deactivated")
 --end
--end)

----------------------------------------------------------------------------
---powers Below
----------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
       Citizen.Wait(0)
       if SuperJump then
        SetSuperJumpThisFrame(PlayerId(), 1000)
       end

       if InfStamina then
        RestorePlayerStamina(source, 1.0)
       end
    end
end)


--Power UI
local display = false

TriggerEvent( "chat:addSuggestion", "/popen", "CLASSIFIED-P - Toggle & Disable" );
RegisterCommand("popen", function(source, args)
    TriggerServerEvent("ui", source)
    end)

    RegisterNetEvent("Powers:uI")
    AddEventHandler("Powers:uI", function()
        Citizen.CreateThread(function()
            SetDisplay(true)
        end)
    end)

    RegisterNUICallback("SuperMelee", function(data)
        --local strength = data.text
        SuperKick = not SuperKick
        if SuperKick then 
            N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"),950.9) 
           N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"),1200.9) 
            notify("~g~SuperMelee-Activated")
        else
           N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 1.49) 
           N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"), 1.49) 
           notify("~r~SuperMelee-Deactivated")
        end
        end)

    RegisterNUICallback("SuperJump", function(data)
        SuperJump = not SuperJump
        if SuperJump then 
            SetSuperJumpThisFrame(PlayerId(), 1000)
            notify("~g~SuperJump-Activated")
        else
           notify("~r~SuperJump-Deactivated")
        end
        end)  

    RegisterNUICallback("SuperFastRun", function(data)
        FastRun = not FastRun
        if FastRun then 
           SetPedMoveRateOverride(PlayerId(),10.0)
           SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
            notify("~g~FastRun-Activated")
        else
           SetPedMoveRateOverride(PlayerId(),10.0)
           SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
            notify("~r~FastRun-Deactivated")
        end
        end)     

    RegisterNUICallback("SuperFastSwim", function(data)
        FastSwim = not FastSwim
        if FastSwim then 
           SetSwimMultiplierForPlayer(PlayerId(), 1.49)
            notify("~g~FastSwim-Activated")
        else
           SetSwimMultiplierForPlayer(PlayerId(), 1.0)
           notify("~r~FastSwim-Deactivated")
        end
        end) 

    RegisterNUICallback("exit", function(data)
        SetDisplay(false)
    end)

    RegisterNUICallback("error", function(data)
        notify("~r~[Power-error]~y~"..data.error)
    end)

---Funtions
function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end
