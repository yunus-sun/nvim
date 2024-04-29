return {
    "rhysd/vim-grammarous",
    -- ft = { "markdown", "text", "tex" },
    enabled = false,
    lazy = false,
    config = function()
        -- Use mappings only after checking
        vim.cmd([[
        let g:grammarous#hooks = {}
        function! g:grammarous#hooks.on_check(errs) abort
            nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
            nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
        endfunction

        function! g:grammarous#hooks.on_reset(errs) abort
            nunmap <buffer><C-n>
            nunmap <buffer><C-p>
        endfunction

        let g:grammarous#disabled_rules = {
                \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'ARROWS', 'SENTENCE_WHITESPACE',
                \        'WORD_CONTAINS_UNDERSCORE', 'COMMA_PARENTHESIS_WHITESPACE',
                \        'EN_UNPAIRED_BRACKETS', 'UPPERCASE_SENTENCE_START',
                \        'ENGLISH_WORD_REPEAT_BEGINNING_RULE', 'DASH_RULE', 'PLUS_MINUS',
                \        'PUNCTUATION_PARAGRAPH_END', 'MULTIPLICATION_SIGN', 'PRP_CHECKOUT',
                \        'CAN_CHECKOUT', 'SOME_OF_THE', 'DOUBLE_PUNCTUATION', 'HELL',
                \        'CURRENCY', 'POSSESSIVE_APOSTROPHE', 'ENGLISH_WORD_REPEAT_RULE',
                \        'NON_STANDARD_WORD'],
                \ }
        ]])
    end
}
