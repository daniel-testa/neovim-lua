-- [[ Setting options ]] -- See `:help o`
local opt = vim.opt
local fn = vim.fn
local o = vim.o

opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.mouse = "a"
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.breakindent = false
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.colorcolumn = ""
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = false
opt.listchars = { tab = "↹ ", trail = "·", nbsp = "␣", precedes = "⇇", extends = "⇉" }
opt.fillchars = { vert = "▆" }
opt.inccommand = "split"
opt.cursorline = true
opt.guicursor = {}
opt.wrap = true
opt.scrolloff = 10
opt.hlsearch = true

--[[ PowerShell como shell predeterminada en Windows]]
if fn.has("win32") == 1 and fn.has("wsl") == 0 then
	o.shell = fn.executable("pwsh") == 1 and "pwsh" or "powershell"
	o.shellcmdflag =
		"-NoProfile -NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::PlainText;Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
	o.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	o.shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
	o.shellquote = ""
	o.shellxquote = ""
end
