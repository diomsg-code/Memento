local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.4

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventPvP-mainline"] = {
	name = L["options.event.pvp"],
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
			name = " " .. L["options.event.pvp.duel"],
			type = "header",
			dialogControl = "SFX-Header-II",
			order = 0.12
		},
		duelActive = {
			type = "toggle",
			name = L["options.event.general.active.name"]:format(L["options.event.pvp.duel"]),
			desc = L["options.event.general.active.desc"]:format(L["options.event.pvp.duel"]),
			get = function()
				return Memento.db.profile.events.pvp.duel.active
			end,
			set = function(_, value)
				Memento.db.profile.events.pvp.duel.active = value
			end,
			width = "full",
			order = 0.13
		},
		duelTimer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.pvp.duel"], 1),
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.pvp.duel.active
			end,
			get = function()
				return Memento.db.profile.events.pvp.duel.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.pvp.duel.timer = value
			end,
			order = 0.14
		},
		SPACE_2 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.15
		},
		SEPARATOR_2 = {
			name = " " .. L["options.event.pvp.arena"],
			type = "header",
			dialogControl = "SFX-Header-II",
			order = 0.16
		},
		arenaActive = {
			type = "toggle",
			name = L["options.event.general.active.name"]:format(L["options.event.pvp.arena"]),
			desc = L["options.event.general.active.desc"]:format(L["options.event.pvp.arena"]),
			get = function()
				return Memento.db.profile.events.pvp.arena.active
			end,
			set = function(_, value)
				Memento.db.profile.events.pvp.arena.active = value
			end,
			width = "full",
			order = 0.17
		},
		arenaTimer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.pvp.arena"], 3),
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.pvp.arena.active
			end,
			get = function()
				return Memento.db.profile.events.pvp.arena.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.pvp.arena.timer = value
			end,
			order = 0.18
		},
		SPACE_3 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.19
		},
		SEPARATOR_3 = {
			name = " " .. L["options.event.pvp.battleground"],
			type = "header",
			dialogControl = "SFX-Header-II",
			order = 0.20
		},
		battlegroundActive = {
			type = "toggle",
			name = L["options.event.general.active.name"]:format(L["options.event.pvp.battleground"]),
			desc = L["options.event.general.active.desc"]:format(L["options.event.pvp.battleground"]),
			get = function()
				return Memento.db.profile.events.pvp.battleground.active
			end,
			set = function(_, value)
				Memento.db.profile.events.pvp.battleground.active = value
			end,
			width = "full",
			order = 0.21
		},
		battlegroundTimer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.pvp.battleground"], 3),
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.pvp.battleground.active
			end,
			get = function()
				return Memento.db.profile.events.pvp.battleground.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.pvp.battleground.timer = value
			end,
			order = 0.22
		},
		SPACE_4 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.23
		},
	},
}

Memento.optionsTable["eventPvP-cata"] = {
	name = L["options.event.pvp"],
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
			name = " " .. L["options.event.pvp.duel"],
			type = "header",
			dialogControl = "SFX-Header-II",
			order = 0.12
		},
		duelActive = {
			type = "toggle",
			name = L["options.event.general.active.name"]:format(L["options.event.pvp.duel"]),
			desc = L["options.event.general.active.desc"]:format(L["options.event.pvp.duel"]),
			get = function()
				return Memento.db.profile.events.pvp.duel.active
			end,
			set = function(_, value)
				Memento.db.profile.events.pvp.duel.active = value
			end,
			width = "full",
			order = 0.13
		},
		duelTimer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.pvp.duel"], 1),
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.pvp.duel.active
			end,
			get = function()
				return Memento.db.profile.events.pvp.duel.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.pvp.duel.timer = value
			end,
			order = 0.14
		},
		SPACE_2 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.15
		},
	},
}

Memento.optionsTable["eventPvP-vanilla"] = {
	name = L["options.event.pvp"],
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
			name = " " .. L["options.event.pvp.duel"],
			type = "header",
			dialogControl = "SFX-Header-II",
			order = 0.12
		},
		duelActive = {
			type = "toggle",
			name = L["options.event.general.active.name"]:format(L["options.event.pvp.duel"]),
			desc = L["options.event.general.active.desc"]:format(L["options.event.pvp.duel"]),
			get = function()
				return Memento.db.profile.events.pvp.duel.active
			end,
			set = function(_, value)
				Memento.db.profile.events.pvp.duel.active = value
			end,
			width = "full",
			order = 0.13
		},
		duelTimer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.pvp.duel"], 1),
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.pvp.duel.active
			end,
			get = function()
				return Memento.db.profile.events.pvp.duel.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.pvp.duel.timer = value
			end,
			order = 0.14
		},
		SPACE_2 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.15
		},
	},
}