return {
  {
    "tpope/vim-fugitive",
    event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "sindrets/diffview.nvim",
    event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
  },
  {
    "junegunn/gv.vim",
    event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
  },
}
