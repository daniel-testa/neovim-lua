-- NOTE: [[ PLugin: nvim-cmp ]]  -- Autocompletion
--  https://github.com/hrsh7th/nvim-cmp
return {
	"hrsh7th/nvim-cmp",
	enable = true,
	event = "InsertEnter",
	dependencies = {

		-- NOTE: [[ PLugin: LuaSnip ]]  -- Snippet Engine & its associated nvim-cmp source
		--  https://github.com/L3MON4D3/LuaSnip
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				{
					-- NOTE: [[ PLugin: friendly-snippets ]]
					-- https://github.com/rafamadriz/friendly-snippets
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		-- NOTE: [[ PLugin: cmp_luasnip ]]
		--  https://github.com/saadparwaiz1/cmp_luasnip
		"saadparwaiz1/cmp_luasnip",

		-- NOTE: [[ PLugin: cmp-nvim-lsp ]]
		--  https://github.com/hrsh7th/cmp-nvim-lsp
		"hrsh7th/cmp-nvim-lsp",

		-- NOTE: [[ PLugin: cmp-path ]]
		--  https://github.com/hrsh7th/cmp-path
		"hrsh7th/cmp-path",
	},
	config = function()
		-- See `:help cmp`
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },
			-- TODO :chosen, you will need to read `:help ins-completion`
			-- No, but seriously. Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert({
				-- Selecionar Próximo item [n]extra
				["<C-n>"] = cmp.mapping.select_next_item(),
				-- Seleccionar item [p]revio
				["<C-p>"] = cmp.mapping.select_prev_item(),
				-- Desplazarse en la ventana de Documentación [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				-- Desencadenar manualmente Competar desde nvim-cmp.
				["<C-Space>"] = cmp.mapping.complete({}),
				-- <c-l> Mueve/expande hacia la derecha completando.
				-- <c-h> similar, pero hacia atrás/reduce.
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},
		})
	end,
}

-- vim: ts=2 sts=2 sw=2 et
