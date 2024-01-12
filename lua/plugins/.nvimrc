version 6.0
let s:cpo_save=&cpo
set cpo&vim
imap <silent> <S-Tab> <Plug>(TaboutBack)
inoremap <Plug>(TaboutBackMulti) <Cmd>lua require("tabout").taboutBackMulti()
inoremap <Plug>(TaboutBack) <Cmd>lua require("tabout").taboutBack()
inoremap <Plug>(TaboutMulti) <Cmd>lua require("tabout").taboutMulti()
inoremap <Plug>(Tabout) <Cmd>lua require("tabout").tabout()
cnoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent> <C-G>Þ <Nop>
inoremap <silent> <C-G> <Cmd>lua require("which-key").show("\7", {mode = "i", auto = true})
inoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <C-G>S <Plug>(nvim-surround-insert-line)
inoremap <C-G>s <Plug>(nvim-surround-insert)
cnoremap <silent> <S-Insert> +
cnoremap <silent> <C-V> +
inoremap <C-W> u
inoremap <C-U> u
noremap <silent>  5b
vnoremap <silent>  "+y
nnoremap <silent> <NL> J
xnoremap <silent> <NL> J
onoremap <silent> <NL> J
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
nnoremap <silent> Þ <Nop>
nnoremap <silent>  <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
tnoremap <silent>  
nnoremap <silent>  <Cmd>nohlsearch
nnoremap <silent>  Þ <Nop>
nnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "n", auto = true})
nnoremap <silent> !aÞ <Nop>
nnoremap <silent> !iÞ <Nop>
nnoremap <silent> !Þ <Nop>
nnoremap <silent> ! <Cmd>lua require("which-key").show("!", {mode = "n", auto = true})
xnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "v", auto = true})
nnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "n", auto = true})
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
nnoremap <silent> ' <Cmd>lua require("which-key").show("'", {mode = "n", auto = true})
xnoremap <silent> ,sÞ <Nop>
xnoremap <silent> ,dÞ <Nop>
xnoremap <silent> ,Þ <Nop>
xnoremap <silent> , <Cmd>lua require("which-key").show(",", {mode = "v", auto = true})
nnoremap <silent> ,wÞ <Nop>
nnoremap <silent> ,FÞ <Nop>
nnoremap <silent> ,fÞ <Nop>
nnoremap <silent> ,sÞ <Nop>
nnoremap <silent> ,hÞ <Nop>
nnoremap <silent> ,tÞ <Nop>
nnoremap <silent> ,eÞ <Nop>
nnoremap <silent> ,dÞ <Nop>
nnoremap <silent> ,xÞ <Nop>
nnoremap <silent> ,cmÞ <Nop>
nnoremap <silent> ,cÞ <Nop>
nnoremap <silent> ,oÞ <Nop>
nnoremap <silent> ,Þ <Nop>
nnoremap <silent> , <Cmd>lua require("which-key").show(",", {mode = "n", auto = true})
nnoremap ,fm <Cmd>Telescope marks
nnoremap ,fo <Cmd>Telescope oldfiles
nnoremap ,fh <Cmd>Telescope help_tags
nnoremap ,fg <Cmd>Telescope live_grep
nnoremap ,ff <Cmd>Telescope find_files
nnoremap ,f/ <Cmd>Telescope current_buffer_fuzzy_find
nnoremap ,fk <Cmd>Telescope keymaps 
nnoremap ,f, <Cmd>Telescope 
nnoremap ,fd <Cmd>lua require'telescope.builtin'.diagnostics{bufnr=0} 
nnoremap ,fa <Cmd>Telescope asynctasks all theme=dropdown 
nnoremap ,fe <Cmd>lua require'telescope.builtin'.symbols{'nerd','emoji','gitemoji','julia'} 
nnoremap ,fp <Cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}
nnoremap ,fn <Cmd>Telescope noice
nnoremap ,FB <Cmd>Telescope file_browser
nnoremap ,fb <Cmd>Telescope buffers
nnoremap ,xx <Cmd>TroubleToggle
nnoremap ,xq <Cmd>TroubleToggle quickfix
nnoremap ,xl <Cmd>TroubleToggle loclist
nnoremap ,xd <Cmd>TroubleToggle lsp_document_diagnostics
nnoremap ,xw <Cmd>TroubleToggle lsp_workspace_diagnostics
nnoremap ,dR <Cmd>!python3 %
nnoremap <silent> ,rp <Cmd>MagmaInitPython
nnoremap <silent> ,ro <Cmd>MagmaShowOutput
nnoremap <silent> ,rd <Cmd>MagmaDelete
nnoremap <silent> ,rc <Cmd>MagmaReevaluateCell
vnoremap <silent> ,r :MagmaEvaluateVisual
nnoremap <silent> ,rr <Cmd>MagmaEvaluateLine
nnoremap <silent> <expr> ,r nvim_exec('MagmaEvaluateOperator', v:true)
nnoremap ,ft <Cmd>TodoTelescope
nnoremap <silent> ,cmd <Cmd>!start cmd /k cd %:p:h
nnoremap <silent> ,ex <Cmd>!start explorer %:p:h
noremap <silent> ,sL L
noremap <silent> ,sH H
noremap <silent> ,sK K
noremap <silent> ,sJ J
noremap <silent> ,sw w
noremap <silent> ,sl l
noremap <silent> ,sh h
noremap <silent> ,sk k
noremap <silent> ,sj j
noremap <silent> ,sp <Cmd>set splitbelow:split
noremap <silent> ,sv <Cmd>set splitright:vsplit
nnoremap <silent> ,tl <Cmd>tabn
nnoremap <silent> ,th <Cmd>tabp
nnoremap <silent> ,tc <Cmd>tabclose
nnoremap <silent> ,tn <Cmd>tabnew
nnoremap <silent> ,ee <Cmd>e $MYVIMRC
nnoremap <silent> ;; ;
vnoremap <silent> ; :
nnoremap <silent> ; :
nnoremap <silent> <aÞ <Nop>
nnoremap <silent> <iÞ <Nop>
nnoremap <silent> <Þ <Nop>
nnoremap <silent> < <Cmd>lua require("which-key").show("<", {mode = "n", auto = true})
nnoremap <silent> >aÞ <Nop>
nnoremap <silent> >iÞ <Nop>
nnoremap <silent> >Þ <Nop>
nnoremap <silent> > <Cmd>lua require("which-key").show(">", {mode = "n", auto = true})
xnoremap <silent> <expr> @ ':normal! @'.getcharstr().''
onoremap F <Plug>(leap-backward-to)
xnoremap F <Plug>(leap-backward-to)
nnoremap F <Plug>(leap-backward-to)
noremap <silent> H 0
noremap <silent> J 5j
noremap <silent> K 5k
noremap <silent> L $
xnoremap <silent> MÞ <Nop>
xnoremap <silent> M <Cmd>lua require("which-key").show("M", {mode = "v", auto = true})
xnoremap <silent> Q :normal! @=reg_recorded()
xnoremap S <Plug>(nvim-surround-visual)
onoremap T <Plug>(leap-backward-till)
xnoremap T <Plug>(leap-backward-till)
nnoremap T <Plug>(leap-backward-till)
nnoremap Y y$
xnoremap <silent> [Þ <Nop>
xnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "v", auto = true})
nnoremap <silent> [Þ <Nop>
nnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "n", auto = true})
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
xnoremap <silent> \Þ <Nop>
xnoremap <silent> \ <Cmd>lua require("which-key").show("\\", {mode = "v", auto = true})
nnoremap <silent> \lÞ <Nop>
nnoremap <silent> \Þ <Nop>
nnoremap <silent> \ <Cmd>lua require("which-key").show("\\", {mode = "n", auto = true})
nnoremap \lt <Cmd>VimtexTocOpen
vnoremap <silent> \s :s//g<Left><Left>
nnoremap <silent> \s :%s//g<Left><Left>
xnoremap <silent> ]Þ <Nop>
xnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "v", auto = true})
nnoremap <silent> ]Þ <Nop>
nnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "n", auto = true})
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nnoremap <silent> ` <Cmd>lua require("which-key").show("`", {mode = "n", auto = true})
xnoremap <silent> aMÞ <Nop>
xnoremap <silent> amÞ <Nop>
xmap a% <Plug>(MatchitVisualTextObject)
onoremap b <Cmd>lua require('spider').motion('b')
nnoremap b <Cmd>lua require('spider').motion('b')
xnoremap b <Cmd>lua require('spider').motion('b')
nnoremap <silent> ciÞ <Nop>
nnoremap <silent> ci <Cmd>lua require("which-key").show("ci", {mode = "n", auto = true})
nnoremap <silent> cÞ <Nop>
nnoremap <silent> c <Cmd>lua require("which-key").show("c", {mode = "n", auto = true})
nnoremap <silent> caÞ <Nop>
nnoremap cS <Plug>(nvim-surround-change-line)
nnoremap cs <Plug>(nvim-surround-change)
nnoremap <silent> daÞ <Nop>
nnoremap <silent> diÞ <Nop>
nnoremap <silent> dÞ <Nop>
nnoremap <silent> d <Cmd>lua require("which-key").show("d", {mode = "n", auto = true})
nnoremap ds <Plug>(nvim-surround-delete)
nnoremap e <Cmd>lua require('spider').motion('e')
xnoremap e <Cmd>lua require('spider').motion('e')
onoremap e <Cmd>lua require('spider').motion('e')
onoremap f <Plug>(leap-forward-to)
xnoremap f <Plug>(leap-forward-to)
nnoremap f <Plug>(leap-forward-to)
xnoremap gb <Plug>(comment_toggle_blockwise_visual)
xnoremap gc <Plug>(comment_toggle_linewise_visual)
nnoremap gb <Plug>(comment_toggle_blockwise)
nnoremap gc <Plug>(comment_toggle_linewise)
xnoremap <silent> gÞ <Nop>
xnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "v", auto = true})
nnoremap <silent> gUaÞ <Nop>
nnoremap <silent> gUiÞ <Nop>
nnoremap <silent> gUÞ <Nop>
nnoremap <silent> g~aÞ <Nop>
nnoremap <silent> g~iÞ <Nop>
nnoremap <silent> g~Þ <Nop>
nnoremap <silent> guaÞ <Nop>
nnoremap <silent> guiÞ <Nop>
nnoremap <silent> guÞ <Nop>
nnoremap <silent> gÞ <Nop>
nnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "n", auto = true})
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
nnoremap gR <Cmd>TroubleToggle lsp_references
onoremap gf <Plug>(leap-from-window)
xnoremap gf <Plug>(leap-from-window)
nnoremap gf <Plug>(leap-from-window)
xnoremap gS <Plug>(nvim-surround-visual-line)
xnoremap <silent> imÞ <Nop>
xnoremap <silent> iMÞ <Nop>
xnoremap <silent> mÞ <Nop>
xnoremap <silent> m <Cmd>lua require("which-key").show("m", {mode = "v", auto = true})
onoremap t <Plug>(leap-forward-till)
xnoremap t <Plug>(leap-forward-till)
nnoremap t <Plug>(leap-forward-till)
nnoremap <silent> vaÞ <Nop>
nnoremap <silent> viÞ <Nop>
nnoremap <silent> vÞ <Nop>
nnoremap <silent> v <Cmd>lua require("which-key").show("v", {mode = "n", auto = true})
nnoremap w <Cmd>lua require('spider').motion('w')
xnoremap w <Cmd>lua require('spider').motion('w')
onoremap w <Cmd>lua require('spider').motion('w')
nnoremap <silent> yaÞ <Nop>
nnoremap <silent> yiÞ <Nop>
nnoremap <silent> yÞ <Nop>
nnoremap <silent> y <Cmd>lua require("which-key").show("y", {mode = "n", auto = true})
nnoremap ySS <Plug>(nvim-surround-normal-cur-line)
nnoremap yS <Plug>(nvim-surround-normal-line)
nnoremap yss <Plug>(nvim-surround-normal-cur)
nnoremap ys <Plug>(nvim-surround-normal)
nnoremap <silent> zÞ <Nop>
nnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "n", auto = true})
nnoremap <silent> zfaÞ <Nop>
nnoremap <silent> zfiÞ <Nop>
nnoremap <silent> zfÞ <Nop>
xnoremap <Plug>(comment_toggle_blockwise_visual) <Cmd>lua require("Comment.api").locked("toggle.blockwise")(vim.fn.visualmode())
xnoremap <Plug>(comment_toggle_linewise_visual) <Cmd>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())
xnoremap <silent> <C-Insert>Þ <Nop>
xnoremap <silent> <C-Insert> <Cmd>lua require("which-key").show("��\4�kI", {mode = "v", auto = true})
nnoremap <silent> <C-W>Þ <Nop>
nnoremap <silent> <C-W> <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_file(vim.fn.expand("%:p"))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
xnoremap <silent> <Plug>(nvim-surround-visual-line) <Cmd>lua require'nvim-surround'.visual_surround({ line_mode = true })
xnoremap <silent> <Plug>(nvim-surround-visual) <Cmd>lua require'nvim-surround'.visual_surround({ line_mode = false })
nnoremap <silent> <F4> a=strftime("%Y-%m-%d %a %I:%M %p")
vnoremap <silent> <C-Insert>  "+y
vnoremap <silent> <BS> d " backspace
vnoremap <silent> <C-C> "+y
nnoremap <silent> <S-Insert> "+gP
noremap <silent> <Right> <Cmd>vertical resize+5
noremap <silent> <Left> <Cmd>vertical resize-5
noremap <silent> <Down> <Cmd>res -5
noremap <silent> <Up> <Cmd>res +5
nnoremap <silent> <C-J> J
xnoremap <silent> <C-J> J
onoremap <silent> <C-J> J
noremap <silent> <C-B> 5b
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
inoremap <silent> Þ <Nop>
inoremap <silent>  <Cmd>lua require("which-key").show("\7", {mode = "i", auto = true})
inoremap S <Plug>(nvim-surround-insert-line)
inoremap s <Plug>(nvim-surround-insert)
imap <silent> 	 <Plug>(Tabout)
cnoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
inoremap  u
cnoremap <silent>  +
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set clipboard=unnamed
set cmdheight=0
set completeopt=menu,menuone,noselect
set expandtab
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set fillchars=eob:\ ,fold:\ ,foldopen:,foldsep:\ ,foldclose:
set foldlevelstart=99
set formatoptions=jclqr
set guicursor=a:NoiceHiddenCursor
set helplang=en
set history=1024
set ignorecase
set langmenu=en_US
set listchars=tab:▸\\\ ,trail:▫
set noloadplugins
set mouse=n
set packpath=~/nvim-linux64/share/nvim/runtime
set pumheight=15
set runtimepath=
set runtimepath+=~/.config/nvim
set runtimepath+=~/.local/share/nvim/lazy/lazy.nvim
set runtimepath+=~/.local/share/nvim/lazy/tabout.nvim
set runtimepath+=~/.local/share/nvim/lazy/copilot.lua
set runtimepath+=~/.local/share/nvim/lazy/nvim-autopairs
set runtimepath+=~/.local/share/nvim/lazy/lspsaga.nvim
set runtimepath+=~/.local/share/nvim/lazy/none-ls.nvim
set runtimepath+=~/.local/share/nvim/lazy/indent-blankline.nvim
set runtimepath+=~/.local/share/nvim/lazy/Comment.nvim
set runtimepath+=~/.local/share/nvim/lazy/todo-comments.nvim
set runtimepath+=~/.local/share/nvim/lazy/telescope-asynctasks.nvim
set runtimepath+=~/.local/share/nvim/lazy/telescope-symbols.nvim
set runtimepath+=~/.local/share/nvim/lazy/telescope-fzf-native.nvim
set runtimepath+=~/.local/share/nvim/lazy/telescope-project.nvim
set runtimepath+=~/.local/share/nvim/lazy/telescope-ui-select.nvim
set runtimepath+=~/.local/share/nvim/lazy/telescope-file-browser.nvim
set runtimepath+=~/.local/share/nvim/lazy/sqlite.lua
set runtimepath+=~/.local/share/nvim/lazy/telescope-smart-history.nvim
set runtimepath+=~/.local/share/nvim/lazy/plenary.nvim
set runtimepath+=~/.local/share/nvim/lazy/telescope.nvim
set runtimepath+=~/.local/share/nvim/lazy/nvim-web-devicons
set runtimepath+=~/.local/share/nvim/lazy/dashboard-nvim
set runtimepath+=~/.local/share/nvim/lazy/nvim-lspconfig
set runtimepath+=~/.local/share/nvim/lazy/mason-tool-installer.nvim
set runtimepath+=~/.local/share/nvim/lazy/mason.nvim
set runtimepath+=~/.local/share/nvim/lazy/playground
set runtimepath+=~/.local/share/nvim/lazy/nvim-treesitter-context
set runtimepath+=~/.local/share/nvim/lazy/nvim-yati
set runtimepath+=~/.local/share/nvim/lazy/nvim-ts-autotag
set runtimepath+=~/.local/share/nvim/lazy/nvim-ts-rainbow
set runtimepath+=~/.local/share/nvim/lazy/nvim-ts-context-commentstring
set runtimepath+=~/.local/share/nvim/lazy/nvim-treesitter
set runtimepath+=~/.local/share/nvim/lazy/nui.nvim
set runtimepath+=~/.local/share/nvim/lazy/noice.nvim
set runtimepath+=~/.local/share/nvim/lazy/vimtex
set runtimepath+=~/.local/share/nvim/lazy/leap-spooky.nvim
set runtimepath+=~/.local/share/nvim/lazy/trouble.nvim
set runtimepath+=~/.local/share/nvim/lazy/leap.nvim
set runtimepath+=~/.local/share/nvim/lazy/transparent.nvim
set runtimepath+=~/.local/share/nvim/lazy/nvim-spider
set runtimepath+=~/.local/share/nvim/lazy/which-key.nvim
set runtimepath+=~/.local/share/nvim/lazy/yanky.nvim
set runtimepath+=~/.local/share/nvim/lazy/onedark.nvim
set runtimepath+=~/.local/share/nvim/lazy/lualine.nvim
set runtimepath+=~/.local/share/nvim/lazy/luasnip-latex-snippets.nvim
set runtimepath+=~/.local/share/nvim/lazy/nvim-dap-python
set runtimepath+=~/.local/share/nvim/lazy/nvim-dap-virtual-text
set runtimepath+=~/.local/share/nvim/lazy/nvim-dap-ui
set runtimepath+=~/.local/share/nvim/lazy/nvim-dap
set runtimepath+=~/.local/share/nvim/lazy/nvim-surround
set runtimepath+=~/.local/share/nvim/lazy/promise-async
set runtimepath+=~/.local/share/nvim/lazy/nvim-ufo
set runtimepath+=~/.local/share/nvim/lazy/cmp_yanky
set runtimepath+=~/.local/share/nvim/lazy/cmp-dictionary
set runtimepath+=~/.local/share/nvim/lazy/cmp-omni
set runtimepath+=~/.local/share/nvim/lazy/lspkind.nvim
set runtimepath+=~/.local/share/nvim/lazy/copilot-cmp
set runtimepath+=~/.local/share/nvim/lazy/cmp-vimtex
set runtimepath+=~/.local/share/nvim/lazy/friendly-snippets
set runtimepath+=~/.local/share/nvim/lazy/LuaSnip
set runtimepath+=~/.local/share/nvim/lazy/cmp_luasnip
set runtimepath+=~/.local/share/nvim/lazy/cmp-cmdline
set runtimepath+=~/.local/share/nvim/lazy/cmp-path
set runtimepath+=~/.local/share/nvim/lazy/cmp-buffer
set runtimepath+=~/.local/share/nvim/lazy/cmp-nvim-lua
set runtimepath+=~/.local/share/nvim/lazy/cmp-nvim-lsp
set runtimepath+=~/.local/share/nvim/lazy/nvim-cmp
set runtimepath+=~/nvim-linux64/share/nvim/runtime
set runtimepath+=~/nvim-linux64/share/nvim/runtime/pack/dist/opt/matchit
set runtimepath+=~/nvim-linux64/lib/nvim
set runtimepath+=~/.local/state/nvim/lazy/readme
set runtimepath+=~/.local/share/nvim/lazy/indent-blankline.nvim/after
set runtimepath+=~/.local/share/nvim/lazy/playground/after
set runtimepath+=~/.local/share/nvim/lazy/vimtex/after
set runtimepath+=~/.local/share/nvim/lazy/cmp_yanky/after
set runtimepath+=~/.local/share/nvim/lazy/cmp-dictionary/after
set runtimepath+=~/.local/share/nvim/lazy/cmp-omni/after
set runtimepath+=~/.local/share/nvim/lazy/cmp-vimtex/after
set runtimepath+=~/.local/share/nvim/lazy/cmp_luasnip/after
set runtimepath+=~/.local/share/nvim/lazy/cmp-cmdline/after
set runtimepath+=~/.local/share/nvim/lazy/cmp-path/after
set runtimepath+=~/.local/share/nvim/lazy/cmp-buffer/after
set runtimepath+=~/.local/share/nvim/lazy/cmp-nvim-lua/after
set runtimepath+=~/.local/share/nvim/lazy/cmp-nvim-lsp/after
set scrolloff=8
set selection=exclusive
set sessionoptions=buffers,curdir,folds,winsize,winpos
set shiftwidth=4
set shortmess=filnxtToOF
set showmatch
set sidescrolloff=8
set smartcase
set smartindent
set softtabstop=4
set splitbelow
set splitright
set statusline=%#Normal#
set noswapfile
set tabstop=4
set termguicolors
set timeoutlen=500
set undofile
set updatetime=100
set viewoptions=cursor,folds,slash,unix
set whichwrap=b,s,<,>,[,]
set winaltkeys=no
set window=69
set nowritebackup
" vim: set ft=vim :
