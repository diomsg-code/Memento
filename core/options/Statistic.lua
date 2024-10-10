local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["statistic"] = {
	name =  function()
		if Memento.flavor == "Retail" then
			return "|T" .. Memento.MEDIA_PATH .. "icon_options.blp:0:0:0:1|t  " .. addonName .. " - " .. L["statistic"]
		else
			return "|T" .. Memento.MEDIA_PATH .. "icon_options.blp:0:0:0:2|t  " .. addonName .. " - " .. L["statistic"]
		end
	end,
	type = "group",
	args = {
		screenshots = {
			name = L["statistic.screenshots"],
			type = "group",
			inline = true,
			order = 1.1,
			args = {
				description = {
					name = L["statistic.screenshots.description"],
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.11
				},
				SEPARATOR_1 = {
					name = "",
					type = "header",
					dialogControl = "SFX-Header",
					order = 0.12
				},
				personalAchievementName = {
					name = MementoMarkGoldFont(L["statistic.screenshots.achievement.personal"]),
					type = "description",
					hidden = function ()
						return (Memento.flavor == "Vanilla")
					end,
					width = 1.2,
					fontSize = "medium",
					order = 0.13
				},
				personalAchievementCount = {
					name = function ()
						if not (Memento.flavor == "Vanilla") then
							return Memento.dbStatstic.global.events.achievement.personal.count .. " (" .. Memento.dbStatstic.char.events.achievement.personal.count .. ")"
						end
					end,
					type = "description",
					hidden = function ()
						return (Memento.flavor == "Vanilla")
					end,
					width = 1,
					fontSize = "medium",
					order = 0.14
				},
				SPACE_1 = {
					name = "",
					type = "description",
					hidden = function ()
						return (Memento.flavor == "Vanilla")
					end,
					width = "full",
					fontSize = "medium",
					order = 0.15
				},
				criteriaAchievementName = {
					name = MementoMarkGoldFont(L["statistic.screenshots.achievement.criteria"]),
					type = "description",
					hidden = function ()
						return (Memento.flavor == "Vanilla" or Memento.flavor == "Cata")
					end,
					width = 1.2,
					fontSize = "medium",
					order = 0.16
				},
				criteriaAchievementCount = {
					name = function ()
						if not (Memento.flavor == "Vanilla" or Memento.flavor == "Cata") then
							return Memento.dbStatstic.global.events.achievement.criteria.count .. " (" .. Memento.dbStatstic.char.events.achievement.criteria.count .. ")"
						end
					end,
					type = "description",
					hidden = function ()
						return (Memento.flavor == "Vanilla" or Memento.flavor == "Cata")
					end,
					width = 1,
					fontSize = "medium",
					order = 0.17
				},
				SPACE_2 = {
					name = "",
					type = "description",
					hidden = function ()
						return (Memento.flavor == "Vanilla" or Memento.flavor == "Cata")
					end,
					width = "full",
					fontSize = "medium",
					order = 0.18
				},
				guildAchievementName = {
					name = MementoMarkGoldFont(L["statistic.screenshots.achievement.guild"]),
					type = "description",
					hidden = function ()
						return (Memento.flavor == "Vanilla")
					end,
					width = 1.2,
					fontSize = "medium",
					order = 0.19
				},
				guildAchievementCount = {
					name = function ()
						if not (Memento.flavor == "Vanilla") then
							return Memento.dbStatstic.global.events.achievement.guild.count .. " (" .. Memento.dbStatstic.char.events.achievement.guild.count .. ")"
						end
					end,
					type = "description",
					hidden = function ()
						return (Memento.flavor == "Vanilla")
					end,
					width = 1,
					fontSize = "medium",
					order = 0.20
				},
				SPACE_3 = {
					name = "",
					type = "description",
					hidden = function ()
						return (Memento.flavor == "Vanilla")
					end,
					width = "full",
					fontSize = "medium",
					order = 0.21
				},
				encounterVictoryName = {
					name = MementoMarkGoldFont(L["statistic.screenshots.encounter.victory"]),
					type = "description",
					width = 1.2,
					fontSize = "medium",
					order = 0.22
				},
				encounterVictoryCount = {
					name = function ()
						return Memento.dbStatstic.global.events.encounter.victory.count .. " (" .. Memento.dbStatstic.char.events.encounter.victory.count .. ")"
					end,
					type = "description",
					width = 1,
					fontSize = "medium",
					order = 0.23
				},
				SPACE_4 = {
					name = "",
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.24
				},
				encounterWipeName = {
					name = MementoMarkGoldFont(L["statistic.screenshots.encounter.wipe"]),
					type = "description",
					width = 1.2,
					fontSize = "medium",
					order = 0.25
				},
				encounterWipeCount = {
					name = function ()
						return Memento.dbStatstic.global.events.encounter.wipe.count .. " (" .. Memento.dbStatstic.char.events.encounter.wipe.count .. ")"
					end,
					type = "description",
					width = 1,
					fontSize = "medium",
					order = 0.26
				},
				SPACE_5 = {
					name = "",
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.27
				},
				levelUpName = {
					name = MementoMarkGoldFont(L["statistic.screenshots.levelUp"]),
					type = "description",
					width = 1.2,
					fontSize = "medium",
					order = 0.28
				},
				levelUpCount = {
					name = function ()
						return Memento.dbStatstic.global.events.levelUp.count .. " (" .. Memento.dbStatstic.char.events.levelUp.count .. ")"
					end,
					type = "description",
					width = 1,
					fontSize = "medium",
					order = 0.29
				},
				SPACE_6 = {
					name = "",
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.30
				},
				deathName = {
					name = MementoMarkGoldFont(L["statistic.screenshots.death"]),
					type = "description",
					width = 1.2,
					fontSize = "medium",
					order = 0.31
				},
				deathCount = {
					name = function ()
						return Memento.dbStatstic.global.events.death.count .. " (" .. Memento.dbStatstic.char.events.death.count .. ")"
					end,
					type = "description",
					width = 1,
					fontSize = "medium",
					order = 0.32
				},
				SPACE_7 = {
					name = "",
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.33
				},
				duelName = {
					name = MementoMarkGoldFont(L["statistic.screenshots.duel"]),
					type = "description",
					width = 1.2,
					fontSize = "medium",
					order = 0.34
				},
				duelCount = {
					name = function ()
						return Memento.dbStatstic.global.events.duel.count .. " (" .. Memento.dbStatstic.char.events.duel.count .. ")"
					end,
					type = "description",
					width = 1,
					fontSize = "medium",
					order = 0.35
				},
				SPACE_8 = {
					name = "",
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.36
				},
				loginName = {
					name = MementoMarkGoldFont(L["statistic.screenshots.login"]),
					type = "description",
					width = 1.2,
					fontSize = "medium",
					order = 0.37
				},
				loginCount = {
					name = function ()
						return Memento.dbStatstic.global.events.login.count .. " (" .. Memento.dbStatstic.char.events.login.count .. ")"
					end,
					type = "description",
					width = 2,
					fontSize = "medium",
					order = 0.38
				},
				SPACE_9 = {
					name = "",
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.39
				},
			},
		},
	},
}
