-- TODO: fzf lua is good, but replace telescope is hard
return {
    "ibhagwan/fzf-lua",
    enabled = false,
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
    end
}
