vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

vim.opt.hlsearch = true    -- Enable search highlighting
vim.opt.incsearch = true   -- Enable incremental search
vim.opt.ignorecase = true  -- Ignore case in search patterns
vim.opt.smartcase = true   -- Override ignorecase if search contains uppercase


vim.opt.termguicolors = true  -- Enable true color support
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-NoLogo -Command"
