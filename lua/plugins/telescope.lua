return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({})
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>p", builtin.lsp_document_symbols, {})
		vim.keymap.set("n", "<Leader>r", builtin.lsp_references, {})
		vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, {})
		vim.keymap.set(
			"n",
			"<leader>fs",
			require("telescope").extensions.live_grep_args.live_grep_args,
			{ noremap = true }
		)

		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope buffers" })

		telescope.load_extension("live_grep_args")
	end,
}
