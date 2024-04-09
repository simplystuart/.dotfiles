local polyglot = require("settings.polyglot")

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			ensure_installed = polyglot.parsers,
			highlight = {
				additional_vim_regex_highlighting = false,
				enable = true,
			},
			sync_install = false,
		})
	end,
}
