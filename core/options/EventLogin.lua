local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.7

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventLogin"] = {
	name = L["general.options.login"],
	type = "group",
	order = orderID,
	args = {
		active = {
			type = "toggle",
			name = L["general.options.login.active.name"],
			desc = L["general.options.login.active.desc"],
			get = function()
				return Memento.db.profile.events.login.active
			end,
			set = function(_, value)
				Memento.db.profile.events.login.active = value
			end,
			width = "double",
			order = 0.11
		},
		timer = {
			name = L["general.options.login.timer.name"],
			desc = L["general.options.login.timer.desc"],
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.login.active
			end,
			get = function()
				return Memento.db.profile.events.login.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.login.timer = value
			end,
			order = 0.12
		},
	},
}
