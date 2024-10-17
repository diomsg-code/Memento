local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

-----------------------
--- Local functions ---
-----------------------

local function SetupDatabase(self)
	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
		self.db = LibStub("AceDB-3.0"):New("Memento_Options", Memento.defaults["options-mainline"], true)
		self.dbStatstic = LibStub("AceDB-3.0"):New("Memento_Statistic_v2", Memento.defaults["statistic-mainline"], true)
	elseif WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC then
		self.db = LibStub("AceDB-3.0"):New("Memento_Options", Memento.defaults["options-cata"], true)
		self.dbStatstic = LibStub("AceDB-3.0"):New("Memento_Statistic_v2", Memento.defaults["statistic-cata"], true)
	elseif WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
		self.db = LibStub("AceDB-3.0"):New("Memento_Options", Memento.defaults["options-vanilla"], true)
		self.dbStatstic = LibStub("AceDB-3.0"):New("Memento_Statistic_v2", Memento.defaults["statistic-vanilla"], true)
	end

	if (not Memento_DataBossKill) then
        Memento_DataBossKill = {}
    end
end

local function SetupOptions(self)
	local AceConfig = LibStub("AceConfigRegistry-3.0")
	local AceConfigDialog = LibStub("AceConfigDialog-3.0")

	local info = Memento.optionsTable["info"]
	local statistic = Memento.optionsTable["statistic"]

	local options = Memento.optionsTable["options"]

	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
		options.args.achievement =  Memento.optionsTable["eventAchievement-mainline"]
		options.args.encounter = Memento.optionsTable["eventEncounter-mainline"]
		options.args.pvp = Memento.optionsTable["eventPvP-mainline"]
	elseif WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC then
		options.args.achievement =  Memento.optionsTable["eventAchievement-cata"]
		options.args.encounter = Memento.optionsTable["eventEncounter-cata"]
		options.args.pvp = Memento.optionsTable["eventPvP-cata"]
	elseif WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
		options.args.encounter = Memento.optionsTable["eventEncounter-vanilla"]
		options.args.pvp = Memento.optionsTable["eventPvP-vanilla"]
	end

	options.args.levelUp = Memento.optionsTable["eventLevelUp"]
	options.args.death = Memento.optionsTable["eventDeath"]
	options.args.login = Memento.optionsTable["eventLogin"]

	local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	profiles.confirm = true

	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
		profiles.name = "|T" .. Memento.MEDIA_PATH .. "icon_options.blp:0:0:0:1|t  " .. addonName .. " - " .. L["profiles"]
	else
		profiles.name = "|T" .. Memento.MEDIA_PATH .. "icon_options.blp:0:0:0:2|t  " .. addonName .. " - " .. L["profiles"]
	end

	AceConfig:RegisterOptionsTable(addonName, info)
	AceConfig:RegisterOptionsTable("Options", options)
	AceConfig:RegisterOptionsTable("Statistic", statistic)
    AceConfig:RegisterOptionsTable("Profiles", profiles)

	AceConfigDialog:AddToBlizOptions(addonName, addonName)
	AceConfigDialog:AddToBlizOptions("Options", L["options"], addonName)
	AceConfigDialog:AddToBlizOptions("Statistic", L["statistic"], addonName)
    AceConfigDialog:AddToBlizOptions("Profiles", L["profiles"], addonName)
end

------------------------
--- Public functions ---
------------------------

function Memento:SetupAddon()
	SetupDatabase(self)
	SetupOptions(self)

	self:RegisterChatCommand("memento", "SlashCommand")

	self:PrintDebug("Default options and database have been loaded." )
end

function Memento:SlashCommand(msg)
	if not msg or msg:trim() == "" then
        Settings.OpenToCategory(addonName)
	else
        self:PrintDebug("No arguments will be accepted.")
	end
end