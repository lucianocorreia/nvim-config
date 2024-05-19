return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        local lsp = require("lsp-zero").preset({})

        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import mason_lspconfig plugin
        local mason_lspconfig = require("mason-lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        lsp.on_attach(function(client, bufnr)
            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = bufnr, silent = true }

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions
            -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)     -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            -- opts.desc = "Show buffer diagnostics"
            -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            -- opts.desc = "Go to previous diagnostic"
            -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
            --
            -- opts.desc = "Go to next diagnostic"
            -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            -- opts.desc = "Show documentation for what is under cursor"
            -- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

            opts.desc = "Code Format"
            keymap.set("n", "<leader>cf", ":lua vim.lsp.buf.format()<CR>", opts)

            keymap.set("v", "<leader>cf", function()
                vim.lsp.buf.format({
                    async = true,
                    range = {
                        ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                        ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
                    },
                })
            end, opts)

            local _border = "single"

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover, {
                    border = _border
                }
            )

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                vim.lsp.handlers.signature_help, {
                    border = _border
                }
            )

            vim.diagnostic.config {
                float = { border = _border }
            }
        end)

        -- vim.api.nvim_create_autocmd("LspAttach", {
        --     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        --     callback = function(ev)
        --         -- Buffer local mappings.
        --         -- See `:help vim.lsp.*` for documentation on any of the below functions
        --         local opts = { buffer = ev.buf, silent = true }
        --
        --         -- set keybinds
        --         opts.desc = "Show LSP references"
        --         keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
        --
        --         opts.desc = "Go to declaration"
        --         keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
        --
        --         opts.desc = "Show LSP definitions"
        --         keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
        --
        --         opts.desc = "Show LSP implementations"
        --         keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
        --
        --         opts.desc = "Show LSP type definitions"
        --         keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
        --
        --         opts.desc = "See available code actions"
        --         keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
        --
        --         opts.desc = "Smart rename"
        --         keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
        --
        --         opts.desc = "Show buffer diagnostics"
        --         keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
        --
        --         opts.desc = "Show line diagnostics"
        --         keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
        --
        --         -- opts.desc = "Go to previous diagnostic"
        --         -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
        --         --
        --         -- opts.desc = "Go to next diagnostic"
        --         -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
        --
        --         -- opts.desc = "Show documentation for what is under cursor"
        --         -- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
        --
        --         opts.desc = "Restart LSP"
        --         keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        --
        --         opts.desc = "Code Format"
        --         keymap.set("n", "<leader>cf", ":lua vim.lsp.buf.format()<CR>", opts)
        --
        --         keymap.set("v", "<leader>cf", function()
        --             vim.lsp.buf.format({
        --                 async = true,
        --                 range = {
        --                     ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
        --                     ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
        --                 },
        --             })
        --         end, opts)
        --     end,
        -- })
        --
        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["graphql"] = function()
                -- configure graphql language server
                lspconfig["graphql"].setup({
                    capabilities = capabilities,
                    filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
                })
            end,
            ["emmet_ls"] = function()
                -- configure emmet language server
                lspconfig["emmet_ls"].setup({
                    capabilities = capabilities,
                    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
                })
            end,
            ["lua_ls"] = function()
                -- configure lua server (with special settings)
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            -- make the language server recognize "vim" global
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
            ["tailwindcss"] = function()
                -- configure tailwindcss server
                lspconfig["tailwindcss"].setup({
                    capabilities = capabilities,
                    filetypes = {
                        "templ",
                        "html",
                        "css",
                    },
                    init_options = {
                        userLanguages = {
                            templ = "html",
                        },
                    },
                })
            end,
            ["gopls"] = function()
                -- configure golang language server
                lspconfig["gopls"].setup({
                    capabilities = capabilities,
                })
            end,
            ["tsserver"] = function()
                -- configure typescript language server
                lspconfig["tsserver"].setup({
                    capabilities = capabilities,
                })
            end,
            ["html"] = function()
                -- configure html language server
                lspconfig["html"].setup({
                    capabilities = capabilities,
                })
            end,
            ["cssls"] = function()
                -- configure css language server
                lspconfig["cssls"].setup({
                    capabilities = capabilities,
                })
            end,
            ["omnisharp"] = function()
                lspconfig["omnisharp"].setup({
                    capabilities = capabilities,
                    -- cmd = { "dotnet", "/Users/correia/.local/share/nvim/mason/bin/omnisharp" },
                    enable_editorconfig_support = true,
                    enable_roslyn_analyzers = true,
                    organize_imports_on_format = true,
                    enable_import_completion = true,
                    analyze_open_documents_only = false,
                    filetypes = { "cs", "vb" },
                    handlers = {
                        ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
                        ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
                        ["textDocument/references"] = require('omnisharp_extended').references_handler,
                        ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
                    },
                })
            end,
            ["jsonls"] = function()
                -- configure json language server
                lspconfig["jsonls"].setup({
                    capabilities = capabilities,
                })
            end,
            ["yamlls"] = function()
                -- configure yaml language server
                lspconfig["yamlls"].setup({
                    capabilities = capabilities,
                })
            end,
            ["dockerls"] = function()
                -- configure docker language server
                lspconfig["dockerls"].setup({
                    capabilities = capabilities,
                })
            end,
            ["bashls"] = function()
                -- configure bash language server
                lspconfig["bashls"].setup({
                    capabilities = capabilities,
                })
            end,
        })
    end,
}
