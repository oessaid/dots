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
  {
    "stevearc/dressing.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('dressing').setup({
        select = {
          enabled = false
        }
      })
    end
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup({
        stages = 'slide',
        timeout = 3000,
        render = "compact",
      })
      vim.notify = require("notify")
    end
  },
  {
    "tversteeg/registers.nvim",
    name = "registers",
    keys = {
      { "\"",    mode = { "n", "v" } },
      { "<C-R>", mode = "i" }
    },
    -- cmd = "Registers",
    config = function()
      require("registers").setup({
        window = {
          max_width = 100,
          highlight_cursorline = true,
          border = "rounded",
          transparency = 0,
        },
      })
    end
  }
}
