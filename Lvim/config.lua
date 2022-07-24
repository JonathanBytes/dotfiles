--[[
lvim is the global options objectupdatetime

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true

--------------------------------
-- Relative number
vim.opt.rnu = true
-- Word wrap
vim.opt.wrap = true
-- Rainbow parentesis
lvim.builtin.treesitter.rainbow.enable = true
-- Surround
require("nvim-surround").setup()
-- Spelling
lvim.builtin.which_key.mappings["o"] = { "<cmd>set spell!<CR>", "Toggle word spelling" }
vim.opt.spelllang = { 'es' }

-- Colorscheme
lvim.colorscheme = "gruvbox-flat"
vim.g.gruvbox_flat_style = "dark"
vim.g.gruvbox_transparent = true
-- vim.cmd("let g:gruvbox_material_background= 'medium'")
-- vim.cmd("let g:gruvbox_material_foreground= 'mix'")
-- vim.cmd("let g:gruvbox_contrast_dark= 'medium'")

-- Minimap config
vim.cmd("let g:minimap_width = 8")
-- vim.cmd("let g:minimap_close_filetypes = ['nvim-tree']")

-- Scrollbar setup
vim.cmd [[
augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
]]

-- Debugging setup
lvim.builtin.dap.active = true
lvim.keys.normal_mode["<F5>"] = ":lua require'dap'.continue()<CR>"
lvim.keys.normal_mode["<F10>"] = ":lua require'dap'.step_over()<CR>"
lvim.keys.normal_mode["<F11>"] = ":lua require'dap'.step_into()<CR>"
lvim.keys.normal_mode["<F12>"] = ":lua require'dap'.step_out()<CR>"
lvim.keys.normal_mode["<leader>B"] = ":lua require'dap'.toggle_breakpoint()<CR>"
lvim.keys.normal_mode["<leader>dv"] = ":lua require'dapui'.toggle()<CR>"

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dapui').setup()
require('nvim-dap-virtual-text').setup()
local dap = require('dap')

-- C# setup for dap
dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/bin/netcoredbg',
  args = { '--interpreter=vscode' }
}
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}
-- JS setup for dap
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },
}

-- Editing default keymapping
lvim.keys.normal_mode["<leader>f"] = false
lvim.keys.normal_mode["<leader>ff"] = ":Telescope find_files<cr>"

-- Own keymapping
lvim.builtin.which_key.mappings["ss"] = { "<cmd>HopChar2 <cr>", "Hop 2 Char fast motion" } -- Better motion keymap
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>fn"] = ":ene!<cr>"
lvim.keys.normal_mode["<C-a>"] = ":%y+<cr>"
lvim.builtin.which_key.mappings["m"] = { "<cmd>MinimapToggle <cr>", "Toggle Minimap" }
-- lvim.keys.normal_mode["<F5>"] = ":w<CR>:ter python3 %<CR>"
lvim.keys.normal_mode["<F6>"] = ":w<CR>:ter mcs % <CR>" -- mono name.exe to run the compiled file
lvim.keys.normal_mode["<leader>t"] = ":ter <CR> i"
lvim.keys.normal_mode["<leader>vt"] = ":vs<CR>:ter <CR> i"
lvim.keys.normal_mode["<leader>ht"] = ":sp<CR>:ter <CR> i"
lvim.keys.normal_mode["<leader>vs"] = ":vs<CR>"
lvim.keys.normal_mode["<leader>n"] = ":set rnu! | :set nu! <CR>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
--------------------------------

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

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

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

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
      require('hop').setup()
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

}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
