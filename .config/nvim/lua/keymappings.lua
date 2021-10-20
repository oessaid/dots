local utils = require("utils")

-- utils.map("n", "<C-l>", "<cmd>noh<CR>") -- Clear highlights
utils.map("i", "jk", "<Esc>") -- jk to escape

-- general maps
utils.map("n", "st", ":tab split<CR>")
utils.map("n", "<leader>\\", "<C-W>v")
utils.map("n", "<leader>-", "<C-W>s")
utils.map("n", "<leader>=", "<C-W>=")

-- Navigation
utils.map("n", "<leader><S-j>", "<C-W><S-J>")
utils.map("n", "<leader><S-k>", "<C-W><S-K>")
utils.map("n", "<leader><S-l>", "<C-W><S-L>")
utils.map("n", "<leader><S-h>", "<C-W><S-H>")
utils.map("n", "<leader>j", "<C-W><C-J>")
utils.map("n", "<leader>k", "<C-W><C-K>")
utils.map("n", "<leader>l", "<C-W><C-L>")
utils.map("n", "<leader>h", "<C-W><C-H>")
utils.map("n", "<C-j>", "<C-d>")
utils.map("n", "<C-k>", "<C-u>")

-- copy pasting
vim.cmd('nnoremap <leader>y "+y')
vim.cmd('vnoremap <leader>y "+y')

-- LSP saga scrolling
-- utils.map("n", "<C-j>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- utils.map("n", "<C-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

-- Telescope
-- utils.map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>")
-- utils.map("n", "<leader>fif", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
-- utils.map("n", "<leader>/", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")
-- utils.map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>")
-- utils.map("n", "<leader>fib", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>")
-- utils.map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
-- utils.map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

-- Bookmarks
-- utils.map("n", "<leader>xx", "<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>")

-- explore available pickers
-- utils.map("n", "<leader>pp", "<cmd>lua require('telescope.builtin').builtin()<cr>")

-- nvim-tree
-- utils.map("n", "<leader>ee", ":NvimTreeFocus<CR>")
-- utils.map("n", "<leader>er", ":NvimTreeRefresh<CR>")

-- git
-- utils.map("n", "<leader>gs", ":Git<CR>")
-- utils.map("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>")
-- utils.map("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>")
-- utils.map("n", "<leader>gd", ":DiffviewOpen<cr>")
-- utils.map("n", "<leader>gh", ":DiffviewFileHistory<cr>")

-- floating terminal
-- utils.map("n", "<leader>tt", ":ToggleTerm<cr>")

-- DAP (debugger)
-- utils.map("n", "<leader>fd", "<cmd>lua require('telescope').extensions.dap.commands()<cr>")
-- utils.map("n", "<leader>dr", "<cmd>lua require('dapui').toggle()<cr>")
-- utils.map("n", "<leader>dp", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
-- utils.map("n", "<leader>dd", "<cmd>lua require('dap').continue()<cr>")
-- utils.map("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>")
-- utils.map("n", "<leader>do", "<cmd>lua require('dap').step_over()<cr>")
-- utils.map("n", "<leader>dx", "<cmd>lua require('dap').repl.open()<cr>")

-- LSP related keymaps
local M = {}

-- This is defined here to put all keymappings in one place, but actually
-- it's loaded inside the `on_attach` function in the LSP setup
M.setup_lsp_keymaps = function(bufnr)
	-- helper functions for options/keymaps
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- buf_set_keymap("n", "<leader><leader>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- buf_set_keymap("n", "<leader>*", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
	-- buf_set_keymap("n", "<leader>?", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
	-- buf_set_keymap("n", "<leader>z", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
	-- buf_set_keymap("n", "<leader>a", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
	-- buf_set_keymap("n", "<leader>ss", ":SymbolsOutline<CR>", opts)
	-- buf_set_keymap("n", "<leader>bb", "<cmd>TroubleToggle lsp_document_diagnostics<cr>", opts)
	-- buf_set_keymap("n", "<leader>d", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<cr>", opts)
	-- buf_set_keymap("n", "<leader>tt", "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<cr>", opts)

	-- buf_set_keymap("n", "<leader><leader>", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- buf_set_keymap("n", "<leader>?", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	-- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	-- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	-- buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	-- buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	-- buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	-- buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	-- buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	-- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

return M
