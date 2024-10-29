return {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
                -- add any opts here
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "stevearc/dressing.nvim",
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
                --- The below dependencies are optional,
                "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
                "zbirenbaum/copilot.lua", -- for providers='copilot'
                {
                        -- support for image pasting
                        "HakonHarnes/img-clip.nvim",
                        event = "VeryLazy",
                        opts = {
                                -- recommended settings
                                default = {
                                        embed_image_as_base64 = false,
                                        prompt_for_file_name = false,
                                        drag_and_drop = {
                                                insert_mode = true,
                                        },
                                        -- required for Windows users
                                        use_absolute_path = true,
                                },
                        },
                },
                {
                        -- Make sure to set this up properly if you have lazy=true
                        'MeanderingProgrammer/render-markdown.nvim',
                        opts = {
                                file_types = { "markdown", "Avante" },
                        },
                        ft = { "markdown", "Avante" },
                },
        },
        claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-haiku",
                temperature = 0,
                max_tokens = 4096,
        },
        config = function()
                vim.api.nvim_create_autocmd("User", {
                        pattern = "ToggleMyPrompt",
                        callback = function() 
                                require("avante.config").override({
                                        system_prompt = "You are a best senior developer in the company, you love brevity and high quality of code. You don't comment the code because it's self-describing and you don't talk about the code, you just output it. Only when really necessary." 
                                }) 
                        end,
                })

                vim.keymap.set("n", "<leader>am", function() 
                        vim.api.nvim_exec_autocmds("User", { pattern = "ToggleMyPrompt" }) 
                end, { desc = "avante: toggle my prompt" })
        end,
}

