local cmd = vim.cmd
local api = vim.api

-- --[[ Correr script Python]]
-- function Correr()
-- 	local extension = vim.fn.expand("%:e")
-- 	if extension == "py" then
-- 		cmd(":silent! write")
-- 		-- vim.cmd('9split | terminal python "%"')
-- 		cmd('vsplit | terminal python "%"')
-- 	elseif extension == "pyw" then
-- 		cmd(":silent! write")
-- 		cmd('!pythonw "%"')
-- 	end
-- end

--[[ Mensaje flotante al guardar archivo ]]
function Mensage_al_guardar()
	local nombrearchivo = vim.fn.expand("%:p")
	local mensaje = string.format("Archivo '%s' guardado.", nombrearchivo)
	local ancho = string.len(mensaje)
	local opts = {
		relative = "editor",
		width = ancho,
		height = 1,
		col = vim.o.columns - 1,
		row = vim.o.lines - 2,
		anchor = "SW",
		style = "minimal",
		title = "  Archivo Guardado",
		border = "rounded",
	}
	local buf = vim.api.nvim_create_buf(false, true) -- buffer
	local win = vim.api.nvim_open_win(buf, true, opts) -- float
	api.nvim_buf_set_lines(buf, 0, -1, true, { mensaje }) -- añadir mensaje al buffer
	api.nvim_set_option_value("winhl", "Normal:DiagnosticOk", { win = win }) -- opciones y creación de la ventana
	vim.defer_fn(function() -- api, corre function() después de x ms
		api.nvim_win_close(win, true) -- cierra float
	end, 2000)
end

-- vim: ts=2 sts=2 sw=2 et
