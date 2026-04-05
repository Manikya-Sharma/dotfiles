local opts = {
	follow_current_file = { enabled = true },
	close_if_last_window = true,
	popup_border_stye = "winborder",
	source_selector = {
		winbar = true,
	},
	window = {
		mappings = {
			["z"] = "noop",
			["/"] = "noop",
		},
	},
	sources = { "filesystem", "buffers", "git_status" },
	default_component_configs = {
		git_status = {
			symbols = {
				-- Change type
				added = "",
				modified = "󰦒",
				deleted = "",
				renamed = "󰁕",
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = " ",
				staged = "",
				conflict = "",
			},
		},
	},
}

require("neo-tree").setup(opts)
