-- Abre ayuda en ventana vertical, `q` para salir de la ayuda
vim.api.nvim_cmd({ cmd = "wincmd", args = { "L" } }, {})
vim.keymap.set("n", "q", "<CMD>q<CR>", { buffer = 0 })
