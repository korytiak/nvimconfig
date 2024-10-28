return {
        'neovim/nvim-lspconfig',
        config = function()
                require'lspconfig'.lua_ls.setup{}
                -- Optional configuration for Harpoon

                require'lspconfig'.marksman.setup{}
                require'lspconfig'.gopls.setup{}
                require'lspconfig'.lemminx.setup{}

                local use = require('packer').use
                require('packer').startup(function()
                        use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
                        use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
                        use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
                        use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
                        use 'L3MON4D3/LuaSnip' -- Snippets plugin
                end)

                -- luasnip setup
                local luasnip = require 'luasnip'

                -- nvim-cmp setup
                local cmp = require 'cmp'
                cmp.setup {
                        snippet = {
                                expand = function(args)
                                        luasnip.lsp_expand(args.body)
                                end,
                        },
                        mapping = cmp.mapping.preset.insert({
                                ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                                ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
                                ['<Tab>'] = cmp.mapping.confirm {
                                        behavior = cmp.ConfirmBehavior.Replace,
                                        select = true,
                                },
                        }),
                        sources = {
                                { name = 'nvim_lsp' },
                                { name = 'luasnip' },
                        },
                }

                -- init.lua or your Lua configuration file

                -- Set up TypeScript language server
                require('lspconfig').ts_ls.setup({
                        on_attach = function(client, bufnr)
                                -- Disable default formatting
                                client.server_capabilities.document_formatting = false

                                local function format_with_prettier()
                                        local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
                                        if ft == "typescript" or ft == "typescriptreact" then
                                                vim.cmd([[silent! !prettier --write %]])
                                                vim.cmd("edit!")
                                        end
                                end

                                -- Format on save
                                vim.api.nvim_create_autocmd("BufWritePre", {
                                        buffer = bufnr,
                                        callback = format_with_prettier,
                                })
                        end,
                })

                require'lspconfig'.omnisharp.setup {
                        cmd = { "dotnet", "/Users/sveto/Projects/omnisharp/OmniSharp.dll" },
                        filetypes = { "cs", "vb", "fs", "razor" },
                        settings = {
                                FormattingOptions = {
                                        -- Enables support for reading code style, naming convention and analyzer
                                        -- settings from .editorconfig.
                                        EnableEditorConfigSupport = true,
                                        -- Specifies whether 'using' directives should be grouped and sorted during
                                        -- document formatting.
                                        OrganizeImports = nil,
                                },
                                MsBuild = {
                                        -- If true, MSBuild project system will only load projects for files that
                                        -- were opened in the editor. This setting is useful for big C# codebases
                                        -- and allows for faster initialization of code navigation features only
                                        -- for projects that are relevant to code that is being edited. With this
                                        -- setting enabled OmniSharp may load fewer projects and may thus display
                                        -- incomplete reference lists for symbols.
                                        LoadProjectsOnDemand = nil,
                                },
                                RoslynExtensionsOptions = {
                                        -- Enables support for roslyn analyzers, code fixes and rulesets.
                                        EnableAnalyzersSupport = nil,
                                        -- Enables support for showing unimported types and unimported extension
                                        -- methods in completion lists. When committed, the appropriate using
                                        -- directive will be added at the top of the current file. This option can
                                        -- have a negative impact on initial completion responsiveness,
                                        -- particularly for the first few completion sessions after opening a
                                        -- solution.
                                        EnableImportCompletion = nil,
                                        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                                        -- true
                                        AnalyzeOpenDocumentsOnly = nil,
                                },
                                Sdk = {
                                        -- Specifies whether to include preview versions of the .NET SDK when
                                        -- determining which version to use for project loading.
                                        IncludePrereleases = true,
                                },
                        },
                }

        end,
}
