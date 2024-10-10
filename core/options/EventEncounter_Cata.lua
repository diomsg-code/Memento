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
			width = "double",
			order = 0.14
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
			order = 0.15
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
			order = 0.16
		},
		SPACE_2 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.17
		},
		SEPARATOR_2 = {
			name = " " .. L["options.event.encounter.wipe"],
			type = "header",
			dialogControl = "SFX-Header-II",
			order = 0.18
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
			order = 0.19
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
			width = "double",
			order = 0.20
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
			order = 0.21
		},
		SPACE_3 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.22
		},
	},
}
