return {
	"folke/trouble.nvim",
	opts = { icons = false },
	config = function()
		vim.keymap.set("n", "<leader>t", function()
			vim.cmd.TroubleToggle()
		end)
	end,
}
