-- go.nvim
-- https://github.com/ray-x/go.nvim
vim.cmd 'packadd go.nvim'
vim.cmd 'packadd nvim-dap'
vim.cmd 'packadd nvim-dap-ui'
vim.cmd 'packadd nvim-dap-virtual-text'

require'go'.setup {
  goimport='goimport',
  gofmt = 'gofumpt',
  max_line_len = 120,
  tag_transform = false, -- tag_transfer  check gomodifytags for details
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
