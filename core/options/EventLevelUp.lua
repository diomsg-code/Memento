local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.4

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventLevelUp"] = {
	name = L["general.options.levelUp"],
	type = "group",
	order = orderID,
	args = {
		active = {
			type = "toggle",
			name = L["general.options.levelUp.active.name"],
			desc = L["general.options.levelUp.active.desc"],
			get = function()
				return Memento.db.profile.events.levelUp.active
			end,
			set = function(_, value)
				Memento.db.profile.events.levelUp.active = value
			end,
			width = "double",
			order = 0.11
		},
		timer = {
			name = L["general.options.levelUp.timer.name"],
			desc = L["general.options.levelUp.timer.desc"],
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.levelUp.active
			end,
			get = function()
				return Memento.db.profile.events.levelUp.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.levelUp.timer = value
			end,
			order = 0.12
		},
	},
}
