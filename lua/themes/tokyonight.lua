-- NOTE: [[ Theme: tokyonight.nvim ]]
--  https://github.com/folke/tokyonight.nvim
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
    })
    -- vim.cmd.colorscheme("tokyonight-night")
    vim.cmd.hi("Comment gui=italic")
  end,
}

-- vim: ts=2 sts=2 sw=2 et
