-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
vim.opt.rnu = true                                                                       -- Relative number
vim.opt.wrap = true                                                                      -- Word wrap
vim.opt.cmdheight = 1                                                                    -- Reduce Bottom gap
lvim.builtin.treesitter.rainbow.enable = true                                            -- Rainbow parentesis
lvim.builtin.which_key.mappings["o"] = { "<cmd>set spell!<CR>", "Toggle word spelling" } -- Spelling
vim.opt.spelllang = { 'es' }                                                             -- Spelling

-- Editing default keymapping
lvim.keys.normal_mode["<leader>f"] = false
lvim.keys.normal_mode["<leader>fn"] = ":ene!<cr>" -- Open new tab
-- lvim.keys.normal_mode["<leader>ff"] = ":Telescope find_files<cr>"

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
  "java",
  "yaml",
  "latex",
  "arduino",
}

----------------------------------------------------
-- Additional Plugins
lvim.plugins = {
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
    'Xuyuanp/scrollbar.nvim',
    event = 'VeryLazy',
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
    build = "cd app && pnpm install",
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
----------------------------------------------------

lvim.keys.insert_mode["<F2>"] = { "<cmd>lua require(\"renamer\").rename()<cr>", { noremap = true, silent = true } }

-- Colorscheme
lvim.colorscheme = "gruvbox-flat"
vim.g.gruvbox_flat_style = "dark"
vim.g.gruvbox_transparent = true

-- Minimap config
vim.cmd("let g:minimap_width = 8")

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
lvim.keys.normal_mode["<F5>"] = ":lua require'dap'.continue()<CR>"
lvim.keys.normal_mode["<F10>"] = ":lua require'dap'.step_over()<CR>"
lvim.keys.normal_mode["<F11>"] = ":lua require'dap'.step_into()<CR>"
lvim.keys.normal_mode["<F12>"] = ":lua require'dap'.step_out()<CR>"
lvim.builtin.which_key.mappings["B"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle debug breakpoint" }
lvim.keys.normal_mode["<leader>dv"] = ":lua require'dapui'.toggle()<CR>"
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

-- Own keymapping
lvim.keys.normal_mode["<C-enter>"] = ":w<cr> :TexlabBuild<cr>" -- Save
vim.cmd [[
nmap <2-LeftMouse> <Plug>(openbrowser-open)
]]

lvim.builtin.which_key.mappings["ss"] = { "<cmd>HopChar2 <cr>", "Hop 2 Char fast motion" } -- Better motion keymap
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"                                                  -- Save
lvim.keys.normal_mode["<C-a>"] = ":%y+<cr>"                                                -- Copy all buffer
lvim.builtin.which_key.mappings["m"] = { "<cmd>MinimapToggle <cr>", "Toggle Minimap" }
-- lvim.keys.normal_mode["<F5>"] = ":w<CR>:ter python3 %<CR>" -- Run python file
lvim.keys.normal_mode["<F6>"] = ":w<CR>:ter mcs % <CR>" -- compile c# file, mono name.exe to run the compiled file
lvim.builtin.which_key.mappings["t"] = { ":ter <CR> i", "Open a terminal" }
lvim.keys.normal_mode["<leader>vt"] = ":vs<CR>:ter <CR> i"
lvim.keys.normal_mode["<leader>ht"] = ":sp<CR>:ter <CR> i"
lvim.keys.normal_mode["<leader>vs"] = ":vs<CR>"
lvim.keys.normal_mode["<leader>hs"] = ":horizontal split<CR>"
lvim.builtin.which_key.mappings["n"] = { ":set rnu! | :set nu! <CR>", "Toggle numbers sidebar" }
lvim.keys.normal_mode["<S-l>"] = ":bnext<cr>"
lvim.keys.normal_mode["<S-h>"] = ":bprev<cr>"
lvim.builtin.which_key.mappings["bc"] = { "<cmd>ColorizerReloadAllBuffers <cr>", "Reload colorizer" }

lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

-- Lualine config

lvim.builtin.lualine.sections.lualine_a = { "mode" }
local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_x = {
  {
    'copilot',
    -- Default values
    symbols = {
      status = {
        hl = {
          enabled = "#84a45a",
          sleep = "#8ec07c",
          disabled = "#83a598",
          warning = "#fe8019",
          unknown = "#fb4934",
        }
      },
      spinners = require("copilot-lualine.spinners").dots,
      spinner_color = "#d3869b",
    },
    show_colors = true,
    show_loading = true
  },
  components.diagnostics,
  "ex.lsp.all",
  -- components.lsp,
  components.filetype,
}
lvim.builtin.lualine.sections.lualine_y = {}
lvim.builtin.lualine.sections.lualine_z = { { "ex.location", pattern = '%3L:%-2C' } }

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})
vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({ virtual_text = false })

lvim.keys.normal_mode["<leader>se"] = ":Telescope emoji<CR>"

-- Copilot setup
lvim.keys.normal_mode["<leader>gt"] = ":Copilot suggestion toggle_auto_trigger<CR>"
-- Copilot setup end

-- Cmdpalette setup keymapping
lvim.keys.normal_mode[":"] = "<cmd>FineCmdline<CR>"

-- Formatters setup
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettierd"
  },
}
