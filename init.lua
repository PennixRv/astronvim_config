return {
    options = {
        g = {
            diagnostics_mode = 3,
            inlay_hints_enabled = false,
            riscv_asm_all_enable = 1,
            neovide_refresh_rate = 100,
            neovide_cursor_vfx_mode = "railgun"
            -- autoformat_enabled = false
        },
        b = {inlay_hints_enabled = false},
        opt = {relativenumber = false, foldcolumn = "0"}

    },
    icons = {
        VimIcon = "",
        ScrollText = "",
        GitBranch = "",
        GitAdd = "",
        GitChange = "",
        GitDelete = ""
    },
    lazy = {git = {timeout = 30}}
}
