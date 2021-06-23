require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        custom_captures = {
            ["keyword.operator"] = "TSKeyword"
        }
    },
    incremental_selection = {
        enable = true 
    },
    textobjects = {
        enable = true 
    },
}
