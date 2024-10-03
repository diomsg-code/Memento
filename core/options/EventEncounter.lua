local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.3

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventEncounter"] = {
	name = L["general.options.encounter"],
	type = "group",
	order = orderID,
	args = {
		victoryDesc = {
			name = L["general.options.encounter.victory.desc"],
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.11
		},
		victoryParty = {
			name = L["general.options.encounter.victory.party.name"],
			desc = L["general.options.encounter.victory.party.desc"],
			type = "toggle",
			get = function()
				return Memento.db.profile.events.encounter.victory.party
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.party = value
			end,
			width = "normal",
			order = 0.12
		},
		victoryRaid = {
			name = L["general.options.encounter.victory.raid.name"],
			desc = L["general.options.encounter.victory.raid.desc"],
			type = "toggle",
			get = function()
				return Memento.db.profile.events.encounter.victory.raid
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.raid = value
			end,
			width = "normal",
			order = 0.13
		},
		victoryScenario = {
			name = L["general.options.encounter.victory.scenario.name"],
			desc = L["general.options.encounter.victory.scenario.desc"],
			type = "toggle",
			hidden = function()
				return (not (Memento.flavor == "Retail"))
			end,
			get = function()
				return Memento.db.profile.events.encounter.victory.scenario
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.scenario = value
			end,
			width = "normal",
			order = 0.14
		},
		victoryFirst = {
			name = L["general.options.encounter.victory.first.name"],
			desc = L["general.options.encounter.victory.first.desc"],
			type = "toggle",
			disabled = function()
				return ((not Memento.db.profile.events.encounter.victory.party) and (not Memento.db.profile.events.encounter.victory.raid) and (not Memento.db.profile.events.encounter.victory.scenario))
			end,
			get = function()
				return Memento.db.profile.events.encounter.victory.first
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.first = value
			end,
			width = "double",
			order = 0.15
		},
		victoryTimer = {
			name = L["general.options.encounter.victory.timer.name"],
			desc = L["general.options.encounter.victory.timer.desc"],
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return ((not Memento.db.profile.events.encounter.victory.party) and (not Memento.db.profile.events.encounter.victory.raid) and (not Memento.db.profile.events.encounter.victory.scenario))
			end,
			get = function()
				return Memento.db.profile.events.encounter.victory.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.timer = value
			end,
			order = 0.16
		},
		SEPARATOR_1 = {
			name = "",
			type = "header",
			dialogControl = "SFX-Header",
			order = 0.17
		},
		wipeDesc = {
			name = L["general.options.encounter.wipe.desc"],
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.18
		},
		wipeParty = {
			name = L["general.options.encounter.wipe.party.name"],
			desc = L["general.options.encounter.wipe.party.desc"],
			type = "toggle",
			get = function()
				return Memento.db.profile.events.encounter.wipe.party
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.party = value
			end,
			width = "normal",
			order = 0.19
		},
		wipeRaid = {
			name = L["general.options.encounter.wipe.raid.name"],
			desc = L["general.options.encounter.wipe.raid.desc"],
			type = "toggle",
			get = function()
				return Memento.db.profile.events.encounter.wipe.raid
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.raid = value
			end,
			width = "normal",
			order = 0.20
		},
		wipeScenario = {
			name = L["general.options.encounter.wipe.scenario.name"],
			desc = L["general.options.encounter.wipe.scenario.desc"],
			type = "toggle",
			hidden = function()
				return (not (Memento.flavor == "Retail"))
			end,
			get = function()
				return Memento.db.profile.events.encounter.wipe.scenario
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.scenario = value
			end,
			width = "normal",
			order = 0.21
		},
		SPACE_1 = {
			name = "",
			type = "description",
			width = "double",
			fontSize = "medium",
			order = 0.22
		},
		wipeTimer = {
			name = L["general.options.encounter.wipe.timer.name"],
			desc = L["general.options.encounter.wipe.timer.desc"],
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return ((not Memento.db.profile.events.encounter.wipe.party) and (not Memento.db.profile.events.encounter.wipe.raid) and (not Memento.db.profile.events.encounter.wipe.scenario))
			end,
			get = function()
				return Memento.db.profile.events.encounter.wipe.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.timer = value
			end,
			order = 0.23
		},
	},
}
