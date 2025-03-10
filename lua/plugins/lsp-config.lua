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
                ensure_installed = { "biome", "lua_ls", "ts_ls", "html", "cssls", "pylsp", "emmet_language_server" },
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
                        on_attach = function(client, bufnr)
                            -- Enable signature help when you open parenthesis
                            vim.api.nvim_buf_set_keymap(bufnr, "i", "(", "(<cmd>lua vim.lsp.buf.signature_help()<CR>", {
                                noremap = true,
                                silent = true,
                            })
                        end,
                    })
                end,
                ["emmet_language_server"] = function()
                    require("lspconfig").emmet_language_server.setup({
                        capabilities = capabilities,
                        filetypes = {
                            "css",
                            "eruby",
                            "html",
                            "javascript",
                            "javascriptreact",
                            "less",
                            "sass",
                            "scss",
                            "svelte",
                            "pug",
                            "typescriptreact",
                            "vue",
                        },
                        init_options = {
                            html = {
                                options = {
                                    -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                                    ["bem.enabled"] = true,
                                },
                            },
                        },
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
                bind = true, -- This is mandatory for the plugin to work
                floating_window = true, -- Enable floating window for signatures

                -- Timing controls
                close_timeout = 2000, -- Window closes 4 seconds after last parameter
                timer_interval = 200, -- How often to check for updates

                -- Display settings
                floating_window_above_cur_line = true, -- Try to place window above current line
                hint_enable = true, -- Enable parameter hints
                hint_prefix = "🐼 ", -- You can change this to any symbol you prefer

                -- Manual control settings
                toggle_key = "<S-A-k>", -- Set Shift+K as toggle key
                select_signature_key = "<S-A-n>", -- Set Shift+N for cycling signatures
                toggle_key_flip_floatwin_setting = true,
                -- Window behavior
                fix_pos = false, -- Allow window to auto-close
                always_trigger = false, -- Don't show signature unnecessarily

                -- Window appearance
                handler_opts = {
                    border = "rounded",
                },
                max_height = 12,
                max_width = 80,
                wrap = true,
            })
        end,
    },
}
