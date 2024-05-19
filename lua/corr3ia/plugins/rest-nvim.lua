return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        opts = {
            rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
        }
    },
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("rest-nvim").setup({})

            local keymap = vim.keymap

            -- rest http client
            keymap.set("n", "<leader>rr", "<cmd>Rest run", { desc = "Rest [R]equest", silent = true })
        end,
    }
}
