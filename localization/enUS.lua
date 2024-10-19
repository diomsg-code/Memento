local L = LibStub("AceLocale-3.0"):NewLocale("Memento", "enUS", true)

local eventColor = "ffF2E699"
local normalCoor = "ffFFD200"

L["info"] = "Info"

L["info.description"] = "Description"
L["info.description.content_1"] = "Memento is an addon that automatically takes screenshots of specific events. The following events are currently supported (more events are planned):\n\n"
                                .. "  • |c" .. eventColor .. "Achievements|r (personal achievements, reached achievement criteria & guild achievements)*\n"
                                .. "  • |c" .. eventColor .. "Boss fight|r (victory & wipe)\n"
                                .. "  • |c" .. eventColor .. "Player vs. Player|r (duel, arena & battleground)**\n"
                                .. "  • |c" .. eventColor .. "Level-up|r\n"
                                .. "  • |c" .. eventColor .. "Player death|r\n"
                                .. "  • |c" .. eventColor .. "Player login|r\n\n"
L["info.description.content_2"] = "* Achievements are not available in 'Classic'\n"
                                .. "** Arena & battleground screenshots currently only implemented for 'Retail'"
L["info.about"] = "About"
L["info.about.addon-version"] = "Addon version"
L["info.about.game-version"] = "Game version"
L["info.about.author"] = "Author"
L["info.about.feedback"] = "To report bugs or give feedback on the addon, please use one of the following options."
L["info.about.email.name"] = "E-Mail"
L["info.about.email.desc"] = "Opens a popup window with an e-mail address."
L["info.about.email.popup"] = "To copy the e-mail press CTRL + C."
L["info.about.github.name"] = "Github"
L["info.about.github.desc"] = "Opens a popup window with a link to Github."
L["info.about.github.popup"] = "To copy the link press CTRL + C."

L["info.help"] = "Help"
L["info.help.description"] = "In case of problems after an update or if you want to, you can reset the settings and statistics here."
L["info.help.options.name"] = "Reset options"
L["info.help.options.desc"] = "Resets the options to the default values. This applies to all characters."
L["info.help.options.confirmText"] = "Do you really want to reset the options?"
L["info.help.statistic.name"] = "Delete statistics"
L["info.help.statistic.desc"] = "Deletes the current statistics. This applies to all characters."
L["info.help.statistic.confirmText"] = "Do you really want to delete the statistics?"

L["options"] = "Options"
L["options.general"] = "General options"
L["options.general.notification.name"] = "Chat notification"
L["options.general.notification.desc"] = "Activate or deactivate the notification in the chat when a screenshot has been taken."
L["options.general.statistic.name"] = "Statistics output"
L["options.general.statistic.desc"] = "Activate or deactivate the statistics output in the chat after login."
L["options.general.ui.name"] = "Hide user interface for screenshot |T132049:0|t"
L["options.general.ui.desc"] = "Activate or deactivate the option to hide the user interface for the screenshot. A small success notification is displayed instead.\n\n|c" .. normalCoor .. "Note:|r The user interface cannot be hidden automatically during a combat. In this case, the screenshot is taken with the user interface."
L["options.general.debug.name"] = "Debug mode"
L["options.general.debug.desc"] = "Activate or deactivate the debug mode."

L["options.event.general.active.name"] = "Take a screenshot for the |c" .. eventColor .. "%s|r event"
L["options.event.general.active.desc"] = "Activate or deactivate the automatic creation of a screenshot for the event |c" .. eventColor .. "%s|r."
L["options.event.general.delay.name"] = "Delay"
L["options.event.general.delay.desc"] = "The time delay of the screenshot after the event |c" .. eventColor .. "%s|r was triggered.\n\n|c" .. normalCoor .. "Default:|r %d second(s)"

L["options.event.achievement"] = "Achievements"
L["options.event.achievement.personal"] = "Personal achievement"
L["options.event.achievement.personal.exist.name"] = "Take a screenshot if a personal achievement has already been reached"
L["options.event.achievement.personal.exist.desc"] = "Activate or deactivate the creation of a screenshot if an personal achievement has already been reached by another character."
L["options.event.achievement.criteria"] = "Personal achievement criteria"
L["options.event.achievement.guild"] = "Guild achievement"

