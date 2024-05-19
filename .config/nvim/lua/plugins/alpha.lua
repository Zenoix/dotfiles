return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		Header = {
			"       ▄▀▀▀▀▀▀▀▀▀▀▄▄           ",
			"     ▄▀▀░░░░░░░░░░░░░▀▄        ",
			"   ▄▀░░░░░░░░░░░░░░░░░░▀▄      ",
			"   █░░░░░░░░░░░░░░░░░░░░░▀▄    ",
			"  ▐▌░░░░░░░░▄▄▄▄▄▄▄░░░░░░░▐▌   ",
			"  █░░░░░░░░░░░▄▄▄▄░░▀▀▀▀▀░░█   ",
			" ▐▌░░░░░░░▀▀▀▀░░░░░▀▀▀▀▀░░░▐▌  ",
			" █░░░░░░░░░▄▄▀▀▀▀▀░░░░▀▀▀▀▄░█  ",
			" █░░░░░░░░░░░░░░░░▀░░░▐░░░░░▐▌ ",
			" ▐▌░░░░░░░░░▐▀▀██▄░░░░░░▄▄▄░▐▌ ",
			"  █░░░░░░░░░░░▀▀▀░░░░░░▀▀██░░█ ",
			"  ▐▌░░░░▄░░░░░░░░░░░░░▌░░░░░░█ ",
			"   ▐▌░░▐░░░░░░░░░░░░░░▀▄░░░░░█ ",
			"    █░░░▌░░░░░░░░▐▀░░░░▄▀░░░▐▌ ",
			"    ▐▌░░▀▄░░░░░░░░▀░▀░▀▀░░░▄▀  ",
			"    ▐▌░░▐▀▄░░░░░░░░░░░░░░░░█   ",
			"    ▐▌░░░▌░▀▄░░░░▀▀▀▀▀▀░░░█    ",
			"    █░░░▀░░░░▀▄░░░░░░░░░░▄▀    ",
			"   ▐▌░░░░░░░░░░▀▄░░░░░░▄▀      ",
			"  ▄▀░░░▄▀░░░░░░░░▀▀▀▀█▀        ",
			" ▀░░░▄▀░░░░░░░░░░▀░░░▀▀▀▀▄▄▄▄▄ ",
		}

		require("alpha.term")

		local dynamic_header = {
			type = "terminal",
			command = "chafa -c full --fg-only --symbols braille ~/dotfiles/.config/nvim/static/spirited.gif",
			width = 70,
			height = 20,
			opts = {
				position = "center",
				redraw = true,
				window_config = {},
			},
		}

		local text_header = {
			type = "text",
			val = Header,
			opts = {
				position = "center",
			},
		}

		local default_header = nil
		if vim.fn.executable("chafa") == 1 then
			default_header = dynamic_header
		else
			default_header = text_header
		end

		local buttons = {
			type = "group",
			val = {
				dashboard.button("n", "󰈔  New File    ", ":enew<CR>"),
				dashboard.button("f", "  Find File   ", ":Telescope find_files<CR>"),
				dashboard.button("t", "󰊄  Find Text   ", ":Telescope live_grep<CR>"),
				dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
				dashboard.button(
					"c",
					"  Nvim Config ",
					":cd $HOME/dotfiles/.config/nvim | Telescope find_files<CR>"
				),
				dashboard.button("q", "󰅙  Quit        ", ":qa<CR>"),
			},
			opts = {
				spacing = 1,
			},
		}

		Footer = {
			"                                  ",
			"Everything not saved will be lost.",
			"                                  ",
		}

		local footer = {
			type = "text",
			val = Footer,
			opts = {
				position = "center",
				hl = "Number",
			},
		}

		local section = {
			header = default_header,
			buttons = buttons,
			footer = footer,
		}

		local opts = {
			layout = {
				{ type = "padding", val = 3 },
				section.header,
				{ type = "padding", val = 1 },
				section.buttons,
				{ type = "padding", val = 1 },
				section.footer,
				{ type = "padding", val = 3 },
			},
			opts = {
				margin = 2,
				noautocmd = true,
				redraw_on_resize = true,
				setup = function()
					vim.api.nvim_create_autocmd("User", {
						pattern = "AlphaReady",
						desc = "hide cursor for alpha",
						callback = function()
							local hl = vim.api.nvim_get_hl_by_name("Cursor", true)
							hl.blend = 100
							vim.api.nvim_set_hl(0, "Cursor", hl)
							vim.opt.guicursor = "a:Cursor/lCursor"
						end,
					})
					vim.api.nvim_create_autocmd("BufUnload", {
						buffer = 0,
						desc = "show cursor after alpha",
						callback = function()
							local hl = vim.api.nvim_get_hl_by_name("Cursor", true)
							hl.blend = nil
							vim.api.nvim_set_hl(0, "Cursor", hl)
							vim.opt.guicursor = "n-v-c-sm-i-ci-ve-o:block,r-cr:hor20"
						end,
					})
				end,
			},
		}

		dashboard.opts = opts
		-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
