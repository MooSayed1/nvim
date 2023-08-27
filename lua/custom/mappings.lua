---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<ESC>"] = { ":noh <CR>", "Clear highlights", opts = { silent = true } },
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal terminal",
    },
    ["<leader>v"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical terminal",
    },
  },
}

M.compiletion = {
  n = {
    ["<F9>"] = {
      function()
        if vim.bo.ft == "cpp" then
          require("nvterm.terminal").send("clear && sh bulid.sh", "vertical")
        elseif vim.bo.ft == "python" then
          require("nvterm.terminal").send("clear && python -m compileall ./", "vertical")
        else
          vim.cmd 'echo "incorrect file type!!"'
        end
      end,

      "compile & run",
    },
    ["<F10>"] = {
      function()
        if vim.bo.ft == "cpp" then
          require("nvterm.terminal").send("clear && ./main", "vertical")
        else
          vim.cmd 'echo "not correct file type"'
        end
      end,

      "run",
    },
    ["<leader>gc"] = {
      function()
        if vim.bo.ft == "cpp" then
          require("nvterm.terminal").send("clear && g++ -o out " .. vim.fn.expand "%" .. " && ./out", "horizontal")
        elseif vim.bo.ft == "python" then
          require("nvterm.terminal").send("clear && python " .. vim.fn.expand "%" .. "", "vertical")
        else
          vim.cmd 'echo "not correct file type"'
        end
      end,

      "compile & run a single file",
    },
  },
}
M.trouble = {
  n = {
    ["<leader>tt"] = {
      "<cmd> TroubleToggle <CR>",
      "Toggle Trouble",
    },
  },
}

M.custom = {
  n = {
    ["<leader>tc"] = {
      "<cmd> ColorcolumnToggle <CR>",
      "Toggle Color column",
    },

    ["<leader>td"] = {
      function()
        vim.api.nvim_input ":tcd "
      end,
      "Run tcd command",
    },
  },
}

return M
