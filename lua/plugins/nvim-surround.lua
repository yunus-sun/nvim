return{
    "kylechui/nvim-surround",
    enabled = true,
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    init = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults

            -- change 's' to '-'
            -- change 's' to 'o'
            keymaps = {
                insert = "<C-g>o",
                insert_line = "<C-g>O",
                normal = "yo",
                normal_cur = "yoo",
                normal_line = "yO",
                normal_cur_line = "yOO",
                visual = "O",
                visual_line = "gO",
                delete = "do",
                change = "co",
                change_line = "cO",
            },
        })
    end
}
