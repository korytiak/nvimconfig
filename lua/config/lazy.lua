local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "rose-pine", "lunaperche", "habamax" } },
    checker = {
        enabled = true,
        notify = false,
    },
})

-- Function to set Rose Pine theme based on system preference
local function set_rose_pine_theme()
    local handle = io.popen("defaults read -g AppleInterfaceStyle")
    local result = handle:read("*a")
    handle:close()

    if result:find("Dark") then
        vim.cmd([[colorscheme rose-pine]]) -- Regular (dark mode)
    else
        vim.cmd([[colorscheme rose-pine-dawn]]) -- Light mode
    end
end

set_rose_pine_theme()

