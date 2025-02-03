return {
  -- Colorscheme
  { 'eddyekofo94/gruvbox-flat.nvim' },
  {
    'p00f/nvim-ts-rainbow',
    event = 'VeryLazy',
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          -- ...
        },
        -- ...
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        }
      }
    end
  },
  -- Easymotion
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  -- Code minimap
  {
    'wfxr/minimap.vim',
    event = "VeryLazy",
    build = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function()
      -- vim.cmd("let g:minimap_auto_start = 1")
      -- vim.cmd("let g:minimap_auto_start_win_enter = 1")
    end,
  },
  -- Indent line
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { scope = { enabled = true }, } },
  -- Simply scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup()
    end
  },
  -- Debugging tools
  { 'theHamsta/nvim-dap-virtual-text' },
  { 'nvim-telescope/telescope-dap.nvim' },
  { 'mfussenegger/nvim-dap-python' },
  -- Surrounding ys ds cs (you, delete and change surround)
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  -- Numb, jump to line while :number
  {
    'nacro90/numb.nvim',
    event = 'VeryLazy',
    config = function()
      require('numb').setup {
        show_numbers = true,     -- Enable 'number' for the window while peeking
        show_cursorline = true,  -- Enable 'cursorline' for the window while peeking
        number_only = false,     -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking = true, -- Peeked line will be centered relative to window
      }
    end
  },
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && bun install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- Uptime extension wakatime
  { 'wakatime/vim-wakatime' },
  -- Colorizer
  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = function()
      require 'colorizer'.setup()
    end
  },
  -- Open URLs
  { 'tyru/open-browser.vim', event = 'InsertEnter' },
  -- Rename names
  {
    'filipdutescu/renamer.nvim',
    config = function()
      require("renamer").setup()
    end
  },
  -- Fancy error virtual text
  {
    url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require("lsp_lines").setup()
    end,
  },
  -- Latex text fold
  { 'matze/vim-tex-fold' },
  -- Better escape
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- Discord rich presence
  { 'andweeb/presence.nvim' },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
          keymap = {
            accept = "<c-l>",
            next = "<c-j>",
            prev = "<c-k>",
            dismiss = "<c-h>",
          },
        },
        panel = {
          enabled = false,
        },
        filetypes = {
          ["*"] = true,
          ["css"] = true,
        }
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
    fix_pairs = true,
  },
  { 'AndreM222/copilot-lualine' },
  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      { 'MunifTanjim/nui.nvim' }
    }
  },
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    event = "VeryLazy",
    config = function()
      require("package-info").setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'dokwork/lualine-ex' },
      { 'nvim-lua/plenary.nvim' },
    }
  },
}
