return {
    {
      "olimorris/codecompanion.nvim",
      config = true,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
      opts = {
        strategies = {
          chat = {
            adapter = "copilot",
            tools = {
              ["mcp"] = {
                callback = function() return require("mcphub.extension.codecompanion") end,
                description = "Call tools and resources for mcp servers"
              }
            }
          },
          inline = {
            adapter = "copilot",
          }
        }
      }
    }, 
}

