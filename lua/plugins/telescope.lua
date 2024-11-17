-- NOTE: [[ PLugin: telescope.nvim ]] -- Fuzzy Finder (Busqueda difusa) | archivos, lsp, etc
--  https://github.com/nvim-telescope/telescope.nvim
return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		-- NOTE: [[ PLugin: plenary.nvim ]]
		--  https://github.com/nvim-lua/plenary.nvim
		"nvim-lua/plenary.nvim",
		{
			-- NOTE: [[ PLugin: telescope-fzf-native.nvim ]]
			--  https://github.com/nvim-telescope/telescope-fzf-native.nvim
			"nvim-telescope/telescope-fzf-native.nvim",
			-- `build` es utilizado para correr algunos comandos cuando el pugin es instalado/actualizado.
			build = "make",
			-- `cond` es la condición utilizada para determinar si el plugin deberá ser
			-- instalado o cargado
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		-- NOTE: [[ PLugin: telescope-ui-select.nvim ]]
		--  https://github.com/nvim-telescope/telescope-ui-select.nvim
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- NOTE: [[ PLugin: nvim-web-devicons ]]
		--  https://github.com/nvim-tree/nvim-web-devicons
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- [[ Configurar Telescope ]] `:help telescope.setup()
		require("telescope").setup({
			pickers = { -- Ayuda en ventana vertival
				help_tags = {
					mappings = {
						i = { ["<CR>"] = "file_vsplit" },
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Premitir extensiones para Telescope si estuvieran instaladas
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- Ver `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Bu[S]car en [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Bu[S]car [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Bu[S]car [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Bu[S]car [S]elección Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Bu[S]car [W]ord actual" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Bu[S]car con [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Bu[S]car [D]iagnósticos" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Bu[S]car [R]esumen" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Bu[S]car archivos recientes ("." para repetir)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Buscar buffers existentes" })

		-- Ejemplo avanzado de como sobreescribir el tema y el comportamiento predeterminado
		vim.keymap.set("n", "<leader>/", function()
			-- Se puede pasar configuraciones adicionales a Telescope para cambiar el tema, la disposición, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
				borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- Es posible pasar opciones de configuraciones adicionales.
		--  Ver `:help telescope.builtin.live_grep()` para info acerca de alguna clave(key) en particular
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Grep en vivo para Archivos Abiertos",
			})
		end, { desc = "Bu[S]car [/] en Archivos Abiertos" })

		-- Acceso directo para buscar los archivos de configuración de neovim
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Bu[S]car archivos de [N]eovim" })
	end,
}

-- vim: ts=2 sts=2 sw=2 et
