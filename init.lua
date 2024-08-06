vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.loaded_perl_provider = 0

-- [[ Setting options ]]
-- See `:help vim.opt`

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.listchars = { tab = "↹ ", trail = "·", nbsp = "␣", precedes = "⇇", extends = "⇉" }
vim.opt.fillchars = { vert = "▆" } --  █ ▓ ▆
vim.opt.inccommand = "split" -- Ver substituciones mientras escribís
vim.opt.cursorline = true
vim.opt.guicursor = {}
vim.opt.wrap = true
vim.opt.scrolloff = 6

-- [[ Accesos directos básicos ]] -- `:help vim.keymap.set()`

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnósticos
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir a mensaje de [D]iagnóstico previo" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir a mensaje de [D]iagnóstico siguiente" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnósticos: mostrar mensages de [E]rror" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnósticos: lista [Q]uickfix" })

-- WARN: Esto podría no funcionar el todos los emuladores de terminal, en ese caso usar el acceso estandar: <C-\><C-n> para salir del modo terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Salir del modo terminal" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Mover foco a la ventana de la Izquierda" }) --  `:help wincmd` lista completa
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Mover foco a la ventana de la Derecha" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Mover foco a la ventana de Abajo" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Mover foco a la ventana de Arriba" })

vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Guardar archivo actual" })
vim.keymap.set("n", "<S-C-k>", ":vert help <cWORD>", { desc = "Buscar Ayuda sonbre la palabra bajo cursor" })
vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>", { desc = "Buffer siguiente" })
vim.keymap.set("n", "<leader><S-Tab>", ":bNext<CR>", { desc = "Buffer anterior" })

--[[ Correr script Python]]
vim.keymap.set("n", "<leader>co", ":lua Correr()<CR>", { desc = "Corre scripts python(w)" })
function Correr()
	local extension = vim.fn.expand("%:e")
	if extension == "py" then
		vim.cmd(":w")
		vim.cmd('9split | terminal python "%"')
	elseif extension == "pyw" then
		vim.cmd(":w")
		vim.cmd('!pythonw "%"')
	end
end

-- [[ Autocommands básicos ]] -- `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd("TextYankPost", { -- `:help vim.highlight.on_yank()`
	desc = "Resaltar al copiar(yank) texto",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--[[ PowerShell como shell predeterminada en Windows]]
if vim.fn.has("win32") == 1 and vim.fn.has("wsl") == 0 then
	vim.o.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
	vim.o.shellcmdflag =
		"-NoProfile -NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::PlainText;Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
	vim.o.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	vim.o.shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
	vim.o.shellquote = ""
	vim.o.shellxquote = ""
end

-- NOTE: [[ Bootstrap `lazy.nvim` plugin manager ]]
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Plugins
require("lazy").setup({
	{ "tpope/vim-sleuth" }, -- Detecta tabstop y shiftwidth automaticamente
	{ "numToStr/Comment.nvim", opts = {} },
	{ "NvChad/nvim-colorizer.lua", opts = {} },
	{ "vladdoster/remember.nvim", opts = {} },
	{ "superDross/run-with-me.vim" },
	require("plugins/autopairs"),
	require("plugins/conform"),
	-- require("plugins/debug"),
	require("plugins/gitsigns"),
	require("plugins/indent_line"),
	require("plugins/lint"),
	require("plugins/lualine"),
	require("plugins/mini"),
	require("plugins/neo-tree"),
	require("plugins/nvim-cmp"),
	require("plugins/nvim-lspconfig"),
	require("plugins/nvim-treesitter"),
	require("plugins/telescope"),
	require("plugins/todo-comments"),
	require("plugins/which-key"),

	-- require("themes/tokyonight"),
	require("themes/catppuccin"),
	require("themes/neosolarized"),
}, {
	ui = {
		icons = {},
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
