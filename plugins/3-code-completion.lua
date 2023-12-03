local cmp = require "cmp"

return {
    --------------------------------------------------------------------------------------------
    --- 插件cmp-cmdline用于为nvim 的命令行提供补全
    {
        "hrsh7th/cmp-cmdline",
        lazy = false,
        opts = {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({{name = "path"}}, {
                {name = "cmdline", option = {ignore_cmds = {"Man", "!"}}}
            }, {{name = "buffer"}})
        },
        config = function(_, opts)
            require("cmp").setup.cmdline(":", opts)
        end
    },

    --------------------------------------------------------------------------------------------
    --- 一款免费的AI辅助代码编写工具，需联网
    --- https://github.com/Exafunction/codeium.vim
    {
        "Exafunction/codeium.vim",
        event = "User AstroFile",
        config = function()
            vim.keymap.set("i", "<C-g>",
                           function()
                return vim.fn["codeium#Accept"]()
            end, {expr = true})
            vim.keymap.set("i", "<c-;>", function()
                return vim.fn["codeium#CycleCompletions"](1)
            end, {expr = true})
            vim.keymap.set("i", "<c-,>", function()
                return vim.fn["codeium#CycleCompletions"](-1)
            end, {expr = true})
            vim.keymap.set("i", "<c-x>",
                           function()
                return vim.fn["codeium#Clear"]()
            end, {expr = true})
            vim.keymap.set("n", "<leader>;", function()
                if vim.g.codeium_enabled == true then
                    vim.cmd "CodeiumDisable"
                else
                    vim.cmd "CodeiumEnable"
                end
            end, {noremap = true, desc = "Toggle Codeium active"})
        end
    }
}
