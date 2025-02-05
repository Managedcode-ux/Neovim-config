return {
	-- Although names none "ls" this is not a language server but plugin for mananing linting and formatting
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, --stylua is the formatter for lua
				null_ls.builtins.completion.spell,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.diagnostics.htmlhint
,
				--require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})

	end,
}
