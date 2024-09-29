local addonName, Memento = ...

local AceConfig = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("Memento")

local mediaPath = "Interface\\AddOns\\" .. addonName .. "\\media\\"

local MEMENTO_NORMAL_FONT_COLOR = "|cffffd200"
local MEMENTO_LINK_FONT_COLOR = "|cff66bbff"

local settings = {}
local event = {}

local defaults = {}
defaults.retail = {}
defaults.vanilla = {}
defaults.cata = {}

---------------
--- Options ---
---------------
settings.info = {
	name =  addonName,
	type = "group",
	args = {
		about = {
			name = L["general.info.about"],
			type = "group",
			inline = true,
			order = 2,
			args = {
				build = {
					name = MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.game-version"] .. ":|r" .. " " .. Memento.gameVersion .. " (".. Memento.flavor .. ")",
					type = "description",
					width = 1.5,
					fontSize = "medium",
					order = 0.21
				},
				version = {
					name = MEMENTO_NORMAL_FONT_COLOR .. L["general.info.about.addon-version"] .. ":|r" .. " " .. Memento.addonVersion .. " (".. Memento.buildDate .. ")",
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
}

settings.options = {
	name =  addonName .. " - " .. L["general"],
	type = "group",
	childGroups = "tab",
	args = {
		general = {
			name = L["general.options.general"],
			type = "group",
			inline = true,
			order = 0,
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
					order = 0.10
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
					order = 0.11
				},
				ui = {
					type = "toggle",
					name = L["general.options.general.ui.name"],
					desc = L["general.options.general.ui.desc"],
					get = function()
						return Memento.db.profile.options.ui
					end,
					set = function(_, value)
						Memento.db.profile.options.ui = value
					end,
					width = "full",
					order = 0.12
				},
				separator = {
					name = "",
					type = "header",
					dialogControl = "SFX-Header",
					order = 0.13
				},
				debug = {
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
					order = 0.14
				},
			},
		},
	},
}

event.achievement = {
	name = L["general.options.achievement"],
	type = "group",
	order = 1,
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
			order = 0.10
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
			order = 0.11
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
			order = 0.12
		},
		separator = {
			name = "",
			type = "header",
			dialogControl = "SFX-Header",
			order = 0.13
		},
		active2 = {
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
			order = 0.14
		},
		timer2 = {
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
			order = 0.15
		},
	},
}

event.encounter = {
	name = L["general.options.encounter"],
	type = "group",
	order = 2,
	args = {
		victoryDesc = {
			name = L["general.options.encounter.victory.desc"],
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.10
		},
		victoryParty = {
			type = "toggle",
			name = L["general.options.encounter.victory.party.name"],
			desc = L["general.options.encounter.victory.party.desc"],
			get = function()
				return Memento.db.profile.events.encounter.victory.party
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.party = value
			end,
			width = "normal",
			order = 0.11
		},
		victoryRaid = {
			type = "toggle",
			name = L["general.options.encounter.victory.raid.name"],
			desc = L["general.options.encounter.victory.raid.desc"],
			get = function()
				return Memento.db.profile.events.encounter.victory.raid
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.raid = value
			end,
			width = "normal",
			order = 0.12
		},
		victoryScenario = {
			type = "toggle",
			name = L["general.options.encounter.victory.scenario.name"],
			desc = L["general.options.encounter.victory.scenario.desc"],
			disabled = function()
				return (not (Memento.flavor == "Retail"))
			end,
			get = function()
				return Memento.db.profile.events.encounter.victory.scenario
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.scenario = value
			end,
			width = "normal",
			order = 0.13
		},
		victoryFirst = {
			type = "toggle",
			name = L["general.options.encounter.victory.first.name"],
			desc = L["general.options.encounter.victory.first.desc"],
			disabled = function()
				return ((not Memento.db.profile.events.encounter.victory.party) and (not Memento.db.profile.events.encounter.victory.raid) and (not Memento.db.profile.events.encounter.victory.scenario))
			end,
			get = function()
				return Memento.db.profile.events.encounter.victory.first
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.first = value
			end,
			width = "double",
			order = 0.14
		},
		victoryTimer = {
			name = L["general.options.encounter.victory.timer.name"],
			desc = L["general.options.encounter.victory.timer.desc"],
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return ((not Memento.db.profile.events.encounter.victory.party) and (not Memento.db.profile.events.encounter.victory.raid) and (not Memento.db.profile.events.encounter.victory.scenario))
			end,
			get = function()
				return Memento.db.profile.events.encounter.victory.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.victory.timer = value
			end,
			order = 0.15
		},
		separator = {
			name = "",
			type = "header",
			dialogControl = "SFX-Header",
			order = 0.16
		},
		wipeDesc = {
			name = L["general.options.encounter.wipe.desc"],
			type = "description",
			width = "full",
			fontSize = "medium",
			order = 0.17
		},
		wipeParty = {
			type = "toggle",
			name = L["general.options.encounter.wipe.party.name"],
			desc = L["general.options.encounter.wipe.party.desc"],
			get = function()
				return Memento.db.profile.events.encounter.wipe.party
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.party = value
			end,
			width = "normal",
			order = 0.18
		},
		wipeRaid = {
			type = "toggle",
			name = L["general.options.encounter.wipe.raid.name"],
			desc = L["general.options.encounter.wipe.raid.desc"],
			get = function()
				return Memento.db.profile.events.encounter.wipe.raid
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.raid = value
			end,
			width = "normal",
			order = 0.19
		},
		wipeScenario = {
			type = "toggle",
			name = L["general.options.encounter.wipe.scenario.name"],
			desc = L["general.options.encounter.wipe.scenario.desc"],
			disabled = function()
				return (not (Memento.flavor == "Retail"))
			end,
			get = function()
				return Memento.db.profile.events.encounter.wipe.scenario
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.scenario = value
			end,
			width = "normal",
			order = 0.20
		},
		space = {
			name = "",
			type = "description",
			width = "double",
			fontSize = "medium",
			order = 0.21
		},
		wipeTimer = {
			name = L["general.options.encounter.wipe.timer.name"],
			desc = L["general.options.encounter.wipe.timer.desc"],
			type = "range",
			min = 0,
			max = 10,
			step = 1,
			disabled = function()
				return ((not Memento.db.profile.events.encounter.wipe.party) and (not Memento.db.profile.events.encounter.wipe.raid) and (not Memento.db.profile.events.encounter.wipe.scenario))
			end,
			get = function()
				return Memento.db.profile.events.encounter.wipe.timer
			end,
			set = function(_, value)
				Memento.db.profile.events.encounter.wipe.timer = value
			end,
			order = 0.22
		},
	},
}

