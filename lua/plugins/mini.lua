-- NOTE: [[ Plugin: mini.nvim ]]  -- Colección de pequeños módulos/plugins independientes
--  https://github.com/echasnovski/mini.nvim
return {
	"echasnovski/mini.nvim",
	config = function()
		-- Mejora [A]lrederor [I]nside(adentro)
		--  - va)  - [V]isual\[A]lrededor\[)]paréntesis
		--  - yinq - [Y]ank\[I]nside\[N]ext\[']quote (intraducible sin cambiar el atajo)
		--  - ci'  - [C]hange\[I]nside\[']quote
		require("mini.ai").setup({ n_lines = 500 })
		-- Añadir/borrar/reemplaza alrrededor de (corchetes, comillas, etc.)
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()
	end,
}

-- vim: ts=2 sts=2 sw=2 et
