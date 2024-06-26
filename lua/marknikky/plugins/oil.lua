local M = {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        columns = {
            "icon",
            -- "permissions",
            -- "size",
            -- "time",
        },
        keymaps = {
            ["<C-h>"] = false,
        },
    },
}

function M.config(_, opts)
    local oil = require("oil")
    vim.keymap.set('n', "<leader>o", "<CMD>Oil<CR>")

    oil.setup(opts)
end

return M
