-- kanagawa.nvim
-- https://github.com/rebelot/kanagawa.nvim
vim.cmd 'packadd kanagawa.nvim'

require'kanagawa'.setup {
    undercurl = true,
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,
    specialException = true, 
    transparent = false,
    dimInactive = false,
}

cmd 'colorscheme kanagawa'
