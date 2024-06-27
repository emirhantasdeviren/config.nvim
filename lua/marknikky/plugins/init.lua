local M = {}

local spec = function(item)
    ok, i = pcall(require, "marknikky.plugins." .. item)
    if ok then
        table.insert(M, i)
    end
end

spec("devicons")
spec("everforest")
spec("lualine")
spec("oil")
spec("plenary")
spec("telescope")
spec("treesitter")
spec("which-key")

return M
