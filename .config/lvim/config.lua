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
lvim.keys.normal_mode["<leader>ff"] = ":Telescope find_files<cr>"

-- All custom headers
local header = require("headers")
lvim.builtin.alpha.dashboard.section.header.val = header

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
lvim.plugins = require("plugins")
----------------------------------------------------

lvim.keys.insert_mode["<F2>"] = { "<cmd>lua require(\"renamer\").rename()<cr>", { noremap = true, silent = true } }

-- Colorscheme
lvim.colorscheme = "gruvbox-flat"
vim.g.gruvbox_flat_style = "dark"
vim.g.gruvbox_transparent = true

-- Minimap config
vim.g.minimap_width = 8

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

-- Cmdpalette setup keymapping
lvim.keys.normal_mode[":"] = "<cmd>FineCmdline<CR>"

-- Formatters setup
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettierd"
  },
}
