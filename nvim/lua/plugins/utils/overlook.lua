return {
	"WilliamHsieh/overlook.nvim",
	opts = {},
	keys = {
		{
			"<leader>pd",
			function()
				require("overlook.api").peek_definition()
			end,
			desc = "Overlook: Peek definition",
		},
		{
			"<leader>pc",
			function()
				require("overlook.api").close_all()
			end,
			desc = "Overlook: Close all popup",
		},
		{
			"<leader>pu",
			function()
				require("overlook.api").restore_popup()
			end,
			desc = "Overlook: Restore popup",
		},
		{
			"<leader>pv",
			function()
				require("overlook.api").open_in_vsplit()
			end,
			desc = "Overlook: Open in vsplit",
		},
	},
}
