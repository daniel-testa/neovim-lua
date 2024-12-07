-- NOTE: [[ Theme: solarized.nvim ]]
--  https://github.com/maxmx03/solarized.nvim
return {
	"maxmx03/solarized.nvim",
	enable = false,
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.background = "dark" -- or 'light'
		vim.cmd.highlight("Conditional gui=italic")
		vim.cmd.highlight("Statement gui=italic")
		vim.cmd.colorscheme("solarized")
	end,
}
