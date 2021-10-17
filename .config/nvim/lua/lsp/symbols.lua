-- Symbols outline settings
vim.g.symbols_outline = {
	auto_preview = false,
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "<space>",
		rename_symbol = "r",
		code_actions = "a",
	},
}
