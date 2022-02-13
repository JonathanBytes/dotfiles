-- This is an example chadrc file , its supposed to be placed in /lua/custom/

local M = {}

---- UI -----

M.ui = {
   hl_override = "", -- path of your file that contains highlights
   italic_comments = true,
   theme = "gruvbox", -- default theme
   transparency = false,
}

-- Install plugins
local userPlugins = require "custom.plugins" -- path to table

M.plugins = {
   install = userPlugins,
  
   status = {
      blankline = true, -- indentline stuff
      bufferline = true, -- manage and preview opened buffers
      colorizer = true, -- color RGB, HEX, CSS, NAME color codes
      comment = true, -- easily (un)comment code, language aware
      dashboard = true,
      better_escape = true, -- map to <ESC> with no lag
      feline = true, -- statusline
      gitsigns = true,
      lspsignature = false, -- lsp enhancements
      telescope_media = false,
      vim_matchup = true, -- improved matchit
      cmp = true,
      nvimtree = true,
      autopairs = true,
   },
   
   options = {
      autopairs = { loadAfter = "nvim-cmp" },
      lspconfig = {
         setup_lspconf = "", -- path of file containing setups of different lsps
      },
      nvimtree = {
         enable_git = 0,

         ui = {
            allow_resize = true,
            side = "left",
            width = 25,
            hide_root_folder = true,
         },
      },
      luasnip = {
         snippet_path = {},
      },
      statusline = {
         -- hide, show on specific filetypes
         hidden = {
            "help",
            "dashboard",
            "NvimTree",
            "terminal",
            "minimap",
         },
         shown = {},

         -- truncate statusline on small screens
         shortline = true,
         style = "block", -- default, round , slant , block , arrow
      },
      esc_insertmode_timeout = 300,
   },
   default_plugin_config_replace = {
    feline = "custom.feline",
    nvim_tree = "custom.nvimtree",
    nvim_treesitter = {
      ensure_installed = {
         "html",
         "css",
         "python",
         "javascript",
         "c_sharp",
         "lua",
         "json",
         "yaml",
         "vim",
         "bash",
         "ruby",
         "rust",
      },
    },
    nvim_colorizer = "custom.nvim_colorizer",
   },
}

M.mappings.plugins = {
   comment = {
      toggle = "<leader>c",
   },
   nvimtree = {
      toggle = "<leader>e",
      focus = "<C-n>",
   },
}

return M
