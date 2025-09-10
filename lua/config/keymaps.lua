-- NVChad-style keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------------
-- Neo-tree shortcuts
-----------------------

-- Toggle Neo-tree (like NVChad <C-n>)
local function toggle_neotree()
  if pcall(require, "neo-tree.command") then
    pcall(function()
      require("neo-tree.command").execute({ toggle = true })
    end)
    return
  end
  pcall(vim.cmd, "Neotree toggle")
end
map("n", "<C-n>", toggle_neotree, opts)
map("n", "<leader>e", toggle_neotree, opts) -- alternate leader shortcut

-- Helper to find Neo-tree window
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

-- Resize Neo-tree
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

-- Resize Neo-tree horizontally
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

-- Resize Neo-tree vertically
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

-----------------------
-- Window splits & navigation
-----------------------

-- Splits
map("n", "<leader>sv", ":vsplit<CR>", opts) -- vertical split
map("n", "<leader>sh", ":split<CR>", opts) -- horizontal split

-- Navigate between splits (Ctrl + h/j/k/l)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize splits
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-----------------------
-- Buffer navigation
-----------------------

-- Next/previous buffer
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)

-----------------------
-- Command-line shortcut
-----------------------
map("n", ";", ":", { noremap = true })
map("v", ";", ":", { noremap = true })
