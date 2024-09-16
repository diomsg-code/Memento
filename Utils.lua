local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

-----------------------
--- Color functions ---
-----------------------
local function markNormalFont(text)
	return WrapTextInColorCode(text, "FFFFD200")
end

local function markWhiteFont(text)
	return WrapTextInColorCode(text, "FFFFFFFF")
end

local function markLightYellowFont(text)
	return WrapTextInColorCode(text, "FFFFFF99")
end

local function markOrangeFont(text)
	return WrapTextInColorCode(text, "FFFF8040")
end

----------------------
--- Print funtions ---
----------------------
function Memento:PrintMessage(msg)
    if self.db.profile.options.notification then
        DEFAULT_CHAT_FRAME:AddMessage(markLightYellowFont("Memento: ") .. markWhiteFont(msg))
    end
end

function Memento:PrintDebug(msg)
    if self.db.profile.options.debug then
        DEFAULT_CHAT_FRAME:AddMessage(markOrangeFont("Debug (Memento): " .. msg))
	end
end

function Memento:PrintStatistic()
    if self.db.profile.options.notification then
        local msg = markLightYellowFont("Memento: ") .. markWhiteFont(L["chat.statistic.header"]) .. "\n"

        if Memento.flavor == "Retail" then
            msg = msg .. markNormalFont(L["chat.statistic.achievement.personal"].. ": ") .. markWhiteFont(self.dbStatstic.global.events.achievement.personal.count .. " (" .. self.dbStatstic.char.events.achievement.personal.count .. ")\n")
            msg = msg .. markNormalFont(L["chat.statistic.achievement.guild"].. ": ") .. markWhiteFont(self.dbStatstic.global.events.achievement.guild.count .. " (" .. self.dbStatstic.char.events.achievement.guild.count .. ")\n")
        end

        msg = msg .. markNormalFont(L["chat.statistic.levelUp"].. ": ") .. markWhiteFont(self.dbStatstic.global.events.levelUp.count .. " (" .. self.dbStatstic.char.events.levelUp.count .. ")\n")
        msg = msg .. markNormalFont(L["chat.statistic.death"].. ": ") .. markWhiteFont(self.dbStatstic.global.events.death.count .. " (" .. self.dbStatstic.char.events.death.count .. ")\n")
        msg = msg .. markNormalFont(L["chat.statistic.duel"].. ": ") .. markWhiteFont(self.dbStatstic.global.events.duel.count .. " (" .. self.dbStatstic.char.events.duel.count .. ")")

        DEFAULT_CHAT_FRAME:AddMessage(msg)
	end
end

---------------------
--- Main funtions ---
---------------------
function Memento:TakeScreenshot(event)
    Screenshot()
    self:PrintDebug("Screenshot taken.")

    if event == 1 then
        self.dbStatstic.char.events.achievement.personal.count = self.dbStatstic.char.events.achievement.personal.count + 1
        self.dbStatstic.global.events.achievement.personal.count = self.dbStatstic.global.events.achievement.personal.count + 1
        self:PrintDebug("Event counter for EVENT_ACHIEVEMENT_PERSONAL increased by one.")
    elseif event == 2 then
        self.dbStatstic.char.events.achievement.guild.count = self.dbStatstic.char.events.achievement.guild.count + 1
        self.dbStatstic.global.events.achievement.guild.count = self.dbStatstic.global.events.achievement.guild.count + 1
        self:PrintDebug("Event counter for EVENT_ACHIEVEMENT_GUILD increased by one.")
    elseif event == 3 then
        self.dbStatstic.char.events.levelUp.count = self.dbStatstic.char.events.levelUp.count + 1
        self.dbStatstic.global.events.levelUp.count = self.dbStatstic.global.events.levelUp.count + 1
        self:PrintDebug("Event counter for EVENT_LEVEL_UP increased by one.")
    elseif event == 4 then
        self.dbStatstic.char.events.death.count = self.dbStatstic.char.events.death.count + 1
        self.dbStatstic.global.events.death.count = self.dbStatstic.global.events.death.count + 1
        self:PrintDebug("Event counter for EVENT_DEATH increased by one.")
    elseif event == 5 then
        self.dbStatstic.char.events.duel.count = self.dbStatstic.char.events.duel.count + 1
        self.dbStatstic.global.events.duel.count = self.dbStatstic.global.events.duel.count + 1
        self:PrintDebug("Event counter for EVENT_DUEL increased by one.")
    end
end