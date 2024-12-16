-- https://neovim.io/doc/user/api.html#nvim_set_keymap()
-- NOTE: Set the Key bindings

vim.g.mapleader = ","
-- make sure to set `mapleader` before `lazy.nvim` so your mappings are correct, also need to before `keybindings.lua`

local keymap = vim.api.nvim_set_keymap
local map = vim.keymap.set
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

-- Better movement
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap('', '<Down>', '5j', opts)
keymap('', '<Up>', '5k', opts)
keymap('', 'H', '^', opts)
keymap('', 'L', '$', opts)

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

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
keymap('', '<C-Up>', '<cmd>res +5<CR>', opts)
keymap('', '<C-Down>', '<cmd>res -5<CR>', opts)
keymap('', '<C-Left>', '<cmd>vertical resize-5<CR>', opts)
keymap('', '<C-Right>', '<cmd>vertical resize+5<CR>', opts)

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

-- Tags jump.
keymap('n', 'go', '<C-O>', opts)
-- keymap('n', 'gd', '<C-]>', opts) -- define in nvim-lspconfig

keymap('i', '<C-L>', '<End><CR>', opts)
