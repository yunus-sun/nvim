return{
    "zbirenbaum/copilot-cmp",
    enabled = true,
    lazy = false,
    event = { "InsertEnter", "LspAttach" },
    config = function ()
        require("copilot_cmp").setup({
            fix_pairs = true,
        })
    end
}
