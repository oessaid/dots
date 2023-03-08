return {
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
      "rcarriga/nvim-notify",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          },
              ["ui-select"] = {
            require("telescope.themes").get_cursor {}
          }
        },
        pickers = {
          lsp_references = {
            theme = "cursor"
          },
          find_files = {
            sorting_strategy = "descending",
            layout_strategy = "bottom_pane",
            layout_config = {
              width = 0.8,
            },
          },
          live_grep = {
            sorting_strategy = "descending",
            layout_strategy = "bottom_pane",
            layout_config = {
              width = 0.8,
            },
          },
        },
        defaults = {
          prompt_prefix = "> ",
          selection_caret = "> ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "horizontal", -- center, horizontal, cursor, vertical, flex
          layout_config = {
            prompt_position = "bottom",
            horizontal = { mirror = false },
            vertical = { mirror = false },
          },
          file_ignore_patterns = { ".git/", ".meta" },
          winblend = 1,
          border = true,
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          use_less = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          dynamic_preview_title = true,
          mappings = {
            i = {
                  ["<esc>"] = require("telescope.actions").close,
                  ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
                  ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
                  ["<C-q>"] = require("telescope.actions").send_selected_to_qflist
              + require("telescope.actions").open_qflist,
            },
            n = {
                  ["<esc>"] = require("telescope.actions").close,
                  ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
                  ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
                  ["<C-q>"] = require("telescope.actions").send_selected_to_qflist
              + require("telescope.actions").open_qflist,
            },
          },
        },
      })
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("notify")
    end
  },
}
