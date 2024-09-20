local L = LibStub("AceLocale-3.0"):NewLocale("Memento", "enUS", true)

L["general"] = "Options"

L["general.info"] = "Info"

L["general.info.about"] = "About"
L["general.info.about.addon-version"] = "Addon version"
L["general.info.about.game-version"] = "Game version"
L["general.info.about.author"] = "Author"

L["general.options"] = "Options"

L["general.options.general"] = "General options"
L["general.options.general.notification.name"] = "Chat notification"
L["general.options.general.notification.desc"] = "Activate or deactivate the notification in the chat when a screenshot has been taken."
L["general.options.general.statistic.name"] = "Statistics output"
L["general.options.general.statistic.desc"] = "Activate or deactivate the statistics output in the chat after login."

L["general.options.achievement.personal"] = "Personal achievement"
L["general.options.achievement.personal.active.name"] = "Take a screenhot on personal achievement"
L["general.options.achievement.personal.active.desc"] = "Activate or deactivate the automatic creation of a screenshot when a personal achievement has been reached."
L["general.options.achievement.personal.exist.name"] = "Take a screenshot if a personal achievement has already been reached"
L["general.options.achievement.personal.exist.desc"] = "Activate or deactivate the creation of a screenshot if an personal achievement has already been reached by another character."
L["general.options.achievement.personal.timer.name"] = "Delay"
L["general.options.achievement.personal.timer.desc"] = "Time delay of the screenshot after a personal achievement has been reached.\n\nDefault: 2 seconds"

L["general.options.achievement.guild"] = "Guild achievement"
L["general.options.achievement.guild.active.name"] = "Take a screenhot on guild achievement"
L["general.options.achievement.guild.active.desc"] = "Activate or deactivate the automatic creation of a screenshot when a guild achievement has been reached."
L["general.options.achievement.guild.timer.name"] = "Delay"
L["general.options.achievement.guild.timer.desc"] = "Time delay of the screenshot after a guild achievement has been reached.\n\nDefault: 2 seconds"

L["general.options.encounter"] = "Boss kill"
L["general.options.encounter.party.name"] = "Dungeon"
L["general.options.encounter.party.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have killed a dungeon boss."
L["general.options.encounter.raid.name"] = "Raid"
L["general.options.encounter.raid.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have killed a raid boss."
L["general.options.encounter.scenario.name"] = "Scenario"
L["general.options.encounter.scenario.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have killed a scenario boss."
L["general.options.encounter.first.name"] = "only on the first kill per difficulty"
L["general.options.encounter.first.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have already killed a boss. This option applies separately for each difficulty."
L["general.options.encounter.timer.name"] = "Delay"
L["general.options.encounter.timer.desc"] = "Time delay of the screenshot after you have killed a boss.\n\nDefault: 2 seconds"

L["general.options.levelUp"] = "Level-up"
L["general.options.levelUp.active.name"] = "Take a screenhot on level-up"
L["general.options.levelUp.active.desc"] = "Activate or deactivate the automatic creation of a screenshot when a level up has taken place."
L["general.options.levelUp.timer.name"] = "Delay"
L["general.options.levelUp.timer.desc"] = "Time delay of the screenshot after a level-up has taken place.\n\nDefault: 5 seconds"

L["general.options.death"] = "Player death"
L["general.options.death.active.name"] = "Take a screenshot on player death"
L["general.options.death.active.desc"] = "Activate or deactivate the automatic creation of a screenshot when the player has died."
L["general.options.death.timer.name"] = "Delay"
L["general.options.death.timer.desc"] = "Time delay of the screenshot after the player has died.\n\nDefault: 1 second"

L["general.options.duel"] = "Duel finished"
L["general.options.duel.active.name"] = "Take a screenshot after duel"
L["general.options.duel.active.desc"] = "Activate or deactivate the automatic creation of a screenshot when a duel has ended."
L["general.options.duel.timer.name"] = "Delay"
L["general.options.duel.timer.desc"] = "Time delay of the screenshot after a duel has ended.\n\nDefault: 1 second"

L["general.options.login"] = "Player login"
L["general.options.login.active.name"] = "Take a screenshot after login"
L["general.options.login.active.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have logged in."
L["general.options.login.timer.name"] = "Delay"
L["general.options.login.timer.desc"] = "Time delay of the screenshot after you have logged in..\n\nDefault: 5 seconds"

L["general.debug"] = "Debug"

L["general.debug.general"] = "General options"
L["general.debug.general.active.name"] = "Activate debug mode"
L["general.debug.general.active.desc"] = "Activate or deactivate the debug mode."

L["profiles"] = "Profiles"

L["chat.events.achievement.personal.new"] = "Screenshot taken - Personal achievement: "
L["chat.events.achievement.personal.exist"] = "Screenshot taken - Personal achievement (has already been reached by another character): "
L["chat.events.achievement.guild.new"] = "Screenshot taken - Guild achievement: "
L["chat.events.encounter.new"] = "Screenshot taken - Boss killed: "
L["chat.events.levelUp.new"] = "Screenshot taken - Level-up: "
L["chat.events.death.new"] = "Screenshot taken - Player death: You are dead."
L["chat.events.duel.new"] = "Screenshot taken - Duel finished."
L["chat.events.login.new"] = "Screenshot taken - Player login."

L["chat.statistic.header"] = "This small overview shows the number of all screenshots created by Memento since release 1.2.0. The number for the current character is shown in brackets."
L["chat.statistic.achievement.personal"] = "Personal achievement"
L["chat.statistic.achievement.guild"] = "Guild achievement"
L["chat.statistic.encounter"] = "Boss killed"
L["chat.statistic.levelUp"] = "Level-up"
L["chat.statistic.death"] = "Player death"
L["chat.statistic.duel"] = "Duel finished"
L["chat.statistic.login"] = "Player login"