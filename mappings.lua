---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>th"] = "",
    ["<leader>td"] = "",
  }
}

M.general = {
  n = {
    ["Y"] = {"yy", "Match vim's line yank"},

    ["<cr>"] = {"<cmd> nohlsearch<cr>", "Clear the search buffer when hitting return"},

    ["<leader>t"] = {"<cmd>Telescope find_files<cr>", "Browse files", opts = {nowait = true}},

    ["<leader>e"] = {"<cmd>lua vim.diagnostic.open_float { border = \"rounded\" }<cr>", "Show diagnostics for current line"},
    ["[d"] = {"<cmd>lua vim.diagnostic.goto_prev { float = { border = \"rounded\" } }<cr>", "Jump to previous diagnostic"},
    ["]d"] = {"<cmd>lua vim.diagnostic.goto_next { float = { border = \"rounded\" } }<cr>", "Jump to next diagnostic"}
  },

  i = {
    ["<tab>"] = {
      function()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        if vim.api.nvim_get_current_line():sub(col, col):match("[a-zA-Z0-9_$]") then
          vim.api.nvim_input("<c-p>")
        else
          vim.api.nvim_input("<c-tab>")
        end
      end,
      "Autocomplete or insert tab"
    },
    ["<s-tab>"] = {"<c-n>"}
  }
}

M.rails = {
  n = {
    ["<leader>gr"] = {"<cmd>topleft split config/routes.rb<cr>", "Open config/routes.rb above everything else"},
    ["<leader>gc"] = {"<cmd>Telescope find_files search_dirs={\"app/controllers\"}<cr>", "Browse app/controllers"},
    ["<leader>gm"] = {"<cmd>Telescope find_files search_dirs={\"app/models\"}<cr>", "Browse app/models"},
    ["<leader>gv"] = {"<cmd>Telescope find_files search_dirs={\"app/views\"}<cr>", "Browse app/views"},

    ["<leader>a"] = {"<cmd>lua require('rspec.integrated').run_spec_file()<cr>", "Run RSpec", opts = {silent = true, noremap = true}},

    ["<leader>."] = {
      function()
        local current_file = vim.fn.expand("%")
        local new_file = current_file

        -- path starts with spec/
        local in_spec = current_file:match("^spec/")

        -- path includes (controllers|models|helpers|mailers)
        local in_app = current_file:match("controllers") or current_file:match("models") or current_file:match("helpers") or current_file:match("mailers")

        if in_spec then
          -- remove leading spec/ and trailing _spec.rb
          new_file = new_file:gsub("^spec/", "")
          new_file = new_file:gsub("_spec.rb", ".rb")

          -- make sure we go back to app/
          if in_app then
            new_file = "app/" .. new_file
          end
        else
          -- strip leading app/
          if in_app then
            new_file = new_file:gsub("^app/", "")
          end

          -- prepend spec/ and append _spec.rb
          new_file = "spec/" .. new_file
          new_file = new_file:gsub(".rb", "_spec.rb")
        end

        vim.cmd("e " .. new_file)
      end,
      "Switch between test and production code"
    }
  },

  i = {
    ["<c-l>"] = {"<space>=><space>", "Insert hash rocket"}
  }
}

M.splits = {
  n = {
    ["<c-j>"] = {"<c-w>j", "Move down split"},
    ["<c-k>"] = {"<c-w>k", "Move up split"},
    ["<c-h>"] = {"<c-w>h", "Move left split"},
    ["<c-l>"] = {"<c-w>l", "Move right split"},
  }
}

M.tabs = {
  n = {
    ["tn"] = {"<cmd>tabnew<cr>", "Open a new tab"},
    ["th"] = {"<cmd>tabprev<cr>", "Go to previous tab"},
    ["tl"] = {"<cmd>tabnext<cr>", "Go to next tab"},
  }
}

-- more keybinds!

return M
