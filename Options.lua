local addonName, Memento = ...

local AceConfig = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("Memento")

local mediaPath = "Interface\\AddOns\\" .. addonName .. "\\media\\"

--Local functions
local function markNormalFont(text)
	return WrapTextInColorCode(text, "FFFFD200")
end

-- Options
local options = {
	name = "|T" .. mediaPath .. "icon:22:22:-1:9|t" .. addonName,
	type = "group",
	childGroups = "tab",
    guiInline = true,
	args = {
		info = {
			name = L["options.info"],
			type = "group",
			order = 0,
			args = {
				general = {
					name = L["options.info.generel"],
					type = "group",
					inline = true,
					order = 0.1,
					args = {
						version = {
							name = markNormalFont(L["options.info.generel.addon-version"] .. ":") .. " " .. Memento.addonVersion,
							type = "description",
							width = "normal",
							fontSize = "medium",
							order = 0.11,
						},
						build = {
							name = markNormalFont(L["options.info.generel.game-version"] .. ":") .. " " .. Memento.gameVersion,
							type = "description",
							width = "normal",
							fontSize = "medium",
							order = 0.12,
						},
						space = {
							name = " ",
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.21,
						},
						author = {
							name = markNormalFont(L["options.info.generel.author"] .. ":") .. " " .. Memento.author,
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.31,
						},
					},
				},
			},
		},
		setting = {
			name = L["options.setting"],
			type = "group",
            order = 1,
            args = {
				generel = {
					name = L["options.setting.generel"],
					type = "group",
					inline = true,
					order = 1.1,
					args = {
						notification = {
							type = "toggle",
							name = L["options.setting.generel.notification.name"],
							desc = L["options.setting.generel.notification.desc"],
							get = function()
								return Memento.db.profile.setting.notification
							end,
							set = function(_, value)
								Memento.db.profile.setting.notification = value
							end,
							width = "full",
							order = 1.11,
						},
					},
				},
				personalAchievement = {
					name = L["options.setting.achievement.personal"],
					type = "group",
					inline = true,
					order = 1.2,
					args = {
						active = {
							type = "toggle",
							name = L["options.setting.achievement.personal.active.name"],
							desc = L["options.setting.achievement.personal.active.desc"],
							get = function()
								return Memento.db.profile.event.achievement.personal.active
							end,
							set = function(_, value)
								Memento.db.profile.event.achievement.personal.active = value
							end,
							width = "full",
							order = 1.21,
						},
						exist = {
							type = "toggle",
							name = L["options.setting.achievement.personal.exist.name"],
							desc = L["options.setting.achievement.personal.exist.desc"],
							disabled = function()
								return not Memento.db.profile.event.achievement.personal.active
							end,
							get = function()
								return Memento.db.profile.event.achievement.personal.exist
							end,
							set = function(_, value)
								Memento.db.profile.event.achievement.personal.exist = value
							end,
							width = "full",
							order = 1.22,
						},
						timer = {
							name = L["options.setting.achievement.personal.timer.name"],
							desc = L["options.setting.achievement.personal.timer.desc"],
							type = "range",
							min = 0,
							max = 10,
							step = 1,
							disabled = function()
								return not Memento.db.profile.event.achievement.personal.active
							end,
							get = function()
								return Memento.db.profile.event.achievement.personal.timer
							end,
							set = function(_, value)
								Memento.db.profile.event.achievement.personal.timer = value
							end,
							order = 1.23,
						},
					},
				},
				guildAchievement = {
					name = L["options.setting.achievement.guild"],
					type = "group",
					inline = true,
					order = 1.3,
					args = {
						active = {
							type = "toggle",
							name = L["options.setting.achievement.guild.active.name"],
							desc = L["options.setting.achievement.guild.active.desc"],
							get = function()
								return Memento.db.profile.event.achievement.guild.active
							end,
							set = function(_, value)
								Memento.db.profile.event.achievement.guild.active = value
							end,
							width = "full",
							order = 1.31,
						},
						timer = {
							name = L["options.setting.achievement.guild.timer.name"],
							desc = L["options.setting.achievement.guild.timer.desc"],
							type = "range",
							min = 0,
							max = 10,
							step = 1,
							disabled = function()
								return not Memento.db.profile.event.achievement.guild.active
							end,
							get = function()
								return Memento.db.profile.event.achievement.guild.timer
							end,
							set = function(_, value)
								Memento.db.profile.event.achievement.guild.timer = value
							end,
							order = 1.32,
						},
					},
				},
				levelUp = {
					name = L["options.setting.levelUp"],
					type = "group",
					inline = true,
					order = 1.4,
					args = {
						active = {
							type = "toggle",
							name = L["options.setting.levelUp.active.name"],
							desc = L["options.setting.levelUp.active.desc"],
							get = function()
								return Memento.db.profile.event.levelUp.active
							end,
							set = function(_, value)
								Memento.db.profile.event.levelUp.active = value
							end,
							width = "full",
							order = 1.41,
						},
						timer = {
							name = L["options.setting.levelUp.timer.name"],
							desc = L["options.setting.levelUp.timer.desc"],
							type = "range",
							min = 0,
							max = 10,
							step = 1,
							disabled = function()
								return not Memento.db.profile.event.levelUp.active
							end,
							get = function()
								return Memento.db.profile.event.levelUp.timer
							end,
							set = function(_, value)
								Memento.db.profile.event.levelUp.timer = value
							end,
							order = 1.42,
						},
					},
				},
				death = {
					name = L["options.setting.death"],
					type = "group",
					inline = true,
					order = 1.5,
					args = {
						active = {
							type = "toggle",
							name = L["options.setting.death.active.name"],
							desc = L["options.setting.death.active.desc"],
							get = function()
								return Memento.db.profile.event.death.active
							end,
							set = function(_, value)
								Memento.db.profile.event.death.active = value
							end,
							width = "full",
							order = 1.51,
						},
						timer = {
							name = L["options.setting.death.timer.name"],
							desc = L["options.setting.death.timer.desc"],
							type = "range",
							min = 0,
							max = 10,
							step = 1,
							disabled = function()
								return not Memento.db.profile.event.death.active
							end,
							get = function()
								return Memento.db.profile.event.death.timer
							end,
							set = function(_, value)
								Memento.db.profile.event.death.timer = value
							end,
							order = 1.52,
						},
					},
				},
    		},
		},
		debug = {
			name = L["options.debug"],
			type = "group",
            order = 2,
            args = {
				generel = {
					name = L["options.debug.generel"],
					type = "group",
					inline = true,
					order = 2.1,
					args = {
						active = {
							type = "toggle",
							name = L["options.debug.generel.active.name"],
							desc = L["options.debug.generel.active.desc"],
							get = function()
								return Memento.db.profile.setting.debug
							end,
							set = function(_, value)
								Memento.db.profile.setting.debug = value
							end,
							width = "full",
							order = 2.11,
						},
					},
				},
			},
		},
	},
}

AceConfig:RegisterOptionsTable(addonName, options)
AceConfigDialog:AddToBlizOptions(addonName, addonName)