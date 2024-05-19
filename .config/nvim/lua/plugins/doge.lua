return {
	"kkoomen/vim-doge",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.cmd([[call doge#install()]])
	end,
}
