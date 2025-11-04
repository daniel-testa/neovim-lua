--  https://github.com/catppuccin/nvim
return {
	"catppuccin/nvim",
	enable = true,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = {
				dark = "mocha",
				light = "latte",
			},
			show_end_of_buffer = true,
			term_colors = true,
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.15,
			},
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = { "bold" },
				keywords = { "bold" },
				variables = { "bold" },
				functions = {},
				strings = {},
				-- numbers = {},
				-- booleans = {},
				-- properties = {},
				-- types = {},
				-- operators = {},
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
