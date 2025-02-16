return {
     {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "ts_ls", "lua_ls", "eslint", "rust_analyzer" },
                automatic_installation = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local nvim_lsp = require("lspconfig")
            local on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end

            nvim_lsp.ts_ls.setup {
                on_attach = on_attach,
                cmd = { "typescript-language-server", "--stdio" },
                filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
                init_options = { hostInfo = "neovim" },
            }

            nvim_lsp.diagnosticls.setup {}

            nvim_lsp.lua_ls.setup {
                cmd = { "lua-language-server" },
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = { globals = { 'vim' } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                        telemetry = { enable = false },
                    },
                },
            }

            nvim_lsp.eslint.setup {
                on_attach = on_attach,
                cmd = { "vscode-eslint-language-server", "--stdio" },
                filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" },
                settings = {
                    codeAction = {
                        disableRuleComment = { enable = true, location = "separateLine" },
                        showDocumentation = { enable = true },
                    },
                    codeActionOnSave = { enable = false, mode = "all" },
                    experimental = { useFlatConfig = false },
                    format = true,
                    nodePath = "",
                    onIgnoredFiles = "off",
                    packageManager = "npm",
                    problems = { shortenToSingleLine = false },
                    quiet = false,
                    rulesCustomizations = {},
                    run = "onType",
                    useESLintClass = false,
                    validate = "on",
                    workingDirectory = { mode = "location" },
                },
            }
        end
    }
}

