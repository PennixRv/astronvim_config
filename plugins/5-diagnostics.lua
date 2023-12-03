local prefix = "<leader>x"
local maps = {n = {}}
local icon = vim.g.icons_enabled and "󱍼 " or ""
maps.n[prefix] = {desc = icon .. "Trouble"}
require("astronvim.utils").set_mappings(maps)
return {
    --------------------------------------------------------------------------------------------
    ---  一个漂亮的诊断、参考资料、望远镜结果、快速修复和位置列表，帮助你解决你的代码造成的所有麻烦。 
    {
        {
            "folke/trouble.nvim",
            cmd = {"TroubleToggle", "Trouble"},
            keys = {
                {
                    prefix .. "X",
                    "<cmd>TroubleToggle workspace_diagnostics<cr>",
                    desc = "Workspace Diagnostics (Trouble)"
                }, {
                    prefix .. "x",
                    "<cmd>TroubleToggle document_diagnostics<cr>",
                    desc = "Document Diagnostics (Trouble)"
                }, {
                    prefix .. "l",
                    "<cmd>TroubleToggle loclist<cr>",
                    desc = "Location List (Trouble)"
                }, {
                    prefix .. "q",
                    "<cmd>TroubleToggle quickfix<cr>",
                    desc = "Quickfix List (Trouble)"
                }
            },
            opts = {
                use_diagnostic_signs = true,
                action_keys = {close = {"q", "<esc>"}, cancel = "<c-e>"}
            }
        }, {
            "folke/edgy.nvim",
            optional = true,
            opts = function(_, opts)
                if not opts.bottom then opts.bottom = {} end
                table.insert(opts.bottom, "Trouble")
            end
        }
    },

    --------------------------------------------------------------------------------------------
    --- lsp_lines 是一个简单的 neovim 插件，它使用虚拟行在真实代码行之上呈现诊断。
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        event = "LspAttach",
        keys = {
            {
                "<Leader>uD",
                function()
                    vim.diagnostic.config {
                        virtual_text = not require("lsp_lines").toggle()
                    }
                end,
                desc = "Toggle virtual diagnostic lines"
            }
        },
        opts = {},
        config = function(_, opts)
            -- disable diagnostic virtual text
            local lsp_utils = require "astronvim.utils.lsp"
            lsp_utils.diagnostics[3].virtual_text = false
            vim.diagnostic.config(lsp_utils.diagnostics[vim.g.diagnostics_mode])
            require("lsp_lines").setup(opts)
        end
    },

    --------------------------------------------------------------------------------------------
    --- https://github.com/tenxsoydev/tabs-vs-spaces.nvim 一款显示缩进的插件
    {
        {
            "tenxsoydev/tabs-vs-spaces.nvim",
            config = true,
            enabled = true,
            event = "User AstroFile",
            opts = {
                -- Preferred indentation. Possible values: "auto"|"tabs"|"spaces".
                -- "auto" detects the dominant indentation style in a buffer and highlights deviations.
                indentation = "auto",
                -- Use a string like "DiagnosticUnderlineError" to link the `TabsVsSpace` highlight to another highlight.
                -- Or a table valid for `nvim_set_hl` - e.g. { fg = "MediumSlateBlue", undercurl = true }.
                highlight = "DiagnosticUnderlineHint",
                -- Priority of highight matches.
                priority = 20,
                ignore = {
                    filetypes = {},
                    -- Works for normal buffers by default.
                    buftypes = {
                        "acwrite", "help", "nofile", "nowrite", "quickfix",
                        "terminal", "prompt"
                    }
                },
                standartize_on_save = false,
                -- Enable or disable user commands see Readme.md/#Commands for more info.
                user_commands = true
            }
        }
    }
}
