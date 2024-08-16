vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.loaded_perl_provider = 0

require("settings.opt")
require("settings.keymaps")
require("settings.autocmd")
require("settings.lazy")

-- vim: ts=2 sts=2 sw=2 et
