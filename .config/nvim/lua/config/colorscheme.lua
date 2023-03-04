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

local colors = require('base16-colorscheme').colors
vim.api.nvim_set_hl(0, "CursorLine", { fg = nil, bg = "#262727" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.base04, bg = "#262727" })

-- base00 = '#1d2021', base01 = '#3c3836', base02 = '#504945', base03 = '#665c54',
-- base04 = '#bdae93', base05 = '#d5c4a1', base06 = '#ebdbb2', base07 = '#fbf1c7',
-- base08 = '#fb4934', base09 = '#fe8019', base0A = '#fabd2f', base0B = '#b8bb26',
-- base0C = '#8ec07c', base0D = '#83a598', base0E = '#d3869b', base0F = '#d65d0e'
