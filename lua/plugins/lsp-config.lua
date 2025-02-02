return {
	{
		-- This plugin is for installing language servers only
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- This plugin is a plugin for the above plugin (Mason) and helps to preconfigure the language servers that should be present on install
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls" },
			})
		end,
	},
	{
		-- This plugin is what helps us do things like goto definiito, goto declaration, code action and act on other information provided by the lsp. This when combined with Telescope ui plugin (available in the telescope folder) it gives us a nice ui.
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n','gr',vim.lsp.buf.reference,{desc='Go to refrence'})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Smart rename' })
		end,
	},
}
