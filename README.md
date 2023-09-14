# Baylor's NvChad Config

This is a WIP config that makes NvChad more minimal to mimic plain vim.

## Breaking Changes

I've disabled tabufline and statusline, but NvChad has a live reloader that requires patching the core config in [`/lua/core/init.lua`](https://github.com/NvChad/NvChad/blob/215aa2bb2ff702014132c629d9c995246234fe0e/lua/core/init.lua#L95-L97)

```lua
-- /lua/core/init.lua#L95-97

-- statusline
-- require("plenary.reload").reload_module("nvchad.statusline." .. config.ui.statusline.theme)
-- vim.opt.statusline = "%!v:lua.require('nvchad.statusline." .. config.ui.statusline.theme .. "').run()"
```
