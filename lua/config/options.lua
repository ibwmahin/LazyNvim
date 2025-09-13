-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- lua/config/options.lua
local opt = vim.opt

vim.o.guifont = "IBM Plex Mono Nerd Font:h12"
opt.winbar = "%=%m %f"
opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = true
opt.termguicolors = true
opt.updatetime = 200
opt.timeoutlen = 400
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.clipboard = "unnamedplus"

-- Global defaults; we’ll override per-language in autocmds
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
-- Better UI for diagnostics
vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  severity_sort = true,
})
