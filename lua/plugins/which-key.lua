-- NOTE: [[ PLugin: which-key.nvim ]]
--  https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  event = "VimEnter", -- Establece el evento de carga a 'VimEnter'
  config = function() -- Esta es la función que corre, DESPUÉS de la carga
    require("which-key").setup()
    require("which-key").add({
      { "<leader>c", group = "[C]ode" },
      { "<leader>d", group = "[D]ocument" },
      { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
      { "<leader>r", group = "[R]ename" },
      { "<leader>s", group = "Bu[S]car" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>w", group = "[W]orkspace" },
    })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
