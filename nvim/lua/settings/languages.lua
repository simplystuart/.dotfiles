local to_formatter = function(formatters_dict)
	for _, formatter in pairs(formatters_dict) do
		local items = {}

		for _, item in pairs(formatter) do
			table.insert(items, item)
		end

		return items
	end
end

return {
	to_formatter = to_formatter,
	formatters_dict = {
		bash = { "beautysh" },
		elm = { "elm-format" },
		css = { "stylelint" },
		html = { "htmlbeautifier" },
		javascript = { { "prettierd", "prettier" } },
		lua = { "stylua" },
		rust = { "rustfmt" },
	},
	lsps = {
		"elmls",
		"lua_ls",
		"rust_analyzer",
		"tsserver",
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
		"rust",
		"typescript",
		"vimdoc",
	},
}
