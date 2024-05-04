-- BUG: replaced by venv-selector, and it seems not work as expected.
return {
    "kmontocam/nvim-conda",
    enabled = false,
    lazy = true,
    cmd = { "CondaActivate", "CondaDeactivate" },
    dependencies = { "nvim-lua/plenary.nvim" },
}
