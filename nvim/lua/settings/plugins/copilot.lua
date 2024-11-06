return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("i", "<C-s>", "<Plug>(copilot-dismiss)") -- stop it!
		vim.keymap.set("i", "<C-d>", "<Plug>(copilot-accept-word)") -- do word!
		vim.keymap.set("i", "<C-f>", "<Plug>(copilot-accept-line)") -- finish line!

		vim.keymap.set("n", "<leader>aa", function()
			vim.cmd.Copilot("panel")
		end)

		vim.keymap.set("n", "<leader>a", function()
			vim.cmd.Copilot("enable")
			vim.cmd.echo([["🗑️🔥 FULLY AUTO 🗑️🔥"]])
		end)

		vim.keymap.set("n", "<leader>m", function()
			vim.cmd.Copilot("disable")
			vim.cmd.echo([["🏎️ 🏎️ MANUAL 🏎️ 🏎️"]])
		end)
	end,
}
