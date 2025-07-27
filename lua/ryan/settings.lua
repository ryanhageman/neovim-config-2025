-- ==========================================================================
-- Basic Settings
-- ==========================================================================

-- Setup Leader Keys (set early, before any mappings)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove default space behavior
vim.keymap.set("n", "<space>", "<nop>")
vim.keymap.set("x", "<space>", "<nop>")

-- Escape with jk
vim.keymap.set("i", "jk", "<esc>")

-- Encoding
vim.opt.fileencoding = "utf-8"         -- The encoding written to a file

-- Performance settings
vim.opt.timeoutlen = 300               -- Time to wait for a mapped sequence to complete
vim.opt.updatetime = 300               -- Faster completion (4000ms default)

-- Mouse (sometimes useful)
vim.opt.mouse = "a"                    -- Mouse on
vim.opt.mousemodel = "popup_setpos"    -- Right-click positions cursor and shows popup

-- Project specific config
vim.opt.exrc = true                    -- Enable reading .vimrc/.nvimrc in current directory
vim.opt.secure = true                  -- Restrict some commands in non-default .vimrc files

-- ==========================================================================
-- UI Settings
-- ==========================================================================

-- Visual markers
vim.opt.cursorline = true
vim.cmd("highlight clear CursorLine")
vim.cmd("highlight CursorLineNR cterm=bold")
vim.opt.showmatch = true               -- Highlight matching brackets
vim.opt.matchtime = 2                  -- Highlight time
vim.opt.signcolumn = "yes"             -- Show the sign column
vim.opt.showmode = false               -- Don't show the mode in the command line


-- TODO: Ghostty keyprotocol support - troubleshoot later
-- if vim.env.TERM_PROGRAM == "ghostty" then
--   vim.opt.keyprotocol = "ghostty:kitty"
-- end

-- Menus and completion
vim.opt.wildmode = "longest:full,full" -- Longest match first, then cycle
vim.opt.wildoptions = "pum"            -- Completions in a popup menu
vim.opt.pumheight = 10                 -- Completion menu height
vim.opt.completeopt = { "menuone", "noselect" }  -- Better completion behavior
vim.opt.cmdheight = 2                  -- More space for displaying messages

-- Window behavior
vim.opt.title = true                   -- Show file in titlebar
vim.opt.splitbelow = true              -- Open new splits below
vim.opt.splitright = true              -- Open new vsplits to the right

-- ==========================================================================
-- Editor Settings
-- ==========================================================================

-- Lines and scrolling
vim.opt.number = true                  -- Show line numbers
vim.opt.relativenumber = true          -- Show relative line numbers
vim.opt.numberwidth = 4                -- Number column width
vim.opt.scrolloff = 8                  -- Minimal lines to keep above/below cursor
vim.opt.sidescrolloff = 8              -- Minimal columns to keep left/right of cursor

-- Smart relative line numbers
local relative_number_group = vim.api.nvim_create_augroup("smart_relative_line_numbers", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  group = relative_number_group,
  pattern = "*",
  command = "set norelativenumber"
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = relative_number_group,
  pattern = "*",
  command = "set relativenumber"
})

-- Indentation
vim.opt.expandtab = true               -- Use spaces instead of tabs
vim.opt.tabstop = 2                    -- A tab is 2 spaces
vim.opt.shiftwidth = 2                 -- Autoindent size
vim.opt.softtabstop = 2                -- Backspace tab removal size
vim.opt.autoindent = true              -- New lines have the same indent as the last

-- Text display
vim.opt.wrap = true                    -- Wrap long lines
vim.opt.linebreak = true               -- Don't break words when wrapping
vim.opt.conceallevel = 2               -- Hide markup in markdown files
vim.opt.whichwrap = "bs<>[]hl"         -- Which keys can move to prev/next line

-- ==========================================================================
-- Search Settings
-- ==========================================================================

vim.opt.incsearch = true               -- Do incremental searching
vim.opt.hlsearch = true                -- Highlight search results
vim.opt.ignorecase = true              -- Ignore case when searching
vim.opt.smartcase = true               -- When search has caps, noignorecase

-- ==========================================================================
-- Buffer and File Settings
-- ==========================================================================

vim.opt.hidden = true                  -- Allow switching buffers without saving

-- File Navigation
vim.opt.path:append("**")
vim.opt.history = 1000

-- Backup and persistence
vim.opt.backup = false                 -- Skip making backup files
vim.opt.writebackup = false            -- Skip making backups when writing
vim.opt.swapfile = false               -- Skip making swap files
vim.opt.undofile = true                -- Enable persistent undo

-- ==========================================================================
-- Custom File Types
-- ==========================================================================

local filetype_group = vim.api.nvim_create_augroup("CustomFileTypes", { clear = true })

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  group = filetype_group,
  pattern = "*.turbo_stream",
  command = "set filetype=html"
})

-- ==========================================================================
-- Built-in Packages
-- ==========================================================================

vim.cmd("packadd! matchit")            -- Better finding the tag match
vim.cmd("packadd nohlsearch")          -- Automatically turn off search highlights

-- ==========================================================================
-- Folding
-- ==========================================================================

vim.opt.foldmethod = "expr"            -- Use expression-based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"  -- Use treesitter for folding
vim.opt.foldenable = false             -- Don't fold by default when opening files

