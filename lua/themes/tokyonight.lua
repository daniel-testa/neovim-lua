-- NOTE: [[ Theme: tokyonight.nvim ]]
--  https://github.com/folke/tokyonight.nvim
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon",
			transparent = false,
			styles = {
				comments = { italic = true },
				keywords = { italic = true, bold = true },
				functions = { italic = false, bold = true },
				variables = { bold = true },
			},
		})
		-- vim.cmd.colorscheme("tokyonight-moon")
	end,
}

-- vim: ts=2 sts=2 sw=2 et
