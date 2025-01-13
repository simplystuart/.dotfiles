local to_formatter = function(formatters_dict)
	for _, formatter in pairs(formatters_dict) do
		local items = {}

		for _, item in pairs(formatter) do
			local conform_name = string.gsub(item, "_", "-")
			table.insert(items, conform_name)
		end

		return items
	end
end

return {
	to_formatter = to_formatter,
	formatters_dict = {
		bash = { "beautysh" },
		elm = { "elm_format" },
		css = { "stylelint" },
		haskell = { "ormolu" },
		html = { "htmlbeautifier" },
		javascript = { "eslint_d", "prettierd", "prettier" },
		typescript = { "eslint_d", "prettierd", "prettier" },
		lua = { "stylua" },
		ruby = { "standardrb" },
		rust = { "rustfmt" },
	},
	lsps = {
		"elmls",
		"hls",
		"lua_ls",
		"ruby_lsp",
		"rust_analyzer",
		"ts_ls",
	},
	parsers = {
		"bash",
		"css",
		"csv",
		"elm",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"ruby",
		"rust",
		"typescript",
		"vimdoc",
	},
}
