-- TODO:
-- vimtex only complete the citation when '.bib' file is in the same directory, how to solve?
return {
    "lervag/vimtex",
    enabled = true,
    lazy = false,
    -- FIX:
    -- lazy load will make inverse search wrong, refer to `:h vimtex`
    -- ft = "tex",
    init = function()
        -- Forward Search
        vim.g.vimtex_view_method = 'zathura'
        -- Inverse Search only need to configure in the pdf
    end,
    config = function()
        vim.g.vimtex_mappings_prefix = '<leader>l'
        vim.g.vimtex_indent_enabled = 0 -- close the indent
        -- vim.opt.conceallevel=2
        vim.g.tex_flavor='latex'
        -- 映射VimtexCountWords！\lw 在命令模式下enter此命令可统计中英文字符的个数
        vim.g.vimtex_texcount_custom_arg=' -ch -total'
        vim.cmd([[
        au FileType tex map <buffer> <silent>  \lw :VimtexCountWords!  <CR><CR>
        ]])

        -- 这里是LaTeX编译引擎的设置，这里默认LaTeX编译方式为-pdf(pdfLaTeX),
        -- vimtex提供了magic comments来为文件设置编译方式
        -- 例如，我在tex文件开头输入 % !TEX program = xelatex   即指定-xelatex （xelatex）编译文件
        -- vim.g.vimtex_compiler_progname = 'nvr'
        vim.g.vimtex_compiler_latexmk_engines = {
            _                = '-pdf',
            pdflatex         = '-pdf',
            dvipdfex         = '-pdfdvi',
            lualatex         = '-lualatex',
            xelatex          = '-xelatex',
            ['context (pdftex)'] = '-pdf -pdflatex=texexec',
            ['context (luatex)'] = '-pdf -pdflatex=context',
            ['context (xetex)']  = '-pdf -pdflatex=\'texexec --xtx\'',
            bibxelatex       = '-xelatex -bibtex -xelatex -xelatex ',
            IEEE       = '-pdflatex -pdflatex -bibtex -pdflatex ',
            beamer       = '-xelatex -biber -xelatex -xelatex ',
            -- Above tow lines are not validated.
        }
        -- -- 这里是设置latexmk工具的可选参数
        -- vim.g.vimtex_compiler_latexmk = {
        --     build_dir = '',
        --     callback = 1,
        --     continuous = 1,
        --     executable = 'latexmk',
        --     hooks = {},
        --     options = {
        --         '-verbose',
        --         '-file-line-error',
        --         '-shell-escape',
        --         '-synctex=1',
        --         '-interaction=nonstopmode',
        --     },
        -- }

        -- Ignore warning message when complie
        vim.g.vimtex_quickfix_open_on_warning=0

        -- vim.g.vimtex_quickfix_mode=0
        -- vim.g.vimtex_mappings_enabled=0

        -- Fold
        vim.opt.foldmethod='expr'
        vim.opt.foldexpr='vimtex#fold#level(v:lnum)'
        vim.opt.foldtext='vimtex#fold#text()'
    end,
    -- mappings
    -- nnoremap \lt :VimtexTocOpen<CR>
    keys = function()
        vim.keymap.set('n', '\\lt', '<CMD>VimtexTocOpen<CR>')
        -- change 's' to '-'
        -- change 's' to 'o'
        vim.keymap.set('n', 'doe', '<plug>(vimtex-env-delete)')
        vim.keymap.set('n', 'doc', '<plug>(vimtex-cmd-delete)')
        vim.keymap.set('n', 'do$', '<plug>(vimtex-env-delete-math)')
        vim.keymap.set('n', 'dod', '<plug>(vimtex-delim-delete)')
        vim.keymap.set('n', 'coe', '<plug>(vimtex-env-change)')
        vim.keymap.set('n', 'coc', '<plug>(vimtex-cmd-change)')
        vim.keymap.set('n', 'co$', '<plug>(vimtex-env-change-math)')
        vim.keymap.set('n', 'cod', '<plug>(vimtex-delim-change-math)')
        vim.keymap.set('n', 'tof', '<plug>(vimtex-cmd-toggle-frac)')
        vim.keymap.set('n', 'toc', '<plug>(vimtex-cmd-toggle-star)')
        vim.keymap.set('n', 'toe', '<plug>(vimtex-env-toggle-star)')
        vim.keymap.set('n', 'to$', '<plug>(vimtex-env-toggle-math)')
        vim.keymap.set('n', 'tod', '<plug>(vimtex-delim-toggle-modifier)')
        vim.keymap.set('n', 'toD', '<plug>(vimtex-delim-toggle-modifier-reverse)')
    end
}
