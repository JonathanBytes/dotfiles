-- This is an example init file , its supposed to be placed in /lua/custom dir
-- lua/custom/init.lua

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

local hooks = require "core.hooks"

-- MAPPINGS
-- To add new plugins, use the "setup_mappings" hook,

hooks.add("setup_mappings", function(map)
   map("n", "<leader>cc", ":Telescope <CR>", opt)
   map("n", "<leader>q", ":q <CR>", opt)
   map("n", "<leader>s", ":HopChar2 <CR>", opt)
   map("n", "<leader>f", "/", opt)
   map("n", "<F5>", ":w<CR>:!python % <CR>", opt)
   map("n", "<leader>m", ":MinimapToggle<CR>:MinimapRefresh<CR>", opt)
   map("n", "<F9>", ":!mcs % <CR>", opt)
end)

-- NOTE : opt is a variable  there (most likely a table if you want multiple options),
-- you can remove it if you dont have any custom options

-- Install plugins
-- To add new plugins, use the "install_plugin" hook,

-- examples below:

hooks.add("install_plugins", function(use)
   -- Better motion with search
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup() 
    end
  }
  -- Scrollbar
  use {
    'Xuyuanp/scrollbar.nvim',
    config = scrollbar, 
  }
  -- HTML live server
  use {
    'turbio/bracey.vim',
    config = bracey,
  }
  -- Minimap
  use {
    'wfxr/minimap.vim',
    config = function() 
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 1
      vim.g.minimap_auto_start_win_enter = 1
    end,
  }
  use {
    'OmniSharp/omnisharp-vim'
  }
end)

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
