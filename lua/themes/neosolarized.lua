-- NOTE: [[ Theme: NeoSolarized.nvim ]]
--  https://github.com/Tsuzat/NeoSolarized.nvim
return {
	"Tsuzat/NeoSolarized.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local NeoSolarized = require("NeoSolarized")
		NeoSolarized.setup({
			style = "dark",
			transparent = true, -- cambio 1
			terminal_colors = true,
			enable_italics = false,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { bold = true },
				variables = { italic = false, bold = true },
				string = { italic = false }, -- cambio 2
				underline = true,
				undercurl = true,
			},
		})
		vim.cmd([[ colorscheme NeoSolarized ]])
	end,
}

-- vim: ts=2 sts=2 sw=2 et