L["options.event.encounter"] = "Boss fight"
L["options.event.encounter.victory"] = "Boss fight - Victory"
L["options.event.encounter.wipe"] = "Boss fight - Wipe"
L["options.event.encounter.party.name"] = "Dungeon"
L["options.event.encounter.raid.name"] = "Raid"
L["options.event.encounter.scenario.name"] = "Scenario / Delve"

L["options.event.encounter.victory.party.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have killed a dungeon boss."
L["options.event.encounter.victory.raid.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have killed a raid boss."
L["options.event.encounter.victory.scenario.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have killed a scenario or delves boss."
L["options.event.encounter.victory.first.name"] = "only on the first kill per difficulty"
L["options.event.encounter.victory.first.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have already killed a boss. This option applies separately for each difficulty."
L["options.event.encounter.wipe.party.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have wiped at a dungeon boss."
L["options.event.encounter.wipe.raid.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have wiped at a raid boss."
L["options.event.encounter.wipe.scenario.desc"] = "Activate or deactivate the automatic creation of a screenshot when you have wwiped at a scenario or delves boss."

L["options.event.pvp"] = "Player vs. Player"
L["options.event.pvp.duel"] = "PvP - Duel finished"
L["options.event.pvp.arena"] = "PvP - Arena completed"
L["options.event.pvp.battleground"] = "PvP - Battleground completed"

L["options.event.levelUp"] = "Level-up"
L["options.event.death"] = "Player death"
L["options.event.login"] = "Player login"

L["profiles"] = "Profiles"

L["statistic"] = "Statistics"
L["statistic.screenshots"] = "Screenshots"
L["statistic.screenshots.description"] = "This small overview shows the number of all screenshots created by Memento since release 2.0.0 The number for the current character is shown in brackets."
L["statistic.screenshots.achievement.personal"] = "Personal achievement"
L["statistic.screenshots.achievement.criteria"] = "Personal achievement criteria"
L["statistic.screenshots.achievement.guild"] = "Guild achievement"
L["statistic.screenshots.encounter.victory"] = "Boss fight - Victory"
L["statistic.screenshots.encounter.wipe"] = "Boss fight - Wipe"
L["statistic.screenshots.pvp.duel"] = "PvP - Duel finished"
L["statistic.screenshots.pvp.arena"] = "PvP - Arena completed"
L["statistic.screenshots.pvp.battleground"] = "PvP - Battleground completed"
L["statistic.screenshots.levelUp"] = "Level-up"
L["statistic.screenshots.death"] = "Player death"
L["statistic.screenshots.login"] = "Player login"

L["chat.level.name"] = "Level"
L["chat.reset.options.success"] = "Options successfully reseted."
L["chat.reset.statistic.success"] = "Statistics successfully deleted."
L["chat.event.achievement.personal.new"] = "Screenshot taken - |c" .. eventColor .. "Personal achievement|r - %s"
L["chat.event.achievement.personal.exist"] = "Screenshot taken - |c" .. eventColor .. "Personal achievement|r - %s (has already been reached by another character)"
L["chat.event.achievement.criteria.new"] = "Screenshot taken - |c" .. eventColor .. "Personal achievement|r - %s - %s"
L["chat.event.achievement.guild.new"] = "Screenshot taken - |c" .. eventColor .. "Guild achievement|r - %s"
L["chat.event.encounter.victory.new"] = "Screenshot taken - |c" .. eventColor .. "Boss fight - Victory|r - %s (%s)"
L["chat.event.encounter.wipe.new"] = "Screenshot taken - |c" .. eventColor .. "Boss fight - Wipe|r - %s (%s)"
L["chat.event.pvp.duel.new"] = "Screenshot erstellt - |c" .. eventColor .. "PvP - Duel finished|r"
L["chat.event.pvp.arena.new"] = "Screenshot erstellt - |c" .. eventColor .. "PvP - Arena completed|r"
L["chat.event.pvp.battleground.new"] = "Screenshot erstellt - |c" .. eventColor .. "PvP - Battleground completed|r"
L["chat.event.levelUp.new"] = "Screenshot taken - |c" .. eventColor .. "Level-up|r - %s"
L["chat.event.death.new"] = "Screenshot taken - |c" .. eventColor .. "Player death|r"
L["chat.event.login.new"] = "Screenshot taken - |c" .. eventColor .. "Player login|r"

L["screen.message"] = "Screenshot taken"
