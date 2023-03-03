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

require("lualine").setup({
  options = {
    icons_enabled = true,
    component_separators = "|",
    section_separators = { left = "", right = "" },
    theme = "auto",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "filename", file_status = true, path = 1 },
    },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
    },
    lualine_x = {
      "filetype",
    },
    lualine_y = {
      { "progress", padding = { right = 1, left = 0 } },
      { "location", padding = { right = 1, left = 0 } },
    },
    lualine_z = {},
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
    lualine_a = {},
    lualine_b = {
      { "tabs", mode = 0, separator = { right = "", left = "" }, padding = 1 },
    },
    lualine_c = {
      { require("nvim-navic").get_location, cond = require("nvim-navic").is_available },
    },
    lualine_x = {
      { "filename",   file_status = true,   path = 3 },
      "encoding",
      { "fileformat", icons_enabled = false },
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
      },
    },
    lualine_y = {
      { "branch" },
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
