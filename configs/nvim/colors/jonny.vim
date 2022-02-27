" Colorscheme build in Lua with `lush.nvim`, modeled initially on Solarized, but intended to be
" usable with alternate colors.
" Still early days, with lots of work needed
" See `../lua/lush-theme/jonny.lua`
let g:colors_name = 'jonny'

" Load colorscheme
lua require'jonny.theme'.loadColorscheme()
