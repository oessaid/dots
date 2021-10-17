-- vim.g.onedark_style = "darker"
-- -- vim.g.onedark_style = "cool"
-- -- vim.g.onedark_style = "deep"
-- -- vim.g.onedark_style = "warm"
-- -- vim.g.onedark_style = "warmer"
-- -- Nothing from above selected means "default"
-- vim.g.onedark_disable_toggle_style = true
-- require("onedark").setup()

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

-- vim.g.ayu_mirage = true
-- vim.cmd([[colorscheme ayu]])

-- vim.g.tokyonight_sidebars = dark_sidebars
-- vim.g.tokyonight_style = "night" -- storm, night or day
-- vim.api.nvim_command("colorscheme tokyonight")

require("github-theme").setup({
	theme_style = "dimmed", -- dark, dark_default, dimmed, light, light_default
	hide_inactive_statusline = false,
	comment_style = "NONE",
	keyword_style = "NONE",
	function_style = "NONE",
	variable_style = "NONE",
	dark_float = true,
	-- hide_inactive_statusline = false,
	sidebars = dark_sidebars,
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	colors = {
		-- hint = "orange",
		-- error = "red",
		pmenu = {
			-- select = "#044289",
			select = "#264466",
		},
	},
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
-- 	popup_menu = "dark", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )
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
