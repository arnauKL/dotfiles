--print("is this shit even being called?")
--print("OMG IT IS")


---- Arnau, on 14/03:
-- From here onwards, this is my nvim setup.
-- I will try to explain what everything means so
-- future me has a nice time reading this file when
-- something inevitably gets messed up.

-- First, a package manager. My choice: Lazy.nvim

require("config.lazy")
-- this statement tells nvim to look for lua files to require
-- inside of the folder "/lazy/config" in the runtime path
-- (this init.lua file is in it).

-- Default terminal in nvim
vim.o.shell = "powershell.exe"


-- Shortcut to run the lua code that is selected in visual mode:
vim.keymap.set("n", "<space>sx", "<cmd>source %<CR>", { desc = "[s]ource and e[x]ecute whole file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "run in lua" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "run in lua" })


-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Higlighting when yanking (copying) text",
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


---- OPTIONS
-- vim.opt is a table that stores many options

vim.opt.shiftwidth = 4 -- Change tabs to be 4 wide

vim.opt.number = true  -- Enable numbers and relative number	
vim.opt.relativenumber = true

-- soft linewrap set to false.
vim.opt.wrap = false

-- set nvim clipboard to be the same as the OS clipboard
vim.opt.clipboard = "unnamedplus"

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Decrease update time
vim.opt.updatetime = 250

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Save undo history
vim.opt.undofile = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

-- Change window simpler
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
