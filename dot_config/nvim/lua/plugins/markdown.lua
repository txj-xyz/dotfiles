local plugins = {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    main = "render-markdown",
    lazy = false,
    opts = require "configs.markdown"
  }
}

return plugins
