-- require("gruvbox").setup({
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = false,
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = false,   -- invert background for search, diffs, statuslines and errors
--   contrast = "hard", -- can be "hard", "soft" or empty string
--   palette_overrides = {},
--   overrides = {},
--   dim_inactive = false,
--   transparent_mode = false,
-- })
-- vim.cmd("colorscheme gruvbox")

require('base16-colorscheme').with_config({
  telescope = false,
  indentblankline = false,
  notify = false,
  ts_rainbow = false,
  cmp = true,
  illuminate = false,
  lsp_semantic = true,
})
vim.cmd("colorscheme base16-gruvbox-dark-hard")
-- vim.cmd("colorscheme base16-gruvbox-dark-medium")
-- vim.cmd("colorscheme base16-gruvbox-material-dark-hard")
