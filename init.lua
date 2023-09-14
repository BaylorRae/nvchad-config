vim.g.mapleader = ","

-- Seriously, guys. It's not like :W is bound to anything anyway.
vim.cmd("command! W :w")

-- Restore cursor position
-- https://github.com/garybernhardt/dotfiles/blob/eed3bbab874f15ddbaaf0341fac1923c12b30b5b/.vimrc#L163-L167
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

-- Separate system clipboard from neovim
vim.opt.clipboard = ""

-- Add breathing room around commands
vim.opt.cmdheight = 2

-- Show status bar for all windows
vim.opt.laststatus = 2

-- Match traditional vim placement of splits
vim.opt.splitbelow = false
vim.opt.splitright = false

-- Always use block cursor
vim.opt.guicursor = "n-v-c-i:block"

-- Add standardrb linter
-- https://github.com/standardrb/standard/wiki/IDE:-neovim
vim.opt.signcolumn = "yes" -- otherwise it bounces in and out, not strictly needed though
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  group = vim.api.nvim_create_augroup("RubyLSP", { clear = true }), -- also this is not /needed/ but it's good practice 
  callback = function()
    vim.lsp.start {
      name = "standard",
      cmd = { "standardrb", "--lsp" },
    }
  end,
})
