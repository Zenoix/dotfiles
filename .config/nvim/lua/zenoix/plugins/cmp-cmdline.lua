return {
	"hrsh7th/cmp-cmdline",
	event = { "CmdlineEnter" },
	config = function()
		local cmp = require("cmp")
		-- `:` cmdline setup.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				name = "buffer",
			},
		})
	end,
}
