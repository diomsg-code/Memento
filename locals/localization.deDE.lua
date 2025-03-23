local L = LibStub("AceLocale-3.0"):NewLocale("Memento", "deDE")

if not L then return end

local eventColor = "ffF2E699"
local normalCoor = "ffFFD200"

L["info"] = "Info"

L["info.description"] = "Beschreibung"
L["info.description.content_1"] = "Memento ist ein Addon, welches bei bestimmten Events automatisch Screenshots erstellt. Die folgenden Events werden aktuell unterstützt (weitere sind geplant):\n\n"
                                .. "  • |c" .. eventColor .. "Erfolge|r (persönliche Erfolge, erreichte Erfolgskriterien & Gildenerfolge)*\n"
                                .. "  • |c" .. eventColor .. "Bosskampf|r (Sieg & Niederlage)\n"
                                .. "  • |c" .. eventColor .. "Spieler vs. Spieler|r (Duell, Arena, Schlachtfeld & Rauferei)*\n"
                                .. "  • |c" .. eventColor .. "Stufenaufstieg|r\n"
                                .. "  • |c" .. eventColor .. "Spielertod|r\n"
                                .. "  • |c" .. eventColor .. "Spielerlogin|r\n\n"
L["info.description.content_2"] = "* Erfolge gibt es in 'Classic' nicht und Arena & Schlachtfeld Screenshots sind aktuell nur für 'Retail' umgesetzt"

L["info.about"] = "Über"
L["info.about.addon-version"] = "Addonversion"
L["info.about.game-version"] = "Spielversion"
L["info.about.author"] = "Autor"
L["info.about.feedback"] = "Um Fehler zu melden oder Feedback zum Addon zu geben, nutze bitte eine der folgenden Möglichkeiten."
L["info.about.email.name"] = "E-Mail"
L["info.about.email.desc"] = "Öffnet ein Popup-Fenster mit einer E-Mailadresse."
L["info.about.email.popup"] = "Um die E-Mail zu kopieren drücke STRG + C."
L["info.about.github.name"] = "Github"
L["info.about.github.desc"] = "Öffnet ein Popup-Fenster mit einem Link nach Github."
L["info.about.github.popup"] = "Um den Link zu kopieren drücke STRG + C."

L["info.help"] = "Hilfe"
L["info.help.description"] = "Bei Problemen nach einem Update oder wenn Du es möchtest, kannst Du hier die Einstellungen und Statistiken zurücksetzen."
L["info.help.options.name"] = "Einstellungen zurücksetzen"
L["info.help.options.desc"] = "Setzt die Einstellungen auf die Standardwerte zurück. Dies gilt für alle Charaktere."
L["info.help.options.confirmText"] = "Sollen die Einstellungen wirklich zurückgesetzt werden?"
L["info.help.statistic.name"] = "Statistiken löschen"
L["info.help.statistic.desc"] = "Löscht die aktuellen Statistiken. Dies gilt für alle Charaktere."
L["info.help.statistic.confirmText"] = "Sollen die Statistiken wirklich gelöscht werden?"

L["options"] = "Einstellungen"
L["options.general"] = "allgemeine Einstellungen"
L["options.general.notification.name"] = "Chatbenachrichtigung"
L["options.general.notification.desc"] = "Aktiviere oder deaktiviere die Benachrichtung im Chat, wenn ein Screenshot erstellt wurde."
L["options.general.statistic.name"] = "Statistikausgabe"
L["options.general.statistic.desc"] = "Aktiviere oder deaktiviere die Statistikausgabe im Chat, nach dem Login."
L["options.general.ui.name"] = "Benutzeroberfläche für den Screenshot ausblenden |T132049:0|t"
L["options.general.ui.desc"] = "Aktiviere oder deaktiviere die Option, dass die Benutzeroberfläche für den Screenshot ausgeblendet wird. Eine kleine Erfolgsanzeige wird stattdessen angezeigt.\n\n|c" .. normalCoor .. "Hinweis:|r Während eines Kampfes kann die Benutzeroberfläche nicht automatisch ausgeblendet werden. In diesem Fall wird der Screenshot mit der Benutzeroberfläche erstellt."
L["options.general.debug.name"] = "Debugmodus"
L["options.general.debug.desc"] = "Aktiviere oder deaktiviere den Debugmodus."

