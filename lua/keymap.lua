-- keymapping.lua
local M = {}

M.setup = function()
	-- Import required modules up front
	local telescope = require("telescope.builtin")

	--[[ Custom keymaps ]]
	-- Command mode paste from register
	vim.keymap.set("c", "<C-v>", '<C-r>"', { noremap = true, desc = "Paste from register in command mode" })

	--[[ LSP related keymaps ]]
	--
	-- Documentation and navigation
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
	vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

	-- Code actions and modifications
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
	vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })

	--[[ Telescope keymaps ]]
	--
	-- File and text searching
	vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
	vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
	vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })

	--code navigation
	vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<CR>") -- Document symbols
	vim.keymap.set("n", "<leader>S", "<cmd>Telescope lsp_workspace_symbols<CR>") -- Workspace symbols

	-- Diagnostics
	vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<CR>") -- Show diagnostics
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev) -- Previous diagnostic
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next) -- Next diagnostic

	--[[ Neo-tree keymaps ]]
	--
	-- File explorer
	vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", { desc = "Toggle file explorer" })

	--[[ Terminal keymaps ]]
	--
	-- Add terminal related keymaps here if you use them

	--[[ Window management keymaps ]]
	--
	-- Add window management keymaps here

	--[[ Completion menu keymaps ]]
	--
	-- Note: These should stay in cmp setup (snippet completion file) but are listed here for reference
	-- local cmp = require('cmp')
	-- ["<C-b>"] = cmp.mapping.scroll_docs(-4)
	-- ["<C-f>"] = cmp.mapping.scroll_docs(4)
	-- ["<C-Space>"] = cmp.mapping.complete()
	-- ["<C-e>"] = cmp.mapping.abort()
	-- ["<CR>"] = cmp.mapping.confirm({ select = true })
end

-- Optional: Add a function to list all keymaps with their descriptions
M.list_keymaps = function()
	-- You could implement a function here that prints all keymaps
	-- This would be useful for documentation purposes
end

return M
