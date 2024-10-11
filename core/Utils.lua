local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

-----------------------
--- Color functions ---
-----------------------

function Memento_MarkNormalFont(text)
	return WrapTextInColorCode(text, Memento.COLOR_NORMAL_FONT)
end

function Memento_MarkWhiteFont(text)
	return WrapTextInColorCode(text, Memento.COLOR_WHITE_FONT)
end

function Memento_MarkOrangeFont(text)
	return WrapTextInColorCode(text, Memento.COLOR_ORANGE_FONT)
end

function Memento_MarkGoldFont(text)
	return WrapTextInColorCode(text, Memento.COLOR_GOLD_FONT)
end

----------------------
--- Link functions ---
----------------------

function Memento_GetLevelUpLink(level)
    return "|cffFF4E00|Hlevelup:" .. level .. ":LEVEL_UP_TYPE_CHARACTER|h[" .. L["chat.level.name"] .. " " .. level .. "]|h|r"
end
