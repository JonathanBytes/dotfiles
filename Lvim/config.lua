-- general
lvim.log.level = "warn"
lvim.format_on_save = true


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.dap.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "c_sharp",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "html",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = {
  -- Colorscheme
  -- { "sainnhe/gruvbox-material", },
  { "morhetz/gruvbox", },
  -- { 'lifepillar/vim-gruvbox8' },
  { 'eddyekofo94/gruvbox-flat.nvim' },
  { 'p00f/nvim-ts-rainbow',
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
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  {
    'daeyun/vim-matlab',
  },
  {
    'mikea1729/octave.vim'
  },
  -- HTML live server
  {
    "turbio/bracey.vim",
    run = "npm install --prefix server",
    config = function()
      vim.g.bracey_server_allow_remote_connections = 1
      vim.g.bracey_refresh_on_save = 1
    end,
  },
  -- Code minimap
  {
    'wfxr/minimap.vim',
    run = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function()
      -- vim.cmd("let g:minimap_auto_start = 1")
      -- vim.cmd("let g:minimap_auto_start_win_enter = 1")
    end,
  },
  -- Indent line
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent-blankline').setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  },
  -- Simply scrollbar
  {
    'Xuyuanp/scrollbar.nvim',
  },
  -- Debugging tools
  -- { 'mfussenegger/nvim-dap' }, -- already installed on core plugs
  { 'rcarriga/nvim-dap-ui' },
  { 'theHamsta/nvim-dap-virtual-text' },
  { 'nvim-telescope/telescope-dap.nvim' },
  { 'mfussenegger/nvim-dap-python' },
  -- Surrounding ys ds cs (you, delete and change surround)
  { 'kylechui/nvim-surround' },
  -- Numb, jump to line while :number
  { 'nacro90/numb.nvim' },
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  -- Uptime extension wakatime
  { 'wakatime/vim-wakatime' },
  -- Colorizer
  { 'norcalli/nvim-colorizer.lua' },
  -- Open URLs
  { 'tyru/open-browser.vim' },
  -- Liveview html
  { 'tamago324/vim-browsersync' },
  -- Rename names
  { 'filipdutescu/renamer.nvim' },
  { 'kovetskiy/sxhkd-vim' },
}

require 'custom'
