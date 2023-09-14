---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<cr>"] = {"<cmd> nohlsearch<cr>", "Clear the search buffer when hitting return"},

    ["<leader>e"] = {"<cmd>lua vim.diagnostic.open_float { border = \"rounded\" }<cr>", "Show diagnostics for current line"},
    ["[d"] = {"<cmd>lua vim.diagnostic.goto_prev { float = { border = \"rounded\" } }<cr>", "Jump to previous diagnostic"},
    ["]d"] = {"<cmd>lua vim.diagnostic.goto_next { float = { border = \"rounded\" } }<cr>", "Jump to next diagnostic"}
  },
}

-- more keybinds!

return M
