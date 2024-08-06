-- NOTE: [[ Theme: vim-solarized ]]
--  https://github.com/lifepillar/vim-solarized8
return {
	"lifepillar/vim-solarized8",
	priority = 1000,
	init = function()
		-- vim.cmd.colorscheme("solarized8_flat")  -- Comando para cargar efectivamente el esquema de color
		vim.cmd.highlight("Comment gui=italic")
		vim.cmd.highlight("Conditional gui=italic")
		vim.cmd.highlight("Statement gui=italic")
	end,
}

-- vim: ts=2 sts=2 sw=2 et
