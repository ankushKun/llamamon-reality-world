-- -- Name: AirLlamaMaster
-- -- PID: abyG0zg0RnguuedHwrjpxPkzc2qcXeX7Pfc2dyfypXw

json = require"json"
-- Llama = require("@sam/Llama-Herder")

NAME = 'Guide Llama'
CHAT_TARGET = "LyaolZK47aoDyQjuUM5DEhwpSJQLKYr7eOQYzgslwhI"

TIMESTAMP_LAST_MESSAGE_MS = TIMESTAMP_LAST_MESSAGE_MS or 0
COOLDOWN_MS = 5000

GUIDE_DES = [[Greetings Llama Trainer! I am Luna, your guide to this world. On the map you can find a variety of Llama masters (Fire, Water, Air, etc...) whom you have to defeat in a battle to get become the Llama champion! Good luck finding 'em all!]]

Handlers.add('DefaultInteraction', Handlers.utils.hasMatchingTag('Action', 'DefaultInteraction'), function(msg)
	print('DefaultInteraction')
	if ((msg.Timestamp - TIMESTAMP_LAST_MESSAGE_MS) < COOLDOWN_MS) then
		return
	end
	TIMESTAMP_LAST_MESSAGE_MS = msg.Timestamp
end)

Handlers.add('Schema', Handlers.utils.hasMatchingTag('Action', 'Schema'), function(msg)
	print('Schema')
	local sender = msg.From
	
	Send({
		Target = msg.From,
		Tags = {
			Type = 'Schema'
		},
		Data = json.encode({
			Guide = {
				Title = "World Guide",
				Description = GUIDE_DES,
				-- Schema = {
				-- 	Tags = {
				-- 		type = "object",
				-- 		required = {
				-- 			"Action",
				-- 			"Scenario",
				-- 			"X-Response"
				-- 		},
				-- 		properties = {
				-- 			Action = {
				-- 				type = "string",
				-- 				const = "Battle"
				-- 			},
				-- 			Quantity = {
				-- 				type = "number",
				-- 				const = 0.01 * 10 ^ 12
				-- 			},
				-- 			Scenario = {
				-- 				type = "string",
				-- 				const = scenario
				-- 			},
				-- 			["X-Response"] = {
				-- 				type = "string",
				-- 				title = "Your response to the situation?",
				-- 				minLength = 5,
				-- 				maxLength = 250,
				-- 				["$comment"] = "Requires 0.01 wAR"
				-- 			}
				-- 		}
				-- 	}
				-- }
			}
		})
	})
end)

Handlers.add("Battle", Handlers.utils.hasMatchingTag("Action", "Battle"), function(msg)
	local statement = "🦙 OPPONENT: " .. msg.Scenario .. ".\n" .. "🦙 PLAYER: " .. msg['X-Response']
	
    Send({
        Target = CHAT_TARGET,
        Tags = {
            Action = 'ChatMessage',
            ['Author-Name'] = NAME,
        },
        Data = statement,
    })

    -- until I can get AI working, use random wins and loses

    -- local prompt = "The following is your input for a battle between llamas, read the input and decide wether the resulting winner is the enemy or the player. Output the resulting scenario and append the winner as either |ENEMY| or |USER|\n\n"..statement
    
    -- Llama.run(
    --     prompt, -- Your prompt
    --     50, -- Number of tokens to generate
    --     function(generated_text) -- Optional: A function to handle the response
    --         print(generated_text)
    --         Send({
    --             Target = CHAT_TARGET,
    --             Tags = {
    --                 Action = 'ChatMessage',
    --                 ['Author-Name'] = NAME,
    --             },
    --             Data = generated_text,
    --         })
    --     end
    -- )

    -- random
    local win = (msg.Timestamp % 10) % 2 == 0

    if win then
        local msg = WINS[msg.Timestamp % #WINS + 1]
        Send({
                Target = CHAT_TARGET,
                Tags = {
                    Action = 'ChatMessage',
                    ['Author-Name'] = NAME,
                },
                Data = "You win! Here is a Llama coin for your victory!",
            })
    else 
        local msg = LOOSES[msg.Timestamp % #LOOSES + 1]
        Send({
                Target = CHAT_TARGET,
                Tags = {
                    Action = 'ChatMessage',
                    ['Author-Name'] = NAME,
                },
                Data = "💀 Your Llama faints and you rush to a nearby Llama care centre. \n"..msg,
            })
    end
end)

return "OK: " .. ao.id