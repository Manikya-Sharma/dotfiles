return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<C-K>",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			python = { "isort", "black" },
			rust = { "rustfmt" },
			javacript = { "prettierd", "prettier", stop_after_first = true },
			javacriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			cpp = { "clang-format" },
			lua = { "stylua" },
			toml = { "taplo" },
			["_"] = { lsp_format = "fallback" },
		},
	},
}
