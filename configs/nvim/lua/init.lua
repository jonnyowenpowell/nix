local o = vim.o
local wo = vim.wo
local g = vim.g
local cmd = vim.cmd
local env = vim.env

-- Basic Vim Config --------------------------------------------------------------------------------

o.scrolloff  = 10   -- start scrolling when cursor is within 5 lines of the ledge
o.linebreak  = true -- soft wraps on words not individual chars
o.mouse      = ''   -- no mouse!
o.updatetime = 300
o.autochdir  = true
o.exrc       = true -- allow project specific config in .nvimrc or .exrc files

-- Search and replace
o.ignorecase = true      -- make searches with lower case characters case insensative
o.smartcase  = true      -- search is case sensitive only if it contains uppercase chars
o.inccommand = 'nosplit' -- show preview in buffer while doing find and replace

-- Tab key behavior
o.expandtab  = true      -- Convert tabs to spaces
o.tabstop    = 2         -- Width of tab character
o.shiftwidth = o.tabstop -- Width of auto-indents

-- Set where splits open
o.splitbelow = true -- open horizontal splits below instead of above which is the default
o.splitright = true -- open vertical splits to the right instead of the left with is the default

-- UI ----------------------------------------------------------------------------------------------
o.termguicolors   = true
o.showmode        = false -- don't show -- INSERT -- etc.
wo.colorcolumn    = '100' -- show column boarder
wo.number         = true  -- display numberline
wo.relativenumber = true  -- relative line numbers
wo.signcolumn     = 'yes' -- always have signcolumn open to avoid thing shifting around all the time
o.fillchars       = 'stl: ,stlnc: ,vert:·,eob: ' -- No '~' on lines after end of file, other stuff

vim.cmd 'packadd kanagawa.nvim'

require'kanagawa'.setup {
  undercurl = true,
  commentStyle = 'italic',
  functionStyle = 'NONE',
  keywordStyle = 'italic',
  statementStyle = 'bold',
  typeStyle = 'NONE',
  variablebuiltinStyle = 'italic',
  specialReturn = true,
  specialException = true, 
  transparent = false,
  dimInactive = false,
}

vim.cmd 'colorscheme kanagawa'

vim.cmd 'packadd plenary.nvim'
vim.cmd 'packadd telescope.nvim'

vim.cmd 'packadd nvim-treesitter'
vim.cmd 'packadd guihua.lua'
vim.cmd 'packadd nvim-lspconfig'

require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
}

vim.cmd 'packadd nvim-dap'
vim.cmd 'packadd nvim-dap-ui'
vim.cmd 'packadd nvim-dap-virtual-text'
vim.cmd 'packadd go.nvim'

require'go'.setup {
  goimport='goimports',
  gofmt = 'gopls',
  max_line_len = 120,
  tag_transform = false,
  lsp_cfg = true,
  lsp_gofumpt = true,
  lsp_on_attach = true,
  lsp_codelens = true,
  lsp_diag_hdlr = true,
  dap_debug = true,
  dap_debug_keymap = true,
  dap_debug_gui = true,
  dap_debug_vt = true,
  test_runner = 'richgo',
  run_in_floaterm = true
}
