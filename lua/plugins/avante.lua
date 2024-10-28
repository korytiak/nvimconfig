local avante = require('avante_lib')

-- Configuration table for Avante
local config = {
    provider = "claude",
    auto_suggestions_provider = "claude",
    claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        temperature = 0,
        max_tokens = 4096,
    },
    behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
    },
    mappings = {
        diff = {
            ours = "co",
            theirs = "ct",
            all_theirs = "ca",
            both = "cb",
            cursor = "cc",
            next = "]x",
            prev = "[x",
        },
        suggestion = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
        jump = {
            next = "]]",
            prev = "[[",
        },
        submit = {
            normal = "<CR>",
            insert = "<C-s>",
        },
        sidebar = {
            apply_all = "A",
            apply_cursor = "a",
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
        },
    },
    hints = { enabled = true },
    windows = {
        position = "right",
        wrap = true,
        width = 30,
        sidebar_header = {
            enabled = true,
            align = "center",
            rounded = true,
        },
        input = {
            prefix = "> ",
        },
        edit = {
            border = "rounded",
            start_insert = true,
        },
        ask = {
            floating = false,
            start_insert = true,
            border = "rounded",
        },
    },
    highlights = {
        diff = {
            current = "DiffText",
            incoming = "DiffAdd",
        },
    },
    diff = {
        autojump = true,
        list_opener = "copen",
    },
}

-- Return a table with the plugin specification
return {
    'yetone/avante.nvim',
    branch = 'main',
    build = 'make',
    config = function()
        -- Load Avante with the configuration
        avante.load(config)
    end,
}

