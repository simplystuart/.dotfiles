local to_formatter = function(formatters_dict)
	local items = {}

	for _, formatter in pairs(formatters_dict) do
		for _, item in pairs(formatter) do
			local conform_name = string.gsub(item, "_", "-")
			table.insert(items, conform_name)
		end
	end

	return items
end

return {
	to_formatter = to_formatter,
	formatters_dict = {
		bash = { "beautysh" },
		elm = { "elm_format" },
		css = { "stylelint" },
		html = { "htmlbeautifier" },
		javascript = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		lua = { "stylua" },
		rust = { "rustfmt" },
	},
	lsps = {
		"elmls",
		"lua_ls",
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
		"rust",
		"typescript",
		"vimdoc",
	},
}
