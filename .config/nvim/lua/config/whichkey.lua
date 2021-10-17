local wk = require("which-key")
wk.setup({
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
		registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = false, -- default bindings on <c-w>
			nav = false, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		["<cr>"] = "RET",
		["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_nowait = { "<leader>", "<space>" },
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

wk.register({
	["#"] = { "!!toilet -f pagga<CR>", "Make line pretty" },
	["/"] = {
		"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({layout_strategy='bottom_pane'})<cr>",
		"Search (Buffer)",
	},
	["<space>"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP: Definition" },
	["?"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP: Hover" },
	["*"] = {
		"<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor({}))<CR>",
		"LSP: References",
	},
	["w"] = { ":e ~/todo.md<CR>", "TODO List" },
	e = {
		name = "File Tree",
		e = { ":NvimTreeFocus<CR>", "Open" },
		r = { ":NvimTreeRefresh<CR>", "Refresh" },
	},
	b = {
		name = "Debugger",
		f = { "<cmd>lua require('telescope').extensions.dap.commands()<cr>", "Commands" },
		t = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle" },
		p = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Breakpoint" },
		c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
		i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
		x = { "<cmd>lua require('dap').repl.open()<cr>", "Execute (REPL)" },
		r = { ":RustDebuggables<cr>", "Rust: Debuggables" },
	},
	t = { ":ToggleTerm<cr>", "Terminal" },
	s = {
		name = "LSP",
		["?"] = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})<cr>", "Diagnostics (Line)" },
		a = {
			"<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>",
			"Actions",
		},
		s = { ":SymbolsOutline<CR>", "Symbols" },
		d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Diagnostics (Buffer)" },
		D = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Diagnostics (Workspace)" },
		r = {
			name = "Rust",
			r = { ":RustRunnables<cr>", "Rust: Runnables" },
			["?"] = { "<cmd>lua require'rust-tools.hover_actions'.hover_actions()<cr>", "Rust: Hover Actions" },
		},
	},
	f = {
		name = "Find", -- optional group name
		f = {
			"<cmd>lua require('telescope.builtin').find_files({hidden=true, no_ignore=true})<cr>",
			"File",
		},
		l = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffer" },
		h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
		w = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Word (Project)" },
		d = { "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", "Diagnostics (Buffer)" },
		D = { "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", "Diagnostics (Workspace)" },
		c = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "Commits" },
		b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Branches" },
	},
	d = {
		name = "Diff",
		d = { ":Gdiffsplit!<cr>", "3-way diff" },
		r = { ":diffupdate<cr>", "Refresh" },
		l = { ":diffget //3<cr>", "Get right (merge copy)" },
		h = { ":diffget //2<cr>", "Get left (target copy)" },
		w = { ":Gwrite<cr>", "Write to index and exit" },
		j = { "]c", "Next conflict" },
		k = { "[c", "Previous conflict" },
	},
	g = {
		name = "Git",
		b = { ":Octo ", "GitHub" },
		s = { ":Git<cr>", "Status" },
		v = { ":DiffviewOpen<cr>", "Diff View (Project)" },
		-- l = { "<cmd>lua require('config.terminal').gitlog_toggle()<CR>", "Log" },
		l = { ":GV --all<cr>", "Log" },
		H = { ":DiffviewFileHistory<cr>", "File History" },
		h = {
			name = "Hunks",
			p = { "<cmd>lua require'gitsigns'.preview_hunk()<CR>", "Preview" },
			b = { "<cmd>lua require'gitsigns'.blame_line(true)<CR>", "Blame" },
			s = { "<cmd>lua require'gitsigns'.stage_hunk()<CR>", "Stage" },
			r = { "<cmd>lua require'gitsigns'.reset_hunk()<CR>", "Reset" },
			u = { "<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>", "Stage (Undo)" },
			S = { "<cmd>lua require'gitsigns'.stage_buffer()<CR>", "Buffer: Stage" },
			U = { "<cmd>lua require'gitsigns'.reset_buffer_index()<CR>", "Buffer: Reset Index" },
			R = { "<cmd>lua require'gitsigns'.reset_buffer()<CR>", "Buffer: Reset" },
			j = { "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'", "Next" },
			k = { "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'", "Previous" },
			-- Visual mode
			-- s = { "<cmd>lua require'gitsigns'.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", "Stage" },
			-- r = { "<cmd>lua require'gitsigns'.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>" },
		},
	},
	p = { "<cmd>lua require('telescope.builtin').builtin()<cr>", "Available pickers (Telescope)" },
	x = { "<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>", "Bookmarks (Firefox)" },
}, {
	mode = "n", -- NORMAL MODE
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
})
