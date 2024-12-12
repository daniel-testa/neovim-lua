-- NOTE: [[ PLugin: nvim-lspconfig ]]
--  https://github.com/neovim/nvim-lspconfig
return {
	"neovim/nvim-lspconfig",
	enable = true,
	dependencies = {
		-- NOTE: [[ PLugin: mason ]] -- Instalar automáticamente LSPs y herramientas relacionadas a stdpath para Neovim
		--  https://github.com/williamboman/mason.nvim
		{ "williamboman/mason.nvim", config = true }, -- Must be loaded before dependants

		-- NOTE: [[ PLugin: mason-lspconfig.nvim ]]
		--  https://github.com/williamboman/mason-lspconfig.nvim
		"williamboman/mason-lspconfig.nvim",

		-- NOTE: [[ PLugin: mason-tool-installer.nvim ]]
		--  https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- NOTE: [[ PLugin: fidget.nvim ]] --  Useful status updates for LSP.
		--  https://github.com/j-hui/fidget.nvim
		{ "j-hui/fidget.nvim", opts = {} },

		-- NOTE: [[ PLugin: neodev ]] -- `neodev` configura Lua LSP para tu configuración de Neovim, runtime y plugins
		--  usada para autocompletar, anotaciones y signatures de las apis de Neovim
		--  https://github.com/folke/neodev.nvim
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("gd", require("telescope.builtin").lsp_definitions, "[G]Ir a [D]efiniciones")
				map("gr", require("telescope.builtin").lsp_references, "[G] Ir a [R]eferencias")
				map("gI", require("telescope.builtin").lsp_implementations, "[G] Ir a [I]mplementación")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "[D]efinición de Tipos")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[S]ímbolos [D]ocumentación")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end
				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		local servers = {
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							black = { enabled = true },
							yapf = { enabled = true },
							pyflakes = { enabled = false },
							pycodestyle = {
								ignore = { "E501", "W503", "C901" },
								maxLineLength = 100,
								maxComplexity = 25,
							},
							mccabe = { enabled = false },
							-- flake8 = { enabled = false },
							rope = {
								enabled = true,
							},
							-- pylint = { enabled = false },
							jedi_completion = { fuzzy = false },
							pyls_isort = { enabled = false },
						},
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							disable = { "missing-fields" },
							globals = { "vim" },
						},
					},
				},
			},
			gopls = {
				completeUninported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		}
		require("mason").setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Utilizado para formatear código Lua
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}

-- vim: ts=2 sts=2 sw=2 et
