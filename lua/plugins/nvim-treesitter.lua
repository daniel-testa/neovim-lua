--  [[ Plugin: nvim-treesitter ]] -- Resaltar, editar, y navegar código
--  https://github.com/nvim-treesitter/nvim-treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "bash", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc", "python" },
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
	},
	config = function(_, opts)
		-- [[ Configuración Treesitter ]] Ver `:help nvim-treesitter`
		require("nvim-treesitter.install").prefer_git = false
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)
	end,
}

-- vim: ts=2 sts=2 sw=2 et