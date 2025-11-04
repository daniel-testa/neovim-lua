-- NOTE: [[ Theme: NeoSolarized.nvim ]]
--  https://github.com/Tsuzat/NeoSolarized.nvim
return {
	"Tsuzat/NeoSolarized.nvim",
	enable = false,
	lazy = false,
	priority = 1000,
	config = function()
		local NeoSolarized = require("NeoSolarized")
		NeoSolarized.setup({
			style = "dark",
			transparent = false,
			terminal_colors = true,
			enable_italics = false,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { bold = false },
				variables = { italic = false, bold = true },
				string = { italic = false },
				underline = false,
				undercurl = true,
			},
		})
		-- vim.cmd([[ colorscheme NeoSolarized ]])
	end,
}
