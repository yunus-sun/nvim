-- https://neovim.io/doc/user/api.html#nvim_set_keymap()
-- NOTE: Set the Key bindings

vim.g.mapleader = ","
-- make sure to set `mapleader` before `lazy.nvim` so your mappings are correct, also need to before `keybindings.lua`

local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

keymap('n', ';', ':', opts)
keymap('v', ';', ':', opts)
keymap('n', ';;', ';', opts) -- it may no need due to leap.nvim

-- HACK: not supportted in lazy.nvim
-- keymap('n', '<LEADER>ss', '<CMD>source $MYVIMRC<CR>', opts)
keymap('n', '<LEADER>ee', '<CMD>e $MYVIMRC<CR>', opts)

-- Search related
-- FIX: seems not work
-- if vim.fn.mode() == '/' then
--     keymap('n', '=', 'nzz', opts)
--     keymap('n', '-', 'Nzz', opts)
-- end
-- if vim.api.nvim_get_mode().mode == 's' then
--     keymap('n', '=', 'nzz', opts)
--     keymap('n', '-', 'Nzz', opts)
-- end
keymap('n', '<ESC>', '<CMD>nohlsearch<CR>', opts)

-- Cursor Movement
keymap('', 'J', '5j', opts)
keymap('', 'K', '5k', opts)
keymap('', 'H', '0', opts)
keymap('', 'L', '$', opts)
-- keymap('', '<C-w>', '5w', opts) -- <C-w> toggles between the vertical and horizontal splits
keymap('', '<C-b>', '5b', opts) -- seems not useful due to leap.vim
-- keymap('', '<C-J>', '5<C-e>', opts)
-- keymap('', '<C-K>', '5<C-y>', opts)
keymap('', '<C-J>', 'J', opts)

-- Globally Find and Replace
keymap('n', '\\s', ':%s//g<left><left>', opts)
keymap('v', '\\s', ':s//g<left><left>', opts)
-- keymap('', '\\s', ':%s//g<left><left>', opts) is wrong
-- 在 Vim 中替换文本的命令是 :%s/old-text/new-text/g。
-- % 表示在整个文件中进行替换，s 表示替换，old-text 是要被替换的文本，new-text 是替换后的文本，g 表示全局，即替换所有匹配的文本。
-- map the \s

-- Split Windows
-- s can be replaced by cl, but it is used in leap.vim
keymap('', '<LEADER>sv', '<CMD>set splitright<CR>:vsplit<CR>', opts) -- TODO: will be canceled due to it can be realized by ';vs' with lsp completion.
keymap('', '<LEADER>sp', '<CMD>set splitbelow<CR>:split<CR>', opts)
-- move the split windows
keymap('', '<LEADER>sj', '<C-w>j', opts)
keymap('', '<LEADER>sk', '<C-w>k', opts)
keymap('', '<LEADER>sh', '<C-w>h', opts)
keymap('', '<LEADER>sl', '<C-w>l', opts)
-- jump to the poped info in coc-nvim
keymap('', '<LEADER>sw', '<C-w>w', opts)
-- Ctrl\-w K moves the current window to full-width at the very top
-- Ctrl\-w H moves the current window to full-height at far left
keymap('', '<LEADER>sJ', '<C-w>J', opts)
keymap('', '<LEADER>sK', '<C-w>K', opts)
keymap('', '<LEADER>sH', '<C-w>H', opts)
keymap('', '<LEADER>sL', '<C-w>L', opts)
-- Resize the split window
-- maybe wrong
keymap('', '<UP>', '<CMD>res +5<CR>', opts)
keymap('', '<DOWN>', '<CMD>res -5<CR>', opts)
keymap('', '<LEFT>', '<CMD>vertical resize-5<CR>', opts)
keymap('', '<RIGHT>', '<CMD>vertical resize+5<CR>', opts)

-- FIX: may need to change to linux
-- Windows Copy and Paste
-- <C-v> bug in terminal, bug not in neovim terminal
-- can use <C-q> to replace <C-v>
keymap('n', '<S-Insert>', '"+gP', opts)
keymap('i', '<C-v>', '"+gP', opts)
keymap('i', '<C-V>', '"+gP', opts)
keymap('v', '<C-c>', '"+y', opts)
keymap('v', '<BS>', 'd " backspace', opts)
keymap('v', '<C-C>', '"+y', opts)
keymap('v', '<C-Insert> ', '"+y', opts)
keymap('c', '<C-V>', '<C-R>+', opts)
keymap('c', '<S-Insert>', '<C-R>+', opts)
-- FIX:
vim.cmd([[
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
]])

-- Open current directory on windows
keymap('n', '<leader>ex', '<CMD>!start explorer %:p:h<CR>', opts)

-- Open current directory CMD on windows
keymap('n', '<LEADER>cmd', '<CMD>!start cmd /k cd %:p:h<cr>', opts)
-- start powershell?

-- Print current time
keymap('n', '<F4>', 'a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><ESC>', opts)

-- Copy current file/path to clipboard
-- keymap('n', '<LEADER>fn', '<CMD>let @*=substitute(expand("%"), "/", "\\", "g")<CR>', opts)
-- keymap('n', '<LEADER>fp', '<CMD>let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>', opts)
-- FIX:
vim.cmd([[
nmap <LEADER>fn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
nmap <LEADER>fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
]])

-- -- Set buffer toggle keys
-- keymap('n', '<C-left>', '<CMD>bp<CR>', opts)
-- keymap('n', '<C-right>', '<CMD>bn<CR>', opts)
-- -- The followings conflict with tn :tabnew<CR>
-- keymap('c', 'bp', 'bp<CR>', opts)
-- keymap('c', 'bn', 'bn<CR>', opts)
-- -- which is realized by ?: [b, ]b

-- To map <Esc> to exit terminal-mode:
keymap('t', '<ESC>', '<C-\\><C-n>', opts)
