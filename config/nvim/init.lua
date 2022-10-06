local config = {

  updater = {
    remote = "origin",
    channel = "stable",
    version = "v1.7.*",
    pin_plugins = true,
    skip_prompts = true,
    show_changelog = false,
  },

  -- Set colorscheme
  colorscheme = "catppuccin",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = true, -- sets vim.opt.relativenumber
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
          vim.g.catppuccin_flavour = "latte"
        end
      },
      {
        "fatih/vim-go",
        config = function()
          vim.g.go_doc_balloon = 1
          vim.g.go_def_mapping_enabled = 0
          vim.g.go_updatetime = 200
          vim.g.go_test_show_name = 1
          vim.g.go_metalinter_autosave = 0
          vim.g.go_mod_fmt_autosave = 0
          vim.g.go_asmfmt_autosave = 0
          vim.g.go_fmt_autosave = 0
          vim.g.go_imports_autosave = 0
          vim.g.go_auto_sameids = 1
          vim.g.go_test_timeout = "20s"
          vim.g.go_term_enabled = 1
          vim.g.go_term_mode = "vsplit"
          vim.g.go_term_reuse = 1
          vim.g.go_gorename_prefill = ""
          vim.g.go_term_close_on_exit = 0
        end
      },
      { "junegunn/fzf" },
      {
        "junegunn/fzf.vim",
        run = function()
          vim.fn['fzf#install']()
        end
      },
      { "towolf/vim-helm" },
      {
        "dylanaraps/root.vim",
        config = function()
          vim.g["root#auto"] = 1
          vim.g["root#echo"] = 0
        end
      },
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      local null_ls = require "null-ls"
      config.sources = {
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
      }
      -- set up null-ls's on_attach function to format on save
      config.on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = function()
              vim.lsp.buf.formatting_sync { async = true }
            end,
          })
        end
      end
      return config -- return final config table
    end,
    packer = {
      compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    },
    treesitter = {
      ensure_installed = "all",
      ignore_install = { "phpdoc" },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
          ["i"] = {
            name = "vim-go",
            -- Compiler commands
            ["B"] = { "<cmd>GoBuild<cr>", "GoBuild" },
            ["G"] = { "<cmd>GoGenerate<cr>", "GoGenerate" },
            ["R"] = { "<cmd>GoRun<cr>", "GoRun" },
            -- Testing commands
            ["A"] = { "<cmd>GoAlternate<cr>", "GoAlternate" },
            ["C"] = { "<cmd>GoCoverageToggle<cr>", "Toggle GoCoverage" },
            ["F"] = { "<cmd>GoTestFunc %:p:h<cr>", "GoTestFunc" },
            ["T"] = { "<cmd>GoTest %:p:h<cr>", "GoTest" },
            -- Tooling commands
            ["L"] = { "<cmd>GoMetaLinter<cr>", "GoMetaLinter" },
            ["g"] = {
              name = "Guru",
              ["s"] = { "<cmd>GoGuruScope \"\"<cr>", "Reset GoGuruScope" },
              ["S"] = { "<cmd>GoGuruScope ...<cr>", "Workspace GoGuruScope" },
            },
            -- Analysis commands
            ["c"] = { "<cmd>GoCallstack<cr>", "GoCallstack" },
            ["D"] = { "<cmd>GoDescribe<cr>", "GoDescribe" },
            ["h"] = { "<cmd>GoDoc<cr>", "GoDoc" },
            ["H"] = { "<cmd>GoDocBrowser<cr>", "GoDocBrowser" },
            ["i"] = { "<cmd>GoInfo<cr>", "GoInfo" },
            ["j"] = { "<cmd>GoImplements<cr>", "GoImplements" },
            ["P"] = { "<cmd>GoPointsTo<cr>", "GoPointsTo" },
            ["u"] = { "<cmd>GoReferrers<cr>", "GoReferrers" },
            ["w"] = { "<cmd>GoWhicherrs<cr>", "GoWhicherrs" },
            ["x"] = { "<cmd>GoCallers<cr>", "GoCallers" },
            ["X"] = { "<cmd>GoCallees<cr>", "GoCallees" },
            ["y"] = { "<cmd>GoChannelPeers<cr>", "GoChannelPeers" },
            -- Movement commands
            ["d"] = { "<cmd>GoDef<cr>", "GoDef"},
            ["p"] = { "<cmd>GoDefPop<cr>", "GoDefPop"},
            ["s"] = { "<cmd>GoDefStack<cr>", "GoDefStack"},
            -- Code commands
            ["e"] = { "<cmd>GoIfErr<cr>", "GoIfErr" },
            ["f"] = { "<cmd>GoFillStruct<cr>", "GoFillStruct" },
            ["I"] = { "<cmd>GoImpl<cr>", "GoImpl" },
            ["k"] = { "<cmd>GoKeyify<cr>", "GoKeyify" },
            ["r"] = { "<cmd>GoRename<cr>", "GoRename" },
          },
          ["r"] = { "<cmd>w !fish<cr>", "Run" },
          ["tr"] = { function() astronvim.toggle_term_cmd "rlwrap yaegi" end, "Go (yaegi)" },
        },
      },
      v = {
        ["<leader>"] = {
          ["r"] = { "<cmd>'<,'>ToggleTermSendVisualLines<cr>", "Run in ToggleTerm" },
          ["i"] = {
            name = "vim-go",
            -- Analysis commands
            ["f"] = { "<cmd>'<,'>GoFreevars<cr>", "GoFreevars" },
          },
        },
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      gopls = {
         on_attach = function(client, _)
           client.resolved_capabilities.document_formatting = false
         end
       }
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- This function is run last
  -- good place to configuring augroups/autocommands and custom filetypes
  polish = function()
    -- Set key binding
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

-- additional filetypes
vim.filetype.add({
  filename = {
    ["Tiltfile"] = "python",
  },
})

return config
