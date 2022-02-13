-- Example plugins file!
-- (suggestion) -> lua/custom/plugins/init.lua or anywhere in custom dir

return {
  {
  -- Better motion with search
    "phaazon/hop.nvim",
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup() 
    end
  },
  {
  -- HTML live server
    "turbio/bracey.vim",
    config = function()   
      vim.g.bracey_server_allow_remote_connections = 1
      vim.g.bracey_refresh_on_save = 1
    end,
  },
  {
  -- Minimap
    'wfxr/minimap.vim',
    config = function() 
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 1
      vim.g.minimap_auto_start_win_enter = 1
    end,
  },
  {
  -- C# plugin
    'OmniSharp/omnisharp-vim',
  },
  {
  -- CSS colorizer
    'ap/vim-css-color',
  },
  {
  -- Autocomplete
    'neoclide/coc.nvim',
    branch = 'release',
  },
  {
  -- Custom colorscheme
    'lifepillar/vim-gruvbox8',
    config = function()
     vim.cmd("colorscheme gruvbox8")
    end,
  },
}
