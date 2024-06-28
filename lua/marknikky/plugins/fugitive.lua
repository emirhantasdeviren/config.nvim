local M = {
    "tpope/vim-fugitive",
}

M.config = function()
    vim.keymap.set('n', "<leader>gs", vim.cmd.Git, { desc = "Git Status" })
end

return M
