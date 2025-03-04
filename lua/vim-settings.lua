--vim.cmd.colorscheme("gruvbox-material")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

vim.opt.hlsearch = true -- Enable search highlighting
vim.opt.incsearch = true -- Enable incremental search
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search contains uppercase
vim.opt.wrap = false

vim.opt.termguicolors = true -- Enable true color support
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-NoLogo -Command"
vim.o.undofile = true
-- :Config opens the neovim config directory
vim.api.nvim_create_user_command("Config", function()
	local config_dir = vim.fn.stdpath("config")
	vim.cmd("cd " .. config_dir)
	vim.cmd("edit " .. config_dir)
end, {
	desc = "Open Neovim config directory",
})
