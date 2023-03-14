return {
  -- colorscheme
  {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
    config = function()
      -- base00 = '#1d2021', base01 = '#3c3836', base02 = '#504945', base03 = '#665c54',
      -- base04 = '#bdae93', base05 = '#d5c4a1', base06 = '#ebdbb2', base07 = '#fbf1c7',
      -- base08 = '#fb4934', base09 = '#fe8019', base0A = '#fabd2f', base0B = '#b8bb26',
      -- base0C = '#8ec07c', base0D = '#83a598', base0E = '#d3869b', base0F = '#d65d0e'

      local function custom_highlights()
        local colors = require('base16-colorscheme').colors
        -- General settings
        vim.api.nvim_set_hl(0, "Visual", { reverse = true })
        vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.base00, bg = colors.base0D })
        vim.api.nvim_set_hl(0, "CursorLine", { fg = nil, bg = "#262727" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.base03, bg = "#262727" })
        vim.api.nvim_set_hl(0, "LineNr", { fg = colors.base03 })
        vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.base03 })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = colors.base00 })
        -- Floating windows
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.base03, bg = colors.base00 })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.base00 })
        -- Telescope: https://github.com/nvim-telescope/telescope.nvim/blob/master/plugin/telescope.lua
        vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.base03 })
        vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#262727" })
        vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = colors.base0D })
        vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.base0D })
        -- Cmp
        vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = colors.base05, bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.base0D, bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = colors.base0D, bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = colors.base02, bg = "NONE", strikethrough = true })
        vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = colors.base0D, bg = "NONE", italic = true })
        -- Command menu
        vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.base05, bg = "#262727" })
        vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.base00, bg = colors.base0D })
        -- Rust
        vim.api.nvim_set_hl(0, "rustReservedKeyword",
          { fg = colors.base08, bg = "NONE", bold = true, italic = true })
        -- vim.api.nvim_set_hl(0, "rustInvalidBareKeyword",
        --   { fg = colors.base08, bg = colors.base0F, bold = true})
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = custom_highlights
      })

      require('base16-colorscheme').with_config({
        telescope = false,
        indentblankline = false,
        notify = false,
        ts_rainbow = false,
        cmp = true,
        illuminate = false,
        lsp_semantic = false,
      })
      vim.cmd("colorscheme base16-gruvbox-dark-hard")
      -- vim.cmd("colorscheme base16-gruvbox-dark-medium")
      -- vim.cmd("colorscheme base16-gruvbox-material-dark-hard")
    end
  },

}
