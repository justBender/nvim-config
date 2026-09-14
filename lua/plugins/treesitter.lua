return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("nvim-treesitter").setup({
			highlight = { enable = true },
			indent = { enable = true },
		}),
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"rust",
				"python",
				"typescript",
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"regex",
				"tsx",
				"vim",
				"yaml",
			})
		end,
	},
}
