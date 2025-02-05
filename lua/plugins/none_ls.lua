return {
	-- Although names none "ls" this is not a language server but plugin for mananing linting and formatting
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
                null_ls.builtins.diagnostics.stylelint,
				null_ls.builtins.formatting.stylua, --stylua is the formatter for lua
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.prettierd,
				--require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})
	end,
}

-- return {
-- 	{
-- 		"nvimtools/none-ls.nvim",
-- 		dependencies = {
-- 			"williamboman/mason.nvim",
-- 			"jay-babu/mason-null-ls.nvim",
-- 		},
-- 		config = function()
-- 			local mason_null_ls = require("mason-null-ls")
-- 			local null_ls = require("null-ls")
--
-- 			-- List of valid formatters and linters
-- 			local builtins = {
-- 				formatting = null_ls.builtins.formatting,
-- 				diagnostics = null_ls.builtins.diagnostics,
-- 			}
--
-- 			-- Setup mason-null-ls with filtering
-- 			mason_null_ls.setup({
-- 				automatic_installation = true,
-- 				handlers = {
-- 					function(source_name, methods)
-- 						-- Check if the installed tool exists in null-ls builtins
-- 						if builtins.formatting[source_name] then
-- 							null_ls.register(builtins.formatting[source_name])
-- 						elseif builtins.diagnostics[source_name] then
-- 							null_ls.register(builtins.diagnostics[source_name])
-- 						end
-- 					end,
-- 				},
-- 			})
--
-- 			-- Setup null-ls
-- 			null_ls.setup({
-- 				on_attach = function(client, bufnr)
-- 					if client.supports_method("textDocument/formatting") then
-- 						vim.api.nvim_create_autocmd("BufWritePre", {
-- 							buffer = bufnr,
-- 							callback = function()
-- 								vim.lsp.buf.format({ bufnr = bufnr })
-- 							end,
-- 						})
-- 					end
-- 				end,
-- 			})
-- 		end,
-- 	},
-- }
