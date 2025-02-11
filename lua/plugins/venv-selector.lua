-- return {
-- 	"linux-cultist/venv-selector.nvim",
-- 	dependencies = {
-- 		"neovim/nvim-lspconfig",
-- 		"mfussenegger/nvim-dap",
-- 		"mfussenegger/nvim-dap-python", --optional
-- 		{
-- 			"nvim-telescope/telescope.nvim",
-- 			branch = "0.1.x",
-- 			dependencies = { "nvim-lua/plenary.nvim" },
-- 		},
-- 	},
-- 	lazy = false,
-- 	branch = "regexp", -- This is the regexp branch, use this for the new version
-- 	config = function()
-- 		require("venv-selector").setup({
-- 			name =  {"venv", ".venv",".env","env"},
-- 			auto_refresh = true,
-- 			search_venv_managers = true,
-- 			search_workspace = true,
-- 			parents = 2, -- how many parent directories to search
-- 			enabled_managers = { "virtualenv", "poetry", "pipenv", "conda" },
-- 			-- Add the search parameter to look for additional folder names
-- 			search = {
-- 				"env", -- Will now look for 'env' folder
-- 				".env", -- Hidden env folder
-- 				"venv", -- Standard venv folder
-- 				".venv", -- Hidden venv folder
-- 				"virtualenv", -- Another common name
-- 				-- You can add more patterns here as needed
-- 			},
-- 			debug = true,
-- 		})
--
-- 		-- Optional: Auto-select virtualenv when a new file is opened
-- 		vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
-- 			pattern = "*",
-- 			callback = function()
-- 				-- Only run if we're in a Python file
-- 				if vim.bo.filetype == "python" then
-- 					require("venv-selector").retrieve_from_cache()
-- 				end
-- 			end,
-- 		})
-- 	end,
-- 	keys = {
-- 		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
-- 		{ "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
-- 	},
-- } -- Only one closing brace here

return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
        "mfussenegger/nvim-dap-python", --optional
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
        require("venv-selector").setup({
            settings = {
                options = {
                    debug = true,
                }
            }
        })
    end,
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
}
