-- cut copy
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- file nav
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", {})
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", {})
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", {})
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", {})

-- file mgmt
vim.keymap.set("n", "<leader>x", vim.cmd.Ex) -- 🚀 space x
vim.keymap.set("n", "<leader>s", vim.cmd.vsplit)

-- formatting
vim.keymap.set("n", "<leader>f", "vim.lsp.buf.format")

-- move the lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- project mgmt
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww code<CR>")

-- show invisibles
vim.keymap.set("n", "<leader>i", ":set invlist<CR>")

-- toggle line numbers
vim.keymap.set("n", "<leader>sn", ":set nu<CR>")
vim.keymap.set("n", "<leader>hn", ":set invnu<CR>")
