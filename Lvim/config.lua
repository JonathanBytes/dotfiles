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
  "latex",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

----------------------------------------------------
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
  -- Latex live view
  { 'xuhdev/vim-latex-live-preview' },
  -- Fancy error virtual text
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  -- Latex text fold
  { 'matze/vim-tex-fold' },
}
----------------------------------------------------
-- Relative number
vim.opt.rnu = true
-- Word wrap
vim.opt.wrap = true
-- Reduce Bottom gap
vim.opt.cmdheight = 1
-- Rainbow parentesis
lvim.builtin.treesitter.rainbow.enable = true
-- Surround
require("nvim-surround").setup()
-- Renamer
require("renamer").setup()
-- vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
lvim.keys.insert_mode["<F2>"] = { "<cmd>lua require(\"renamer\").rename()<cr>", { noremap = true, silent = true } }
lvim.keys.visual_mode["<leader>rn"] = { "<cmd>lua require(\"renamer\").rename()<cr>", { noremap = true, silent = true } }
lvim.builtin.which_key.mappings["rn"] = { "<cmd>lua require(\"renamer\").rename()<CR>", "Rename" }
-- Colorizer
require 'colorizer'.setup()
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

-- Jump to line :number
require('numb').setup {
  show_numbers = true, -- Enable 'number' for the window while peeking
  show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
  centered_peeking = true, -- Peeked line will be centered relative to window
}
-- Init Hop
require('hop').setup()

-- Bracey config
-- vim.g.bracey_server_allow_remote_connections = 1
-- vim.g.bracey_refresh_on_save = 1
-- vim.g.bracey_server_path = 'https://localhost'

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
lvim.builtin.which_key.mappings["B"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle debug breakpoint" }
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

-- https://www.vim.org/scripts/script.php?script_id=3133

-- Editing default keymapping
lvim.keys.normal_mode["<leader>f"] = false
lvim.keys.normal_mode["<leader>ff"] = ":Telescope find_files<cr>"

-- Own keymapping
vim.cmd [[
nmap <2-LeftMouse> <Plug>(openbrowser-open)
]]
lvim.builtin.which_key.mappings["ss"] = { "<cmd>HopChar2 <cr>", "Hop 2 Char fast motion" } -- Better motion keymap
lvim.keys.normal_mode["<C-s>"] = ":w<cr>" -- Save
lvim.keys.normal_mode["<leader>fn"] = ":ene!<cr>" -- Open new tab
lvim.keys.normal_mode["<C-a>"] = ":%y+<cr>" -- Copy all buffer
lvim.builtin.which_key.mappings["m"] = { "<cmd>MinimapToggle <cr>", "Toggle Minimap" }
-- lvim.keys.normal_mode["<F5>"] = ":w<CR>:ter python3 %<CR>" -- Run python file
lvim.keys.normal_mode["<F6>"] = ":w<CR>:ter mcs % <CR>" -- compile c# file, mono name.exe to run the compiled file
lvim.builtin.which_key.mappings["t"] = { ":ter <CR> i", "Open a terminal" }
lvim.keys.normal_mode["<leader>vt"] = ":vs<CR>:ter <CR> i"
lvim.keys.normal_mode["<leader>ht"] = ":sp<CR>:ter <CR> i"
lvim.keys.normal_mode["<leader>vs"] = ":vs<CR>"
lvim.builtin.which_key.mappings["n"] = { ":set rnu! | :set nu! <CR>", "Toggle numbers sidebar" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_z = {}

require("lsp_lines").setup()
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})
vim.diagnostic.config({ virtual_lines = true })
lvim.lsp.diagnostics.virtual_text = false
----------------------------------------------------
