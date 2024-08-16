local autocmd = vim.api.nvim_create_autocmd
require("settings.utils")

autocmd("BufWritePost", {
	desc = "Crea mensaje flotante al guardar un archivo",
	group = vim.api.nvim_create_augroup("daniel-float-al-guardar", { clear = true }),
	pattern = "*",
	callback = function()
		Mensage_al_guardar()
	end,
})

autocmd("TextYankPost", { -- `:help vim.highlight.on_yank()`
	desc = "Resaltar al copiar(yank) texto",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- vim: ts=2 sts=2 sw=2 et
