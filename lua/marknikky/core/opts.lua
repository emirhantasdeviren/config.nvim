local opts = {
    relativenumber = true,
    number = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    cursorline = true,
    termguicolors = true,
    background = "dark",
    splitright = true,
    splitbelow = true,
    signcolumn = "yes",
    colorcolumn = "80",
}

for k, v in pairs(opts) do
    vim.opt[k] = v
end
