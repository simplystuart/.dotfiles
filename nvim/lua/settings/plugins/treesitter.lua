local languages = require("settings.languages")

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		auto_install = true,
		ensure_installed = languages.parsers,
		highlight = {
			additional_vim_regex_highlighting = false,
			enable = true,
		},
		sync_install = false,
	},
}
