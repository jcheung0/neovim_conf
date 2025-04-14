

return {
  {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    format_on_save = {
      -- Customize format on save behavior
      timeout_ms = 500,
      lsp_fallback = true,
    },
    opts = {

      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
      }
    },
  }

}
