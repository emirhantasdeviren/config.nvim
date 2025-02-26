local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    }
}

function M.config()
    local servers = {
        "clangd",
        "rust_analyzer",
        "gopls",
        "tsserver",
        "lua_ls",
        "cssls",
        "html",
    }

    require("mason").setup({
        ui = {
            border = "rounded",
        }
    })

    require("mason-lspconfig").setup({
        ensure_installed = servers,
    })
end

return M
