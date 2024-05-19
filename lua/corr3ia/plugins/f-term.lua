return {
    "numToStr/FTerm.nvim",
    config = function(_, _)
        require("FTerm").setup({
            border = "double",
            dimensions = {
                height = 0.7,
                width = 0.7,
            },
        })

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>tt", '<Cmd>lua require("FTerm").toggle()<CR>', { desc = "Toggle [T]erminal" })
        keymap.set("t", "<leader>tt", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle [T]erminal" })
    end,
}
