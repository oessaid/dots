return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 120
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      local gruvbox = {
        black        = '#1d2021',
        white        = '#d5c4a1',
        red          = '#d65d0e',
        green        = '#8ec07c',
        blue         = '#83a598',
        yellow       = '#fabd2f',
        gray         = '#bdae93',
        darkgray     = '#262727',
        lightgray    = '#504945',
        inactivegray = '#7c6f64',
      }

      local theme = {
        normal = {
          a = { bg = gruvbox.gray, fg = gruvbox.black, gui = 'bold' },
          b = { bg = gruvbox.lightgray, fg = gruvbox.white },
          c = { bg = gruvbox.darkgray, fg = gruvbox.gray }
        },
        insert = {
          a = { bg = gruvbox.blue, fg = gruvbox.black, gui = 'bold' },
          b = { bg = gruvbox.lightgray, fg = gruvbox.white },
          c = { bg = gruvbox.darkgray, fg = gruvbox.gray }
        },
        visual = {
          a = { bg = gruvbox.yellow, fg = gruvbox.black, gui = 'bold' },
          b = { bg = gruvbox.lightgray, fg = gruvbox.white },
          c = { bg = gruvbox.darkgray, fg = gruvbox.gray }
        },
        replace = {
          a = { bg = gruvbox.red, fg = gruvbox.black, gui = 'bold' },
          b = { bg = gruvbox.lightgray, fg = gruvbox.white },
          c = { bg = gruvbox.darkgray, fg = gruvbox.gray }
        },
        command = {
          a = { bg = gruvbox.green, fg = gruvbox.black, gui = 'bold' },
          b = { bg = gruvbox.lightgray, fg = gruvbox.white },
          c = { bg = gruvbox.darkgray, fg = gruvbox.gray }
        },
        inactive = {
          a = { bg = gruvbox.darkgray, fg = gruvbox.gray, gui = 'bold' },
          b = { bg = gruvbox.darkgray, fg = gruvbox.gray },
          c = { bg = gruvbox.darkgray, fg = gruvbox.gray }
        }
      }

      require("lualine").setup({
        options = {
          icons_enabled = true,
          component_separators = "|",
          section_separators = { left = "", right = "" },
          theme = theme,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            {
              "filename",
              file_status = true,
              path = 1
            },
          },
          lualine_c = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
          },
          lualine_x = {
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = "✖ " },
            },
            "filetype",
          },
          lualine_y = {
            { "progress", padding = { right = 1, left = 1 } },
            { "location", padding = { right = 1, left = 0 } },
            "encoding",
            { "fileformat", icons_enabled = false },
          },
          lualine_z = {
            { "branch" },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              -- color = { fg = theme.blue },
            },
            {
              "tabs",
              mode = 0,
              separator = nil,
              padding = 1
            },
          },
          lualine_b = {
            {
              function()
                return require("nvim-navic").get_location()
              end,
              cond = function()
                return require("nvim-navic").is_available()
              end
            },
          },
          lualine_c = {
          },
          lualine_x = {
          },
          lualine_y = {
            { "filename", file_status = true, path = 3 },
          },
          lualine_z = {
            {
              function()
                local msg = "None"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
              end,
              cond = conditions.hide_in_width,
            },
          },
        },
        extensions = { "toggleterm", "fzf", "fugitive" },
      })
    end
  },

}
