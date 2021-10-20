return require("packer").startup({
	function()
		-- Packer can manage itself as a plugin
		use({ "wbthomason/packer.nvim" })

		-- Dashboard/Projects
		use({ "glepnir/dashboard-nvim" })
		use({ "ahmedkhalf/project.nvim" })

		-- Terminal
		use({ "akinsho/toggleterm.nvim" })

		-- Which Key
		use({ "folke/which-key.nvim" })

		-- Registers management
		use("tversteeg/registers.nvim")

		-- Utils
		use("norcalli/nvim-colorizer.lua")
		use("tpope/vim-surround")
		use({ "kevinhwang91/nvim-bqf" })

		-- Status line, tabline
		use({
			"shadmansaleh/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-- Colorscheme
		-- use("folke/tokyonight.nvm")
		use({
			"projekt0n/github-nvim-theme",
		})
		-- use("EdenEast/nightfox.nvim")
		-- use("marko-cerovac/material.nvim")
		-- use("navarasu/onedark.nvim")
		-- use("CantoroMC/ayu-nvim")
		-- use("eddyekofo94/gruvbox-flat.nvim")

		-- Fuzzy finder
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({ "dhruvmanila/telescope-bookmarks.nvim" })
		use({ "nvim-telescope/telescope-dap.nvim", requires = { "mfussenegger/nvim-dap" } })

		-- LSP
		use({ "neovim/nvim-lspconfig" })
		use({ "williamboman/nvim-lsp-installer" })
		use({ "ray-x/lsp_signature.nvim" })
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		})
		-- use({ "weilbith/nvim-code-action-menu" })
		use({ "~/Software/nvim-code-action-menu", cmd = "CodeActionMenu" })
		use({ "kosayoda/nvim-lightbulb" })

		use({
			"simrat39/rust-tools.nvim",
			requires = {
				"neovim/nvim-lspconfig",
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
				"mfussenegger/nvim-dap",
			},
		})
		use({ "Saecki/crates.nvim", requires = { "nvim-lua/plenary.nvim" } })

		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
		use({ "theHamsta/nvim-dap-virtual-text" })

		use({
			"folke/lua-dev.nvim",
			config = function()
				require("lua-dev").setup({})
			end,
		})

		-- Code completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/vim-vsnip",
				"hrsh7th/cmp-buffer",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"f3fora/cmp-spell",
				-- "tzachar/cmp-tabnine",
				"ray-x/cmp-treesitter",
				"hrsh7th/cmp-calc",
				"hrsh7th/cmp-emoji",
			},
		})

		-- Diagnostics
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})

		-- Symbols
		use("simrat39/symbols-outline.nvim")

		-- Git stuff
		use({ "tpope/vim-dispatch" })
		use({ "tpope/vim-fugitive" })
		use({
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})
		use("sindrets/diffview.nvim")
		use("junegunn/gv.vim")
		use({
			"pwntester/octo.nvim",
		})

		-- File Explorer
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})

		-- Code commenting
		use("terrortylor/nvim-comment")
		require("nvim_comment").setup()
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
