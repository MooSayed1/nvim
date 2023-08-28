local create_cmd = vim.api.nvim_create_user_command
local create_autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
local g = vim.g
local settings = require("custom.config").settings



create_autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("center_on_insert", {}),
  pattern = "*",
  callback = function()
    vim.cmd.normal { bang = true, "zz" }
  end,
})
-- Disable scrolloff in blacklisted filetypes
create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.o.scrolloff = (vim.tbl_contains(settings.blacklist, vim.bo.ft) and 0 or settings.so_size)
  end,
})

-- Disable colorcolumn in blacklisted filetypes
create_autocmd({ "FileType" }, {
  callback = function()
    if vim.g.ccenable then
      vim.opt_local.cc = (vim.tbl_contains(settings.blacklist, vim.bo.ft) and "0" or settings.cc_size)
    end
  end,
})
create_autocmd({ "UIEnter" }, {

  once = true,
  callback = function()
    local function getcmd_output()
      local handle = io.popen "pgrep nvim | wc -l"
      local output = handle:read "*a"
      handle:close()
      return output
    end
  end,
})
-- Toggle autosave
create_cmd("AutosaveToggle", function()
  vim.g.autosave = not vim.g.autosave

  if vim.g.autosave then
    create_autocmd({ "InsertLeave", "TextChanged" }, {
      group = vim.api.nvim_create_augroup("Autosave", {}),
      callback = function()
        if vim.api.nvim_buf_get_name(0) and #vim.bo.buftype == 0 then
          vim.cmd "silent w"
          vim.api.nvim_echo({
            { "󰄳", "LazyProgressDone" },
            { " file autosaved at " .. os.date "%I:%M %p" },
          }, false, {})

          vim.defer_fn(function()
            vim.api.nvim_echo({}, false, {})
          end, 1800)
        end
      end,
    })
  else
    vim.api.nvim_del_augroup_by_name "Autosave"
  end
end, {})
-- Custom snippets
--
local spath = vim.fn.stdpath "config" .. "/lua/custom/snippet"
g.vscode_snippets_path = spath

opt.backup = false
opt.swapfile = false

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.relativenumber = true
opt.wrap = false
vim.o.spelllang = "en_us"
opt.cmdheight = 0



opt.foldcolumn = "2"
opt.foldlevel = 1
opt.foldnestmax = 2
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.signcolumn = "auto:1-2"

vim.opt.termguicolors = true
-- to made ctrl+x swich from insert mode to normal mode
vim.api.nvim_set_keymap("i", "<C-x>", "<ESC>", { noremap = true })
-- Map Ctrl + S to save changes and switch to normal mode from insert mode
--vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-S>', '<C-O>:w<CR><C-O>:stopinsert<CR>', { noremap = true, silent = true })
-- KeyBind Compatative programing
vim.api.nvim_set_keymap('n', '<leader>co', [[<Cmd>CompetiTestReceive contest<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rc', [[<Cmd>CompetiTestReceive problem<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rr', [[<Cmd>CompetiTestRun<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ra', [[<Cmd>CompetiTestAdd<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>re', [[<Cmd>CompetiTestEdit<CR>]], { noremap = true, silent = true })
-- Disable arrow keys
vim.keymap.set({ "n", "v", "x", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v", "x", "i" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v", "x", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v", "x", "i" }, "<Right>", "<Nop>")
