require("lsp.symbols")
require("lsp.diagnostics")

local lsp_keymaps = require("keymappings")
local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.common_on_attach = function(client, bufnr)
	-- Format on save
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end

	-- setup lsp signature options
	require("lsp_signature").on_attach({
		debug = false, -- set to true to enable debug logging
		-- log_path = "debug_log_file_path", -- debug log path
		verbose = false, -- show debug line number
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		-- If you want to hook lspsaga or other signature handler, pls set to false
		doc_lines = 5, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
		-- set to 0 if you DO NOT want any API comments be shown
		-- This setting only take effect in insert mode, it does not affect signature help in normal
		-- mode, 10 by default
		floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
		floating_window_above_cur_line = false, -- try to place the floating above the current line when possible Note:
		-- will set to true when fully tested, set to false will use whichever side has more space
		-- this setting will be helpful if you do not want the PUM and floating win overlap
		fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
		hint_enable = true, -- virtual hint enable
		-- hint_prefix = "🐼 ", -- logo for parameter
		hint_prefix = " ", -- logo for parameter
		hint_scheme = "String",
		use_lspsaga = true, -- set to true if you want to use lspsaga popup
		hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
		max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
		-- to view the hiding contents
		max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
		transpancy = nil, -- set this value if you want the floating windows to be transpant (100 fully transpant), nil to disable(default)
		handler_opts = {
			border = "single", -- double, single, shadow, none
		},
		always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
		auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
		extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
		zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
		padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
		shadow_blend = 36, -- if you using shadow as border use this set the opacity
		shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
		timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
		toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
	}, bufnr)

	-- helper functions for options
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- set LSP keymappings
	lsp_keymaps.setup_lsp_keymaps(bufnr)

	local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

-- Code Action Menu
vim.g.code_action_menu_show_details = true
vim.g.code_action_menu_show_diff = true

-- Rust-tools options (wrapper around rust_analyzer for LSP)
require("rust-tools").setup({
	tools = { -- rust-tools options
		autoSetHints = true,
		hover_with_actions = true,
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			only_current_line = true,
			show_parameter_hints = true,
			parameter_hints_prefix = " ",
			other_hints_prefix = "=> ",
			max_len_align = false,
			-- max_len_align_padding = 1,
			right_align = false,
			-- right_align_padding = 7,
		},
	},
	server = {
		cmd = { "rust-analyzer" },
		on_attach = M.common_on_attach,
		capabilities = capabilities,
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

-- require("lspconfig").rust_analyzer.setup({
-- 	cmd = { "rust-analyzer" },
-- 	on_attach = M.common_on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			-- enable clippy on save
-- 			checkOnSave = {
-- 				command = "clippy",
-- 			},
-- 		},
-- 	},
-- })

-- Lua
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/home/omar/.local/share/nvim/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	on_attach = M.common_on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				-- version = "LuaJIT",
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "use" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- python (pyright)
require("lspconfig").pyright.setup({
	cmd = { "/home/omar/.local/share/nvim/lsp_servers/python/node_modules/.bin/pyright-langserver", "--stdio" },
	filetypes = { "python" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
	single_file_support = true,
})

-- C#
local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
-- local omnisharp_bin = "/home/omar/.local/share/nvim/lspinstall/csharp/omnisharp/run"
-- local omnisharp_bin = "/home/omar/Software/omnisharp/omnisharp-linux-x64/run"
-- local omnisharp_bin = "/home/omar/software/omnisharp/omnisharp-mono/OmniSharp.exe"
local omnisharp_bin = "/home/omar/software/omnisharp-roslyn/artifacts/publish/OmniSharp.Stdio.Driver/mono/OmniSharp.exe"
-- on Windows
-- local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"
require("lspconfig").omnisharp.setup({
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	-- root_dir = require("lspconfig").util.root_pattern("*.csproj", "*.sln"),
	-- root_dir = require("lspconfig").util.root_pattern(".sln") or require("lspconfig").util.root_pattern(".csproj"),
	on_attach = M.common_on_attach,
})

-- C++
local custom_clangd_attach = function()
	-- M.common_on_attach(client, bufnr)
	require("clang-tidy").setup({
		on_attach = M.common_on_attach,
		checks = { "*" },
		args = {
			"--extra-arg='std=c++17'",
		},
	})
	require("clang-tidy").run()
end

require("lspconfig").clangd.setup({
	-- on_attach = custom_clangd_attach,
	on_attach = M.common_on_attach,
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
	filetypes = { "c", "cpp", "objc", "objcpp" },
	single_file_support = true,
})

-- SQL: doesn't support a lot of features, deactivate it for now
-- require("lspconfig").sqlls.setup({
-- 	cmd = { "sql-language-server", "up", "--method", "stdio" },
-- 	on_attach = M.common_on_attach,
-- })

-- Custom SQL formatter using https://github.com/darold/pgFormatter
-- See also https://www.postgresql.org/about/news/pgformatter-v50-released-2166/
-- This creates a custom null-ls builtin.
-- TODO: submit a PR to https://github.com/zeroturnaround/sql-formatter
local pgformatter = require("null-ls.helpers").make_builtin({
	method = require("null-ls").methods.FORMATTING, -- internal null-ls method (string)
	filetypes = { "sql" }, -- table
	generator_opts = {
		command = "pg_format",
		args = {
			"--spaces",
			"2", -- change space indent, default 4 spaces.
			"--keyword-case", -- case for reserved keywords
			"2", -- Values: 0=>unchanged, 1=>lowercase, 2=>uppercase, 3=>capitalize
			"--type-case", -- case for data type names
			"2", -- Values: 0=>unchanged, 1=>lowercase, 2=>uppercase, 3=>capitalize
			"--function-case", -- case for reserved keywords (functions)
			"2", -- Values: 0=>unchanged, 1=>lowercase, 2=>uppercase, 3=>capitalize
			"--no-extra-line",
			-- "--comma-break",
			-- "--wrap-comment",
			"-", -- use stdin
		},
		to_stdin = true,
	}, -- table
	factory = require("null-ls.helpers").formatter_factory, -- function (optional)
})

-- null-ls (formatting)
require("null-ls").setup({
	on_attach = M.common_on_attach,
	sources = {
		pgformatter,
		-- require("null-ls").builtins.formatting.clang_format, -- not required because LSP handles it
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.shfmt, -- bash support
		-- require("null-ls").builtins.formatting.rustfmt,
		require("null-ls").builtins.formatting.prettier.with({
			command = "prettier",
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
				"css",
				"scss",
				"html",
				"json",
				"yaml",
				"markdown",
				"toml",
			},
		}),
	},
})

return M
