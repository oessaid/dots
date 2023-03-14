return {
  {
    "tpope/vim-fugitive",
    event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
    keys = {
      { "<leader>gs",  ":Git<cr>",         desc = "Git" },
      { "<leader>ggd", ":Gdiffsplit!<cr>", desc = "Git diff" },
      { "<leader>ggw", ":Gwrite<cr>",      desc = "Git write" }
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    -- event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
    keys = {
      { "<leader>gj",  "<cmd>lua require'gitsigns.actions'.next_hunk()<CR>",   desc = "Next hunk" },
      { "<leader>gk",  "<cmd>lua require'gitsigns.actions'.prev_hunk()<CR>",   desc = "Previous hunk" },
      { "<leader>ghp", "<cmd>lua require'gitsigns'.preview_hunk()<cr>",        desc = "Preview hunk" },
      { "<leader>ghb", "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>", desc = "Blame line" },
      { "<leader>ghs", "<cmd>lua require'gitsigns'.stage_hunk()<CR>",          desc = "Stage" },
      { "<leader>ghr", "<cmd>lua require'gitsigns'.reset_hunk()<CR>",          desc = "Reset" },
      { "<leader>ghu", "<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>",     desc = "Undo Stage" },
      { "<leader>ghS", "<cmd>lua require'gitsigns'.stage_buffer()<CR>",        desc = "Stage buffer" },
      { "<leader>ghU", "<cmd>lua require'gitsigns'.reset_buffer_index()<CR>",  desc = "Reset buffer index" },
      { "<leader>ghR", "<cmd>lua require'gitsigns'.reset_buffer()<CR>",        desc = "Reset buffer" }
    },
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "sindrets/diffview.nvim",
    -- event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
    keys = {
      { "<leader>gH",  ":DiffviewFileHistory<cr>", desc = "Diff file history" },
      { "<leader>ggp", ":DiffviewOpen<cr>",        desc = "Diff view open" },
    }
  },
  {
    "junegunn/gv.vim",
    -- event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
    keys = {
      { "<leader>gl", ":GV --all<cr>", desc = "" },
    }
  },
}
