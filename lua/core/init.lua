--require("core.lazy")
require("core.globals")
require("core.settings")
--require("core.remap")
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        require "core.mappings"
    end,
})
vim.opt.termguicolors = true
-- to made ctrl+x swich from insert mode to normal mode
vim.api.nvim_set_keymap("i", "<C-x>", "<ESC>", { noremap = true })
-- Map Ctrl + S to save changes and switch to normal mode from insert mode
--vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-S>', '<C-O>:w<CR><C-O>:stopinsert<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
-- KeyBind Compatative programing
--vim.api.nvim_set_keymap('n', '<leader>co', [[<Cmd>CompetiTestReceive contest<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>rc', [[<Cmd>CompetiTestReceive problem<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>rr', [[<Cmd>CompetiTestRun<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>ra', [[<Cmd>CompetiTestAdd<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>re', [[<Cmd>CompetiTestEdit<CR>]], { noremap = true, silent = true })
--
