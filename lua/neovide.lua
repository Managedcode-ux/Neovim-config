local M = {}

function M.setup()
	if vim.g.neovide then
		-- font configurations
		vim.o.guifont = "JetBrainsMono Nerd Font Mono:h12"

		--line space
		vim.opt.linespace = 1

		--titlebar color and title bar text color`
		vim.g.neovide_title_background_color =
			string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)

		vim.g.neovide_title_text_color = "gold"

		-- hiding mouse when typing
		vim.g.neovide_hide_mouse_when_typing = true

		vim.g.neovide_cursor_smooth_blink = true
	end
end

return M
