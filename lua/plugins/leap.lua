-- NOTE: Fast moving.

return {
    "ggandor/leap.nvim",
    enabled = true,
    lazy = false,
    config = function()
        require('leap').add_default_mappings()
        -- Disable auto-jumping to the first match
        require('leap').opts.safe_labels = {}
    end
}
