-- NOTE: [[ Plugin: todo-comments.nvim ]] -- Highlight todo, notes, etc in comments
--  https://github.com/folke/todo-comments.nvim
return {
	"folke/todo-comments.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}

-- vim: ts=2 sts=2 sw=2 et
