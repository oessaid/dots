local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
	return
end
local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
	return
end

require("crates").setup({
	smart_insert = true, -- try to be smart about inserting versions
	avoid_prerelease = true, -- don't select a prerelease if the requirement does not have a suffix
	autoload = true, -- automatically run update when opening a Cargo.toml
	autoupdate = true, -- atomatically update when editing text
	loading_indicator = true, -- show a loading indicator while fetching crate versions
	text = {
		loading = "   Loading",
		version = "   %s",
		prerelease = "   %s",
		yanked = "   %s",
		nomatch = "   No match",
		update = "   %s",
		error = "   Error fetching crate",
	},
	highlight = {
		loading = "CratesNvimLoading",
		version = "CratesNvimVersion",
		prerelease = "CratesNvimPreRelease",
		yanked = "CratesNvimYanked",
		nomatch = "CratesNvimNoMatch",
		update = "CratesNvimUpdate",
		error = "CratesNvimError",
	},
	popup = {
		autofocus = false, -- focus the versions popup when opening it
		copy_register = '"', -- the register into which the version will be copied
		style = "minimal", -- same as nvim_open_win config.style
		border = "none", -- same as nvim_open_win config.border
		max_height = 30,
		min_width = 20,
		text = {
			title = "  %s ",
			version = "   %s ",
			prerelease = "  %s ",
			yanked = "  %s ",
			feature = "   %s ",
		},
		highlight = {
			title = "CratesNvimPopupTitle",
			version = "CratesNvimPopupVersion",
			prerelease = "CratesNvimPopupPreRelease",
			yanked = "CratesNvimPopupYanked",
			feature = "CratesNvimPopupFeature",
		},
		keys = {
			hide = { "q", "<esc>" },
			select = { "<cr>" },
			select_dumb = { "s" },
			copy_version = { "yy" },
		},
	},
	cmp = {
		text = {
			prerelease = "  pre-release ",
			yanked = "  yanked ",
		},
	},
})

cmp.setup({
	completion = {
		completeopt = "menu,menuone,noinsert",
	},

	formatting = {
		format = function(entry, vim_item)
			local icons = require("lsp.kind").icons
			vim_item.kind = icons[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = "(LSP)",
				emoji = "(Emoji)",
				path = "(Path)",
				calc = "(Calc)",
				cmp_tabnine = "(Tabnine)",
				vsnip = "(Snippet)",
				luasnip = "(Snippet)",
				buffer = "(Buffer)",
			})[entry.source.name]
			vim_item.dup = ({
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
			})[entry.source.name] or 0
			return vim_item
		end,
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		-- { name = "cmp_tabnine" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "calc" },
		-- { name = "emoji" },
		{ name = "treesitter" },
		{ name = "crates" },
		{ name = "spell" },
	},

	-- preselect = cmp.PreselectMode.Item,

	mapping = {
		-- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		-- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
})
