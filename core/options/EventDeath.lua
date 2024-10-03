local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.5

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventDeath"] = {
	name = L["general.options.death"],
	type = "group",
	order = orderID,
	args = {
		active = {
			type = "toggle",
			name = L["general.options.death.active.name"],
			desc = L["general.options.death.active.desc"],
			get = function()
				return Memento.db.profile.events.death.active
			end,
			set = function(_, value)
				Memento.db.profile.events.death.active = value
			end,
			width = "double",
			order = 0.11
		},
		timer = {
			name = L["general.options.death.timer.name"],
			desc = L["general.options.death.timer.desc"],
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.death.active
			end,
			get = function()
				return Memento.db.profile.events.death.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.death.timer = value
			end,
			order = 0.12
		},
	},
}
