return {
	"HiPhish/rainbow-delimiters.nvim",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("rainbow-delimiters.setup").setup({
			strategy = { global = require("rainbow-delimiters.strategy.global") },

			colors = {
				"#E06C75",
				"#E5C07B",
				"#61AFEF",
				"#D19A66",
				"#98C379",
				"#C678DD",
				"#56B6C2",
				-- Vivid Violet [7]
			},
			query = { html = "rainbow-tags" }, -- Highlight HTML tags instead of brackets
		})
	end,
}
