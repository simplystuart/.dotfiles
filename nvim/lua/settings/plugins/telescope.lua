return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<C-y>"] = "select_vertical" },
					n = { ["<C-y>"] = "select_vertical" },
				},
			},
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>lb", builtin.buffers, {}) -- buffer
		vim.keymap.set("n", "<leader>lf", builtin.find_files, {}) -- file
		vim.keymap.set("n", "<leader>lh", builtin.help_tags, {}) -- help
		vim.keymap.set("n", "<leader>ls", builtin.live_grep, {}) -- search
		vim.keymap.set("n", "<leader>lu", builtin.lsp_definitions, {}) -- lookup

		--  git
		vim.keymap.set("n", "<leader>lg", function()
			builtin.git_files({
				prompt_title = "Git Files",
			})
		end)

		-- word
		vim.keymap.set("n", "<leader>lw", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)

		-- text
		vim.keymap.set("n", "<leader>lt", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
	end,
}
