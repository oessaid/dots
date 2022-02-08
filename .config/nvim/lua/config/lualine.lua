-- GPS component
local gps = require("nvim-gps")
gps.setup({
	disable_icons = false,
	depth = 0,
	depth_limit_indicator = "..",
})

-- require("tabline").setup({
-- 	-- Defaults configuration options
-- 	enable = true,
-- 	options = {
-- 		-- If lualine is installed tabline will use separators configured in lualine by default.
-- 		-- These options can be used to override those settings.
-- 		component_separators = { "|", "|" },
-- 		section_separators = { "", "" },
-- 		-- section_separators = { "", "" },
-- 		-- component_separators = { "", "" },
-- 		-- max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
-- 		-- show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
-- 		show_devicons = true, -- this shows devicons in buffer section
-- 		show_bufnr = true, -- this appends [bufnr] to buffer section,
-- 		show_filename_only = true, -- shows base filename only instead of relative path in filename
-- 		modified_icon = "+ ", -- change the default modified icon
-- 		modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
-- 	},
-- })

-- used for diagnostic/diff colors
-- local colors = require("nightfox.colors").load()
-- Gruvbox Flat colors (Hard)
local colors = {
	bg = "#1d2021",
	bg2 = "#17191a",
	bg_highlight = "#3c3836",
	prompt_border = "#45403d",
	bg_visual = "#3c3836",
	comment = "#6a635d",
	line_cursor = "#32302f",
	border = "#5a524c",
	fg = "#d4be98",
	fg_light = "#ddc7a1",
	fg_dark = "#d4be98",
	tree_normal = "#aa9987",
	fg_gutter = "#5a524c",
	dark5 = "#5a524c",
	blue = "#7daea3",
	aqua = "#89b482",
	purple = "#d3869b",
	orange = "#e78a4e",
	yellow = "#d8a657",
	yellow2 = "#b47109",
	bg_yellow = "#a96b2c",
	green = "#a9b665",
	red = "#ea6962",
	red1 = "#c14a4a",
	black = "#1d2021",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 120
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local opts = {
	icons_enabled = true,
	-- theme = "catppuccin",
	-- theme = "auto",
	theme = "auto",
	-- theme = "gruvbox-flat",
	-- theme = "material-nvim",
	-- component_separators = "|",
	-- section_separators = { left = "", right = "" },
	component_separators = "",
	section_separators = { left = "", right = "" },
}

local active_sections = {
	lualine_a = {
		-- {
		-- 	function()
		-- 		return "▊"
		-- 	end,
		-- 	padding = { left = 0, right = 1 }, -- We don't need space before this
		-- },
		{
			-- custom mode component
			function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					-- [""] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg2)
				-- vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()])
				return ""
			end,
			color = "LualineMode",
			padding = { right = 1, left = 0 },
			separator = {
				-- right = "",
				left = "",
			},
		},
	},

	lualine_b = {},

	lualine_c = {
		{
			"filename",
			path = 1,
			color = {
				-- gui = "bold",
				fg = colors.yellow,
			},
			cond = conditions.buffer_not_empty,
		},
		-- { gps.get_location, cond = gps.is_available },
	},
	lualine_x = {
		{
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				color_error = { fg = colors.red },
				color_warn = { fg = colors.yellow },
				color_info = { fg = colors.cyan },
			},
		},
		{
			function()
				local msg = "None"
				local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			-- icon = " ",
			cond = conditions.hide_in_width,
			color = {
				fg = colors.aqua,
			},
		},
		{
			"branch",
			icon = "",
			cond = conditions.hide_in_width,
			color = {
				fg = colors.comment,
			},
		},
		{
			"diff",
			symbols = { added = " ", modified = "柳", removed = " " },
			diff_color = {
				added = { fg = colors.aqua },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.hide_in_width,
		},
		{ "filetype" },
		-- { "filesize", color = { fg = colors.comment } },
		-- { "location", color = { fg = colors.comment } },
		-- { "progress" },
		{ "o:encoding", color = { fg = colors.comment } },
		{ "fileformat", icons_enabled = false, color = { fg = colors.comment } },
	},
	lualine_y = {},
	lualine_z = {},
}

local inactive_buffer_sections = {
	lualine_a = {
		{ "filename", path = 1, cond = conditions.buffer_not_empty, color = { fg = colors.comment } },
	},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {},
}

-- require("lualine").setup({
-- 	options = opts,
-- 	sections = active_sections,
-- 	inactive_sections = inactive_buffer_sections,
-- 	tabline = {},
-- 	extensions = { "toggleterm", "nvim-tree", "fzf", "fugitive" },
-- })

require("lualine").setup({
	options = {
		icons_enabled = true,
		component_separators = "|",
		-- component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		theme = "github", -- or "auto"
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{ "filename", file_status = true, path = 1 },
		},
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_x = {
			"filetype",
		},
		lualine_y = {
			{ "progress", padding = { right = 1, left = 0 } },
			{ "location", padding = { right = 1, left = 0 } },
		},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {
			{ "tabs", mode = 0, separator = { right = "", left = "" }, padding = 1 },
		},
		lualine_c = {
			-- { require("tabline").tabline_buffers },
			-- -- { gps.get_location, cond = gps.is_available },
		},
		lualine_x = {
			-- { require("tabline").tabline_tabs },
			{ "filename", file_status = true, path = 2 },
			"encoding",
			{ "fileformat", icons_enabled = false },
			{
				"diff",
				symbols = { added = " ", modified = "柳", removed = " " },
			},
		},
		lualine_y = {
			{ "branch" },
		},
		lualine_z = {
			{
				function()
					local msg = "None"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				-- icon = " ",
				cond = conditions.hide_in_width,
			},
		},
	},
	extensions = { "toggleterm", "nvim-tree", "fzf", "fugitive" },
})
