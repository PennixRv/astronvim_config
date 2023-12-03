local utils = require "astronvim.utils"
local prefix = "<leader>fd"

return {
    --------------------------------------------------------------------------------------------
    --- nvim-bqf 插件用于提供lsp补全的快速方式 better quick fix 
    { --
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        opts = {}
    },

    --------------------------------------------------------------------------------------------
    --- 使用 treesitter 向 nvim-dap REPL 缓冲区添加语法高亮显示。
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "LiadOz/nvim-dap-repl-highlights",
            dependencies = {"mfussenegger/nvim-dap"},
            opts = {}
        },
        opts = function(_, opts)
            if opts.ensure_installed ~= "all" then
                opts.ensure_installed = utils.list_insert_unique(
                                            opts.ensure_installed, "dap_repl")
            end
        end
    },

    --------------------------------------------------------------------------------------------
    --- 此插件为 nvim-dap 添加了虚拟文本支持。nvim-treesitter 用于查找变量定义。
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter"
        },
        event = "User AstroFile",
        opts = {commented = true, enabled = true, enabled_commands = true}
    },

    --------------------------------------------------------------------------------------------
    --- persistent-breakpoints 是 Neovim 的一个 lua 插件，用于将 nvim-dap 的检查点保存到文件中，并在打开 neovim 时自动加载它们 
    {
        "Weissle/persistent-breakpoints.nvim",
        event = "BufReadPost",
        opts = function(_, opts)
            return require("astronvim.utils").extend_tbl(opts, {
                load_breakpoints_event = {"BufReadPost"}
            })
        end,
        keys = {
            {
                "<leader>db",
                function()
                    require("persistent-breakpoints.api").toggle_breakpoint()
                end,
                {silent = true},
                desc = "Toggle Breakpoint"
            }, {
                "<leader>dB",
                function()
                    require("persistent-breakpoints.api").clear_all_breakpoints()
                end,
                {silent = true},
                desc = "Clear Breakpoints"
            }, {
                "<leader>dC",
                function()
                    require("persistent-breakpoints.api").set_conditional_breakpoint()
                end,
                {silent = true},
                desc = "Conditional Breakpoint"
            }
        }
    },

    --------------------------------------------------------------------------------------------
    --- nvim-dap 与 telescope.nvim 的集成。
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            {
                prefix .. "c",
                function()
                    require("telescope").extensions.dap.commands()
                end,
                desc = "Telescope DAP commands"
            }, {
                prefix .. "f",
                function()
                    require("telescope").extensions.dap.frames()
                end,
                desc = "Telescope DAP frames"
            }, {
                prefix .. "g",
                function()
                    require("telescope").extensions.dap.configurations()
                end,
                desc = "Telescope DAP configurations"
            }, {
                prefix .. "l",
                function()
                    require("telescope").extensions.dap.list_breakpoints()
                end,
                desc = "Telescope DAP list breakpoints"
            }, {
                prefix .. "v",
                function()
                    require("telescope").extensions.dap.variables()
                end,
                desc = "Telescope DAP variables"
            }
        },
        dependencies = {"nvim-telescope/telescope-dap.nvim"},
        opts = function() require("telescope").load_extension "dap" end
    }
}
