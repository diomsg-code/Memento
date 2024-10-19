local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["info"] = {
	name =  function()
		if Memento.FLAVOR_IS_MAINLINE then
			return "|T" .. Memento.MEDIA_PATH .. "icon_options.blp:0:0:0:1|t  " .. addonName
		else
			return "|T" .. Memento.MEDIA_PATH .. "icon_options.blp:0:0:0:2|t  " .. addonName
		end
	end,
	type = "group",
	args = {
		description = {
			name = L["info.description"],
			type = "group",
			inline = true,
			order = 1.1,
			args = {
				content_1 = {
					name = L["info.description.content_1"],
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.11
				},
				content_2 = {
					name = L["info.description.content_2"],
					type = "description",
					width = "full",
					fontSize = "small",
					order = 0.12
				},
				LINE_1 = Memento_GetStyleLineSmall(0.13),
			},
		},
		about = {
			name = L["info.about"],
			type = "group",
			inline = true,
			order = 1.2,
			args = {
				build = {
					name = Memento_MarkGoldFont(L["info.about.game-version"] .. ": ") .. Memento.gameVersion .. " (".. Memento.flavor .. ")",
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.11
				},
				version = {
					name = Memento_MarkGoldFont(L["info.about.addon-version"] .. ": ") .. Memento.addonVersion .. " (".. Memento.buildDate .. ")",
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.12
				},
				LINE_1 = Memento_GetStyleLineNormal(0.13),
				author = {
					name =  Memento_MarkGoldFont(L["info.about.author"] .. ": ") .. Memento.author,
					type = "description",
					width = "full",
					fontSize = "medium",
					order = 0.14
				},
				SEPARATOR_1 = Memento_GetStyleSeparator(0.15),
				feedback = {
					name = L["info.about.feedback"],
					type = "description",
					width = "full",
					fontSize = "small",
					order = 0.16
				},
				LINE_2 = Memento_GetStyleLineSmall(0.17),
				email = {
					name = L["info.about.email.name"],
					type = "execute",
					width = 1.0,
					desc = L["info.about.email.desc"],
					func = function()
						LibStub("Memento_PopupDialog-1.0").ShowDialogExternalLink(Memento.eMail, L["info.about.email.popup"])
					end,
					order = 0.18
				},
				SPACE_1 = {
					name = "",
					type = "description",
					width = 0.5,
					fontSize = "medium",
					order = 0.19
				},
				github = {
					name = L["info.about.github.name"],
					type = "execute",
					width = 1.0,
					desc = L["info.about.github.desc"],
					func = function()
						LibStub("Memento_PopupDialog-1.0").ShowDialogExternalLink(Memento.github, L["info.about.github.popup"])
					end,
					order = 0.20
				},
			},
		},
	},
}
