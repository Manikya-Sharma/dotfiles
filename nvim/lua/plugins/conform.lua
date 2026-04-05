local opts = {
	formatters_by_ft = {
		python = { "isort", "black" },
		rust = { "rustfmt" },
		javacript = { "prettierd", "prettier", stop_after_first = true },
		javacriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		cpp = { "clang-format" },
		lua = { "stylua" },
		toml = { "taplo" },
		json = { "biome", "clang-format", stop_after_first = true },
		astro = { "prettierd", "prettier", stop_after_first = true },
		["_"] = { lsp_format = "fallback" },
	},
}

require("conform").setup(opts)
