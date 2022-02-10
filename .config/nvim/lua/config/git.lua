require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	keymaps = {
		-- Default keymap options
		noremap = true,

		-- 		["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
		-- 		["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },
		--
		-- 		["n ghs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		-- 		["v ghs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		-- 		["n ghu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		-- 		["n ghr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		-- 		["v ghr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		-- 		["n ghR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		-- 		["n ghp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		-- 		["n ghb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
		-- 		["n ghS"] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
		-- 		["n ghU"] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

		-- Text objects
		["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
		["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
	},
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = false,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
	},
	current_line_blame_formatter_opts = {
		relative_time = true,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

local cb = require("diffview.config").diffview_callback
require("diffview").setup({
	diff_binaries = false, -- Show diffs for binaries
	use_icons = true, -- Requires nvim-web-devicons
	enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
	signs = {
		fold_closed = "",
		fold_open = "",
	},
	file_panel = {
		position = "left", -- One of 'left', 'right', 'top', 'bottom'
		width = 35, -- Only applies when position is 'left' or 'right'
		height = 10, -- Only applies when position is 'top' or 'bottom'
	},
	file_history_panel = {
		position = "bottom",
		width = 35,
		height = 16,
		log_options = {
			max_count = 256, -- Limit the number of commits
			follow = false, -- Follow renames (only for single file)
			all = false, -- Include all refs under 'refs/' including HEAD
			merges = false, -- List only merge commits
			no_merges = false, -- List no merge commits
			reverse = false, -- List commits in reverse order
		},
	},
	key_bindings = {
		disable_defaults = false, -- Disable the default key bindings
		-- The `view` bindings are active in the diff buffers, only when the current
		-- tabpage is a Diffview.
		view = {
			["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
			["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
			["gf"] = cb("goto_file"), -- Open the file in a new split in previous tabpage
			["<C-w><C-f>"] = cb("goto_file_split"), -- Open the file in a new split
			["<C-w>gf"] = cb("goto_file_tab"), -- Open the file in a new tabpage
			["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
			["<leader>b"] = cb("toggle_files"), -- Toggle the files panel.
		},
		file_panel = {
			["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
			["<down>"] = cb("next_entry"),
			["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
			["<up>"] = cb("prev_entry"),
			["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
			["o"] = cb("select_entry"),
			["<2-LeftMouse>"] = cb("select_entry"),
			["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
			["S"] = cb("stage_all"), -- Stage all entries.
			["U"] = cb("unstage_all"), -- Unstage all entries.
			["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
			["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
			["<tab>"] = cb("select_next_entry"),
			["<s-tab>"] = cb("select_prev_entry"),
			["gf"] = cb("goto_file"),
			["<C-w><C-f>"] = cb("goto_file_split"),
			["<C-w>gf"] = cb("goto_file_tab"),
			["<leader>e"] = cb("focus_files"),
			["<leader>b"] = cb("toggle_files"),
		},
		file_history_panel = {
			["g!"] = cb("options"), -- Open the option panel
			["<C-d>"] = cb("open_in_diffview"), -- Open the entry under the cursor in a diffview
			["zR"] = cb("open_all_folds"),
			["zM"] = cb("close_all_folds"),
			["j"] = cb("next_entry"),
			["<down>"] = cb("next_entry"),
			["k"] = cb("prev_entry"),
			["<up>"] = cb("prev_entry"),
			["<cr>"] = cb("select_entry"),
			["o"] = cb("select_entry"),
			["<2-LeftMouse>"] = cb("select_entry"),
			["<tab>"] = cb("select_next_entry"),
			["<s-tab>"] = cb("select_prev_entry"),
			["gf"] = cb("goto_file"),
			["<C-w><C-f>"] = cb("goto_file_split"),
			["<C-w>gf"] = cb("goto_file_tab"),
			["<leader>e"] = cb("focus_files"),
			["<leader>b"] = cb("toggle_files"),
		},
		option_panel = {
			["<tab>"] = cb("select"),
			["q"] = cb("close"),
		},
	},
})

-- -- octo (Github)
-- require("octo").setup({
-- 	default_remote = { "upstream", "origin" }, -- order to try remotes
-- 	reaction_viewer_hint_icon = "", -- marker for user reactions
-- 	user_icon = " ", -- user icon
-- 	timeline_marker = "", -- timeline marker
-- 	timeline_indent = "2", -- timeline indentation
-- 	right_bubble_delimiter = "", -- Bubble delimiter
-- 	left_bubble_delimiter = "", -- Bubble delimiter
-- 	github_hostname = "", -- GitHub Enterprise host
-- 	snippet_context_lines = 4, -- number or lines around commented lines
-- 	file_panel = {
-- 		size = 10, -- changed files panel rows
-- 		use_icons = true, -- use web-devicons in file panel
-- 	},
-- 	mappings = {
-- 		issue = {
-- 			close_issue = "<space>ic", -- close issue
-- 			reopen_issue = "<space>io", -- reopen issue
-- 			list_issues = "<space>il", -- list open issues on same repo
-- 			reload = "<C-r>", -- reload issue
-- 			open_in_browser = "<C-b>", -- open issue in browser
-- 			copy_url = "<C-y>", -- copy url to system clipboard
-- 			add_assignee = "<space>aa", -- add assignee
-- 			remove_assignee = "<space>ad", -- remove assignee
-- 			create_label = "<space>lc", -- create label
-- 			add_label = "<space>la", -- add label
-- 			remove_label = "<space>ld", -- remove label
-- 			goto_issue = "<space>gi", -- navigate to a local repo issue
-- 			add_comment = "<space>ca", -- add comment
-- 			delete_comment = "<space>cd", -- delete comment
-- 			next_comment = "]c", -- go to next comment
-- 			prev_comment = "[c", -- go to previous comment
-- 			react_hooray = "<space>rp", -- add/remove 🎉 reaction
-- 			react_heart = "<space>rh", -- add/remove ❤️ reaction
-- 			react_eyes = "<space>re", -- add/remove 👀 reaction
-- 			react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
-- 			react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
-- 			react_rocket = "<space>rr", -- add/remove 🚀 reaction
-- 			react_laugh = "<space>rl", -- add/remove 😄 reaction
-- 			react_confused = "<space>rc", -- add/remove 😕 reaction
-- 		},
-- 		pull_request = {
-- 			checkout_pr = "<space>po", -- checkout PR
-- 			merge_pr = "<space>pm", -- merge PR
-- 			list_commits = "<space>pc", -- list PR commits
-- 			list_changed_files = "<space>pf", -- list PR changed files
-- 			show_pr_diff = "<space>pd", -- show PR diff
-- 			add_reviewer = "<space>va", -- add reviewer
-- 			remove_reviewer = "<space>vd", -- remove reviewer request
-- 			close_issue = "<space>ic", -- close PR
-- 			reopen_issue = "<space>io", -- reopen PR
-- 			list_issues = "<space>il", -- list open issues on same repo
-- 			reload = "<C-r>", -- reload PR
-- 			open_in_browser = "<C-b>", -- open PR in browser
-- 			copy_url = "<C-y>", -- copy url to system clipboard
-- 			add_assignee = "<space>aa", -- add assignee
-- 			remove_assignee = "<space>ad", -- remove assignee
-- 			create_label = "<space>lc", -- create label
-- 			add_label = "<space>la", -- add label
-- 			remove_label = "<space>ld", -- remove label
-- 			goto_issue = "<space>gi", -- navigate to a local repo issue
-- 			add_comment = "<space>ca", -- add comment
-- 			delete_comment = "<space>cd", -- delete comment
-- 			next_comment = "]c", -- go to next comment
-- 			prev_comment = "[c", -- go to previous comment
-- 			react_hooray = "<space>rp", -- add/remove 🎉 reaction
-- 			react_heart = "<space>rh", -- add/remove ❤️ reaction
-- 			react_eyes = "<space>re", -- add/remove 👀 reaction
-- 			react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
-- 			react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
-- 			react_rocket = "<space>rr", -- add/remove 🚀 reaction
-- 			react_laugh = "<space>rl", -- add/remove 😄 reaction
-- 			react_confused = "<space>rc", -- add/remove 😕 reaction
-- 		},
-- 		review_thread = {
-- 			goto_issue = "<space>gi", -- navigate to a local repo issue
-- 			add_comment = "<space>ca", -- add comment
-- 			add_suggestion = "<space>sa", -- add suggestion
-- 			delete_comment = "<space>cd", -- delete comment
-- 			next_comment = "]c", -- go to next comment
-- 			prev_comment = "[c", -- go to previous comment
-- 			select_next_entry = "]q", -- move to previous changed file
-- 			select_prev_entry = "[q", -- move to next changed file
-- 			close_review_tab = "<C-c>", -- close review tab
-- 			react_hooray = "<space>rp", -- add/remove 🎉 reaction
-- 			react_heart = "<space>rh", -- add/remove ❤️ reaction
-- 			react_eyes = "<space>re", -- add/remove 👀 reaction
-- 			react_thumbs_up = "<space>r+", -- add/remove 👍 reaction
-- 			react_thumbs_down = "<space>r-", -- add/remove 👎 reaction
-- 			react_rocket = "<space>rr", -- add/remove 🚀 reaction
-- 			react_laugh = "<space>rl", -- add/remove 😄 reaction
-- 			react_confused = "<space>rc", -- add/remove 😕 reaction
-- 		},
-- 		submit_win = {
-- 			approve_review = "<C-a>", -- approve review
-- 			comment_review = "<C-m>", -- comment review
-- 			request_changes = "<C-r>", -- request changes review
-- 			close_review_tab = "<C-c>", -- close review tab
-- 		},
-- 		review_diff = {
-- 			add_review_comment = "<space>ca", -- add a new review comment
-- 			add_review_suggestion = "<space>sa", -- add a new review suggestion
-- 			focus_files = "<leader>e", -- move focus to changed file panel
-- 			toggle_files = "<leader>b", -- hide/show changed files panel
-- 			next_thread = "]t", -- move to next thread
-- 			prev_thread = "[t", -- move to previous thread
-- 			select_next_entry = "]q", -- move to previous changed file
-- 			select_prev_entry = "[q", -- move to next changed file
-- 			close_review_tab = "<C-c>", -- close review tab
-- 			toggle_viewed = "<leader><space>", -- toggle viewer viewed state
-- 		},
-- 		file_panel = {
-- 			next_entry = "j", -- move to next changed file
-- 			prev_entry = "k", -- move to previous changed file
-- 			select_entry = "<cr>", -- show selected changed file diffs
-- 			refresh_files = "R", -- refresh changed files panel
-- 			focus_files = "<leader>e", -- move focus to changed file panel
-- 			toggle_files = "<leader>b", -- hide/show changed files panel
-- 			select_next_entry = "]q", -- move to previous changed file
-- 			select_prev_entry = "[q", -- move to next changed file
-- 			close_review_tab = "<C-c>", -- close review tab
-- 			toggle_viewed = "<leader><space>", -- toggle viewer viewed state
-- 		},
-- 	},
-- })
