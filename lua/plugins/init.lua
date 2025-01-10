return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      "folke/which-key.nvim", -- optional [for whichkey hints]
      "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
      "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
      "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      -- local highlight = {
      --   "RainbowRed",
      --   "RainbowYellow",
      --   "RainbowBlue",
      --   "RainbowOrange",
      --   "RainbowGreen",
      --   "RainbowViolet",
      --   "RainbowCyan",
      -- }
      -- local hooks = require "ibl.hooks"
      -- -- create the highlight groups in the highlight setup hook, so they are reset
      -- -- every time the colorscheme changes
      -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      --     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      --     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      --     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      --     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      --     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      --     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      --     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      -- end)
      -- vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup {
        -- indent = { highlight = highlight, char = "·̩̍" },
        -- indent = { highlight = highlight, char = "" },
        indent = { char = "" },
        whitespace = {
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      }
      -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    main = "lspconfig",
    config = function()
      require "configs.lspconfig"
      -- local lspconfig = require "lspconfig"
      -- for _, lsp in ipairs(lspconfig) do
      --   lsp.setup{
      --     autostart = false
      --   }
      -- end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "c",
        "python",
        "bash",
        "cpp",
        "rust",
        "yaml",
        "toml",
        "xml",
      },
      auto_install = true,
    },
  },
  {
    "yioneko/nvim-yati",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        yati = {
          enable = true,
          -- Disable by languages, see `Supported languages`
          disable = { "python" },

          -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
          default_lazy = true,

          -- Determine the fallback method used when we cannot calculate indent by tree-sitter
          --   "auto": fallback to vim auto indent
          --   "asis": use current indent as-is
          --   "cindent": see `:h cindent()`
          -- Or a custom function return the final indent result.
          default_fallback = "asis",
        },
        indent = {
          enable = false, -- disable builtin indent module
        },
      }
    end,
  },
}
