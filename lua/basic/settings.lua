-- Vim 会在保存或加载会话时保存和恢复以下信息
vim.opt.sessionoptions = "buffers,curdir,folds,winsize,winpos"

-- 当文件被外部程序修改时，自动加载
vim.opt.autoread = true
vim.opt.autoread = true

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- Vim 会在编辑过程中将 undo 信息写入到文件中，可以确保在编辑器崩溃或关闭后重新打开文件时还能恢复到最近的编辑状态
vim.opt.undofile = true

-- FIX:
-- 使用增强状态栏后不再需要 vim 的模式提示
-- vim.o.showmode = false
-- show the statusline information
vim.opt.shortmess = "filnxtToOF"
-- show the mode in the statusline
vim.opt.showmode = true
-- 显示当前光标所在的行列信息
vim.opt.ruler = true

-- 显示一个额外的列，用来显示标记。标记可以用来表示文件中的错误，警告或者其他重要信息
-- 感觉很丑？
vim.opt.signcolumn = "yes"


vim.opt.pumheight = 15
-- 当这个选项设置为 true 时，Vim 会允许在编辑其他文件时隐藏当前文件而不保存，并在稍后可以恢复。这样可以让你在不保存当前文件的情况下切换到其他文件进行编辑。
vim.opt.hidden = true

-- jk移动时光标下上方保留8行
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "80"

-- forbid the mouse
vim.opt.mouse = "n"
-- 文本选择将仅包括光标起始和结束位置之间的字符
vim.opt.selection = "exclusive"

-- vim.opt.selectmode = "mouse,key"

-- 表示启用光标、折叠、斜线和 Unix 格式视图选项
vim.opt.viewoptions = "cursor,folds,slash,unix"

-- match the bracket
vim.opt.showmatch = true


-- Systems: {{{
vim.g.python3_host_prog = 'D:/Software/Miniconda/python.exe'
-- test command
-- :echo g:python3_host_prog


-- Vim shares register with system clipboard
-- FIX:
vim.cmd([[
set clipboard+=unnamed
]])
-- += does not equal to =
-- vim.opt.clipboard = 'unnamed'

-- FIX:
-- vim.opt.spellcheck = true

-- Timeout Setting
vim.opt.timeout = true
vim.opt.updatetime = 100 -- update interval for gitsigns
vim.opt.timeoutlen = 500 -- keymap timeout
--- }}}

-- FileType Related {{{
-- FIX:
-- vim识别不同文件格式
vim.cmd([[
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
]])
-- vim.opt.filetype = "plugin"

-- }}}

-- Terminal Mode {{{
-- URL: https://neovim.io/doc/user/nvim_terminal_emulator.html
-- To map <Esc> to exit terminal-mode:
-- keymap('t', '<ESC>', '<C-\><C-n>', opts) -- defined in keybindings.lua
-- }}}

-- Fold Files {{{
vim.opt.foldenable = true
-- vim.opt.foldmethod = 'manual'
-- vim.opt.foldmethod = 'syntax'
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99 -- indicate all not fold

-- }}}

-- Apperance {{{

-- Settings for molokai theme, it's should put before the color settings.
-- let g:molokai_original = 1

-- Close the gui tabline and popumenu in neovim
-- 设置 alt 键不映射到菜单栏
vim.opt.winaltkeys = 'no'
-- FIX:
vim.cmd([[
if has('nvim')
    try
        call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
        call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
    catch
    endtry
endif
]])

-- 下面这两句似乎不是很懂
-- FIX:
vim.cmd([[
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
]])

-- 不显示工具/菜单栏
-- FIX:
vim.cmd([[
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
" 使用内置 tab 样式而不是 gui
set guioptions-=e
]])

-- " 不同模式光标转换
-- FIX:
vim.cmd([[
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
]])

-- 设置为双字宽显示，否则无法完整显示如:☆
-- set ambiwidth=double
-- will lead bug to fzf, telescope and so on.

-- always show the statusline
vim.opt.laststatus = 2

-- set split manner
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Fix:
-- To solve color problem in vim
vim.cmd([[
set t_Co=256
]])

vim.opt.termguicolors = true

-- Set background transparent
-- https://www.reddit.com/r/neovim/comments/3v06lo/making_the_background_transparent/
-- FIX:
-- vim.cmd([[
-- au ColorScheme * hi Normal ctermbg=none guibg=none
-- au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
-- ]])

-- Hide the cmdline (Neovim>=0.8.0)
vim.opt.cmdheight = 0
-- }}}

-- Format {{{
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.cindent = true -- For C files
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.syntax = 'enable'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true -- 高亮显示当前行
vim.opt.wrap = true -- 自动换行
vim.opt.showcmd = true -- 显示指令
vim.opt.wildmenu = true -- 增强模式的命令行补全
-- FIX:
vim.cmd([[
let &t_ut='' " 颜色迁移
]])
vim.opt.tw = 0
-- FIX:
vim.cmd([[
set indentexpr=
]])
-- vim.opt.indentexpr = ''

vim.opt.hlsearch = true
-- FIX:
vim.cmd([[
exec "nohlsearch"
]])
vim.opt.incsearch = true -- 边搜索边高亮

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 设置不可见字符
vim.opt.list = true -- will show the unreadable chars
vim.opt.listchars = 'tab:▸\\ ,trail:▫'

-- FIX:
vim.cmd([[
" set nocompatible
" set nobackup
" set noswapfile
]])
vim.opt.compatible = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.history = 1024
vim.opt.autochdir = true
vim.opt.whichwrap = 'b,s,<,>,[,]'
-- FIX:
vim.cmd([[
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
]])
-- vim.opt.nobomb = true
-- vim.opt.backspace = 'indent,eol,start whichwrap+=<,>,[,]'

-- }}}

-- Lang & Encoding {{{
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = 'utf-8,gbk2312,gbk,gb18030,cp936'
vim.opt.langmenu = 'en_US'
-- FIX:?
vim.cmd("language en_US.utf8")
-- FIX:
vim.cmd([[
let $LANG = 'en_US.UTF-8'
]])

-- }}}
