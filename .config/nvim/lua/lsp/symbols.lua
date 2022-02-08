-- Symbols outline settings
vim.g.symbols_outline = {
	highlight_hovered_item = true,
	auto_preview = false,
	position = "left",
	show_symbol_details = true,
	show_guides = true,
	show_numbers = false,
	show_relative_numbers = false,
	relative_width = true,
	width = 45,
	auto_close = false,
	-- auto_close = true,
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
if vim.fn.hlexists("FocusedSymbol") == 0 then
	vim.cmd(
		"hi FocusedSymbol term=italic,bold cterm=italic ctermbg=yellow ctermfg=darkblue gui=bold,italic guibg=yellow guifg=darkblue"
	)
end
