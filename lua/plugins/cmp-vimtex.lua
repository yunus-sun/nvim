return{
    "micangl/cmp-vimtex",
    -- BUG: seems don't work
    enabled = true,
    lazy = true,
    event = { "InsertEnter", "LspAttach" }, -- TODO: should I use it?
    filetype = { "tex" },
    config = function ()
        require('cmp_vimtex').setup({
            additional_information = {
                info_in_menu = true,
                info_in_window = true,
                info_max_length = 60,
                match_against_info = true,
                symbols_in_menu = true,
            },
            bibtex_parser = {
                enabled = true,
            },
        })
    end
}
