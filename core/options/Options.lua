local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local orderID = 2.1

Memento.optionsTable = Memento.optionsTable or {}

Memento.optionsTable["options"] = {
	name =  function()
		if Memento.flavor == "Retail" then
			return "|T" .. Memento.MEDIA_PATH .. "icon_options.blp:0:0:0:1|t  " .. addonName .. " - " .. L["options"]
		else
			return "|T" .. Memento.MEDIA_PATH .. "icon_options.blp:0:0:0:2|t  " .. addonName .. " - " .. L["options"]
		end
	end,
	type = "group",
	childGroups = "tab",
	args = {
		general = {
			name = L["general.options.general"],
			type = "group",
			inline = true,
			order = orderID,
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
					order = 0.11
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
					order = 0.12
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
					order = 0.13
				},
				separator = {
					name = "",
					type = "header",
					dialogControl = "SFX-Header",
					order = 0.14
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
					order = 0.15
				},
			},
		},
	},
}
