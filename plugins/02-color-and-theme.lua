return {
    --------------------------------------------------------------------------------------------
    --- 插件modes用于高亮当前编辑的行
    {
        "folke/which-key.nvim",
        optional = true,
        opts = {plugins = {presets = {operators = false}}}
    }, ---
    {"mvllow/modes.nvim", version = "^0.2", event = "VeryLazy", opts = {}},

    --------------------------------------------------------------------------------------------
    --- vim-highlighter 插件用于高亮匹配项
    {
        "azabiong/vim-highlighter",
        lazy = false, -- Not Lazy by default
        keys = {
            {"f<Enter>", desc = "Highlight"},
            {"f<BS>", desc = "Remove Highlight"},
            {"f<C-L>", desc = "Clear Highlight"},
            {"f<Tab>", desc = "Find Highlight (similar to Telescope grep)"}
        }
    },

    --------------------------------------------------------------------------------------------
    --- 使用astronvim自带的主题并简单修改
    {
        "AstroNvim/astrotheme",
        opts = {
            style = {
                italic_comments = false,
                inactive = false,
                border = true,
                neotree = false,
                title_invert = false,
                terminal_color = false,
                termguicolors = false
                -- float = false,
                -- popup = false
            }
            -- palettes = {astrodark = {ui = {base = "#0b0c0e"}}}
        }

    }
    --------------------------------------------------------------------------------------------
    --- ccc 是一款屏幕取色插件 
}
