local M = {
    "tpope/vim-fugitive",
}

M.config = function()
    vim.keymap.set('n', "<leader>gs", vim.cmd.Git, { desc = "Git Status" })
    vim.keymap.set('n', "<leader>gf", function()
        vim.cmd.Git({ args = { "fetch" } })
    end, { desc = "Git Fetch" })
    vim.keymap.set('n', "<leader>gp", function()
        vim.cmd.Git({ args = { "pull" } })
    end, { desc = "Git Pull" })
end

return M
