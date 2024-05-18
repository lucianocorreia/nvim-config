return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        -- indent = { char = "┊" },
        indent = { char = "│", highlight = { "LineNr" } },
        scope = { enabled = false },
    },
}
