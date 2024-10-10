local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.2

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventAchievement"] = {
	name = L["options.event.achievement"],
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
			name = " " .. L["options.event.achievement.personal"],
			type = "header",
			dialogControl = "SFX-Header-II",
			order = 0.12
		},
		personalActive = {
			type = "toggle",
			name = L["options.event.general.active.name"]:format(L["options.event.achievement.personal"]),
			desc = L["options.event.general.active.desc"]:format(L["options.event.achievement.personal"]),
			get = function()
				return Memento.db.profile.events.achievement.personal.active
			end,
			set = function(_, value)
				Memento.db.profile.events.achievement.personal.active = value
			end,
			width = "full",
			order = 0.13
		},
		personalExist = {
			type = "toggle",
			name = L["options.event.achievement.personal.exist.name"],
			desc = L["options.event.achievement.personal.exist.desc"],
			disabled = function()
				return not Memento.db.profile.events.achievement.personal.active
			end,
			get = function()
				return Memento.db.profile.events.achievement.personal.exist
			end,
			set = function(_, value)
				Memento.db.profile.events.achievement.personal.exist = value
			end,
			width = "full",
			order = 0.14
		},
		personalTimer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.achievement.personal"], 2),
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.achievement.personal.active
			end,
			get = function()
				return Memento.db.profile.events.achievement.personal.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.achievement.personal.timer = value
			end,
			order = 0.15
		},
		SPACE_2 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.16
		},
		SEPARATOR_2 = {
			name = " " .. L["options.event.achievement.guild"],
			type = "header",
			dialogControl = "SFX-Header-II",
			order = 0.17
		},
		guildActive = {
			type = "toggle",
			name = L["options.event.general.active.name"]:format(L["options.event.achievement.guild"]),
			desc = L["options.event.general.active.desc"]:format(L["options.event.achievement.guild"]),
			get = function()
				return Memento.db.profile.events.achievement.guild.active
			end,
			set = function(_, value)
				Memento.db.profile.events.achievement.guild.active = value
			end,
			width = "full",
			order = 0.22
		},
		guildTimer = {
			name = L["options.event.general.delay.name"],
			desc = L["options.event.general.delay.desc"]:format(L["options.event.achievement.guild"], 2),
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return not Memento.db.profile.events.achievement.guild.active
			end,
			get = function()
				return Memento.db.profile.events.achievement.guild.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.achievement.guild.timer = value
			end,
			order = 0.23
		},
		SPACE_4 = {
			name = " ",
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.24
		},
	},
}
