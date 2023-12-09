-- FIX:
-- `pip3 install pynvim --upgrade` is needed
return {
    "numirias/semshi",
    enabled = false,
    build = ":UpdateRemotePlugins",
    ft = "python",
}
