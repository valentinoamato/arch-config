-- Set leader key
vim.g.mapleader = ' '
vim.g.localleader = ' '

-- Print line numbers
vim.opt.number = true

-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Set clipboard
vim.opt.clipboard = 'unnamedplus'

-- Wrapped lines continue visually indented
vim.opt.breakindent = true

-- Ignore case on search
-- Can be overwritten by searching capital letters or using \C
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always draw the signcolumn
vim.opt.signcolumn = 'yes'

-- Useful to see the difference between whitespace characters
vim.opt.list = true

-- Highlight the line of the cursor
vim.opt.cursorline = true

-- Minimal number of screen lines to keep around the cursor
vim.opt.scrolloff = 5

-- Minimal number of screen columns to keep around the cursor
vim.opt.sidescrolloff = 15

-- Turn off highlighting of matches after a search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys in all modes
vim.keymap.set({'n', 'i', 'v', 'x', 's', 'c', 'o', 't'}, '<Up>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({'n', 'i', 'v', 'x', 's', 'c', 'o', 't'}, '<Down>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({'n', 'i', 'v', 'x', 's', 'c', 'o', 't'}, '<Left>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({'n', 'i', 'v', 'x', 's', 'c', 'o', 't'}, '<Right>', '<Nop>', { noremap = true, silent = true })
