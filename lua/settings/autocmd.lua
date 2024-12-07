local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup
require("settings.utils")

autocmd("FileType", {
	desc = "Ejecutar Python script",
	group = vim.api.nvim_create_augroup("py_ejecutar", { clear = true }),
	pattern = "python",
	callback = function()
		vim.keymap.set("n", "<F5>", function()
			vim.cmd("write")
			vim.cmd('9split | terminal python "%"')
		end)
	end,
})

autocmd("FileType", {
	desc = "Correr go",
	group = vim.api.nvim_create_augroup("go_correr", { clear = true }),
	pattern = "go",
	callback = function()
		vim.keymap.set("n", "<F5>", function()
			vim.cmd("write")
			vim.cmd('9split | terminal go run "%"')
		end)
		vim.keymap.set("n", "<F6>", function()
			vim.cmd("write")
			vim.cmd('9split | terminal go build "%"')
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
