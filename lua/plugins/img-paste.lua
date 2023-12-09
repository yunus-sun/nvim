-- FIX: Don't work in WSL!
return {
    'img-paste-devs/img-paste.vim',
    enabled = false,
    ft = {"markdown", "tex"},
    init = function()
        vim.g.mdip_imgdir = 'figures'
        vim.g.mdip_imgname = 'figure'
        -- NOTE: For tex paste
        vim.cmd([[
            function! g:LatexPasteImage(relpath)
                execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
                let ipos = getcurpos()
                execute "normal! a" . "mage}"
                call setpos('.', ipos)
                execute "normal! ve\<C-g>"
            endfunction
            autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
            autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
        ]])
    end,
    config = function()
        -- FIX:
        -- not work?
        -- need to set in init! why?

        -- vim.g.mdip_imgdir = 'figures'
        -- vim.g.mdip_imgname = 'figure'

        -- FIX:
        -- key should be lazy? to trigger!
        vim.keymap.set('n', '<leader>p', ':call mdip#MarkdownClipboardImage()<CR>', {noremap = true, silent = true})
        -- TODO:
        -- how to realize latex paste?
        -- refer to: https://github.com/img-paste-devs/img-paste.vim
    end,
}
