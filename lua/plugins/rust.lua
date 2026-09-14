return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = { ensure_installed = { "rust_analyzer" } },
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
							checkOnSave = {
								command = "clippy",
							},
							inlayHints = {
								enable = true,
								typeHints = true,
								parameterHints = true,
							},
							hover = {
								actions = {
									references = {
										enable = true,
									},
								},
							},
							procMacro = { enable = true },
						},
					},
				},
			},
		},
	},
}
