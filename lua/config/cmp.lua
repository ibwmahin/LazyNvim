return {

  -----------------------------------------------------------------------------
  -- COMPLETION / SNIPPETS
  -----------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Tailwind formatting (optional)
      local ok, tw = pcall(require, "tailwindcss-colorizer-cmp")
      if ok then
        opts.formatting = opts.formatting or {}
        opts.formatting.format = tw.formatter
      end

      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }

      opts.mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- DON'T auto-select
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
      })

      opts.snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      }

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      })

      return opts
    end,
  },

  -- LuaSnip with friendly-snippets and custom Next.js snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    opts = function()
      local luasnip = require("luasnip")

      -- Load VSCode style snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Load my Lua-style snippets placed in lua/snippets
      local ok, _ = pcall(function()
        require("luasnip.loaders.from_lua").lazy_load({
          paths = vim.fn.stdpath("config") .. "/lua/snippets",
        })
      end)

      -- Basic keymaps for expanding / jumping snippets.
      -- I use <C-l> to expand or jump forward, <C-h> to jump backward.
      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-h>", function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { silent = true })

      -- Optional: <C-k> to cut a choice (if using choice nodes)
      vim.keymap.set({ "i" }, "<C-k>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end)

      return {}
    end,
  },

  -----------------------------------------------------------------------------
  -- COLOR / TAILWIND PREVIEWS
  -----------------------------------------------------------------------------
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
      user_default_options = {
        names = false,
        tailwind = true,
        mode = "background",
      },
    },
  },
}
