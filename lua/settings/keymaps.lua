local map = vim.keymap.set
local diag = vim.diagnostic

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnósticos
map("n", "[d", diag.goto_prev, {
	desc = "Ir a mensaje de [D]iagnóstico previo",
})
map("n", "]d", diag.goto_next, { desc = "Ir a mensaje de [D]iagnóstico siguiente" })
map("n", "<leader>e", diag.open_float, { desc = "Diagnósticos: mostrar mensages de [E]rror" })
map("n", "<leader>q", diag.setloclist, { desc = "Diagnósticos: lista [Q]uickfix" })

-- WARN: Esto podría no funcionar el todos los emuladores de terminal, en
-- ese caso usar el acceso estandar: <C-\><C-n> para salir del modo terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Salir del modo terminal" })

--  `:help wincmd` lista completa
map("n", "<C-h>", "<C-w><C-h>", { desc = "Mover foco a la ventana de la Izquierda" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Mover foco a la ventana de la Derecha" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Mover foco a la ventana de Abajo" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Mover foco a la ventana de Arriba" })
map("n", "<A-,>", "<C-w><C-<>", { desc = "Ajustar el tamaño de la ventana a la Derecha" })
map("n", "<A-.>", "<C-w><C->>", { desc = "Ajustar el tamaño de la ventana a la Izquierda" })

map("n", "grn", vim.lsp.buf.rename)
map("n", "gra", vim.lsp.buf.code_action)
map("n", "grr", vim.lsp.buf.references)
map("i", "<C-s>", vim.lsp.buf.signature_help)

map("n", "<C-s>", ":w<CR>", { desc = "Guardar archivo actual" })
map("n", "<leader><C-k>", ":help <C-r><C-w><CR>", {
	desc = "Buscar Ayuda sonbre la palabra bajo cursor",
})
map("n", "<leader><Tab>", ":bnext<CR>", { desc = "Buffer siguiente" })
map("n", "<leader><S-Tab>", ":bNext<CR>", { desc = "Buffer anterior" })

--[[ Correr script Python]]
map("n", "<leader>co", ":lua Correr()<CR>", { desc = "Corre scripts python(w)" })
