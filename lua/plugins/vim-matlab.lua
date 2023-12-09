-- FIX:
-- return {
--     "daeyun/vim-matlab",
--     ft = "matlab",
--     build = ":UpdateRemotePlugins",
--     -- config = function()
--     --     --
--     -- end
-- }
-- -- " Matlab
-- -- " Some bugs, but may be helpful for edit the matlab files
-- -- function! DoRemote(arg)
-- --   UpdateRemotePlugins
-- -- endfunction
-- -- Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }
-- -- "
-- -- " Plug 'Thieso/vim-matlab', { 'do': function('DoRemote') }
-- -- "
-- -- " Plug 'yinflying/matlab-screen'

-- -- " matlab
-- -- " let g:matlab_server_launcher = ""

-- FIX: Local Version
return {
    "yunus-sun/vim-matlab",
    enabled = false,
    -- dir = "C:/Users/Yunus/AppData/Local/nvim-data/lazy/vim-matlab",
    -- dev = true,
    ft = "matlab",
    build = ":UpdateRemotePlugins",
    -- config = function()
    --     --
    -- end
}
-- " Matlab
-- " Some bugs, but may be helpful for edit the matlab files
-- function! DoRemote(arg)
--   UpdateRemotePlugins
-- endfunction
-- Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }
-- "
-- " Plug 'Thieso/vim-matlab', { 'do': function('DoRemote') }
-- "
-- " Plug 'yinflying/matlab-screen'

-- " matlab
-- " let g:matlab_server_launcher = ""
