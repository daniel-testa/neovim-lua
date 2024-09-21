local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup
require("settings.utils")

autocmd("FileType", {
	desc = "python ft mappings",
	group = vim.api.nvim_create_augroup("py_mapping", { clear = true }),
	pattern = "python",
	callback = function()
		vim.keymap.set("n", "<F5>", function()
			vim.cmd("write")
			vim.cmd('9split | terminal python "%"')
		end)
	end,
})

autocmd("BufWritePost", {
	desc = "Crea mensaje flotante al guardar un archivo",
	group = autogroup("daniel-float-al-guardar", { clear = true }),
	pattern = "*",
	callback = function()
		Mensage_al_guardar()
	end,
})

autocmd("TextYankPost", { -- `:help vim.highlight.on_yank()`
	desc = "Resaltar al copiar(yank) texto",
	group = autogroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- vim: ts=2 sts=2 sw=2 et
