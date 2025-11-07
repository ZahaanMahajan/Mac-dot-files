return {
	"nvim-flutter/flutter-tools.nvim",
	ft = { "dart" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	opts = {
		lsp = {
			color = {
				enabled = true,
			},
			settings = {
				lineLength = 130,
			},
		},
		dev_log = {
			enabled = true,
		},
	},
	config = function(_, opts)
		require("flutter-tools").setup(opts)
	end,
}
