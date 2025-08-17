local icons = {
    Array         = " ",
    Boolean       = "󰨙 ",
    Class         = " ",
    Constant      = "󰏿 ",
    Constructor   = " ",
    Enum          = " ",
    EnumMember    = " ",
    Event         = " ",
    Field         = " ",
    File          = "󰈙 ",
    Function      = "󰊕 ",
    Interface     = " ",
    Key           = "󰌋 ",
    Method        = " ",
    Module        = " ",
    Namespace     = "󰦮 ",
    Null          = "󰟢 ",
    Number        = "󰎠 ",
    Object        = " ",
    Operator      = "󰆕 ",
    Package       = " ",
    Property      = " ",
    String        = " ",
    Struct        = " ",
    TypeParameter = "󰗴 ",
    Variable      = " ",
    Collapsed     = " ",
}

return {
    'stevearc/aerial.nvim',
    opts = {
        attach_mode = "global",
        backends = { "lsp", "treesitter", "markdown", "man" },
        layout = { min_width = 28 },
        show_guides = true,
        filter_kind = false,
        guides = {
            mid_item = "├ ",
            last_item = "└ ",
            nested_top = "│ ",
            whitespace = "  ",
        },
        icons = icons
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    lazy = true,
    event = { "BufEnter" }
}
