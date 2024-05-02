local languages = require("settings.languages")

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			ensure_installed = languages.parsers,
			highlight = {
				additional_vim_regex_highlighting = false,
				enable = true,
			},
			sync_install = false,
		})
	end,
}
