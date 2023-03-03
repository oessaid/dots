vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- utils.opt("b", "shiftwidth", indent)
-- utils.opt("o", "hidden", true)
-- utils.opt("o", "shiftround", true)

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

local M = {}
M.load_options = function()
	local default_options = {
		showmatch = false,
		termguicolors = true,
		mouse = "a",
		incsearch = true,
		backup = false, -- creates a backup file
		clipboard = "unnamedplus", -- allows neovim to access the system clipboard
		cmdheight = 1, -- space in the neovim command line for displaying messages
		colorcolumn = "99999", -- fixes indentline for now
		-- completeopt = {
		-- 	"menu",
		-- 	"menuone",
		-- 	-- "noselect",
		-- 	"noinsert",
		-- },
		conceallevel = 0, -- so that `` is visible in markdown files
		fileencoding = "utf-8", -- the encoding written to a file
		foldlevel = 99,
		foldmethod = "expr", -- folding set to "expr" for treesitter based folding
		foldexpr = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
		guifont = "monospace:h17", -- the font used in graphical neovim applications
		hidden = true, -- required to keep multiple buffers and open multiple buffers
		hlsearch = false, -- highlight all matches on previous search pattern
		ignorecase = false, -- ignore case in search patterns
		pumheight = 10, -- pop up menu height
		showmode = false, -- we don't need to see things like -- INSERT -- anymore
		showtabline = 1, -- only show tabs if there's more than one
		smartcase = true, -- smart case
		smartindent = true, -- make indenting smarter again
		splitbelow = true, -- force all horizontal splits to go below current window
		splitright = true, -- force all vertical splits to go to the right of current window
		swapfile = false, -- creates a swapfile
		timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
		title = true, -- set the title of window to the value of the titlestring
		titlestring = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
		-- undodir = CACHE_PATH .. "/undo" -- set an undo directory
		undofile = true, -- enable persistent undo
		updatetime = 100, -- faster completion
		writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
		expandtab = true, -- convert tabs to spaces
		shiftwidth = 2, -- the number of spaces inserted for each indentation
		tabstop = 2, -- insert 2 spaces for a tab
		cursorline = true, -- highlight the current line
		number = true, -- set numbered lines
		relativenumber = true, -- set relative numbered lines
		numberwidth = 4, -- set number column width to 2 {default 4}
		signcolumn = "yes", -- always show the sign column otherwise it would shift the text each time
		wrap = true, -- display lines as one long line
		spell = false,
		spelllang = "en",
		scrolloff = 8, -- is one of my fav
		sidescrolloff = 8,
		inccommand = "nosplit",
	}

	---  SETTINGS  ---

	vim.opt.shortmess:append("c")

	for k, v in pairs(default_options) do
		vim.opt[k] = v
	end
end

M.load_options()

return M
