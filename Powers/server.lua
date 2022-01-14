RegisterServerEvent("powers")
AddEventHandler("powers",function(param)
    local plr = GetPlayerName(source)
    if IsPlayerAceAllowed(source, "powers.cmds") then
	   TriggerClientEvent("Powers:SuperKick", source)
	   TriggerClientEvent("Powers:SuperJump", source)
	   TriggerClientEvent("Powers:FastRun", source)
	   TriggerClientEvent("Powers:FastSwim", source)
	   TriggerClientEvent("Powers:InfStamina", source)
	 --TriggerClientEvent("Powers:NoRagdoll", source)
    else
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "You are not permitted to execute this command.",
			type = "error",
			timeout = 3000,
			layout = "topRight",
			queue = "perms"
		})
    end
end)

RegisterServerEvent("ui")
AddEventHandler("ui",function(param)
    local plr = GetPlayerName(source)
    if IsPlayerAceAllowed(source, "powers.cmds") then
	   TriggerClientEvent("Powers:uI", source)
	   TriggerClientEvent("pNotify:SendNotification", source, {
		text = "You have opened Power UI",
		type = "success",
		timeout = 3000,
		layout = "topRight",
		queue = "ui"
	})
    else
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "You are not permitted to execute this command.",
			type = "error",
			timeout = 3000,
			layout = "topRight",
			queue = "perms"
		})
    end
end)

-------Functions-------
function sendMessage(text)
	TriggerEvent(
		"chat:addMessage",
		{
			templateId = "powers",
			args = {
				"Powers - RP -V1",
				text
			}
		}
	)
end