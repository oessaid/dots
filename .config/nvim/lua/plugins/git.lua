return {
  {
    "tpope/vim-fugitive",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "sindrets/diffview.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "junegunn/gv.vim",
    event = { "BufReadPre", "BufNewFile" },
  },
}
