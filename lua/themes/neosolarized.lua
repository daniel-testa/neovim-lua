-- NOTE: [[ Theme: NeoSolarized.nvim ]]
--  https://github.com/Tsuzat/NeoSolarized.nvim
return {
	"Tsuzat/NeoSolarized.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local NeoSolarized = require("NeoSolarized")
		NeoSolarized.setup({
			transparent = true, -- cambio 1
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { bold = true },
				variables = {},
				string = { italic = false }, -- cambio 2
				underline = true,
				undercurl = true,
			},
			-- on_colors = function(colors)
			-- 	colors.bg_statusline = colors.none -- intento de hacer lualine transparente WARN: FALLó
			-- end,
		})
		vim.cmd([[ colorscheme NeoSolarized ]])
	end,
}

-- vim: ts=2 sts=2 sw=2 et
