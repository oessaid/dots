return {
  -- LSP support
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim" },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { "jose-elias-alvarez/null-ls.nvim" },
      -- Rust
      { "simrat39/rust-tools.nvim" },
      {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
      },
      { "hrsh7th/nvim-cmp" },
      { "j-hui/fidget.nvim" },
      { "SmiteshP/nvim-navic" },
    },
    config = function()
      require("fidget").setup {}

      local navic = require("nvim-navic")
      navic.setup {
        icons = {
          File = ' ',
          Module = ' ',
          Namespace = ' ',
          Package = ' ',
          Class = ' ',
          Method = ' ',
          Property = ' ',
          Field = ' ',
          Constructor = ' ',
          Enum = ' ',
          Interface = ' ',
          Function = ' ',
          Variable = ' ',
          Constant = ' ',
          String = ' ',
          Number = ' ',
          Boolean = ' ',
          Array = ' ',
          Object = ' ',
          Key = ' ',
          Null = ' ',
          EnumMember = ' ',
          Struct = ' ',
          Event = ' ',
          Operator = ' ',
          TypeParameter = ' '
        }
      }

      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "lua_ls",
          "clangd",
          "cmake",
          "dockerls",
          "pyright",
        },
      })

      vim.lsp.handlers["textDocument/hover"] =
          vim.lsp.with(
            vim.lsp.handlers.hover,
            {
              border = "rounded"
            }
          )

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local lsp_attach = function(client, bufnr)
        -- Location in file
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end

        -- Format on save
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end

        -- Keymaps
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local opts = { noremap = true, silent = true }

        buf_set_keymap("n", "<leader>?",
          "<cmd> lua vim.diagnostic.open_float(nil, {focusable=false, source='always', border='rounded'})<cr>",
          opts)
        buf_set_keymap("n", "<leader>ss", ":SymbolsOutline<cr>", opts)

        buf_set_keymap("n", "<leader>sa", "<cmd> lua vim.lsp.buf.code_action()<cr>", opts)

        buf_set_keymap("n", "<leader>sd",
          "<cmd>lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor({}))<cr>",
          opts)
        buf_set_keymap("n", "<leader>si",
          "<cmd>lua require('telescope.builtin').lsp_implementations(require('telescope.themes').get_cursor({}))<cr>",
          opts)
        buf_set_keymap("n", "<leader>st",
          "<cmd>lua require('telescope.builtin').lsp_type_definitions(require('telescope.themes').get_cursor({}))<cr>",
          opts)
        buf_set_keymap("n", "<leader>sr",
          "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor({}))<cr>",
          opts)
        -- buf_set_keymap("n", "<leader>so",
        --   "<cmd>lua require('telescope.builtin').lsp_outgoing_calls(require('telescope.themes').get_cursor({}))<cr>",
        --   opts)
        -- buf_set_keymap("n", "<leader>si",
        --   "<cmd>lua require('telescope.builtin').lsp_incoming_calls(require('telescope.themes').get_cursor({}))<cr>",
        --   opts)

        buf_set_keymap("n", "<leader>sn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        buf_set_keymap("n", "<leader>s?", ":TroubleToggle document_diagnostics<cr><cr>", opts)
        buf_set_keymap("n", "<leader>sj", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
        buf_set_keymap("n", "<leader>sk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
      end

      require("neodev").setup()
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Documentation in toml specification (Rust crates)
      local function show_documentation()
        local filetype = vim.bo.filetype
        if vim.tbl_contains({ 'vim', 'help' }, filetype) then
          vim.cmd('h ' .. vim.fn.expand('<cword>'))
        elseif vim.tbl_contains({ 'man' }, filetype) then
          vim.cmd('Man ' .. vim.fn.expand('<cword>'))
        elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
          require('crates').show_popup()
        else
          vim.lsp.buf.hover()
        end
      end

      vim.keymap.set("n", "<leader><leader>", show_documentation, { noremap = true, silent = true })

      local null_ls = require("null-ls")
      null_ls.setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        sources = {
          null_ls.builtins.formatting.buf,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.taplo,
          null_ls.builtins.formatting.prettier.with({
            command = "prettier",
          }),
          null_ls.builtins.diagnostics.eslint,
        },
      })

      require("lspconfig").clangd.setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--suggest-missing-includes",
          -- -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
          -- -- to add more checks, create .clang-tidy file in the root directory
          -- -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
          "--clang-tidy",
          "--completion-style=bundled",
          "--cross-file-rename",
          "--header-insertion=iwyu",
        },
        init_options = {
          clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
          usePlaceholders = true,
          completeUnimported = true,
          semanticHighlighting = true,
        },
        filetypes = { "c", "cpp" },
        single_file_support = true,
      })

      require("lspconfig").lua_ls.setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      require("rust-tools").setup({
        tools = {
          -- rust-tools options
          autoSetHints = true,
          runnables = {
            use_telescope = true,
          },
          inlay_hints = {
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = " ",
            other_hints_prefix = "→ ",
            max_len_align = false,
            -- max_len_align_padding = 1,
            right_align = false,
            -- right_align_padding = 7,
          },
        },
        server = {
          cmd = { "rust-analyzer" },
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
          settings = {
                ["rust-analyzer"] = {
              -- enable clippy on save
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      })

      require("crates").setup({
        null_ls = {
          enabled = false,
          name = "crates",
        },
        popup = {
          show_version_date = true,
        }
      })
    end
  },
}
