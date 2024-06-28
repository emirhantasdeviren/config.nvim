local M = {}

local spec = function(item)
    local ok, i = pcall(require, "marknikky.plugins." .. item)
    if ok then
        table.insert(M, i)
    end
end

spec("cmp")
spec("devicons")
spec("fugitive")
spec("everforest")
spec("lspconfig")
spec("lualine")
spec("mason")
spec("oil")
spec("plenary")
spec("telescope")
spec("treesitter")
spec("which-key")

return M
