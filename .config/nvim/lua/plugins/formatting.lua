return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				bash = { "beautysh" },
				go = { "gofmt", "goimports-reviser" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				yaml = { "prettier" },
				zsh = { "beautysh" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
