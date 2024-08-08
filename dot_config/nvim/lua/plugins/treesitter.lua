local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			local customConfig = require("configs.treesitter")
			configs.setup(customConfig)
		end,
	},
}
return plugins
