vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("correia-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- additional filetypes
vim.filetype.add({
	extension = {
		templ = "templ",
	},
})
