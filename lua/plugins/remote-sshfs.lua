return {
    'nosduco/remote-sshfs.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'RemoteSSHFSEdit', 'RemoteSSHFSReload', 'RemoteSSHFSConnect', 'RemoteSSHFSLiveGrep', 'RemoteSSHFSFindFiles', 'RemoteSSHFSDisconnect' },
    dependencies = { 'nvim-telescope/telescope.nvim' }, -- optional if you declare plugin somewhere else
    config = function ()
        require('remote-sshfs').setup({})
    end
}
