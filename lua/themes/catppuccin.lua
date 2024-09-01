-- NOTE: [[ Theme: Catppuccin ]]
--  https://github.com/catppuccin/nvim

return {
	"catppuccin/nvim",
	name = "catppuccin-mocha",
	priority = 1000,
	color_overrides = {
		mocha = {},
	},
	init = function()
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}

-- vim: ts=2 sts=2 sw=2 et
