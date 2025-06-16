

require('mason-nvim-dap').setup({
  ensure_installed = { 'python', 'delve' },  -- List adapters to auto-install
  automatic_installation = true,  -- Auto-install adapters used in config
  handlers = {
    function(config)
      -- Default handler
      require('mason-nvim-dap').default_setup(config)
    end,
    -- Custom handlers for specific adapters if needed
    python = function(config)
      config.configurations = {
        {
          type = 'python',
          request = 'launch',
          name = 'Python: Current File',
          program = "${file}",
        },
      }
      require('mason-nvim-dap').default_setup(config)
    end,
  },
})
