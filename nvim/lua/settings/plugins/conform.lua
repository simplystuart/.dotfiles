local languages = require("settings.languages")

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = languages.formatters_dict,
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 1500,
			},
		})
	end,
}
