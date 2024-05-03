-- TODO: try it
-- FIX: seems not work
return {
    "tiagovla/zotex.nvim",
    enabled = false,
    lazy = true,
    filetype = { "tex" },
    config = function()
        require("zotex").setup {
            auto_save = true,
            path = "~/Zotero/zotero.sqlite",
            translator = "bibtex",
        }
    end
}
