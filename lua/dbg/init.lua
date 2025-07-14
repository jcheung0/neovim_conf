
require('telescope').load_extension('dap')
-- require('dap-go').setup()
-- require('dap-python').setup('~/.pyenv/shims/python')

-- require("nvim-dap-virtual-text").setup()
local dap = require('dap')
local utils = require('utils')
local dapui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text") 
local mason_dap = require("mason-nvim-dap")

require("dap-python").setup("python3")

require("lazydev").setup({
  library = { "nvim-dap-ui" },
})

mason_dap.setup({
  ensure_installed = { "cppdbg","delve","node2"},
  automatic_installation = true,
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end
  }
})

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end


dap.configurations = {

  go = { 
    {
      type = 'delve';
      name = 'Debug';
      request = 'launch';
      showLog = false;
      program = "${file}";
    },
    {
      type = 'delve';
      name = 'Debug test';
      request = 'launch';
      showLog = false;
      mode = "test",
      program = "${file}";
    },
    {
      type = 'delve';
      name = 'Debug test';
      request = 'launch';
      showLog = false;
      mode = "test",
      program = "./${relativeFileDirname}";
    }


  },
  typescript = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch file',
      program = '${file}',
      cwd = '${workspaceFolder}',
    }
  },
  c = {
    {
      name = "Launch File",
      type = "cppdbg",
      request = "launch",
      program = function() 
        return vim.fn.input("Path to executable", vim.fn.getcwd() .. "/", "file")
      end
    }
  }
}



dap.configurations.dapui_console = {
}


utils.map('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
utils.map('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
utils.map('v', '<leader>dhv',
          '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

utils.map('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
utils.map('n', '<leader>duf',
          "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

utils.map('n', '<leader>dsbr',
          '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
utils.map('n', '<leader>dsbm',
          '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
utils.map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
utils.map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')


-- telescope-dap
utils.map('n', '<leader>dcc',
          '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
utils.map('n', '<leader>dco',
          '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
utils.map('n', '<leader>dlb',
          '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
utils.map('n', '<leader>dv',
          '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
utils.map('n', '<leader>df',
          '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')




vim.fn.sign_define('DapBreakpoint',{ text ='🛑', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
