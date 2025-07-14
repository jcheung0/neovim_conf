
local keys = {
  {
    "<leader>b",
    function()
      require("dap").toggle_breakpoint()
    end,
    options = {
      desc = "Toggle breakpoint",
      nowait = true,
      remap = false
    },
    mode = "n"
  },
  {
    "<F1>",
    function()
      require("dap").continue()
    end,
    options = {
      desc = "Continue Debug",
      nowait = true,
      remap = false
    },
    mode = "n"
  },
  {
    "<F2>",
    function()
      require("dap").step_over()
    end,
    options = {
      desc = "Toggle breakpoint",
      nowait = true,
      remap = false
    },
    mode = "n"

  },
  {
    "<F3>",
    function()
      require("dap").step_into()
    end,
    options = {
      desc = "Toggle breakpoint",
      nowait = true,
      remap = false
    },
    mode = "n"

  },
  {
    "<F4>",
    function()
      require("dap").step_out()
    end,
    options = {
      desc = "Toggle breakpoint",
      nowait = true,
      remap = false
    },
    mode = "n"

  },
}

for index,value in ipairs(keys) do
  vim.keymap.set(value.mode, value[1], value[2],value.options)
end

