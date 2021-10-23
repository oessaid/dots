vim.g.dashboard_default_executive = "telescope"
-- vim.g.dashboard_preview_command = "splashcii"
-- vim.g.dashboard_preview_pipeline = "lolcat"
-- vim.g.dashboard_preview_file = "beach"
-- vim.g.dashboard_preview_file_height = 20
-- vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_enable_session = 0
vim.g.dashboard_disable_statusline = 0

vim.g.dashboard_custom_header = {
	" ░█▀█░█▀▀░█▀█░█░█░▀█▀░█▄█",
	" ░█░█░█▀▀░█░█░▀▄▀░░█░░█░█",
	" ░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀",
}

-- vim.g.dashboard_custom_shortcut = {
-- 	["last_session"] = "SPC s l",
-- 	["find_history"] = "SPC f r",
-- 	["find_file"] = "SPC spc",
-- 	["new_file"] = "SPC f n",
-- 	["change_colorscheme"] = "SPC h c",
-- 	["find_word"] = "SPC f g",
-- 	["book_marks"] = "SPC f b",
-- }

vim.g.dashboard_custom_section = {
	-- a = { description = { "  Recently Opened Files          SPC f r" }, command = "Telescope oldfiles" },
	a = { description = { "  TODO List                      SPC f r" }, command = ":e ~/todo.md" },
	-- b = { description = { "  Open Project                   SPC f p" }, command = "Telescope projects" },
	-- c = { description = { "  Find File                      SPC f f" }, command = "Telescope find_files" },
	-- d = { description = { "  Find Word                      SPC s p" }, command = "Telescope live_grep" },
	b = { description = { "  Firefox Bookmarks              SPC f c" }, command = "Telescope bookmarks" },
	c = { description = { "  Change Colorscheme             SPC f c" }, command = "Telescope colorscheme" },
	d = { description = { "  Open Neovim Configuration      SPC f P" }, command = ":e ~/.config/nvim/init.lua" },
}

vim.g.dashboard_custom_footer = {
	"Omar Essaid -  + ",
}
vim.g.nvim_tree_respect_buf_cwd = 1

-- require("project_nvim").setup({
-- 	-- Manual mode doesn't automatically change your root directory, so you have
-- 	-- the option to manually do so using `:ProjectRoot` command.
-- 	manual_mode = true,
-- 	-- Methods of detecting the root directory. **"lsp"** uses the native neovim
-- 	-- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
-- 	-- order matters: if one is not detected, the other is used as fallback. You
-- 	-- can also delete or rearangne the detection methods.
-- 	detection_methods = { "lsp", "pattern" },
-- 	-- All the patterns used to detect root dir, when **"pattern"** is in
-- 	-- detection_methods
-- 	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
-- 	-- Table of lsp clients to ignore by name
-- 	-- eg: { "efm", ... }
-- 	ignore_lsp = {},
-- 	-- Don't calculate root dir on specific directories
-- 	-- Ex: { "~/.cargo/*", ... }
-- 	exclude_dirs = {},
-- 	-- Show hidden files in telescope
-- 	show_hidden = true,
-- 	-- When set to false, you will get a message when project.nvim changes your
-- 	-- directory.
-- 	silent_chdir = false,
-- 	-- Path where project.nvim will store the project history for use in
-- 	-- telescope
-- 	datapath = vim.fn.stdpath("data"),
-- })