event.levelUp = {
	name = L["general.options.levelUp"],
	type = "group",
	order = 3,
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
			order = 0.1
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
			order = 0.2
		},
	},
}

event.death = {
	name = L["general.options.death"],
	type = "group",
	order = 4,
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
			order = 0.0
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
			order = 0.2
		},
	},
}

event.duel = {
	name = L["general.options.duel"],
	type = "group",
	order = 5,
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
			order = 0.1
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
			order = 0.2
		},
	},
}

event.login = {
	name = L["general.options.login"],
	type = "group",
	order = 6,
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
			order = 0.12
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
			order = 0.13
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
			ui = false,
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
			encounter = {
                victory = {
					party = true,
					raid = true,
					scenario = true,
					first = true,
					timer = 2
                },
                wipe = {
					party = true,
					raid = true,
					scenario = true,
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
			},
			login = {
                active = false,
                timer = 5
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
			encounter = {
				count = 0
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            },
			login = {
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
			encounter = {
				count = 0
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            },
			login = {
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
			ui = false,
			debug = false
		},
		events = {
			encounter = {
				victory = {
					party = true,
					raid = true,
					scenario = false,
					first = true,
					timer = 2
				},
				wipe = {
					party = true,
					raid = true,
					scenario = false,
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
            },
			login = {
                active = false,
                timer = 5
			}
		}
    }
}

defaults.vanilla.statistic = {
	char = {
		events = {
			encounter = {
				count = 0
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            },
			login = {
				count = 0
            }
		}
	},
    global = {
		events = {
			encounter = {
				count = 0
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            },
			login = {
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
			ui = false,
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
			encounter = {
				victory = {
					party = true,
					raid = true,
					scenario = false,
					first = true,
					timer = 2
				},
				wipe = {
					party = true,
					raid = true,
					scenario = false,
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
            },
			login = {
                active = false,
                timer = 5
			}
		}
    }
}

defaults.cata.statistic = {
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
			encounter = {
				count = 0
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            },
			login = {
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
			encounter = {
				count = 0
            },
            levelUp = {
				count = 0
            },
            death = {
				count = 0
            },
			duel = {
				count = 0
            },
			login = {
				count = 0
            }
		}
    }
}

-------------------------
--- Memento functions ---
-------------------------
function Memento:SetupOptions()
	if self.flavor == "Retail" then
		settings.options.args.achievement = event.achievement
		self.db = LibStub("AceDB-3.0"):New("Memento_Options", defaults.retail.options, true)
		self.dbStatstic = LibStub("AceDB-3.0"):New("Memento_Statistic", defaults.retail.statistic, true)
        self:PrintDebug("Retail default options and database have been loaded." )
	elseif self.flavor == "Vanilla" then
		self.db = LibStub("AceDB-3.0"):New("Memento_Options", defaults.vanilla.options, true)
		self.dbStatstic = LibStub("AceDB-3.0"):New("Memento_Statistic", defaults.vanilla.statistic, true)
        self:PrintDebug("Vanilla default options and database have been loaded.")
	elseif Memento.flavor == "Cata" then
		settings.options.args.achievement = event.achievement
		self.db = LibStub("AceDB-3.0"):New("Memento_Options", defaults.cata.options, true)
		self.dbStatstic = LibStub("AceDB-3.0"):New("Memento_Statistic", defaults.cata.statistic, true)
        self:PrintDebug("Cata default options and database have been loaded.")
	else
		self:PrintDebug("No default options and database have been loaded.")
	end

	settings.options.args.encounter = event.encounter
	settings.options.args.levelUp = event.levelUp
	settings.options.args.death = event.death
	settings.options.args.duel = event.duel
	settings.options.args.login = event.login

	settings.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	settings.profiles.name = addonName .. " - " .. L["profiles"]
	settings.profiles.confirm = true

	AceConfig:RegisterOptionsTable(addonName, settings.info)
	AceConfig:RegisterOptionsTable("Options", settings.options)
    AceConfig:RegisterOptionsTable("Profiles", settings.profiles)

	AceConfigDialog:AddToBlizOptions(addonName, addonName)
	AceConfigDialog:AddToBlizOptions("Options", L["general.options"], addonName)
    AceConfigDialog:AddToBlizOptions("Profiles", L["profiles"], addonName)
end