L["options.event.general.active.name"] = "Screenshot für das Event |c" .. eventColor .. "%s|r erstellen"
L["options.event.general.active.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots für das Event |c" .. eventColor .. "%s|r."
L["options.event.general.delay.name"] = "Verzögerung"
L["options.event.general.delay.desc"] = "Die zeitliche Verzögerung des Screenshots, nachdem das Event |c" .. eventColor .. "%s|r ausgelöst wurde.\n\n|c" .. normalCoor .. "Standard:|r %d Sekunde(n)"

L["options.event.achievement"] = "Erfolge"
L["options.event.achievement.personal"] = "persönlicher Erfolg"
L["options.event.achievement.personal.exist.name"] = "Screenshot bei bereits erzieltem Erfolg erstellen"
L["options.event.achievement.personal.exist.desc"] = "Aktiviere oder deaktiviere die Erstellung eines Screenhots, wenn ein Erfolg bereits von einem anderen Charakter erlangt wurde."
L["options.event.achievement.criteria"] = "persönliches Erfolgskriterium"
L["options.event.achievement.guild"] = "Gildenerfolg"

L["options.event.encounter"] = "Bosskampf"
L["options.event.encounter.victory"] = "Bosskampf - Sieg"
L["options.event.encounter.wipe"] = "Bosskampf - Niederlage"
L["options.event.encounter.party.name"] = "Dungeon"
L["options.event.encounter.raid.name"] = "Raid"
L["options.event.encounter.scenario.name"] = "Szenario / Tiefen"

L["options.event.encounter.victory.party.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein Dungeon-Boss besiegt wurde."
L["options.event.encounter.victory.raid.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein Raid-Boss besiegt wurde."
L["options.event.encounter.victory.scenario.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein Szenario- oder Tiefen-Boss besiegt wurde."
L["options.event.encounter.victory.first.name"] = "nur der erste Sieg pro Schwierigkeit"
L["options.event.encounter.victory.first.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn ein Boss bereits besiegt wurde. Diese Option gilt für jede Schwierigkeit getrennt."
L["options.event.encounter.wipe.party.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn bei einem Dungeon-Boss eine Niederlage stattgefunden hat."
L["options.event.encounter.wipe.raid.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn bei einem Raid-Boss eine Niederlage stattgefunden hat."
L["options.event.encounter.wipe.scenario.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenhots, wenn bei einem Szenario- oder Tiefen-Boss eine Niederlage stattgefunden hat."

L["options.event.pvp"] = "Spieler vs. Spieler"
L["options.event.pvp.duel"] = "PvP - Duell beendet"
L["options.event.pvp.arena"] = "PvP - Arena abgeschlossen"
L["options.event.pvp.battleground"] = "PvP - Schlachtfeld abgeschlossen"
L["options.event.pvp.brawl"] = "PvP - Rauferei abgeschlossen"

L["options.event.pvp.victory.name"] = "nur bei Sieg"
L["options.event.pvp.victory.desc"] = "Aktiviere oder deaktiviere die automatische Erstellung eines Screenshots, wenn Du das PVP-Match gewonnen hast."

L["options.event.levelUp"] = "Stufenaufstieg"

L["options.event.death"] = "Spielertod"
L["options.event.death.instance.name"] = "Screenshotverhalten in Instanzen"
L["options.event.death.instance.desc"] = "Screenshots werden unter Berücksichtigung der folgenden Einstellungen für den |c" .. eventColor .. "Spielertod|r nur innerhalb und / oder außerhalb einer Instanz erstellt.\n\nZu einer Instanz zählen u.a. Arenen, Schlachtfelder, Raids oder Dungeons."
L["options.event.death.instance.option.0"] = "in- und außerhalb von Instanzen"
L["options.event.death.instance.option.1"] = "nur innerhalb von Instanzen"
L["options.event.death.instance.option.2"] = "nur außerhalb von Instanzen"

L["options.event.login"] = "Spielerlogin"

L["profiles"] = "Profile"

L["statistic"] = "Statistiken"
L["statistic.screenshots"] = "Screenshots"
L["statistic.screenshots.description"] = "Diese kleine Übersicht zeigt die Anzahl aller ab Release 2.0.0 erstellten Screenshots durch Memento. In Klammern steht die Anzahl für den aktuellen Charakter."
L["statistic.screenshots.achievement.personal"] = "persönlicher Erfolg"
L["statistic.screenshots.achievement.criteria"] = "persönliches Erfolgskriterium"
L["statistic.screenshots.achievement.guild"] = "Gildenerfolg"
L["statistic.screenshots.encounter.victory"] = "Bosskampf - Sieg"
L["statistic.screenshots.encounter.wipe"] = "Bosskampf - Niederlage"
L["statistic.screenshots.pvp.duel"] = "PvP - Duell beendet"
L["statistic.screenshots.pvp.arena"] = "PvP - Arena abgeschlossen"
L["statistic.screenshots.pvp.battleground"] = "PvP - Schlachtfeld abgeschlossen"
L["statistic.screenshots.pvp.brawl"] = "PvP - Rauferei abgeschlossen"
L["statistic.screenshots.levelUp"] = "Stufenaufstieg"
L["statistic.screenshots.death"] = "Spielertod"
L["statistic.screenshots.login"] = "Spielerlogin"

L["chat.level.name"] = "Stufe"
L["chat.reset.options.success"] = "Einstellungen erfolgreich zurückgesetzt."
L["chat.reset.statistic.success"] = "Statistik erfolgreich gelöscht."
L["chat.event.achievement.personal.new"] = "Screenshot erstellt - |c" .. eventColor .. "persönlicher Erfolg|r - %s"
L["chat.event.achievement.personal.exist"] = "Screenshot erstellt - |c" .. eventColor .. "persönlicher Erfolg|r - %s (wurde bereits von einem anderen Charakter erzielt)"
L["chat.event.achievement.criteria.new"] = "Screenshot erstellt - |c" .. eventColor .. "persönliches Erfolgskriterium|r - %s - %s"
L["chat.event.achievement.guild.new"] = "Screenshot erstellt - |c" .. eventColor .. "Gildenerfolg|r: %s"
L["chat.event.encounter.victory.new"] = "Screenshot erstellt - |c" .. eventColor .. "Bosskampf - Sieg|r - %s (%s)"
L["chat.event.encounter.wipe.new"] = "Screenshot erstellt - |c" .. eventColor .. "Bosskampf - Niederlage|r - %s (%s)"
L["chat.event.pvp.duel.new"] = "Screenshot erstellt - |c" .. eventColor .. "PvP - Duell beendet|r"
L["chat.event.pvp.arena.new"] = "Screenshot erstellt - |c" .. eventColor .. "PvP - Arena abgeschlossen|r"
L["chat.event.pvp.battleground.new"] = "Screenshot erstellt - |c" .. eventColor .. "PvP - Schlachtfeld abgeschlossen|r"
L["chat.event.pvp.brawl.new"] = "Screenshot erstellt - |c" .. eventColor .. "PvP - Rauferei abgeschlossen|r"
L["chat.event.levelUp.new"] = "Screenshot erstellt - |c" .. eventColor .. "Stufenaufstieg|r - %s"
L["chat.event.death.new"] = "Screenshot erstellt - |c" .. eventColor .. "Spielertod|r"
L["chat.event.login.new"] = "Screenshot erstellt - |c" .. eventColor .. "Spielerlogin|r"

L["screen.message"] = "Screenshot erstellt"
