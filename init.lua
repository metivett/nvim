-- Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Neovim plugins
require("lazy").setup("plugins")

-- Load init.vim
local vimrc = "~/.vim/init.vim"

local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true, silent = true }

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme 'tokyonight-night'
---- fix weird slow down when searching due to tokyonight linking CurSearch to IncSearch
vim.cmd('hi! link CurSearch Search')

-- Global options
--- Line wrapping
vim.opt.linebreak = true
--- Tab
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
--- Line numbers (hybrid or absolute)
require("linenumbers")
--- Search results highlights
vim.opt.hlsearch = true
keymap( 'n', '<ESC>', [[<ESC>:noh<CR>]], noremap_opts )
vim.opt.incsearch = true

-- Mappings
--- Terminal mode
keymap( 't', '<ESC><ESC>', [[<C-\><C-n>]], noremap_opts )
