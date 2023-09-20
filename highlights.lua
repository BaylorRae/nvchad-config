-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  htmlArg = {
    italic = true,
  },
  StatusLine = {
    fg = "white",
    bg = "#1c2026"
  },
  Type = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  StatusLineNC = {
    fg = "lightgrey",
    bg = "#1c2026"
  },
}

return M
