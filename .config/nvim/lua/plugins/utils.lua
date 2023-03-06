return {
  -- Editing
  {
    'norcalli/nvim-colorizer.lua',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end
  },
  {
    "terrortylor/nvim-comment",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('nvim_comment').setup()
    end
  },
}
