return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local transform_mod = require("telescope.actions.mt").transform_mod

        local trouble = require("trouble")
        local trouble_telescope = require("trouble.providers.telescope")

        -- or create your custom action
        local custom_actions = transform_mod({
            open_trouble_qflist = function(prompt_bufnr)
                trouble.toggle("quickfix")
            end,
        })

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,     -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                        ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
                    },
                },

                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },

                file_ignore_patterns = {
                    "node_modules/",
                    "%.git/",
                    "%.DS_Store$",
                    "target/",
                    "build/",
                    "%.o$",
                },

                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,

                layout_config = {
                    prompt_position = "top",

                },
                sorting_strategy = "ascending",
            },
            pickers = {
                find_files = {
                    hidden = true,
                    previewer = false,
                    layout_config = {
                        height = 0.7,
                        width = 0.6,
                    },
                },
                diagnostics = {
                    bufrn = 0,
                    previewer = false,
                    path_display = "hidden",
                },
                buffers = {
                    previewer = false,
                    layout_config = {
                        height = 0.7,
                        width = 0.7,
                    },
                },
                current_buffer_fuzzy_find = {
                    previewer = false,
                    layout_config = {
                        height = 0.7,
                        width = 0.7,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    -- case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    case_mode = "ignore_case",       -- or "ignore_case" or "respect_case"
                },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

        keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Find todos" })
        keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "Find todos" })
        keymap.set("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find todos" })
        keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find todos" })
        keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find todos" })
    end,
}
