local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.3

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventEncounter"] = {
	name = L["options.event.encounter"],
	type = "group",
	order = orderID,
	args = {
		SPACE_1 = {
			name = "",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.11
		},
		SEPARATOR_1 = {
			name = " " .. L["options.event.encounter.victory"],
			type = "header",
			dialogControl = "SFX-Header-II",
			order = 0.12
		},
		victoryParty = {
			name = L["options.event.encounter.party.name"],
			desc = L["options.event.encounter.victory.party.desc"],
			type = "toggle",
			get = function()
				return Memento.db.profile.events.encounter.victory.party
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.party = value
			end,
			width = "normal",
			order = 0.13
		},
		victoryRaid = {
			name = L["options.event.encounter.raid.name"],
			desc = L["options.event.encounter.victory.raid.desc"],
			type = "toggle",
			get = function()
				return Memento.db.profile.events.encounter.victory.raid
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.raid = value
			end,
			width = "normal",
			order = 0.14
		},
		victoryScenario = {
			name = L["options.event.encounter.scenario.name"],
			desc = L["options.event.encounter.victory.scenario.desc"],
			type = "toggle",
			get = function()
				return Memento.db.profile.events.encounter.victory.scenario
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.scenario = value
			end,
			width = "normal",
			order = 0.15
		},
		victoryFirst = {
			name = L["options.event.encounter.victory.first.name"],
			desc = L["options.event.encounter.victory.first.desc"],
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
			width = "full",
			order = 0.16
		},
		victoryTimer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.encounter.victory"], 2),
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
			order = 0.17
		},
		SPACE_2 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.18
		},
		SEPARATOR_2 = {
			name = " " .. L["options.event.encounter.wipe"],
			type = "header",
			dialogControl = "SFX-Header-II",
			order = 0.19
		},
		wipeParty = {
			name = L["options.event.encounter.party.name"],
			desc = L["options.event.encounter.wipe.party.desc"],
			type = "toggle",
			get = function()
				return Memento.db.profile.events.encounter.wipe.party
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.party = value
			end,
			width = "normal",
			order = 0.20
		},
		wipeRaid = {
			name = L["options.event.encounter.raid.name"],
			desc = L["options.event.encounter.wipe.raid.desc"],
			type = "toggle",
			get = function()
				return Memento.db.profile.events.encounter.wipe.raid
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.raid = value
			end,
			width = "normal",
			order = 0.21
		},
		wipeScenario = {
			name = L["options.event.encounter.scenario.name"],
			desc = L["options.event.encounter.wipe.scenario.desc"],
			type = "toggle",
			get = function()
				return Memento.db.profile.events.encounter.wipe.scenario
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.scenario = value
			end,
			width = "normal",
			order = 0.22
		},
		wipeTimer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.encounter.wipe"], 2),
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
		SPACE_3 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.24
		},
	},
}
