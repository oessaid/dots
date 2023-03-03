require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "lua", "vim", "help", "rust", "python", "bash", "cmake", "cpp", "dockerfile", "dot", "diff",
    "git_rebase", "gitattributes", "gitcommit", "gitignore", "sql", "toml", "yaml" }
}
