local to_formatter = function(formatters_dict)
	local keep = { eslint_d = true }
	local items = {}

	for _, formatter in pairs(formatters_dict) do
		for _, item in pairs(formatter) do
			if type(item) == "string" then
				local conform_name = not keep[item] and string.gsub(item, "_", "-") or item
				table.insert(items, conform_name)
			end
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
		javascript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
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
