-- FIX:
-- `pip3 install pynvim --upgrade` is needed
return {
    "numirias/semshi",
    build = ":UpdateRemotePlugins",
    ft = "python",
}
