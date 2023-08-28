local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- User Interface -----------------------------------------------------------
  {
    "anuvyklack/pretty-fold.nvim",
    -- Foldtext customization
    event = "BufWinEnter",
    dependencies = {
      {
        "anuvyklack/fold-preview.nvim",
        dependencies = {
          "anuvyklack/keymap-amend.nvim",
        },
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    config = function()
      require "custom.configs.external.pretty-fold"
    end,
  },
  {
    "zbirenbaum/neodim",
    --Neovim plugin for dimming the highlights of unused functions, variables, parameters, and more
    event = "LspAttach",
    branch = "v2",
    config = function()
      require("custom.configs.external.neodim").setup()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    --Smooth scrolling for window movement commands
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup {
        mappings = {
          "<C-u>",
          "<C-d>",
        },
      }
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    --The goal of nvim-ufo is to make Neovim's fold look modern and keep high performance.
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require("custom.configs.external.nvim-ufo").statuscolSetup()
        end,
      },
    },
    event = "BufReadPost",
    keys = require("custom.configs.external.nvim-ufo").ufoKeys,
    config = function()
      require("custom.configs.external.nvim-ufo").ufoSetup()
    end,
  },

  {
    "andreadev-it/shade.nvim",
    --An Nvim lua plugin that dims your inactive windows
    keys = "<Bslash>",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },
  {
    "Aasim-A/scrollEOF.nvim",
    --Scroll past the end of file just like scrolloff option
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("scrollEOF").setup {
        insert_mode = true,
      }
    end,
  },

  {
    "danilamihailov/beacon.nvim",
    -- Whenever cursor jumps some distance or moves between windows,
    -- it will flash so you can see where it is
    event = "BufReadPost",
    config = function()
      require "custom.configs.external.beacon"
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    --  improve neovim lsp experience
    event = "LspAttach",
    config = function()
      require "custom.configs.external.lspsaga"
    end,
  },
  {
    "rcarriga/nvim-notify",
    --A fancy, configurable, notification manager
    event = "UIEnter",
    config = function()
      require("notify").setup {
        top_down = false,
        -- render = "compact",
      }
    end,
  },
  {
    "folke/noice.nvim",
    --boom Highly experimental plugin that completely replaces
    --the UI for messages, cmdline and the popupmenu.
    event = "UIEnter",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "custom.configs.external.noice"
    end,
  },

  {
    "anuvyklack/windows.nvim",
    -- Automatically expand width of the current window. Maximizes and restore it.
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", enabled = false },
    },
    keys = { { "<leader>Z", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
    config = function()
      vim.o.winwidth = 5
      vim.o.equalalways = false
      require("windows").setup {
        ignore = {
          buftype = { "quickfix", "temrinal" },
          filetype = { "temrinal" },
        },
        -- animation = { enable = true, duration = 150 },
      }
    end,
  },
  -- Debugging ----------------------------------------------------------------
  {
    "folke/trouble.nvim",
    --vertical_traffic_light A pretty diagnostics, references, telescope results
    --quickfix and location list to help you solve all the trouble your code is causing.
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require "custom.configs.external.trouble"
    end,
  },
  {
    "lervag/vimtex",
    --VimTeX is a modern Vim and Neovim filetype and syntax plugin for LaTeX files.
    lazy = false,
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "xeluxee/competitest.nvim",
    --a Neovim plugin to automate testcases management and checking for Competitive Programming
    event = "InsertEnter",
    dependencies = {
      -- format & linting
      {
        "MunifTanjim/nui.nvim",
      },
    },
    config = function()
      require("competitest").setup {
        received_problems_path = "$(HOME)/Competitive Programming/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)",
        received_contests_directory = "$(HOME)/Competitive Programming/$(JUDGE)/$(CONTEST)",
        received_contests_problems_path = "$(PROBLEM).$(FEXT)",
        received_problems_prompt_path = false,
        testcases_use_single_file = true,
        evaluate_template_modifiers = true,
        received_contests_prompt_directory = false,
        received_contests_prompt_extension = false,
        open_received_contests = false,
        received_files_extension = "cpp",
        template_file = {
          cpp = "/home/mohamed/.config/nvim/lua/custom/template/file.cpp",
        },
      }
    end,
  },
  -- QOL ----------------------------------------------------------------------
  {
    "abecodes/tabout.nvim",
    --Supercharge your workflow and start tabbing out from parentheses, quotes, and similar contexts today.
    event = "BufEnter",
    config = function()
      require("tabout").setup()
    end,
  },

  {
    "max397574/better-escape.nvim",
    --Escape from insert mode without delay when typing
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "m-demare/hlargs.nvim",
    --Highlight arguments' definitions and usages, asynchronously, using Treesitter
    event = "BufWinEnter",
    config = function()
      require("hlargs").setup()
    end,
  },

  {
    --nvim-hlslens helps you better glance at matched information, seamlessly jump between matched instances.
    --(numbers after search)
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("hlslens").setup()
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    --similar to indent-blankline, this plugin can highlight the indent line,
    --and highlight the code chunk according to the current cursor position.
    event = "BufReadPost",
    config = function()
      require "custom.configs.external.hlchunk"
    end,
  },

  {
    "mrjones2014/nvim-ts-rainbow",
    -- Rainbow delimiters {[()]} for Neovim through Tree-sitter
    event = "BufReadPost",
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    -- shows the context of the currently visible buffer contents
    event = "BufWinEnter",
    config = function()
      require "custom.configs.external.ts-context"
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    -- Intelligently reopen files at your last edit position.
    -- event = "VeryLazy",
    config = function()
      require("custom.configs.external.lastplace").setup()
    end,
    lazy = false,
  },

  {
    "neovim/nvim-lspconfig",
    -- Quickstart configs for Nvim LSP
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    --Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers,
    --DAP servers, linters, and formatters.
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    --The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter
    --in Neovim and to provide some basic functionality such as highlighting based on it
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    --A file explorer tree for neovim written in lua
    opts = overrides.nvimtree,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- Syntax aware text-objects, select, move, swap, and peek support.
    event = "BufWinEnter",
    config = function()
      require "custom.configs.external.textobjects"
    end,
    enabled = false,
  },
  -- Fun ----------------------------------------------------------------------
  {
    "alec-gibson/nvim-tetris",
    cmd = { "Tetris" },
  },

  {
    "wakatime/vim-wakatime",
    --Vim plugin for automatic time tracking and metrics generated from your programming activity.
    event = "InsertEnter",
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
