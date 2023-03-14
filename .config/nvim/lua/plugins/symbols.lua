return {
  {
    'simrat39/symbols-outline.nvim',
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("symbols-outline").setup({
        keymaps = {
          close = { "<Esc>", "q" },
          goto_location = "o",
          focus_location = "<cr>",
          hover_symbol = "<leader><leader>",
          -- toggle_preview = "<leader><leader>",
          -- rename_symbol = "r",
          -- code_actions = "a",
          fold = "zc",
          unfold = "zo",
          fold_all = "zM",
          unfold_all = "zR",
          fold_reset = "zx",
        },
      })
    end
  },
}
