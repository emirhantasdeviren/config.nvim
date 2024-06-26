-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=main",
        lazyrepo,
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    spec = require("marknikky.plugins"),
    ui = {
        border = "rounded",
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
}

require("lazy").setup(opts)
