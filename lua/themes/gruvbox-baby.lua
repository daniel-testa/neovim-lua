-- NOTE: [[ Theme: tokyonight.nvim ]]
--  https://github.com/luisiacc/gruvbox-baby
return {
	"luisiacc/gruvbox-baby",
	enable = true,
	config = function()
		vim.g.gruvbox_baby_function_style = "bold"
		vim.g.gruvbox_baby_keyword_style = "italic"
		vim.g.gruvbox_baby_telescope_theme = 1
		vim.g.gruvbox_baby_transparent_mode = false
		-- vim.cmd.colorscheme("gruvbox-baby")
	end,
}
