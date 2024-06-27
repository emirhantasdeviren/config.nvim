local M = {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "folke/neodev.nvim",
    },
}

M.config = function()
    local lspconfig = require("lspconfig")
    local servers = {
        "clangd",
        "rust_analyzer",
        "gopls",
        "tsserver",
        "lua_ls",
        "cssls",
        "html",
    }

    local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        local keymap = vim.keymap

        opts.desc = "Go to definition"
        keymap.set('n', "<leader>ld", vim.lsp.buf.definition, opts)

        opts.desc = "Go to implementation"
        keymap.set('n', "<leader>li", vim.lsp.buf.implementation, opts)

        opts.desc = "Rename symbol"
        keymap.set('n', "<leader>lr", vim.lsp.buf.rename, opts)

        opts.desc = "References"
        keymap.set('n', "<leader>lrf", vim.lsp.buf.references, opts)

        opts.desc = "Format"
        keymap.set('n', "<leader>lf", vim.lsp.buf.format, opts)
    end

    local diagnostic_config = {
        virtual_text = false,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
    vim.diagnostic.config(diagnostic_config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    require("lspconfig.ui.windows").default_options.border = "rounded"

    for _, server in pairs(servers) do
        local opts = { on_attach = on_attach }

        local ok, settings = pcall(require, "marknikky.lsp." .. server)
        if ok then
            opts = vim.tbl_deep_extend("force", settings, opts)
        end

        if server == "lua_ls" then
            require("neodev").setup()
        end

        lspconfig[server].setup(opts)
    end
end

return M
