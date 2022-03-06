-- Add some aliases for Neovim Lua API
local o = vim.o
local wo = vim.wo
local g = vim.g
local cmd = vim.cmd
local env = vim.env

-- Basic Vim Config --------------------------------------------------------------------------------

o.scrolloff  = 10   -- start scrolling when cursor is within 5 lines of the ledge
o.linebreak  = true -- soft wraps on words not individual chars
o.mouse      = 'a'  -- enable mouse support in all modes
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

-- Set UI related options
o.termguicolors   = true
o.showmode        = false -- don't show -- INSERT -- etc.
wo.colorcolumn    = '100' -- show column boarder
wo.number         = true  -- display numberline
wo.relativenumber = true  -- relative line numbers
wo.signcolumn     = 'yes' -- always have signcolumn open to avoid thing shifting around all the time
o.fillchars       = 'stl: ,stlnc: ,vert:·,eob: ' -- No '~' on lines after end of file, other stuff


-- WhichKey maps -----------------------------------------------------------------------------------

-- Define all `<Space>` prefixed keymaps with which-key.nvim
-- https://github.com/folke/which-key.nvim
cmd 'packadd which-key.nvim'
cmd 'packadd! gitsigns.nvim' -- needed for some mappings
local wk = require 'which-key'
wk.setup { plugins = { spelling = { enabled = true } } }

-- Spaced prefiexd in Normal mode
wk.register ({
  -- Tabs
  t = {
    name = '+Tabs',
    n = { '<Cmd>tabnew +term<CR>'  , 'New with terminal' },
    o = { '<Cmd>tabonly<CR>'       , 'Close all other'   },
    q = { '<Cmd>tabclose<CR>'      , 'Close'             },
    l = { '<Cmd>tabnext<CR>'       , 'Next'              },
    h = { '<Cmd>tabprevious<CR>'   , 'Previous'          },
  },

  -- Windows/splits
  ['-']  = { '<Cmd>new +term<CR>'           , 'New terminal below'               },
  ['_']  = { '<Cmd>botright new +term<CR>'  , 'New termimal below (full-width)'  },
  ['\\'] = { '<Cmd>vnew +term<CR>'          , 'New terminal right'               },
  ['|']  = { '<Cmd>botright vnew +term<CR>' , 'New termimal right (full-height)' },
  w = {
    name = '+Windows',
    -- Split creation
    s = { '<Cmd>split<CR>'  , 'Split below'     },
    v = { '<Cmd>vsplit<CR>' , 'Split right'     },
    q = { '<Cmd>q<CR>'      , 'Close'           },
    o = { '<Cmd>only<CR>'   , 'Close all other' },
    -- Navigation
    k = { '<Cmd>wincmd k<CR>' , 'Go up'           },
    j = { '<Cmd>wincmd j<CR>' , 'Go down'         },
    h = { '<Cmd>wincmd h<CR>' , 'Go left'         },
    l = { '<Cmd>wincmd l<CR>' , 'Go right'        },
    w = { '<Cmd>wincmd w<CR>' , 'Go down/right'   },
    W = { '<Cmd>wincmd W<CR>' , 'Go up/left'      },
    t = { '<Cmd>wincmd t<CR>' , 'Go top-left'     },
    b = { '<Cmd>wincmd b<CR>' , 'Go bottom-right' },
    p = { '<Cmd>wincmd p<CR>' , 'Go to previous'  },
    -- Movement
    K = { '<Cmd>wincmd k<CR>' , 'Move to top'              },
    J = { '<Cmd>wincmd J<CR>' , 'Move to bottom'           },
    H = { '<Cmd>wincmd H<CR>' , 'Move to left'             },
    L = { '<Cmd>wincmd L<CR>' , 'Move to right'            },
    T = { '<Cmd>wincmd T<CR>' , 'Move to new tab'          },
    r = { '<Cmd>wincmd r<CR>' , 'Rotate clockwise'         },
    R = { '<Cmd>wincmd R<CR>' , 'Rotate counter-clockwise' },
    -- Resize
    ['='] = { '<Cmd>wincmd =<CR>'            , 'All equal size'   },
    ['-'] = { '<Cmd>resize -5<CR>'           , 'Decrease height'  },
    ['+'] = { '<Cmd>resize +5<CR>'           , 'Increase height'  },
    ['<'] = { '<Cmd><C-w>5<<CR>'             , 'Decrease width'   },
    ['>'] = { '<Cmd><C-w>5><CR>'             , 'Increase width'   },
    ['|'] = { '<Cmd>vertical resize 106<CR>' , 'Full line-lenght' },
  },

  -- Git
  g = {
    name = '+Git',
    -- vim-fugitive
    b = { '<Cmd>Gblame<CR>' , 'Blame'  },
    s = { '<Cmd>Git<CR>'    , 'Status' },
    d = {
      name = '+Diff',
      s = { '<Cmd>Ghdiffsplit<CR>' , 'Split horizontal' },
      v = { '<Cmd>Gvdiffsplit<CR>' , 'Split vertical'   },
    },
    -- gitsigns.nvim
    h = {
      name = '+Hunks',
      s = { require'gitsigns'.stage_hunk      , 'Stage'      },
      u = { require'gitsigns'.undo_stage_hunk , 'Undo stage' },
      r = { require'gitsigns'.reset_hunk      , 'Reset'      },
      n = { require'gitsigns'.next_hunk       , 'Go to next' },
      N = { require'gitsigns'.prev_hunk       , 'Go to prev' },
      p = { require'gitsigns'.preview_hunk    , 'Preview'    },
    },
  },
}, { prefix = ' ' })
