return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	init = function()
		local languages = {
			"bash",
			"c",
			"cmake",
			"comment",
			"cpp",
			"csv",
			"diff",
			"dockerfile",
			"ecma",
			"javascript",
			"json",
			"jsx",
			"lua",
			"make",
			"rust",
			"tmux",
			"toml",
			"tsv",
			"typescript",
			"vimdoc",
			"yaml",
		}
		vim.api.nvim_create_autocmd("FileType", {
			pattern = languages,
			callback = function()
				vim.treesitter.start()
				-- use treesitter for indent
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
		require("nvim-treesitter").install(languages)
	end,
}
