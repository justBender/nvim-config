return {
	{
		"justbender/eclipse-darker",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("eclipse-darker")
		end,
	},
}
