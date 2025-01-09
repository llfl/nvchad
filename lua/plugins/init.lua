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
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function ()
      local highlight = {
        "CursorColumn",
        "Whitespace",
    }
    require("ibl").setup {
        -- indent = { highlight = highlight, char = "·̩̍" },
        indent = { highlight = highlight, char = "" },
        whitespace = {
            highlight = highlight,
            remove_blankline_trail = false,
        },
        scope = { enabled = false },
    }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    main = "lspconfig",
    config = function()
      local lspconfig = require "lspconfig"
      for _, lsp in ipairs(lspconfig) do
        lsp.setup{
          autostart = false
        }
      end
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
