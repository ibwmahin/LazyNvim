-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- ----------------------
-- Helpers
-- ----------------------
local function is_mapped(mode, lhs)
  return vim.fn.maparg(lhs, mode) ~= ""
end

local function safe_map(mode, lhs, rhs, opts)
  if is_mapped(mode, lhs) then
    return
  end
  map(mode, lhs, rhs, opts or default_opts)
end

-- ----------------------
-- Window / split helpers
-- ----------------------
local function split_vertical()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
end
local function split_horizontal()
  vim.cmd("split")
  vim.cmd("wincmd j")
end
local function equalize_windows()
  vim.cmd("wincmd =")
end
local function rotate_windows()
  vim.cmd("wincmd r")
end
local function close_split()
  if #vim.api.nvim_tabpage_list_wins(0) > 1 then
    vim.cmd("close")
  end
end

local function resize_horiz(delta)
  local w = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_width(
    w,
    math.max(10, vim.api.nvim_win_get_width(w) + delta)
  )
end

local function resize_vert(delta)
  local w = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_height(
    w,
    math.max(3, vim.api.nvim_win_get_height(w) + delta)
  )
end

-- ----------------------
-- Window / split mappings
-- ----------------------
safe_map("n", "<leader>jj", split_vertical)
safe_map("n", "<leader>kk", split_horizontal)
safe_map("n", "<leader>se", equalize_windows)
safe_map("n", "<leader>jc", close_split)
safe_map("n", "<leader>wr", rotate_windows)

-- Move between splits
safe_map("n", "<C-h>", "<C-w>h")
safe_map("n", "<C-j>", "<C-w>j")
safe_map("n", "<C-k>", "<C-w>k")
safe_map("n", "<C-l>", "<C-w>l")

-- Resize with Alt + hjkl
safe_map("n", "<A-h>", function()
  resize_horiz(-5)
end)
safe_map("n", "<A-l>", function()
  resize_horiz(5)
end)
safe_map("n", "<A-k>", function()
  resize_vert(-2)
end)
safe_map("n", "<A-j>", function()
  resize_vert(2)
end)

-- Ctrl+arrows fallback
safe_map("n", "<C-Left>", function()
  resize_horiz(-5)
end)
safe_map("n", "<C-Right>", function()
  resize_horiz(5)
end)
safe_map("n", "<C-Up>", function()
  resize_vert(-2)
end)
safe_map("n", "<C-Down>", function()
  resize_vert(2)
end)

-- Equalize & focus
safe_map("n", "<leader>wo", ":only<CR>")
safe_map("n", "<leader>wh", ":wincmd H<CR>")
safe_map("n", "<leader>wl", ":wincmd L<CR>")

-- ----------------------
-- Buffer navigation
-- ----------------------
safe_map("n", "<Tab>", ":bnext<CR>")
safe_map("n", "<S-Tab>", ":bprevious<CR>")

-- ----------------------
-- Command-line shortcut
-- ----------------------
vim.keymap.del("n", ";")
vim.keymap.del("v", ";")

vim.keymap.set("n", ";", ":", { noremap = true, silent = false })
vim.keymap.set("v", ";", ":", { noremap = true, silent = false })
