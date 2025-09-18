local aug = vim.api.nvim_create_augroup

-- Per-language indentation
vim.api.nvim_create_autocmd("FileType", {
  group = aug("SetIndent", { clear = true }),
  pattern = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "yaml",
    "lua",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = aug("SetIndentPython", { clear = true }),
  pattern = { "python" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

-- Lint on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = aug("LintOnSave", { clear = true }),
  callback = function()
    require("lint").try_lint()
  end,
})
