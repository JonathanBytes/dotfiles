-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>", opt)
map("n", "<leader>q", ":q <CR>", opt)
map("n", "<leader>s", ":HopChar2 <CR>", opt)
map("n", "<leader>f", "/", opt)
-- map("n", "<F5>", ":w<CR>:!python % <CR>", opt)
map("n", "<F5>", ":w<CR>:ter python3 %<CR>", opt)
map("n", "<leader>m", ":MinimapToggle<CR>:MinimapRefresh<CR>", opt)
map("n", "<F9>", ":!mcs % <CR>", opt)

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
