return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "jay-babu/mason-nvim-dap.nvim" },
        { "j-hui/fidget.nvim",                tag = "legacy", opts = {} },

        -- -- null-ls
        -- { "jose-elias-alvarez/null-ls.nvim" },
        -- { "jay-babu/mason-null-ls.nvim" },

        -- Autocompletion
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                -- Snippet Engine & its associated nvim-cmp source
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",

                -- Adds LSP completion capabilities
                "hrsh7th/cmp-nvim-lsp",

                -- Adds a number of user-friendly snippets
                "rafamadriz/friendly-snippets",
            },
        },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },

        -- Snippets
        { "L3MON4D3/LuaSnip",            version = "2.*" },
        { "rafamadriz/friendly-snippets" },
        { "honza/vim-snippets" },

        -- other languages
        { "fatih/vim-go" },
        { "rrethy/vim-illuminate" },

        -- rust
        {
            "mrcjkb/rustaceanvim",
            version = "^4",
            ft = { "rust" },
        },
        {
            "saecki/crates.nvim",
            tag = "stable",
            config = function()
                require("crates").setup()
            end,
        },

        -- c#!/usr/bin/env lua
        { "Hoffs/omnisharp-extended-lsp.nvim" }
    },

}
