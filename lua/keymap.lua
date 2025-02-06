-- keymapping.lua
local M = {}

M.setup = function()
	-- Import required modules up front
	local telescope = require("telescope.builtin")
	local keymap_ref = require("refrence")
	-----------------------------------------------------------------------------------------------------------------------------------------------
	--[[ CUSTOM KEYMAPS ]]
	-- Command mode paste from register
	vim.keymap.set("c", "<C-v>", '<C-r>"', { noremap = true, desc = "Paste from register in command mode" })
	vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })
	vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })
	vim.keymap.set("n", "cs", ":nohl<CR>", { desc = "Clear search highlighting" })
	-----------------------------------------------------------------------------------------------------------------------------------------------

	--[[ LSP RELATED KEYMAPS ]]
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

	-----------------------------------------------------------------------------------------------------------------------------------------------

	--[[ TELESCOPE KEYMAPS ]]
	--
	-- File and text searching
	vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
	vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
	vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
	vim.keymap.set("n", "<leader>ch", "<cmd>Telescope keymaps<CR>", { desc = "Show all the keymappings" })

	--code navigation
	vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<CR>") -- Document symbols
	vim.keymap.set("n", "<leader>S", "<cmd>Telescope lsp_workspace_symbols<CR>") -- Workspace symbols

	-- Diagnostics
	vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<CR>") -- Show diagnostics
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev) -- Previous diagnostic
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next) -- Next diagnostic

	-----------------------------------------------------------------------------------------------------------------------------------------------

	--[[ NEOTREE KEYMAPS ]]
	--
	-- File explorer
	vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", { desc = "Toggle file explorer" })

	-----------------------------------------------------------------------------------------------------------------------------------------------

	--[[ Terminal keymaps ]]
	--
	-- Add terminal related keymaps here if you use them
	-----------------------------------------------------------------------------------------------------------------------------------------------

	--[[ Window management keymaps ]]
	--
	-- Add window management keymaps here
	vim.keymap.set("n", "<C-w>", ":vsplit<CR>", { desc = "Create vertical split" })
	vim.keymap.set("n", "<C-w>h", ":split<CR>", { desc = "Create horizontal split" })

	-- Window resizing
	vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
	vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
	vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
	vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

	-- Window movements
	vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
	vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
	vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
	-----------------------------------------------------------------------------------------------------------------------------------------------

	--[[Buffer Management]]
	vim.keymap.set("n", "<C-b>", ":enew<CR>", { desc = "Create new buffer" })
	vim.keymap.set("n", "<C-b>n", ":bnext<CR>", { desc = "Go to next buffer" })
	vim.keymap.set("n", "<C-b>p", ":bprevious<CR>", { desc = "Go to previous buffer" })
	vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close current buffer" })

	-----------------------------------------------------------------------------------------------------------------------------------------------
	-- [[Tab management]]
	vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { desc = "Create new tab" })
	vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "Go to next tab" })
	vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Go to previous tab" })

	-----------------------------------------------------------------------------------------------------------------------------------------------
	--[[ Keymap Reference ]]
	--[[currently Not working will need to reimplement or correct the refrence.lua file]]
	--
	keymap_ref.set_keymap("n", "<leader>hk", function()
		keymap_ref.list_keymaps()
	end, { desc = "List all keymaps" })

	keymap_ref.set_keymap("n", "<leader>sk", function()
		vim.ui.input({ prompt = "Search keymaps: " }, function(input)
			if input then
				keymap_ref.search_keymaps(input)
			end
		end)
	end, { desc = "Search keymaps" })

	------------------------------------------------------------------
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

return M
