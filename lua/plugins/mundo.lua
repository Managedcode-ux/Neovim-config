return {
	"simnalamburt/vim-mundo",
	cmd = "MundoToggle", -- Lazy-load on this command
	config = function()
		-- Optional: Set a keybinding to toggle Mundo
		vim.api.nvim_set_keymap("n", "<leader>u", ":MundoToggle<CR>", { noremap = true, silent = true })
	end,
}
