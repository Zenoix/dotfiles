-- Set cursor to block
vim.o.guicursor = ""

-- Set highlight on search
vim.o.hlsearch = false

-- Set incremental search
vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true

-- Tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Leader key
vim.g.mapleader = " "

-- Decrease update time to 100ms
vim.o.updatetime = 100

-- Set line numbers to be relative
vim.wo.relativenumber = true

-- Change line number to relative when not in insert or visual mode
local number_toggle_group = vim.api.nvim_create_augroup("number_toggle", { clear = true })

-- Turn relative line numbers off when entering insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.wo.relativenumber = false
	end,
})

-- Turn relative line numbers on when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.wo.relativenumber = true
	end,
})

-- Turn relative line numbers off when entering visual mode
vim.api.nvim_create_autocmd("ModeChanged", {
	group = number_toggle_group,
	pattern = { "*:[vV\x16]*" },
	callback = function()
		vim.wo.relativenumber = false
	end,
})

-- Turn relative line numbers on when leaving visual mode
vim.api.nvim_create_autocmd("ModeChanged", {
	group = number_toggle_group,
	pattern = { "[vV\x16]*:*" },
	callback = function()
		vim.wo.relativenumber = true
	end,
})
