return {
	"echasnovski/mini.pairs",
	event = "VeryLazy",
	opts = {
		mappings = {
			["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\`].", register = { cr = false } },
		},
	},
	keys = {
		{
			"<leader>up",
			function()
				vim.notify = require("notify")
				vim.g.minipairs_disable = not vim.g.minipairs_disable
				if vim.g.minipairs_disable then
					vim.notify("Disabled auto pairs", "warn", { title = "Option" })
				else
					vim.notify("Enabled auto pairs", "info", { title = "Option" })
				end
			end,
			desc = "Toggle Auto Pairs",
		},
	},
}
