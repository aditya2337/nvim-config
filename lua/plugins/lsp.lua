return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    'ts_ls',
                    'lua_ls',
                    'rust_analyzer',
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                    lua_ls = function()
                        require("lspconfig").lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { 'vim' }
                                    }
                                }
                            }
                        })
                    end,
                }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}
                
                opts.desc = "Go to Definition"
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                
                opts.desc = "Hover Documentation"
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                
                opts.desc = "Workspace Symbols"
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                
                opts.desc = "View Diagnostic (Float)"
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                
                opts.desc = "Next Diagnostic"
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                
                opts.desc = "Prev Diagnostic"
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                
                opts.desc = "Code Action"
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                
                opts.desc = "Find References"
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                
                opts.desc = "Rename Symbol"
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                
                opts.desc = "Signature Help"
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)
            lsp_zero.set_sign_icons({
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
            })
            vim.diagnostic.config({
                virtual_text = true
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        config = function()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()
            
            -- Helper to add descriptions to cmp mappings
            local function with_desc(map, desc)
                return function(fallback)
                    map(fallback)
                end
            end
            -- Note: cmp mappings are special and don't sit in the normal vim keymap table the same way.
            -- Using a different approach for documentation: We'll document them manually in the cheatsheet generator
            -- or we can try to inject them if supported. 
            -- Actually, standard vim.keymap.set is better for documentation if possible, but cmp controlls these.
            
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<Tab>'] = nil,
                    ['<S-Tab>'] = nil,
                }),
                sources = {
                    {name = 'nvim_lsp'},
                }
            })
        end
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = false,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "prettier", -- formatter
                    "stylua", -- formatter
                },
            })
        end
    }
}

