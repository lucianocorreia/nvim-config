return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path",   -- source for file system paths
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",     -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim",         -- vs-code like pictograms
        "hrsh7th/cmp-nvim-lsp-signature-help", -- lsp signature help
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        lspkind.init()

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        local kind_icons = {
            Text = "",
            Method = "m",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
        }

        vim.opt.completeopt = { "menu", "menuone", "noselect" }
        vim.opt.shortmess:append("c")

        cmp.setup({
            -- completion = {
            --     completeopt = "menu,menuone,preview,noselect",
            -- },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
                -- ["<C-y>"] = cmp.mapping.confirm({
                --     behavior = cmp.ConfirmBehavior.Replace,
                --     select = true,
                -- }),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- snippets
                { name = "buffer" },  -- text within current buffer
                { name = "path" },    -- file system paths
                { name = "nvim_lsp_signature_help" },
                { name = "treesitter" },
                { name = "copilot" },
            }),

            -- configure lspkind for vs-code like pictograms in completion menu
            formatting = {
                fields = { "abbr", "menu", "kind" },
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format("%s ", kind_icons[vim_item.kind])
                    -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

                    vim_item.abbr = string.sub(vim_item.abbr, 1, 30)

                    vim_item.menu = ({
                        nvim_lsp = "[Lsp]",
                        luasnip = "[Snp]",
                        buffer = "[Buf]",
                        path = "[Pth]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            view = {},
            window = {
                completion = {
                    border = "rounded",
                    -- max_width = 10,
                    -- max_height = 10,
                    -- completion = {
                    -- 	border = "rounded",
                    -- 	max_width = 10,
                    -- 	max_height = 10,
                    -- },
                },
                documentation = {
                    border = "rounded",
                },
            },
        })

        cmp.setup.filetype({ "sql" }, {
            sources = {
                { name = "vim-deadbod-completion" },
                { name = "buffer" },
            },
        })
    end,
}
