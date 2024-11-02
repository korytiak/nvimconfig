return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- Function to check if macOS is in dark mode
        local function is_dark_mode()
            local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
            local result = handle:read("*a")
            handle:close()
            return result:match("Dark") ~= nil
        end

        -- Select themes based on the system appearance
        local selected_theme = is_dark_mode() and require'lualine.themes.ayu_mirage' or require'lualine.themes.ayu_light'

        require('lualine').setup {
            options = { theme = selected_theme },
        }
    end,
}

