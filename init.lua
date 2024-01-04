-- Packer configuration
require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Plugins
	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("dense-analysis/ale")
	use("github/copilot.vim")
	use("mattn/emmet-vim")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({})
			vim.cmd("colorscheme github_dark_dimmed")
		end,
	})
	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
end)

-- General settings
vim.cmd("colorscheme github_dark_dimmed")
vim.g.mapleader = ","
vim.o.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Key mappings
vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-y>", ":let @+=expand('%:p')<CR>", { noremap = true, silent = true })

-- File type configuration
vim.api.nvim_command("autocmd BufRead,BufNewFile *.erb set filetype=eruby")

-- ALE configuration
vim.g.ale_fixers = {
	["ruby"] = { "standardrb" },
	["eruby"] = { "erb-formatter" },
	["lua"] = { "stylua" },
}
vim.g.ale_linters = {
	ruby = { "standardrb" },
	eruby = { "erb-formatter" },
}
vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = "always"
vim.g.ale_javascript_eslint_executable = "eslint_d"

-- Lualine setup
require("lualine").setup({
	sections = {
		lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
	},
})

-- Netrw configuration
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Termguicolors and NvimTree setup
vim.opt.termguicolors = true
require("nvim-tree").setup()

-- Telescope key mappings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- GitSigns configuration
require("gitsigns").setup({})
