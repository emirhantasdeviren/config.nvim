local M = {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}

function M.opts()
    local actions = require("telescope.actions")

    return {
        defaults = {
            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
                n = {
                    ["<ESC>"] = actions.close,
                    j = actions.move_selection_next,
                    k = actions.move_selection_previous,
                    q = actions.close,
                },
            },
        },
        pickers = {
            live_grep = {
                theme = "dropdown",
            },
            grep_string = {
                theme = "dropdown",
            },
            find_files = {
                theme = "dropdown",
                previewer = false,
            },
            buffers = {
                theme = "dropdown",
                previewer = false,
                initial_mode = "normal",
                mappings = {
                    i = {
                        ["<C-d>"] = actions.delete_buffer,
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                    },
                },
            },
            planets = {
                show_pluto = true,
                show_moon = true,
            },

            colorscheme = {
                enable_preview = true,
            },

            lsp_references = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_definitions = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_declarations = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_implementations = {
                theme = "dropdown",
                initial_mode = "normal",
            },
        },
    }
end

function M.config(_, opts)
    local wk = require("which-key")
    local mappings = {
        bb = { "<CMD>Telescope buffers previewer=false<CR>", "Find" },
        fb = { "<CMD>Telescope git_branches<CR>", "Checkout branch" },
        fc = { "<CMD>Telescope colorscheme<CR>", "Colorscheme" },
        ff = { "<CMD>Telescope find_files<CR>", "Find files" },
        ft = { "<CMD>Telescope live_grep<CR>", "Find Text" },
        fh = { "<CMD>Telescope help_tags<CR>", "Help" },
        fl = { "<CMD>Telescope resume<CR>", "Last Search" },
        fr = { "<CMD>Telescope oldfiles<CR>", "Recent File" },
    }
    wk.register(mappings, { prefix = "<leader>" })

    local telescope = require("telescope")
    telescope.setup(opts)
end

return M
