local languages = require("settings.languages")

return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = languages.to_formatter(languages.formatters_dict),
		})
	end,
}
