-- FIX: nabla.nvim with treesitter would make snippets not work
-- TODO: the effect?
return {
    "jbyuki/nabla.nvim",
    enabled = false,
    ft = {"markdown", "tex"},
    config = function()
        require"nabla".enable_virt()
        -- Customize with popup({border = ...})  : `single` (default), `double`, `rounded`
    end,
    keys = {
        { "<leader>v", "<CMD>lua require(\"nabla\").popup()<CR>", "n", { noremap = true, silent = true } },
    }
}
