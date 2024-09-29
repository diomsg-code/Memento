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

local function CreateMessageFrame(frame)
    local font

    frame = CreateFrame("Frame")
    frame:ClearAllPoints()
    frame:SetPoint("BOTTOM", 0, 100)
    frame:SetSize(164, 41)

    frame.background = frame:CreateTexture(nil, "BACKGROUND")
    frame.background:ClearAllPoints()
    frame.background:SetAllPoints(frame)
    frame.background:SetTexture(612384)

    frame.textTop = frame:CreateFontString(nil, "OVERLAY", "GameFontBlackTiny")
    frame.textTop:ClearAllPoints()
    frame.textTop:SetPoint("CENTER", 0, 5)
    font = frame.textTop:GetFont()
    frame.textTop:SetFont(tostring(font), 7)
    frame.textTop:SetText(L["message"])

    frame.textBottom = frame:CreateFontString(nil, "OVERLAY", "GameFontWhiteTiny")
    frame.textBottom:ClearAllPoints()
    frame.textBottom:SetPoint("CENTER", 0, -6)
    font = frame.textBottom:GetFont()
    frame.textBottom:SetFont(tostring(font), 7)
    frame.textBottom:SetText(tostring(date("%d/%m/%y %H:%M:%S", GetServerTime())))

    return frame
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

        if Memento.flavor == "Retail" or Memento.flavor == "Cata" then
            msg = msg .. markNormalFont(L["chat.statistic.achievement.personal"] .. ": ") .. markWhiteFont(self.dbStatstic.global.events.achievement.personal.count .. " (" .. self.dbStatstic.char.events.achievement.personal.count .. ")\n")
            msg = msg .. markNormalFont(L["chat.statistic.achievement.guild"] .. ": ") .. markWhiteFont(self.dbStatstic.global.events.achievement.guild.count .. " (" .. self.dbStatstic.char.events.achievement.guild.count .. ")\n")
        end

        msg = msg .. markNormalFont(L["chat.statistic.encounter"] .. ": ") .. markWhiteFont(self.dbStatstic.global.events.encounter.count .. " (" .. self.dbStatstic.char.events.encounter.count .. ")\n")
        msg = msg .. markNormalFont(L["chat.statistic.levelUp"] .. ": ") .. markWhiteFont(self.dbStatstic.global.events.levelUp.count .. " (" .. self.dbStatstic.char.events.levelUp.count .. ")\n")
        msg = msg .. markNormalFont(L["chat.statistic.death"] .. ": ") .. markWhiteFont(self.dbStatstic.global.events.death.count .. " (" .. self.dbStatstic.char.events.death.count .. ")\n")
        msg = msg .. markNormalFont(L["chat.statistic.duel"] .. ": ") .. markWhiteFont(self.dbStatstic.global.events.duel.count .. " (" .. self.dbStatstic.char.events.duel.count .. ")\n")
        msg = msg .. markNormalFont(L["chat.statistic.login"] .. ": ") .. markWhiteFont(self.dbStatstic.global.events.login.count .. " (" .. self.dbStatstic.char.events.login.count .. ")")

        DEFAULT_CHAT_FRAME:AddMessage(msg)
	end
end

---------------------
--- Main funtions ---
---------------------
function Memento:TakeScreenshot(event)
    if self.db.profile.options.ui and (not InCombatLockdown()) then
        UIParent:Hide()

        local frame = CreateFrame("Frame")
        frame = CreateMessageFrame(frame)
    
        Screenshot()
    
        C_Timer.After(0.01, function()
            UIParent:Show()
            frame:Hide()
        end)

        self:PrintDebug("Screenshot without UI taken.")
    else
        Screenshot()
        self:PrintDebug("Screenshot taken.")
    end

    if event == 1 then
        self.dbStatstic.char.events.achievement.personal.count = self.dbStatstic.char.events.achievement.personal.count + 1
        self.dbStatstic.global.events.achievement.personal.count = self.dbStatstic.global.events.achievement.personal.count + 1
        self:PrintDebug("Counter for \"ACHIEVEMENT_EARNED\" (Personal) increased by one.")
    elseif event == 2 then
        self.dbStatstic.char.events.achievement.guild.count = self.dbStatstic.char.events.achievement.guild.count + 1
        self.dbStatstic.global.events.achievement.guild.count = self.dbStatstic.global.events.achievement.guild.count + 1
        self:PrintDebug("Counter for \"ACHIEVEMENT_EARNED\" (Guild) increased by one.")
    elseif event == 3 then
        self.dbStatstic.char.events.encounter.count = self.dbStatstic.char.events.encounter.count + 1
        self.dbStatstic.global.events.encounter.count = self.dbStatstic.global.events.encounter.count + 1
        self:PrintDebug("Counter for \"ENCOUNTER_END\" (Victory) increased by one.")
    elseif event == 4 then
        self.dbStatstic.char.events.levelUp.count = self.dbStatstic.char.events.levelUp.count + 1
        self.dbStatstic.global.events.levelUp.count = self.dbStatstic.global.events.levelUp.count + 1
        self:PrintDebug("Counter for \"ENCOUNTER_END\" (Wipe) increased by one.")
    elseif event == 5 then
        self.dbStatstic.char.events.levelUp.count = self.dbStatstic.char.events.levelUp.count + 1
        self.dbStatstic.global.events.levelUp.count = self.dbStatstic.global.events.levelUp.count + 1
        self:PrintDebug("Counter for \"PLAYER_LEVEL_UP\" increased by one.")
    elseif event == 6 then
        self.dbStatstic.char.events.death.count = self.dbStatstic.char.events.death.count + 1
        self.dbStatstic.global.events.death.count = self.dbStatstic.global.events.death.count + 1
        self:PrintDebug("Counter for \"PLAYER_DEAD\" increased by one.")
    elseif event == 7 then
        self.dbStatstic.char.events.duel.count = self.dbStatstic.char.events.duel.count + 1
        self.dbStatstic.global.events.duel.count = self.dbStatstic.global.events.duel.count + 1
        self:PrintDebug("Counter for \"DUEL_FINISHED\" increased by one.")
    elseif event == 8 then
        self.dbStatstic.char.events.login.count = self.dbStatstic.char.events.login.count + 1
        self.dbStatstic.global.events.login.count = self.dbStatstic.global.events.login.count + 1
        self:PrintDebug("Counter for \"PLAYER_LOGIN\" increased by one.")
    else
        self:PrintDebug("No Counter was increased.")
    end
end
