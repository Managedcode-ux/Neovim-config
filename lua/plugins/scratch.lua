return -- use lazy.nvim
{
	"LintaoAmons/scratch.nvim",
	event = "VeryLazy",
    config = function()
        require("scratch").setup({
        scratch_file_dir = vim.fn.getcwd() .. "/scratch.nvim"})
    end
}
