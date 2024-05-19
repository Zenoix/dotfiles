return {
	"code-biscuits/nvim-biscuits",
	event = { "InsertLeave", "CursorHoldI" },
	config = function()
		require("nvim-biscuits").setup({
			cursor_line_only = true,
		})
	end,
}
