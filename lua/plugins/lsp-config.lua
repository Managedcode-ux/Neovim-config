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
				ensure_installed = { "biome","lua_ls", "ts_ls", "html","css-lsp","emmet-ls","html-lsp","markuplint","prettierd","ruff","stylelint","stylua"},
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

			-- Default handler - will be called for each LSP server that dosen't have a dedicated handlder
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- Dedicated hander - this can be used as an example for setting a custom handler if any special settings are required for the lsp
				-- ["lua_ls"] = function()
				-- 	lspconfig.lua_ls.setup({
				-- 		capabilities = capabilities,
				-- 	})
				-- end,
				["ts_ls"] = function()
					require("lspconfig").ts_ls.setup({
						capabilities = capabilities,
						settings = {
							typescript = {
								suggestionActions = {
									enabled = true,
								},
								updateImportsOnFileMove = {
									enabled = "always",
								},
								preferences = {
									importModuleSpecifier = "non-relative",
								},
							},
							javascript = {
								suggestionActions = {
									enabled = true,
								},
								updateImportsOnFileMove = {
									enabled = "always",
								},
							},
						},
						filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
					})
				end,
			})
		end,
	},
}
