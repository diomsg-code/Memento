local L = LibStub("AceLocale-3.0"):NewLocale("Memento", "deDE")

if not L then return end

L["general"] = "Einstellungen"

L["general.info"] = "Info"

L["general.info.about"] = "Über"
L["general.info.about.addon-version"] = "Addonversion"
L["general.info.about.game-version"] = "Spielversion"
L["general.info.about.author"] = "Autor"

L["general.options"] = "Einstellungen"

L["general.options.general"] = "allgemeine Einstellungen"
L["general.options.general.notification.name"] = "Chatbenachrichtigung"
L["general.options.general.notification.desc"] = "Aktiviere oder deaktiviere die Benachrichtung im Chat, wenn ein Screenshot erstellt wurde."
L["general.options.general.statistic.name"] = "Statistikausgabe"
L["general.options.general.statistic.desc"] = "Aktiviere oder deaktiviere die Statistikausgabe im Chat, nach dem Login."

L["general.options.achievement.personal"] = "persönlicher Erfolg"
L["general.options.achievement.personal.active.name"] = "Screenshot bei persönlichem Erfolg erstellen"
L["general.options.achievement.personal.active.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein persönlicher Erfolg erlangt wurde."
L["general.options.achievement.personal.exist.name"] = "Screenshot bei bereits erzieltem Erfolg erstellen"
L["general.options.achievement.personal.exist.desc"] = "Aktiviere oder deaktiviere die Erstellung eines Screenhots, wenn ein Erfolg bereits von einem anderen Charakter erlangt wurde."
L["general.options.achievement.personal.timer.name"] = "Verzögerung"
L["general.options.achievement.personal.timer.desc"] = "Zeitliche Verzögerung des Screenshots, nachdem ein persönlicher Erfolg erzielt wurde.\n\nStandard: 2 Sekunden"

L["general.options.achievement.guild"] = "Gildenerfolg"
L["general.options.achievement.guild.active.name"] = "Screenshot bei Gildenerfolg erstellen"
L["general.options.achievement.guild.active.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein Gildenerfolg erlangt wurde."
L["general.options.achievement.guild.timer.name"] = "Verzögerung"
L["general.options.achievement.guild.timer.desc"] = "Zeitliche Verzögerung des Screenshots, nachdem ein Gildenerfolg erzielt wurde.\n\nStandard: 2 Sekunden"

L["general.options.levelUp"] = "Levelaufstieg"
L["general.options.levelUp.active.name"] = "Screenshot bei Levelaufstieg erstellen"
L["general.options.levelUp.active.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein Levelaufstieg erfolgt ist."
L["general.options.levelUp.timer.name"] = "Verzögerung"
L["general.options.levelUp.timer.desc"] = "Zeitliche Verzögerung des Screenshots, nachdem ein Levelaufstieg erfolgt ist.\n\nStandard: 5 Sekunden"

L["general.options.death"] = "Spielertod"
L["general.options.death.active.name"] = "Screenshot bei Spielertod erstellen"
L["general.options.death.active.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn der Spieler gestorben ist."
L["general.options.death.timer.name"] = "Verzögerung"
L["general.options.death.timer.desc"] = "Zeitliche Verzögerung des Screenshots, nachdem der Spieler gestorben ist.\n\nStandard: 1 Sekunde"

L["general.options.duel"] = "Duell beendet"
L["general.options.duel.active.name"] = "Screenshot nach Duell erstellen"
L["general.options.duel.active.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein Duell beendet wurde."
L["general.options.duel.timer.name"] = "Verzögerung"
L["general.options.duel.timer.desc"] = "Zeitliche Verzögerung des Screenshots, nachdem ein Duell beendet wurde.\n\nStandard: 1 Sekunde"

L["general.debug"] = "Debug"

L["general.debug.general"] = "allgemeine Einstellungen"
L["general.debug.general.active.name"] = "Debugmodus aktivieren"
L["general.debug.general.active.desc"] = "Aktiviere oder deaktiviere den Debugmodus."

L["profiles"] = "Profile"

L["chat.events.achievement.personal.new"] = "Screenshot erstellt - persönlicher Erfolg: "
L["chat.events.achievement.personal.exist"] = "Screenshot erstellt - persönlicher Erfolg (wurde bereits von einem anderen Charakter erzielt): "
L["chat.events.achievement.guild.new"] = "Screenshot erstellt - Gildenerfolg: "
L["chat.events.levelUp.new"] = "Screenshot erstellt - Levelaufstieg: "
L["chat.events.death.new"] = "Screenshot erstellt - Spielertod: Du bist gestorben."
L["chat.events.duel.new"] = "Screenshot erstellt - Duell beendet."

L["chat.statistic.header"] = "Diese kleine Übersicht zeigt die Anzahl aller ab Release 1.2.0 erstellten Screenshots durch Memento. In Klammern steht die Anzahl für den aktuellen Charakter."
L["chat.statistic.achievement.personal"] = "persönlicher Erfolg"
L["chat.statistic.achievement.guild"] = "Gildenerfolg"
L["chat.statistic.levelUp"] = "Levelaufstieg"
L["chat.statistic.death"] = "Spielertod"
L["chat.statistic.duel"] = "Duel beendet"