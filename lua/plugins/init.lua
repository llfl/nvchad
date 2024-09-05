return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     -- format & linting
  --     {
  --       "jose-elias-alvarez/null-ls.nvim",
  --       config = function()
  --       end,
  --     },
  --   },
  --   config = function()
  --
  --   end, -- Override to setup mason-lspconfig
  -- },

  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      "folke/which-key.nvim", -- optional [for whichkey hints]
      "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
      "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
      "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
    },
  },

  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   version = "2.20.7",
  --   event = "User FilePost",
  --   opts = function()
  --     return require("plugins.configs.others").blankline
  --   end,
  --   config = function(_, opts)
  --     require("core.utils").load_mappings "blankline"
  --     dofile(vim.g.base46_cache .. "blankline")
  --     require("indent_blankline").setup(opts)
  --   end,
  -- },
  --

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
