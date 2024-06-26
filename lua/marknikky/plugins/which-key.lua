local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
}

function M.init()
    vim.o.timeout = true
    vim.o.timeoutlen = 400
end

return M
