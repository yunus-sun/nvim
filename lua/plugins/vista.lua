return {
    "liuchengxu/vista.vim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- FIX:
    enable = false,
    config = function()
        vim.cmd([[
        function! NearestMethodOrFunction() abort
          return get(b:, 'vista_nearest_method_or_function', '')
        endfunction

        set statusline+=%{NearestMethodOrFunction()}

        " By default vista.vim never run if you don't call it explicitly.

        " If you want to show the nearest function in your statusline automatically,
        " you can add the following line to your vimrc
        autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
        ]])
    end
}
