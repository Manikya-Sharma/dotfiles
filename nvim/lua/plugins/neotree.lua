return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
        { "MunifTanjim/nui.nvim",  lazy = true },
    },
    opts = {
        follow_current_file = { enabled = true },
        close_if_last_window = true,
        popup_border_stye = 'winborder',
        source_selector = {
            winbar = true
        },
        sources = { "filesystem", "buffers" },
    },
    lazy = false,
}
