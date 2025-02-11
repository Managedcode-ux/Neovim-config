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
				ensure_installed = { "biome", "lua_ls", "ts_ls", "html", "cssls", "pylsp" },
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

						settings = {
							-- Enable signature help
							signatureHelp = {
								enabled = true,
							},
							-- Show parameter hints
							hover = {
								enabled = true,
							},
							completion = {
								signatureHelp = {
									enabled = true,
								},
							},
						},

						-- Add this to get automatic signature triggering
						on_attach = function(client, bufnr)
							-- Enable signature help when you open parenthesis
							vim.api.nvim_buf_set_keymap(bufnr, "i", "(", "(<cmd>lua vim.lsp.buf.signature_help()<CR>", {
								noremap = true,
								silent = true,
							})
						end,
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
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		config = function()
			-- Notice the underscore here, not a hyphen
			require("lsp_signature").setup({
				bind = true,
				handler_opts = {
					border = "rounded",
				},
				hint_enable = true,
				hint_prefix = "🔍 ",
				floating_window = true,
				floating_window_above_cur_line = true,
				toggle_key = "<S-A-k>",
				select_signature_key = "<S-A-n>",
				-- Add these settings for automatic closing
				close_timeout = 5000, -- Close the window after 1000ms (1 second) of no typing
				timer_interval = 500, -- Check every 100ms if we should close
				auto_close_after = 1, -- Close after this many characters typed following the signature match

				-- Additional settings for better behavior
				check_completion_visible = true, -- Don't show signatures when completion is visible
				always_trigger = false, -- Only show signatures when needed
				-- Add these new settings
				max_height = 12, -- Allows for more signature variations to be shown
				max_width = 80, -- Wider window to show full signatures
				wrap = true, -- Wrap long signatures instead of truncating
				doc_lines = 10, -- Show more lines of documentation
				floating_window_off_x = 1, -- Adjust window position if needed
				floating_window_off_y = 0,
				check_completion_visible = false, -- Show signatures even when completion is visible
				always_trigger = true, -- Show signature help more aggressively
				debug = false, -- Set to true temporarily if you need to debug
			})
		end,
	},
}
