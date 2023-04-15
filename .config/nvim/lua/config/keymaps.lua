vim.keymap.set("i", "jk", "<Esc>") -- jk to escape

-- general maps
vim.keymap.set("n", "st", ":tab split<CR>")
vim.keymap.set("n", "<leader>i", "gt")
vim.keymap.set("n", "<leader>u", "gT")
vim.keymap.set("n", "<leader>\\", "<C-W>v")
vim.keymap.set("n", "<leader>-", "<C-W>s")
vim.keymap.set("n", "<leader>=", "<C-W>=")

-- Navigation
vim.keymap.set("n", "<leader><S-j>", "<C-W><S-J>")
vim.keymap.set("n", "<leader><S-k>", "<C-W><S-K>")
vim.keymap.set("n", "<leader><S-l>", "<C-W><S-L>")
vim.keymap.set("n", "<leader><S-h>", "<C-W><S-H>")
vim.keymap.set("n", "<leader>j", "<C-W><C-J>")
vim.keymap.set("n", "<leader>k", "<C-W><C-K>")
vim.keymap.set("n", "<leader>l", "<C-W><C-L>")
vim.keymap.set("n", "<leader>h", "<C-W><C-H>")
vim.keymap.set("n", "<C-j>", "<C-d>")
vim.keymap.set("n", "<C-k>", "<C-u>")

-- copy pasting
vim.keymap.set({ "n", "v" }, "<leader>y", "+y")

-- File explorer
-- vim.keymap.set("n", "<leader>e", ":Neotree<cr>")

-- Utils
vim.keymap.set("n", "<leader>#", "!!toilet -f pagga<cr>")
vim.keymap.set("n", "<leader>w", ":e ~/todo.md<cr>")

-- Terminal
-- vim.keymap.set("n", "<leader>t", ":ToggleTerm<cr>")

-- Telescope
-- vim.keymap.set("n", "<leader>/",
--   "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({layout_strategy='bottom_pane'})<cr>")
-- vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>")
-- vim.keymap.set("n", "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>")
-- vim.keymap.set("n", "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
-- vim.keymap.set("n", "<leader>fc", "<cmd>lua require('telescope.builtin').git_commits()<cr>")
-- vim.keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').git_branches()<cr>")

vim.keymap.set("n", "<leader>ggr", ":diffupdate<cr>")
vim.keymap.set("n", "<leader>ggl", ":diffget //3<cr>")
vim.keymap.set("n", "<leader>ggh", ":diffget //2<cr>")
vim.keymap.set("n", "<leader>ggj", "]c")
vim.keymap.set("n", "<leader>ggk", "[c")
