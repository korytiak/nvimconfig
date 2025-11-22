return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
      formatters = {
        csharpier_format = {
          command = "csharpier",
          args = { "format", "--write-stdout" },
          stdin = true,
        },
      },
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				cs = { "csharpier_format" },
				go = { "gofmt" },
			},
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
