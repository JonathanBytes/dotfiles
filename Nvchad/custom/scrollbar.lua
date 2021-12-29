vim.api.nvim_command([[
augroup ScrollbarInit
autocmd!
autocmd WinEnter,FocusGained,CursorMoved,VimResized * silent! lua require('scrollbar').show()
autocmd WinLeave,FocusLost,CursorHold               * silent! lua require('scrollbar').clear()
augroup end
]])
vim.g.scrollbar_right_offset = 0
vim.g.scrollbar_highlight = {
  head = NonText,
  body = NonText,
  tail = NonText,
}
vim.g.scrollbar_shape = {
  head = ▖
  body = ▌
  tail = ▘
}
