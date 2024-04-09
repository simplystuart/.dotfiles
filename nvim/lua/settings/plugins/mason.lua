local polyglot = require("settings.polyglot")

local formatters = polyglot.formatters_by_ft_to_formatter(polyglot.formatters_by_ft)

return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = formatters,
		})
	end,
}
