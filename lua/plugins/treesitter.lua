return{
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
        -- if treesitter gives error on windows try manually installing it using "TSIntall" command
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {"lua","javascript"},
            auto_install = true,
            sync_install = true,
            highlight = {enable = true},
            indent = {enable = true},
            parser_install_dir = vim.fn.stdpath("data") .. "/site"
        }) 
    end
}
