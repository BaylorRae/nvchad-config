-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.g.mapleader = ","

vim.keymap.set('n', '<leader>t', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>gc', '<cmd>Telescope find_files search_dirs={"app/controllers"}<cr>')
vim.keymap.set('n', '<leader>gm', '<cmd>Telescope find_files search_dirs={"app/models"}<cr>')
vim.keymap.set('n', '<leader>gv', '<cmd>Telescope find_files search_dirs={"app/views"}<cr>')

vim.keymap.set('n', 'Y', 'yy')

-- Move around splits with <c-hjkl>
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Quickly insert hash rocket
vim.keymap.set('i', '<c-L>', '<space>=><space>')

-- Better tab navigation
vim.keymap.set('n', 'th', '<cmd>tabprev<cr>')
vim.keymap.set('n', 'tl', '<cmd>tabnext<cr>')
vim.keymap.set('n', 'tn', '<cmd>tabnew<cr>')

vim.cmd('hi htmlArg gui=italic')
vim.cmd('hi Comment gui=italic')
vim.cmd('hi Type    gui=italic')
vim.cmd('hi htmlArg cterm=italic')
vim.cmd('hi Comment cterm=italic')
vim.cmd('hi Type    cterm=italic')


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

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

-- Lua API
vim.keymap.set("n", "<leader>a", "<cmd>lua require('rspec.integrated').run_spec_file()<cr>", { silent = true, noremap = true })

vim.opt.clipboard = ""

vim.opt.cmdheight = 2
vim.opt.laststatus = 2

vim.keymap.set("n", "<leader>gr", "<cmd>topleft split config/routes.rb<cr>")

vim.opt.splitbelow = false
vim.opt.splitright = false

vim.opt.guicursor = "n-v-c-i:block"
