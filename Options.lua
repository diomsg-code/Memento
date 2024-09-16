local addonName, Memento = ...

local AceConfig = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("Memento")

local mediaPath = "Interface\\AddOns\\" .. addonName .. "\\media\\"

local MEMENTO_NORMAL_FONT_COLOR = "|cffffd200"
local MEMENTO_LINK_FONT_COLOR = "|cff66bbff"

local options = {}
options.retail = {}
options.vanilla = {}
options.cata = {}

local defaults = {}
defaults.retail = {}
defaults.vanilla = {}
defaults.cata = {}

---------------
--- Options ---
---------------
options.retail.general = {
	name =  addonName .. " - " .. L["general"],
	type = "group",
	childGroups = "tab",
    guiInline = true,
	args = {
		info = {
			name = L["general.info"],
			type = "group",
			order = 0,
			args = {
				about = {
					name = L["general.info.about"],
					type = "group",
					inline = true,
					order = 0.2,
					args = {
						build = {
							name = MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.game-version"] .. ":|r" .. " " .. Memento.gameVersion .. " (".. Memento.flavor .. ")",
							type = "description",
							width = 1.5,
							fontSize = "medium",
							order = 0.21
						},
						version = {
							name = MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.addon-version"] .. ":|r" .. " " .. Memento.addonVersion,
							type = "description",
							width = 1.5,
							fontSize = "medium",
							order = 0.22
						},
						space1 = {
							name = " ",
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.23
						},
						author = {
							name =  MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.author"] .. ":|r" .. " " .. Memento.author,
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.24
						},
						separator = {
							name = "",
							type = "header",
							dialogControl = "SFX-Header",
							order = 0.25
						},
						email = {
							name = "E-Mail",
							type = "input",
							arg = MEMENTO_LINK_FONT_COLOR .. "feedback@memento-addon.de|r",
							get = function(Info)
								return Info.arg
							end,
							set = function() end,
							disabled = true,
							dialogControl = "SFX-Info-URL",
							order = 0.26
						 },
						 space2 = {
							name = "",
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.27
						},
						 github = {
							name = "Github",
							type = "input",
							arg = MEMENTO_LINK_FONT_COLOR .. "https://github.com/diomsg-code/Memento|r",
							get = function(Info)
								return Info.arg
							end,
							set = function() end,
							disabled = true,
							dialogControl = "SFX-Info-URL",
							order = 0.28
						 },
						 space3 = {
							name = "",
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.29
						},
					},
				},
			},
		},
		options = {
			name = L["general.options"],
			type = "group",
            order = 1,
            args = {
				general = {
					name = L["general.options.general"],
					type = "group",
					inline = true,
					order = 1.1,
					args = {
						notification = {
							type = "toggle",
							name = L["general.options.general.notification.name"],
							desc = L["general.options.general.notification.desc"],
							get = function()
								return Memento.db.profile.options.notification
							end,
							set = function(_, value)
								Memento.db.profile.options.notification = value
							end,
							width = "full",
							order = 1.11
						},
						statistic = {
							type = "toggle",
							name = L["general.options.general.statistic.name"],
							desc = L["general.options.general.statistic.desc"],
							get = function()
								return Memento.db.profile.options.statistic
							end,
							set = function(_, value)
								Memento.db.profile.options.statistic = value
							end,
							width = "full",
							order = 1.12
						},
					},
				},
				personalAchievement = {
					name = L["general.options.achievement.personal"],
					type = "group",
					inline = true,
					order = 1.2,
					args = {
						active = {
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
							order = 1.21
						},
						timer = {
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
							order = 1.22
						},
						exist = {
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
							order = 1.23
						},
					},
				},
				guildAchievement = {
					name = L["general.options.achievement.guild"],
					type = "group",
					inline = true,
					order = 1.3,
					args = {
						active = {
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
							order = 1.31
						},
						timer = {
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
							order = 1.32
						},
					},
				},
				levelUp = {
					name = L["general.options.levelUp"],
					type = "group",
					inline = true,
					order = 1.4,
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
							order = 1.41
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
							order = 1.42
						},
					},
				},
				death = {
					name = L["general.options.death"],
					type = "group",
					inline = true,
					order = 1.5,
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
							order = 1.51
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
							order = 1.52
						},
					},
				},
				duel = {
					name = L["general.options.duel"],
					type = "group",
					inline = true,
					order = 1.6,
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
							order = 1.61
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
							order = 1.62
						},
					},
				},
    		},
		},
		debug = {
			name = L["general.debug"],
			type = "group",
            order = 2,
            args = {
				generel = {
					name = L["general.debug.general"],
					type = "group",
					inline = true,
					order = 2.1,
					args = {
						active = {
							type = "toggle",
							name = L["general.debug.general.active.name"],
							desc = L["general.debug.general.active.desc"],
							get = function()
								return Memento.db.profile.options.debug
							end,
							set = function(_, value)
								Memento.db.profile.options.debug = value
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

options.vanilla.general = {
	name =  addonName .. " - " .. L["general"],
	type = "group",
	childGroups = "tab",
    guiInline = true,
	args = {
		info = {
			name = L["general.info"],
			type = "group",
			order = 0,
			args = {
				about = {
					name = L["general.info.about"],
					type = "group",
					inline = true,
					order = 0.2,
					args = {
						build = {
							name = MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.game-version"] .. ":|r" .. " " .. Memento.gameVersion .. " (".. Memento.flavor .. ")",
							type = "description",
							width = 1.5,
							fontSize = "medium",
							order = 0.21
						},
						version = {
							name = MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.addon-version"] .. ":|r" .. " " .. Memento.addonVersion,
							type = "description",
							width = 1.5,
							fontSize = "medium",
							order = 0.22
						},
						space1 = {
							name = " ",
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.23
						},
						author = {
							name =  MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.author"] .. ":|r" .. " " .. Memento.author,
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.24
						},
						separator = {
							name = "",
							type = "header",
							dialogControl = "SFX-Header",
							order = 0.25
						},
						email = {
							name = "E-Mail",
							type = "input",
							arg = MEMENTO_LINK_FONT_COLOR .. "feedback@memento-addon.de|r",
							get = function(Info)
								return Info.arg
							end,
							set = function() end,
							disabled = true,
							dialogControl = "SFX-Info-URL",
							order = 0.26
						 },
						 space2 = {
							name = "",
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.27
						},
						 github = {
							name = "Github",
							type = "input",
							arg = MEMENTO_LINK_FONT_COLOR .. "https://github.com/diomsg-code/Memento|r",
							get = function(Info)
								return Info.arg
							end,
							set = function() end,
							disabled = true,
							dialogControl = "SFX-Info-URL",
							order = 0.28
						 },
						 space3 = {
							name = "",
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.29
						},
					},
				},
			},
		},
		options = {
			name = L["general.options"],
			type = "group",
            order = 1,
            args = {
				generel = {
					name = L["general.options.general"],
					type = "group",
					inline = true,
					order = 1.1,
					args = {
						notification = {
							type = "toggle",
							name = L["general.options.general.notification.name"],
							desc = L["general.options.general.notification.desc"],
							get = function()
								return Memento.db.profile.options.notification
							end,
							set = function(_, value)
								Memento.db.profile.options.notification = value
							end,
							width = "full",
							order = 1.11,
						},
						statistic = {
							type = "toggle",
							name = L["general.options.general.statistic.name"],
							desc = L["general.options.general.statistic.desc"],
							get = function()
								return Memento.db.profile.options.statistic
							end,
							set = function(_, value)
								Memento.db.profile.options.statistic = value
							end,
							width = "full",
							order = 1.12
						},
					},
				},
				levelUp = {
					name = L["general.options.levelUp"],
					type = "group",
					inline = true,
					order = 1.2,
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
							order = 1.21,
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
							order = 1.22,
						},
					},
				},
				death = {
					name = L["general.options.death"],
					type = "group",
					inline = true,
					order = 1.3,
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
							order = 1.31,
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
							order = 1.32,
						},
					},
				},
				duel = {
					name = L["general.options.duel"],
					type = "group",
					inline = true,
					order = 1.4,
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
							order = 1.41
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
							order = 1.42
						},
					},
				},
    		},
		},
		debug = {
			name = L["general.debug"],
			type = "group",
            order = 2,
            args = {
				generel = {
					name = L["general.debug.general"],
					type = "group",
					inline = true,
					order = 2.1,
					args = {
						active = {
							type = "toggle",
							name = L["general.debug.general.active.name"],
							desc = L["general.debug.general.active.desc"],
							get = function()
								return Memento.db.profile.options.debug
							end,
							set = function(_, value)
								Memento.db.profile.options.debug = value
							end,
							width = "full",
							order = 2.11
						},
					},
				},
			},
		},
	},
}

