local L = LibStub("AceLocale-3.0"):NewLocale("Memento", "deDE")

if not L then return end

L["options.info"] = "Info"
L["options.info.generel"] = "Allgemein"
L["options.info.generel.addon-version"] = "Addonversion"
L["options.info.generel.game-version"] = "Spielversion"
L["options.info.generel.author"] = "Autor"

L["options.setting"] = "Einstellungen"
L["options.setting.generel"] = "allgemeine Einstellungen"
L["options.setting.generel.notification.name"] = "Chatbenachrichtigung"
L["options.setting.generel.notification.desc"] = "Aktiviere oder deaktiviere die Benachrichtung im Chat, wenn ein Screenshot erstellt wurde."
L["options.setting.achievement.personal"] = "persöhnlicher Erfolg"
L["options.setting.achievement.personal.active.name"] = "Screenshot bei persönlichem Erfolg erstellen"
L["options.setting.achievement.personal.active.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein persönlicher Erfolg erlangt wird."
L["options.setting.achievement.personal.exist.name"] = "Screenshot bei bereits erzieltem Erfolg erstellen"
L["options.setting.achievement.personal.exist.desc"] = "Aktiviere oder deaktiviere die Erstellung eines Screenhots, wenn ein Erfolg bereits von einem anderen Charakter erlangt wurde."
L["options.setting.achievement.personal.timer.name"] = "Verzögerung"
L["options.setting.achievement.personal.timer.desc"] = "Zeitliche Verzögerung des Screenshots, nachdem ein persönlicher Erfolg erzielt wurde.\nStandard: 2 Sekunden"
L["options.setting.achievement.guild"] = "Gildenerfolg"
L["options.setting.achievement.guild.active.name"] = "Screenshot bei Gildenerfolg erstellen"
L["options.setting.achievement.guild.active.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein Gildenerfolg erlangt wird."
L["options.setting.achievement.guild.timer.name"] = "Verzögerung"
L["options.setting.achievement.guild.timer.desc"] = "Zeitliche Verzögerung des Screenshots, nachdem ein Gildenerfolg erzielt wurde.\nStandard: 2 Sekunden"
L["options.setting.levelUp"] = "Levelaufstieg"
L["options.setting.levelUp.active.name"] = "Screenshot bei Levelaufstieg erstellen"
L["options.setting.levelUp.active.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein Levelaufstieg erfolgt ist."
L["options.setting.levelUp.timer.name"] = "Verzögerung"
L["options.setting.levelUp.timer.desc"] = "Zeitliche Verzögerung des Screenshots, nachdem ein Levelaufstieg erfolgt ist.\nStandard: 5 Sekunden"

L["options.debug"] = "Debug"
L["options.debug.generel"] = "allgemeine Einstellungen"
L["options.debug.generel.active.name"] = "Debugmodus aktivieren"
L["options.debug.generel.active.desc"] = "Aktiviere oder deaktiviere den Debugmodus."

L["chat.event.achievement.personal.new"] = "Screenshot erstellt - persöhnlicher Erfolg: "
L["chat.event.achievement.personal.exist"] = "Screenshot erstellt - persöhnlicher Erfolg (wurde bereits von einem anderen Charakter erzielt): "
L["chat.event.achievement.guild.new"] = "Screenshot erstellt - Gildenerfolg: "
L["chat.event.levelUp.new"] = "Screenshot erstellt - Levelaufstieg: "

L["debug.event.achievement.personal.exist"] = "Es wurde kein Screenshot erstellt, da der Erfolg bereits von einem anderen Charakter erzielt wurde."