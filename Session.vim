let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +4 ~/.config/nvim/lua/plugins/persistence.lua
badd +147 ~/.config/nvim/init.lua
argglobal
%argdel
edit ~/.config/nvim/lua/plugins/persistence.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
setlocal fdm=manual
setlocal fde=vimtex#fold#level(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
6,8fold
9,14fold
1,15fold
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 015|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/init.lua", ":p")) | buffer ~/.config/nvim/init.lua | else | edit ~/.config/nvim/init.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/init.lua
endif
balt ~/.config/nvim/lua/plugins/persistence.lua
setlocal fdm=manual
setlocal fde=vimtex#fold#level(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
9,16fold
8,17fold
23,27fold
32,38fold
39,44fold
45,50fold
72,77fold
56,78fold
89,91fold
88,92fold
96,98fold
95,99fold
83,100fold
51,101fold
102,110fold
111,117fold
118,122fold
124,134fold
141,150fold
136,151fold
123,152fold
156,161fold
21,162fold
171,174fold
170,175fold
let &fdl = &fdl
let s:l = 147 - ((32 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 147
normal! 0
wincmd w
2wincmd w
wincmd =
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
