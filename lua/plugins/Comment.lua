return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- Load the plugin before you start editing
    opts = {
        padding = true,    -- Add a space between comment and line
        sticky = true,    -- Whether the cursor should stay at its position
        toggler = {
            line = '<leader>/',  -- Line-comment toggle keymap
            block = '<leader>b/', -- Block-comment toggle keymap
        },
        opleader = {
            line = '<leader>/',   -- Line-comment keymap for Visual mode
            block = '<leader>b/', -- Block-comment keymap for Visual mode
        },
        -- Enable extra mappings like gcc, gbc, etc.
        mappings = {
            basic = true,    -- Enable gcc, gbc
            extra = true,    -- Enable gco, gcO, gcA
        },
    },
    config = function(_, opts)
        require('Comment').setup(opts)
    end
}
