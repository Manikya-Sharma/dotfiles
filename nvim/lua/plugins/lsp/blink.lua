local icons = {
	Text = "",
	Method = "󰡱",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "󰂡",
	Class = "",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "󰒕",
	Color = "󰏘",
	Reference = "",
	File = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	-- init = function()
	-- 	local capabilities = require("blink.cmp").get_lsp_capabilities()
	-- 	vim.lsp.config("*", capabilities)
	-- end,
	build = "cargo build --release",
	opts = {
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
			kind_icons = icons,
		},
		sources = {
			default = { "lazydev", "lsp", "path", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				cmdline = {
					-- ignores cmdline completions when executing shell commands
					enabled = function()
						return vim.fn.getcmdtype() ~= ":" or not vim.fn.getcmdline():match("^[%%0-9,'<>%-%.]*!")
					end,
				},
			},
		},
		completion = {
			menu = {
				draw = {
					-- We don't need label_description now because label and label_description are already
					-- combined together in label by colorful-menu.nvim.
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								local has_colorful_menu, colorful_menu = pcall(require, "colorful-menu")
								if not has_colorful_menu then
									vim.notify("colorful-menu not found", vim.log.levels.ERROR, { title = "Config" })
								end
								return colorful_menu.blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
			accept = {
				auto_brackets = { enabled = false },
			},
			documentation = {
				window = {
					border = "rounded",
				},
				auto_show = true,
				auto_show_delay_ms = 500,
				treesitter_highlighting = false,
			},
		},
		keymap = {
			preset = "enter",
			["<C-L>"] = {
				function(cmp)
					cmp.show()
				end,
			},
		},
		signature = {
			enabled = true,
			window = {
				border = "single",
			},
		},
	},
	opts_extend = { "sources.default" },
}
