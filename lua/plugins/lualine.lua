-- NOTE: [[ Plugin: lualine.nvim ]] --   Lualine: Configuración portada desde init.vim antiguo
--  https://github.com/nvim-lualine/lualine.nvim
--
return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local function inactivo()
			return [[INACTIVO]]
		end
		-- local custom_NeoSolarized = require("lualine.themes.NeoSolarized") -- local var theme
		-- custom_NeoSolarized.normal.c.bg = "" -- configura fondo de la seccion `c` a nada/NONE
		-- custom_NeoSolarized.insert.c.bg = "" -- configura fondo de la seccion `c` a nada/NONE
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto", --custom_NeoSolarized,
				component_separators = {}, --{ left = "", right = "" },
				section_separators = {}, --{ left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", path = 4, symbols = { unnamed = "[Sin Nombre]", newfile = "[Nuevo]" } },
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { inactivo },
				lualine_y = {},
				lualine_z = { "filename" },
			},
			tabline = {},
			-- 	cond = function()
			-- 		local vim.api.nvim_list_tabpages().getn(vim.api.nvim_list_tabpages())
			-- 	end,
			-- },
			-- -- 	lualine_a = {},
			-- 	lualine_b = {
			-- 		{ "filename", path = 3, symbols = { unnamed = "[Sin Nombre]", newfile = "[Nuevo]" } },
			-- 	},
			-- 	lualine_c = {},
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = { "tabs" },
			-- },
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}

-- vim: ts=2 sts=2 sw=2 et