options.cata.general = {
	name =  addonName .. " - " .. L["general"],
	type = "group",
	childGroups = "tab",
    guiInline = true,
	args = {
		info = {
			name = L["general.info"],
			type = "group",
			order = 0,
			args = {
				about = {
					name = L["general.info.about"],
					type = "group",
					inline = true,
					order = 0.2,
					args = {
						build = {
							name = MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.game-version"] .. ":|r" .. " " .. Memento.gameVersion .. " (".. Memento.flavor .. ")",
							type = "description",
							width = 1.5,
							fontSize = "medium",
							order = 0.21
						},
						version = {
							name = MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.addon-version"] .. ":|r" .. " " .. Memento.addonVersion,
							type = "description",
							width = 1.5,
							fontSize = "medium",
							order = 0.22
						},
						space1 = {
							name = " ",
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.23
						},
						author = {
							name =  MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.author"] .. ":|r" .. " " .. Memento.author,
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.24
						},
						separator = {
							name = "",
							type = "header",
							dialogControl = "SFX-Header",
							order = 0.25
						},
						email = {
							name = "E-Mail",
							type = "input",
							arg = MEMENTO_LINK_FONT_COLOR .. "feedback@memento-addon.de|r",
							get = function(Info)
								return Info.arg
							end,
							set = function() end,
							disabled = true,
							dialogControl = "SFX-Info-URL",
							order = 0.26
						 },
						 space2 = {
							name = "",
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.27
						},
						 github = {
							name = "Github",
							type = "input",
							arg = MEMENTO_LINK_FONT_COLOR .. "https://github.com/diomsg-code/Memento|r",
							get = function(Info)
								return Info.arg
							end,
							set = function() end,
							disabled = true,
							dialogControl = "SFX-Info-URL",
							order = 0.28
						 },
						 space3 = {
							name = "",
							type = "description",
							width = "full",
							fontSize = "medium",
							order = 0.29
						},
					},
				},
			},
		},
		options = {
			name = L["general.options"],
			type = "group",
            order = 1,
            args = {
				general = {
					name = L["general.options.general"],
					type = "group",
					inline = true,
					order = 1.1,
					args = {
						notification = {
							type = "toggle",
							name = L["general.options.general.notification.name"],
							desc = L["general.options.general.notification.desc"],
							get = function()
								return Memento.db.profile.options.notification
							end,
							set = function(_, value)
								Memento.db.profile.options.notification = value
							end,
							width = "full",
							order = 1.11,
						},
						statistic = {
							type = "toggle",
							name = L["general.options.general.statistic.name"],
							desc = L["general.options.general.statistic.desc"],
							get = function()
								return Memento.db.profile.options.statistic
							end,
							set = function(_, value)
								Memento.db.profile.options.statistic = value
							end,
							width = "full",
							order = 1.12
						},
					},
				},
				levelUp = {
					name = L["general.options.levelUp"],
					type = "group",
					inline = true,
					order = 1.2,
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
							order = 1.2,
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
							order = 1.22,
						},
					},
				},
				death = {
					name = L["general.options.death"],
					type = "group",
					inline = true,
					order = 1.3,
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
							order = 1.31,
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
							order = 1.32,
						},
					},
				},
				duel = {
					name = L["general.options.duel"],
					type = "group",
					inline = true,
					order = 1.4,
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
							order = 1.41
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
							order = 1.42
						},
					},
				},
    		},
		},
		debug = {
			name = L["general.debug"],
			type = "group",
            order = 2,
            args = {
				generel = {
					name = L["general.debug.general"],
					type = "group",
					inline = true,
					order = 2.1,
					args = {
						active = {
							type = "toggle",
							name = L["general.debug.general.active.name"],
							desc = L["general.debug.general.active.desc"],
							get = function()
								return Memento.db.profile.options.debug
							end,
							set = function(_, value)
								Memento.db.profile.options.debug = value
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

----------------
--- Defaults ---
----------------
defaults.retail.options = {
    profile = {
        options = {
            notification = true,
			statistic = false,
			debug = false
		},
		events = {
            achievement = {
                personal = {
                    active = true,
                    exist = false,
                    timer = 2
                },
                guild = {
                    active = true,
                    timer = 2
                },
            },
            levelUp = {
                active = true,
                timer = 5
            },
            death = {
                active = true,
                timer = 1
            },
			duel = {
                active = true,
                timer = 1
            }
		}
    }
}

defaults.retail.statistic = {
	char = {
		events = {
            achievement = {
                personal = {
                    count = 0
                },
                guild = {
                    count = 0
                },
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            }
		}
	},
    global = {
		events = {
            achievement = {
                personal = {
                    count = 0
                },
                guild = {
                    count = 0
                },
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            }
		}
    }
}

defaults.vanilla.options = {
    profile = {
        options = {
            notification = true,
			statistic = false,
			debug = false
		},
		events = {
            levelUp = {
                active = true,
                timer = 5
            },
            death = {
                active = true,
                timer = 1
            },
			duel = {
                active = true,
                timer = 1
            }
		}
    }
}

defaults.vanilla.statistic = {
	char = {
		events = {
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            }
		}
	},
    global = {
		events = {
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            }
		}
    }
}

defaults.cata.options = {
    profile = {
        options = {
            notification = true,
			statistic = false,
			debug = false
		},
		events = {
            levelUp = {
                active = true,
                timer = 5
            },
            death = {
                active = true,
                timer = 1
            },
			duel = {
                active = true,
                timer = 1
            }
		}
    }
}

defaults.cata.statistic = {
	char = {
		events = {
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            }
		}
	},
    global = {
		events = {
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            }
		}
    }
}

-------------------------
--- Memento functions ---
-------------------------
function Memento:SetupOptions()
	if self.flavor == "Vanilla" then
		AceConfig:RegisterOptionsTable(addonName, options.vanilla.general)
		self.db = LibStub("AceDB-3.0"):New("Memento_Options", defaults.vanilla.options, true)
		self.dbStatstic = LibStub("AceDB-3.0"):New("Memento_Statistic", defaults.vanilla.statistic, true)
        self:PrintDebug("Vanilla default options and database have been loaded.")
	elseif Memento.flavor == "Cata" then
		AceConfig:RegisterOptionsTable(addonName, options.cata.general)
		self.db = LibStub("AceDB-3.0"):New("Memento_Options", defaults.cata.options, true)
		self.dbStatstic = LibStub("AceDB-3.0"):New("Memento_Statistic", defaults.cata.statistic, true)
        self:PrintDebug("Cata default options and database have been loaded.")
	else
		AceConfig:RegisterOptionsTable(addonName, options.retail.general)
		self.db = LibStub("AceDB-3.0"):New("Memento_Options", defaults.retail.options, true)
		self.dbStatstic = LibStub("AceDB-3.0"):New("Memento_Statistic", defaults.retail.statistic, true)
        self:PrintDebug("Retail default options and database have been loaded.")
	end

	options.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	options.profiles.name = addonName .. " - " .. L["profiles"]
	options.profiles.confirm = true

    AceConfig:RegisterOptionsTable("Profiles", options.profiles)

	AceConfigDialog:AddToBlizOptions(addonName, addonName)
    AceConfigDialog:AddToBlizOptions("Profiles", L["profiles"], addonName)
end