-- NOTE: [[ Plugin: todo-comments.nvim ]] -- Highlight todo, notes, etc in comments
--  https://github.com/folke/todo-comments.nvim
return {
	"folke/todo-comments.nvim",
	enable = true,
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}
