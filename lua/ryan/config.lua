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

-- Basic vim options
local opt = vim.opt

-- Encoding
opt.fileencoding = "utf-8"  -- The encoding written to a file

-- Performance settings
opt.timeoutlen = 300        -- Time to wait for a mapped sequence to complete
opt.updatetime = 300        -- Faster completion (4000ms default)

-- Mouse (sometimes useful)
opt.mouse = "a"                     -- Mouse on
opt.mousemodel = "popup_setpos"     -- Right-click positions cursor and shows popup

-- Project specific config
opt.exrc = true         -- Enable reading .vimrc/.nvimrc in current directory
opt.secure = true       -- Restrict some commands in non-default .vimrc files

-- ==========================================================================
-- UI Settings
-- ==========================================================================

-- Visual markers
opt.cursorline = true
vim.cmd("highlight clear CursorLine")
vim.cmd("highlight CursorLineNR cterm=bold")
opt.showmatch = true                -- Highlight matching brackets
opt.matchtime = 2                   -- Highlight time
opt.signcolumn = "yes"              -- Show the sign column
opt.showmode = false                -- Don't show the mode in the command line


-- TODO: Ghostty keyprotocol support - troubleshoot later
-- if vim.env.TERM_PROGRAM == "ghostty" then
--   opt.keyprotocol = "ghostty:kitty"
-- end

-- Menus and completion
opt.wildmode = "longest:full,full"  -- Longest match first, then cycle
opt.wildoptions = "pum"             -- Completions in a popup menu
opt.pumheight = 10                  -- Completion menu height
opt.completeopt = { "menuone", "noselect" }  -- Better completion behavior
opt.cmdheight = 2                   -- More space for displaying messages

-- Window behavior
opt.title = true                    -- Show file in titlebar
opt.splitbelow = true               -- Open new splits below
opt.splitright = true               -- Open new vsplits to the right

-- ==========================================================================
-- Editor Settings
-- ==========================================================================

-- Lines and scrolling
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Show relative line numbers
opt.numberwidth = 4                 -- Number column width
opt.scrolloff = 8                   -- Minimal lines to keep above/below cursor
opt.sidescrolloff = 8               -- Minimal columns to keep left/right of cursor

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
opt.expandtab = true               -- Use spaces instead of tabs
opt.tabstop = 2                    -- A tab is 2 spaces
opt.shiftwidth = 2                 -- Autoindent size
opt.softtabstop = 2                -- Backspace tab removal size
opt.autoindent = true              -- New lines have the same indent as the last

-- Text display
opt.wrap = true                    -- Wrap long lines
opt.linebreak = true               -- Don't break words when wrapping
opt.conceallevel = 2               -- Hide markup in markdown files
opt.whichwrap = "bs<>[]hl"         -- Which keys can move to prev/next line

-- ==========================================================================
-- Search Settings
-- ==========================================================================

opt.incsearch = true               -- Do incremental searching
opt.hlsearch = true                -- Highlight search results
opt.ignorecase = true              -- Ignore case when searching
opt.smartcase = true               -- When search has caps, noignorecase

-- ==========================================================================
-- Buffer and File Settings
-- ==========================================================================

opt.hidden = true                  -- Allow switching buffers without saving

-- File Navigation
opt.path:append("**")
opt.history = 1000

-- Backup and persistence
opt.backup = false                 -- Skip making backup files
opt.writebackup = false            -- Skip making backups when writing
opt.swapfile = false               -- Skip making swap files
opt.undofile = true                -- Enable persistent undo

-- ==========================================================================
-- Netrw Settings
-- ==========================================================================

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 100

-- Toggle Netrw function
local function toggle_netrw()
  if vim.bo.filetype == "netrw" then
    vim.cmd("Rexplore")
  else
    vim.cmd("Explore")
  end
end

vim.keymap.set("n", "<leader>e", toggle_netrw, { desc = "Toggle file explorer" })

-- ==========================================================================
-- File Types
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

vim.cmd("packadd! matchit")        -- Better finding the tag match
vim.cmd("packadd nohlsearch")      -- Automatically turn off search highlights

-- ==========================================================================
-- Folding
-- ==========================================================================

opt.foldmethod = "expr"            -- Use expression-based folding
opt.foldexpr = "nvim_treesitter#foldexpr()"  -- Use treesitter for folding
opt.foldenable = false             -- Don't fold by default when opening files

