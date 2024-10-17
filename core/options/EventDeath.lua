local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.6

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventDeath"] = {
	name = L["options.event.death"],
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
			name = L["options.event.general.active.name"]:format(L["options.event.death"]),
			desc = L["options.event.general.active.desc"]:format(L["options.event.death"]),
			get = function()
				return Memento.db.profile.events.death.active
			end,
			set = function(_, value)
				Memento.db.profile.events.death.active = value
			end,
			width = "full",
			order = 0.12
		},
		timer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.death"], 1),
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
