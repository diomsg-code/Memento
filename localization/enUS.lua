local L = LibStub("AceLocale-3.0"):NewLocale("Memento", "enUS", true)

L["options.info"] = "Info"

L["options.info.generel"] = "General"
L["options.info.generel.addon-version"] = "Addon version"
L["options.info.generel.game-version"] = "Game version"
L["options.info.generel.author"] = "Author"

L["options.setting"] = "Settings"

L["options.setting.generel"] = "General settings"
L["options.setting.generel.notification.name"] = "Chat notification"
L["options.setting.generel.notification.desc"] = "Activate or deactivate the notification in the chat when a screenshot has been taken."

L["options.setting.achievement.personal"] = "Personal achievement"
L["options.setting.achievement.personal.active.name"] = "Take a screenhot on personal achievement"
L["options.setting.achievement.personal.active.desc"] = "Activate or deactivate the automatic creation of a screenshot when a personal achievement has been reached."
L["options.setting.achievement.personal.exist.name"] = "Take a screenshot if a personal achievement has already been reached"
L["options.setting.achievement.personal.exist.desc"] = "Activate or deactivate the creation of a screenshot if an personal achievement has already been reached by another character."
L["options.setting.achievement.personal.timer.name"] = "Delay"
L["options.setting.achievement.personal.timer.desc"] = "Time delay of the screenshot after a personal achievement has been reached.\nDefault: 2 seconds"

L["options.setting.achievement.guild"] = "Guild achievement"
L["options.setting.achievement.guild.active.name"] = "Take a screenhot on guild achievement"
L["options.setting.achievement.guild.active.desc"] = "Activate or deactivate the automatic creation of a screenshot when a guild achievement has been reached."
L["options.setting.achievement.guild.timer.name"] = "Delay"
L["options.setting.achievement.guild.timer.desc"] = "Time delay of the screenshot after a guild achievement has been reached.\nDefault: 2 seconds"

L["options.setting.levelUp"] = "Level-up"
L["options.setting.levelUp.active.name"] = "Take a screenhot on level-up"
L["options.setting.levelUp.active.desc"] = "Activate or deactivate the automatic creation of a screenshot when a level up has taken place."
L["options.setting.levelUp.timer.name"] = "Delay"
L["options.setting.levelUp.timer.desc"] = "Time delay of the screenshot after a level-up has taken place.\nDefault: 5 seconds"

L["options.setting.death"] = "Player death"
L["options.setting.death.active.name"] = "Take a screenshot on player death"
L["options.setting.death.active.desc"] = "Activate or deactivate the automatic creation of a screenshot when the player has died."
L["options.setting.death.timer.name"] = "Delay"
L["options.setting.death.timer.desc"] = "Time delay of the screenshot after the player has died.\nDefault: 1 second"

L["options.debug"] = "Debug"
L["options.debug.generel"] = "General settings"
L["options.debug.generel.active.name"] = "Activate debug mode"
L["options.debug.generel.active.desc"] = "Activate or deactivate the debug mode."

L["chat.event.achievement.personal.new"] = "Screenshot taken - personal achievement: "
L["chat.event.achievement.personal.exist"] = "Screenshot taken - personal achievement (has already been reached by another character): "
L["chat.event.achievement.guild.new"] = "Screenshot taken - guild achievement: "
L["chat.event.levelUp.new"] = "Screenshot taken - level-up: "
L["chat.event.death.new"] = "Screenshot taken - Player death: You are dead."

L["debug.cmd.exist"] = "No arguments will be accepted."
L["debug.event.achievement.personal.exist"] = "No screenshot has been taken as the achievement has already been reached by another character."