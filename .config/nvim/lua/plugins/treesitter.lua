return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "c", "lua", "vim",
          "help", "rust", "python",
          "bash", "cmake", "cpp",
          "dockerfile", "dot", "diff",
          "git_rebase", "gitattributes", "gitcommit",
          "gitignore", "sql", "toml", "yaml"
        }
      }
    end
  },
}
