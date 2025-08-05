return {
    "ramojus/mellifluous.nvim",
    config = function()
        require("mellifluous").setup({
            colorset = "kanagawa_dragon",
            transparent_background = {
                enabled = true
            },
            styles = {
                main_keywords = {
                    italic = true
                },
                other_keywords = {
                    italic = true
                },
                functions = {
                    italic = true
                },
                constants = {
                    bold = true
                }
            }
        })
        -- vim.cmd("colorscheme mellifluous")
    end,
}
