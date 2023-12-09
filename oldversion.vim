" Matlab
" Some bugs, but may be helpful for edit the matlab files
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }
"
" Plug 'Thieso/vim-matlab', { 'do': function('DoRemote') }
"
" Plug 'yinflying/matlab-screen'

" matlab
" let g:matlab_server_launcher = ""
