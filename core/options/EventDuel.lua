local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.6

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventDuel"] = {
	name = L["general.options.duel"],
	type = "group",
	order = orderID,
	args = {
		active = {
			type = "toggle",
			name = L["general.options.duel.active.name"],
			desc = L["general.options.duel.active.desc"],
			get = function()
				return Memento.db.profile.events.duel.active
			end,
			set = function(_, value)
				Memento.db.profile.events.duel.active = value
			end,
			width = "double",
			order = 0.11
		},
		timer = {
			name = L["general.options.duel.timer.name"],
			desc = L["general.options.duel.timer.desc"],
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
			order = 0.12
		},
	},
}
