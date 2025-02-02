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
		end,
	},
}
