-- FIX:
-- `pip3 install pynvim --upgrade` is needed
return {
    "numirias/semshi",
    enabled = true,
    build = ":UpdateRemotePlugins",
    ft = "python",
}
