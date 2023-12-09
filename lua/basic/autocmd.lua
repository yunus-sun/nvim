-- Remove trailing whitespace when writing a buffer, but not for diff files.
-- From: Vigil
-- @see http://blog.bs2.to/post/EdwardLee/17961

-- Wsl的nvim与Windows系统剪切板通信
if vim.fn.has('wsl') then
  vim.cmd [[
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
  ]]
end

-- FIX:
vim.cmd([[
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
]])

-- FIX:
-- NOTE: Two Functions!!
-- vim 文件折叠方式为 marker
vim.cmd([[
augroup ft_vim
    au!

    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType lua setlocal foldmethod=marker
    " or?

    " 打开文件总是定位到上次编辑的位置
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

augroup END
]])
-- 重新打开缓冲区恢复光标位置
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.fn.setpos(".", vim.fn.getpos("'\""))
            vim.cmd([[silent! foldopen]])
        end
    end,
})


-- FIX:
vim.cmd([[
augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=78
augroup END
]])

-- Open help window in a vertical split to the right.
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("help_window_right", {}),
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == 'help' then vim.cmd.wincmd("L") end
    end
})

-- 取消换行注释
-- 用o换行不要延续注释
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    callback = function()
        -- vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
        vim.opt.formatoptions = vim.opt.formatoptions
            - "o" -- O and o, don't continue comments
            + "r" -- But do continue when pressing enter.
    end,
})

-- number{{{
-- 好像是插入的时候改成绝对行号？
local ft = { "c", "cpp", "java", "python", "lua", "vim", "html", "css", "javascript" }

local function include()
    for _, value in pairs(ft) do
        if vim.bo.filetype == value then
            return true
        end
    end
    return false
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function()
        if include() then
            vim.opt_local.relativenumber = true
        end
    end,
})
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
        if include() then
            vim.opt_local.relativenumber = false
            vim.opt_local.number = true
        end
    end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        if include() then
            vim.opt_local.relativenumber = true
        end
    end,
})
-- }}}

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    pattern = "*",
})
