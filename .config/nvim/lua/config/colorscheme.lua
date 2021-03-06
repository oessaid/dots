local dark_sidebars = {
	"qf",
	"terminal",
	"packer",
	"Outline",
	"Trouble",
	"fugitive",
	"floggraph",
	"GV",
}

-- Icons
-- require("circles").setup({
-- 	icons = {
-- 		empty = "",
-- 		filled = "",
-- 		lsp_prefix = "",
-- 	},
-- 	lsp = false,
-- })

-- require("nvim-web-devicons").setup({
-- your personnal icons can go here (to override)
-- you can specify color or cterm_color instead of specifying both of them
-- DevIcon will be appended to `name`
-- override = {
-- 	zsh = {
-- 		icon = "",
-- 		color = "#428850",
-- 		cterm_color = "65",
-- 		name = "Zsh",
-- 	},
-- },
-- globally enable default icons (default to false)
-- will get overriden by `get_icons` option
-- 	default = true,
-- })

-- -- vim.g.onedark_style = "darker"
-- vim.g.onedark_style = "cool"
-- -- vim.g.onedark_style = "deep"
-- -- vim.g.onedark_style = "warm"
-- -- vim.g.onedark_style = "warmer"
-- -- Nothing from above selected means "default"
-- vim.g.onedark_toggle_style_keymap = "<nop>"
-- vim.g.onedark_disable_toggle_style = true
-- require("onedark").setup()

-- vim.g.ayu_mirage = true
-- vim.cmd([[colorscheme ayu]])

-- vim.g.tokyonight_sidebars = dark_sidebars
-- vim.g.tokyonight_style = "night" -- storm, night or day
-- vim.api.nvim_command("colorscheme tokyonight")

-- black = '#22272e',
-- bright_black = '#636e7b',
-- white = '#909dab',
-- bright_white = '#cdd9e5',
-- red = '#ff938a',
-- bright_red = '#ff938a',
-- green = '#6bc46d',
-- bright_green = '#6bc46d',
-- yellow = '#c69026',
-- bright_yellow = '#daaa3f',
-- blue = '#6cb6ff',
-- bright_blue = '#6cb6ff',
-- magenta = '#b083f0',
-- bright_magenta = '#dcbdfb',
-- cyan = '#56d4dd',
-- bright_cyan = '#56d4dd',

require("github-theme").setup({
	theme_style = "dimmed", -- dark, dark_default, dimmed, light, light_default
	transparent = false,
	--
	-- add a thin border to status lines (deprecated?)
	hide_inactive_statusline = true,
	--
	comment_style = "NONE",
	keyword_style = "bold",
	function_style = "NONE",
	variable_style = "NONE",
	msg_area_style = "NONE",
	--
	dark_float = true,
	dark_sidebar = true,
	sidebars = dark_sidebars,
	--
	colors = {
		error = "bright_red",
		warning = "yellow",
		info = "blue",
		hint = "magenta",
	},
	overrides = function(c)
		return {
			DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
		}
	end,
	-- colors = {
	-- 	warning = "yellow",
	-- 	info = "blue",
	-- 	hint = "orange",
	-- 	error = "red",
	-- 	pmenu = {
	-- 		-- select = "#044289",
	-- 		select = "#264466",
	-- 	},
	-- },
})

-- vim.g.gruvbox_flat_style = "hard" -- comment out | dark | hard
-- vim.g.gruvbox_italic_functions = true
-- vim.g.gruvbox_sidebars = dark_sidebars
-- vim.g.gruvbox_hide_inactive_statusline = false
-- -- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- -- vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }
-- -- Change the TabLineSel highlight group (used by barbar.nvim) to the "orange" color
-- -- vim.g.gruvbox_theme = { TabLineSel = { bg = "orange" } }
-- -- Load the colorscheme
-- vim.cmd([[colorscheme gruvbox-flat]])

-- require("nightfox").setup({
-- 	fox = "nordfox", -- nightfox | nordfox | palefox
-- 	transparent = false, -- Disable setting the background color
-- 	terminal_colors = true, -- Configure the colors used when opening :terminal
-- 	styles = {
-- 		comments = "italic", -- Style that is applied to comments: see `highlight-args` for options
-- 		functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
-- 		keywords = "bold", -- Style that is applied to keywords: see `highlight-args` for options
-- 		strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
-- 		variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
-- 	},
-- 	inverse = {
-- 		match_paren = false, -- Enable/Disable inverse highlighting for match parens
-- 		visual = true, -- Enable/Disable inverse highlighting for visual selection
-- 		search = true, -- Enable/Disable inverse highlights for search highlights
-- 	},
-- })
-- require("nightfox").load()

-- vim.g.material_style = "deep ocean"
-- require("material").setup({
-- 	contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
-- 	borders = true, -- Enable borders between verticaly split windows
-- 	popup_menu = "colorful", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )
-- 	italics = {
-- 		comments = false, -- Enable italic comments
-- 		keywords = false, -- Enable italic keywords
-- 		functions = false, -- Enable italic functions
-- 		strings = false, -- Enable italic strings
-- 		variables = false, -- Enable italic variables
-- 	},
-- 	contrast_windows = dark_sidebars, -- Specify which windows get the contrasted (darker) background
-- 	text_contrast = {
-- 		lighter = false, -- Enable higher contrast text for lighter style
-- 		darker = true, -- Enable higher contrast text for darker style
-- 	},
-- 	disable = {
-- 		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
-- 		term_colors = false, -- Prevent the theme from setting terminal colors
-- 		eob_lines = false, -- Hide the end-of-buffer lines
-- 	},
-- 	-- custom_highlights = {} -- Overwrite highlights with your own
-- })
-- vim.cmd([[colorscheme material]])
