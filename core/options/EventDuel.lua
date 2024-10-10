local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.6

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventDuel"] = {
	name = L["options.event.duel"],
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
		active = {
			type = "toggle",
			name = L["options.event.general.active.name"]:format(L["options.event.duel"]),
			desc = L["options.event.general.active.desc"]:format(L["options.event.duel"]),
			get = function()
				return Memento.db.profile.events.duel.active
			end,
			set = function(_, value)
				Memento.db.profile.events.duel.active = value
			end,
			width = "full",
			order = 0.12
		},
		timer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.duel"], 1),
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.duel.active
			end,
			get = function()
				return Memento.db.profile.events.duel.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.duel.timer = value
			end,
			order = 0.13
		},
		SPACE_2 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.14
		},
	},
}
