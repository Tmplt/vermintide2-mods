return {
	run = function()
		fassert(rawget(_G, "new_mod"), "NoOverchargeDmgIndicator must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("NoOverchargeDmgIndicator", {
			mod_script       = "scripts/mods/NoOverchargeDmgIndicator/NoOverchargeDmgIndicator",
			mod_data         = "scripts/mods/NoOverchargeDmgIndicator/NoOverchargeDmgIndicator_data",
			mod_localization = "scripts/mods/NoOverchargeDmgIndicator/NoOverchargeDmgIndicator_localization"
		})
	end,
	packages = {
		"resource_packages/NoOverchargeDmgIndicator/NoOverchargeDmgIndicator"
	}
}
