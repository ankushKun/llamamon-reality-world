-- -- Name: AirLlamaMaster
-- -- PID: abyG0zg0RnguuedHwrjpxPkzc2qcXeX7Pfc2dyfypXw

json = require"json"
-- Llama = require("@sam/Llama-Herder")

NAME = 'Water Llama Master'
CHAT_TARGET = "LyaolZK47aoDyQjuUM5DEhwpSJQLKYr7eOQYzgslwhI"

TIMESTAMP_LAST_MESSAGE_MS = TIMESTAMP_LAST_MESSAGE_MS or 0
COOLDOWN_MS = 5000

COOLDOWN_DAY = {}

TYPES = {
	"Fire",
	"Water",
	"Grass",
	"Air",
	"Electric"
}

MY_TYPE = "Water"

SCENARIOS = {
	"The Water Llama sends a powerful wave crashing towards your <TYPE> Llama",
	"The Water Llama creates a whirlpool around your <TYPE> Llama",
	"The Water Llama launches a high-pressure water jet at your <TYPE> Llama",
	"The Water Llama causes a rainstorm that drenches your <TYPE> Llama",
	"The Water Llama freezes the ground around your <TYPE> Llama"
}

WINS = {
	"Well done! Your Llama fought bravely and emerged victorious! Your training is truly paying off!",
	"Congratulations, Player! Your Llamas strength and strategy have led you to victory! The opposing llama stood no chance!",
  "Victory! Your Llama prevailed!",
  "Success! Your Llama are unstoppable!"
}

LOOSES = {
  "The battle was intense, but you were defeated. It's all part of becoming a stronger llama. Reflect on this experience and come back with renewed determination!",
  "You fought hard, but the battle ended in defeat. Remember, every loss is a lesson. Keep training and come back stronger next time!",
  "Close match, but you lost. Try again!",
  "Defeat today, victory tomorrow!"
}

message_overhead = [[
Greetings trainer, I have trained for an eternity to master the Water type Llama.
You wish to fight me? bring it on...

]]

message_underhead = [[

Enter your response to the situation:
]]

Handlers.add('DefaultInteraction', Handlers.utils.hasMatchingTag('Action', 'DefaultInteraction'), function(msg)
	print('DefaultInteraction')
	if ((msg.Timestamp - TIMESTAMP_LAST_MESSAGE_MS) < COOLDOWN_MS) then
		return
	end
	local randomEnough = msg.Timestamp
	local scenario = SCENARIOS[randomEnough % # SCENARIOS + 1]
	local playerType = TYPES[randomEnough % # TYPES + 1]
	scenario = scenario:gsub("<TYPE>", playerType)
	scenario = message_overhead .. scenario .. message_underhead
	Send({
		Target = CHAT_TARGET,
		Tags = {
			Action = 'ChatMessage',
			['Author-Name'] = NAME,
		},
		Data = scenario,
	})
	TIMESTAMP_LAST_MESSAGE_MS = msg.Timestamp
end)

Handlers.add('Schema', Handlers.utils.hasMatchingTag('Action', 'Schema'), function(msg)
	print('Schema')
	local sender = msg.From
	local randomEnough = msg.Timestamp
	local scenario = SCENARIOS[randomEnough % # SCENARIOS + 1]
	local playerType = TYPES[randomEnough % # TYPES + 1]
	scenario = scenario:gsub("<TYPE>", playerType)
	scenario_text = message_overhead .. scenario
	Send({
		Target = msg.From,
		Tags = {
			Type = 'Schema'
		},
		Data = json.encode({
			Battle = {
				Title = NAME.." challenges you to a battle",
				Description = scenario_text,
				Schema = {
					Tags = {
						type = "object",
						required = {
							"Action",
							"Scenario",
							"X-Response"
						},
						properties = {
							Action = {
								type = "string",
								const = "Battle"
							},
							Quantity = {
								type = "number",
								const = 0.01 * 10 ^ 12
							},
							Scenario = {
								type = "string",
								const = scenario
							},
							["X-Response"] = {
								type = "string",
								title = "Your response to the situation?",
								minLength = 5,
								maxLength = 250,
								["$comment"] = "Requires 0.01 wAR"
							}
						}
					}
				}
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
    --                 ['Author-Name'] = 'Air Llama Master',
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
                Data = "✌️ "..msg,
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