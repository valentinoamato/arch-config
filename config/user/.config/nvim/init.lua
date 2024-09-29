-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netwr
vim.g.loaded_netwr = 1
vim.g.loaded_netwrPlugin = 1

-- Print line numbers
vim.opt.number = true

-- Enable mouse support in all modes
vim.opt.mouse = "a"

-- Set clipboard
vim.opt.clipboard = "unnamedplus"

-- Wrapped lines continue visually indented
vim.opt.breakindent = true

-- Ignore case on search
-- Can be overwritten by searching capital letters or using \C
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always draw the signcolumn
vim.opt.signcolumn = "yes"

-- Useful to see the difference between whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "»»",  nbsp = "⏎", trail = "∙"}

-- Highlight the line of the cursor
vim.opt.cursorline = true

-- Minimal number of screen lines to keep around the cursor
vim.opt.scrolloff = 5

-- Minimal number of screen columns to keep around the cursor
vim.opt.sidescrolloff = 15

-- Use spaces to indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Set split direction
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable 24-bit RGB color
vim.opt.termguicolors = true

-- Hide the mode in the last line as it is already displayed in the statusline
vim.opt.showmode = false

-- Turn off highlighting of matches after a search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Toggle nvim-tree
vim.keymap.set("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>")

-- Disable arrow keys in all modes
vim.keymap.set({"n", "i", "v", "x", "s", "c", "o", "t"}, "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v", "x", "s", "c", "o", "t"}, "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v", "x", "s", "c", "o", "t"}, "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v", "x", "s", "c", "o", "t"}, "<Right>", "<Nop>", { noremap = true, silent = true })

-- Move the cursor to other window
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize current window
local width_amount = 6  -- Width change
local height_amount = 2 -- Height change
vim.keymap.set({"n", "t"}, "<Leader>=", ":vert res +" .. width_amount .. "<CR>") -- Increase width
vim.keymap.set({"n", "t"}, "<Leader>-", ":vert res -" .. width_amount .. "<CR>") -- Decrease width
vim.keymap.set({"n", "t"}, "<Leader>.", ":res +" .. height_amount .. "<CR>") -- Increase height
vim.keymap.set({"n", "t"}, "<Leader>,", ":res -" .. height_amount .. "<CR>") -- Decrease height

-- Delete previous word
vim.keymap.set("i", "<C-BS>", "<C-w>")

-- Prevent p from yanking the selection 
vim.keymap.set("v", "p", "\"_dP")

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- add your plugins here
        {   -- Neovim theme
            "folke/tokyonight.nvim",
            lazy = false, -- make sure we load this during startup if it is your main colorscheme
            priority = 1000, -- make sure to load this before all the other start plugins
            config = function()
                -- load the colorscheme here
                vim.cmd([[colorscheme tokyonight-moon]])
            end,
        },
        {   -- Indentation guides
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {}
        },
        {   -- File explorer tree
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup {}
            end,
        },
        {   -- Fuzzy finder
            "nvim-telescope/telescope.nvim",
            tag = "0.1.8",
            dependencies = {
                "nvim-lua/plenary.nvim"
            }
        },
        {   -- Git decorations
            "lewis6991/gitsigns.nvim"
        },
        {   -- Statusline
            "nvim-lualine/lualine.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            }
        },
        {   -- Treesitter
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate"
        },
        {   -- Package manager for LSPs, linters, etc
            "williamboman/mason.nvim"
        },
        {   -- Makes it easier to use mason.nvim and lspconfig together
            "williamboman/mason-lspconfig.nvim"
        },
        {   -- Configs for the Neovim LSP client
            "neovim/nvim-lspconfig"
        },
        {   -- Autocompletion plugin
            "hrsh7th/nvim-cmp"
        },
        {   -- LSP source for nvim-cmp
            "hrsh7th/cmp-nvim-lsp"
        },
        {   -- Snippets source for nvim-cmp
            "saadparwaiz1/cmp_luasnip"
        },
        {   -- Snippets plugin
            "L3MON4D3/LuaSnip"
        },
        {   -- Markdown preview plugin
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            ft = { "markdown" },
            build = "cd app && npm install",
        }
   },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})

-- Setup indent-blankline.nvim
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({ indent = { highlight = highlight } })

-- Setup nvim-tree.lua
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

-- Setup telescope.nvim
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Setup gitsigns.nvim
local gitsigns = require("gitsigns")
gitsigns.setup({
    on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end)
    end
})
-- Setup lualine.nvim
require("lualine").setup()

-- Setup nvim-treesitter
require("nvim-treesitter.configs").setup({
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you dont have `tree-sitter` CLI installed locally
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
})

-- Setup mason.nvim
require("mason").setup()

-- Setup mason-lspconfig.nvim
require("mason-lspconfig").setup({
    -- A list of servers to automatically install if theyre not already installed.
    -- List of available servers: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    ensure_installed = { "lua_ls",
                         "rust_analyzer",
                         "clangd",
    },
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup nvim-lspconfig
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                -- Define the "vim" global
                globals = {
                    "vim",
                },
            },
        },
    },
    capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
})
lspconfig.clangd.setup({
    capabilities = capabilities,
})

-- Setup luasnip
local luasnip = require("luasnip")

-- Setup nvim-cmp
local cmp = require("cmp")
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered({}),
        documentation = cmp.config.window.bordered({}),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
        ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
        ["<Tab>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    formatting = {
        -- Truncate suggestions that are too long
        fields = { "abbr", "menu", "kind" },
        format = function(_, item)
            local abbr_width = 16
            local kind_width = 4
            item.menu = ""
            if #item.kind > kind_width then
                item.kind = vim.fn.strcharpart(item.kind, 0, kind_width - 1) .. "…"
            end
            if #item.abbr > abbr_width then
                item.abbr = vim.fn.strcharpart(item.abbr, 0, abbr_width) .. "…"
            end
        return item
    end,
},
}
