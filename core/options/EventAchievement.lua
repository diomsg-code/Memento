local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.2

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["eventAchievement"] = {
	name = L["general.options.achievement"],
	type = "group",
	order = orderID,
	args = {
		personalActive = {
			type = "toggle",
			name = L["general.options.achievement.personal.active.name"],
			desc = L["general.options.achievement.personal.active.desc"],
			get = function()
				return Memento.db.profile.events.achievement.personal.active
			end,
			set = function(_, value)
				Memento.db.profile.events.achievement.personal.active = value
			end,
			width = "double",
			order = 0.11
		},
		personalTimer = {
			name = L["general.options.achievement.personal.timer.name"],
			desc = L["general.options.achievement.personal.timer.desc"],
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
			order = 0.12
		},
		personalExist = {
			type = "toggle",
			name = L["general.options.achievement.personal.exist.name"],
			desc = L["general.options.achievement.personal.exist.desc"],
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
			order = 0.13
		},
		SEPARATOR_01 = {
			name = "",
			type = "header",
			dialogControl = "SFX-Header",
			order = 0.14
		},
		guildActive = {
			type = "toggle",
			name = L["general.options.achievement.guild.active.name"],
			desc = L["general.options.achievement.guild.active.desc"],
			get = function()
				return Memento.db.profile.events.achievement.guild.active
			end,
			set = function(_, value)
				Memento.db.profile.events.achievement.guild.active = value
			end,
			width = "double",
			order = 0.15
		},
		guildTimer = {
			name = L["general.options.achievement.guild.timer.name"],
			desc = L["general.options.achievement.guild.timer.desc"],
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
			order = 0.16
		},
	},
}
