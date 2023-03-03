return {
  -- colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },
  { "RRethy/nvim-base16" },

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  -- LSP support
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "j-hui/fidget.nvim" },

  -- Diagnostics/Tools
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons"
  },
  { 'simrat39/symbols-outline.nvim' },
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig"
  },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'ray-x/lsp_signature.nvim' },

  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
  },
  { 'nvim-telescope/telescope-ui-select.nvim' },

  -- Git
  { "tpope/vim-fugitive" },
  { 'lewis6991/gitsigns.nvim' },
  { "sindrets/diffview.nvim" },
  { "junegunn/gv.vim" },

  -- Editing
  { "tpope/vim-commentary" },
  { "folke/neodev.nvim" },

  -- Terminal
  { "akinsho/toggleterm.nvim",                version = "*", config = true },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  },

  -- Rust
  { "simrat39/rust-tools.nvim" },
  {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
