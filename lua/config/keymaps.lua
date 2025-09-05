-- NVChad-like tree + quick mappings (append to your keymaps file)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Toggle Neo-tree quickly (NVChad: <C-n>)
local function toggle_neotree()
  -- Try Lua API first, then fallback to command
  if pcall(require, "neo-tree.command") then
    pcall(function()
      require("neo-tree.command").execute({ toggle = true })
    end)
    return
  end
  pcall(vim.cmd, "Neotree toggle")
end
map("n", "<C-n>", toggle_neotree, opts)

-- Helper: find neo-tree window (looks for 'neo-tree' filetype or buffer name)
local function find_neo_tree_win()
  for _, w in ipairs(vim.api.nvim_list_wins()) do
    local b = vim.api.nvim_win_get_buf(w)
    local ok, ft = pcall(vim.api.nvim_buf_get_option, b, "filetype")
    if ok and ft and ft:match("neo[-_]tree") then
      return w
    end
    local name = vim.api.nvim_buf_get_name(b)
    if name and name:match("neo%-tree") then
      return w
    end
  end
  return nil
end

-- Resize neo-tree (delta = positive or negative integer)
local function resize_neo_tree(delta)
  local w = find_neo_tree_win()
  if not w then
    vim.notify("Neo-tree window not found", vim.log.levels.WARN)
    return
  end
  local cur = vim.api.nvim_win_get_width(w)
  local new = math.max(10, cur + delta)
  vim.api.nvim_win_set_width(w, new)
end

-- NVChad-style Ctrl+Alt + h/j/k/l to resize sidebar.
-- Different terminals encode Alt as <A-...> or <M-...>, so we register both variants.
-- Horizontal adjustments (left/right)
map("n", "<C-A-h>", function()
  resize_neo_tree(-5)
end, opts)
map("n", "<C-A-l>", function()
  resize_neo_tree(5)
end, opts)
map("n", "<C-M-h>", function()
  resize_neo_tree(-5)
end, opts)
map("n", "<C-M-l>", function()
  resize_neo_tree(5)
end, opts)

-- Vertical adjustments (up/down) - only meaningful if neo-tree is floating or vertical split,
-- we'll just call win_set_height if possible (some setups won't change height for vertical)
map("n", "<C-A-j>", function()
  local w = find_neo_tree_win()
  if not w then
    vim.notify("Neo-tree not open", vim.log.levels.WARN)
    return
  end
  local curh = vim.api.nvim_win_get_height(w)
  vim.api.nvim_win_set_height(w, math.max(5, curh + 3))
end, opts)
map("n", "<C-A-k>", function()
  local w = find_neo_tree_win()
  if not w then
    vim.notify("Neo-tree not open", vim.log.levels.WARN)
    return
  end
  local curh = vim.api.nvim_win_get_height(w)
  vim.api.nvim_win_set_height(w, math.max(5, curh - 3))
end, opts)
map("n", "<C-M-j>", function()
  local w = find_neo_tree_win()
  if not w then
    vim.notify("Neo-tree not open", vim.log.levels.WARN)
    return
  end
  local curh = vim.api.nvim_win_get_height(w)
  vim.api.nvim_win_set_height(w, math.max(5, curh + 3))
end, opts)
map("n", "<C-M-k>", function()
  local w = find_neo_tree_win()
  if not w then
    vim.notify("Neo-tree not open", vim.log.levels.WARN)
    return
  end
  local curh = vim.api.nvim_win_get_height(w)
  vim.api.nvim_win_set_height(w, math.max(5, curh - 3))
end, opts)

-- Shortcut to toggle file explorer (same as <C-n> but with leader)
map("n", "<leader>e", toggle_neotree, opts)

-- Make ';' open command-line like NVChad (so you don't need shift+;)
-- NOTE: this overrides default ';' behavior (repeat f/t motions). If you rely on ';', skip this.
map("n", ";", ":", { noremap = true })
map("v", ";", ":", { noremap = true })

-- If you prefer semicolon to remain and want ';;' to open command-line:
-- map("n", ";;", ":", { noremap = true })
