-- NOTE: [[ Bootstrap `lazy.nvim` plugin manager ]]
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Plugins
require("lazy").setup({
	{ "tpope/vim-sleuth" }, -- Detecta tabstop y shiftwidth automaticamente
	{ "numToStr/Comment.nvim", opts = {} },
	{ "NvChad/nvim-colorizer.lua", opts = {} },
	{ "vladdoster/remember.nvim", opts = {} },
	{ "superDross/run-with-me.vim" },
	require("plugins.rainbow-delimiters"),
	require("plugins.autopairs"),
	require("plugins.conform"),
	-- require("plugins.debug"),
	require("plugins.gitsigns"),
	require("plugins.indent_line"),
	require("plugins.lint"),
	require("plugins.lualine"),
	require("plugins.mini"),
	require("plugins.neo-tree"),
	require("plugins.nvim-cmp"),
	require("plugins.nvim-lspconfig"),
	require("plugins.nvim-treesitter"),
	require("plugins.telescope"),
	require("plugins.todo-comments"),
	require("plugins.which-key"),
	-- NOTE: Themes
	require("themes.catppuccin"),
	require("themes.neosolarized"),
	require("themes.rose-pine"),
	require("themes.tokyonight"),
	require("themes.kanagawa"),
	-- require("themes.onedark"),
	require("themes.onedarkpro"),
}, {
	ui = { icons = {} },
	performance = {
		cache = { enabled = true },
		reset_packpath = true,
		rtp = {
			reset = true,
			---@type string[]
			paths = {},
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
