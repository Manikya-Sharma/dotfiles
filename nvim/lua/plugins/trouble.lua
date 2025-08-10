return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<C-T>",
            "<cmd>Trouble diagnostics toggle focus=true<cr>",
            desc = "Toggle diagnostics"
        }
    }
}
