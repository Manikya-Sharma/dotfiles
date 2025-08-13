return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        {
            "<leader>-",
            mode = { "n", "v" },
            function() vim.cmd('Yazi') end,
            desc = "Open yazi at the current file",
        },
        {
            "<leader>p",
            function() vim.cmd('Yazi cwd') end,
            desc = "Open the file manager in nvim's working directory",
        },
    },
    opts = {},
}
