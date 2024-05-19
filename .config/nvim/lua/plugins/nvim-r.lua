return {
	{
		"jalvesaq/Nvim-R",
		branch = "master",
		ft = { "r", "rmd", "quarto" },
		config = function()
			-- Start nvim-r when opening a R compatible file
			vim.cmd("let R_auto_start = 2")

			-- Have more syntax highlighting in the R console
			vim.cmd("let Rout_more_colors = 1")

			-- Disable _ turning into arrows
			vim.cmd("let R_assign = 0")
		end,
	},
	{
		"jalvesaq/cmp-nvim-r",
		ft = { "r", "rmd", "quarto" },
		config = function()
			require("cmp_nvim_r").setup({})
		end,
	},
}
