-- NOTE: [[ Theme: tokyonight.nvim ]]
--  https://github.com/folke/tokyonight.nvim
return {
	"folke/tokyonight.nvim",
	enable = false,
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			light_style = "day",
			terminal_colors = true,
			transparent = false,
			styles = {
				comments = { italic = true },
				keywords = { italic = true, bold = true },
				functions = { italic = false, bold = true },
				variables = { bold = true },
				sidebars = "light",
				floats = "light",
			},
		})
		-- vim.cmd.colorscheme("tokyonight-moon")
	end,
}
