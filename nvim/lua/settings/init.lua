vim.g.mapleader = " "

require("settings.lazy")
require("settings.mappings")

-- columns
vim.opt.colorcolumn = "81"
vim.opt.nu = true
vim.opt.wrap = false

-- indents
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- system
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- windows
vim.opt.splitbelow = true
vim.opt.splitright = true
