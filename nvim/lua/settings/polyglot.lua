local formatters_by_ft_to_formatter = function(formatters_by_ft)
	for _, formatter in pairs(formatters_by_ft) do
		local items = {}

		for _, item in pairs(formatter) do
			table.insert(items, item)
		end

		return items
	end
end

return {
	formatters_by_ft_to_formatter = formatters_by_ft_to_formatter,
	formatters_by_ft = {
		bash = { "beautysh" },
		elm = { "elm_format" },
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
