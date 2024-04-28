-- FIX:
-- `pip3 install pynvim --upgrade` is needed
-- mamba install neovim is also needed?
return {
    "numirias/semshi",
    enabled = true,
    build = ":UpdateRemotePlugins",
    ft = "python",
}
