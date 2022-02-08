require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		bookmarks = {
			-- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
			selected_browser = "firefox",
			-- Either provide a shell command to open the URL
			url_open_command = "xdg-open",
			-- Or provide the plugin name which is already installed
			-- Available: 'vim_external', 'open_browser'
			url_open_plugin = nil,
			firefox_profile_name = "vyq2zguz.default-release",
		},
	},
	pickers = {
		-- lsp_references = {
		-- 	-- layout_strategy = "vertical",
		-- 	theme = "cursor",
		-- 	layout_config = {
		-- 		width = 0.8,
		-- 	},
		-- },
		lsp_references = {
			sorting_strategy = "descending",
			layout_strategy = "bottom_pane",
			layout_config = {
				width = 0.8,
			},
		},
		find_files = {
			-- theme = "dropdown",
			sorting_strategy = "descending",
			layout_strategy = "bottom_pane",
			layout_config = {
				width = 0.8,
			},
		},
		live_grep = {
			-- theme = "dropdown",
			sorting_strategy = "descending",
			layout_strategy = "bottom_pane",
			layout_config = {
				width = 0.8,
			},
		},
	},
	defaults = {
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal", -- center, horizontal, cursor, vertical, flex
		layout_config = {
			-- width = 0.75,
			prompt_position = "bottom",
			-- preview_cutoff = 120,
			horizontal = { mirror = false },
			vertical = { mirror = false },
		},
		-- file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_ignore_patterns = { ".git/", ".meta" },
		-- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 1,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		dynamic_preview_title = true,
		-- path_display = { shorten = 5 },
		-- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		-- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		-- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		mappings = {
			i = {
				["<C-j>"] = require("telescope.actions").preview_scrolling_down,
				["<C-k>"] = require("telescope.actions").preview_scrolling_up,
				["<C-q>"] = require("telescope.actions").send_selected_to_qflist
					+ require("telescope.actions").open_qflist,
			},
			n = {
				["<C-j>"] = require("telescope.actions").preview_scrolling_down,
				["<C-k>"] = require("telescope.actions").preview_scrolling_up,
				["<C-q>"] = require("telescope.actions").send_selected_to_qflist
					+ require("telescope.actions").open_qflist,
			},
		},
	},
})
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("dap")
-- require("telescope").load_extension("projects")
