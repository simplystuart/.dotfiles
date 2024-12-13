return {
	"vim-test/vim-test",
	config = function()
		vim.g["test#strategy"] = "neovim"

		vim.keymap.set("n", "<leader>tt", vim.cmd.TestNearest)
		vim.keymap.set("n", "<leader>tf", vim.cmd.TestFile)
		vim.keymap.set("n", "<leader>tl", vim.cmd.TestLast)
		vim.keymap.set("n", "<leader>tv", vim.cmd.TestVisit)
		vim.keymap.set("n", "<leader>ts", vim.cmd.TestSuite)
	end,
}
