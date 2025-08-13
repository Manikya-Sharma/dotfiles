return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<C-T>",
            function() vim.cmd('Trouble diagnostics toggle focus=true') end,
            desc = "Toggle diagnostics"
        }
    }
}
