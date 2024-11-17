-- NOTE: [[ Theme: Catppuccin ]]
--  https://github.com/catppuccin/nvim

return {
	"catppuccin/nvim",
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
				functions = {},
				keywords = { "bold" },
				strings = {},
				variables = { "bold" },
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}

-- vim: ts=2 sts=2 sw=2 et
