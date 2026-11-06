local c = {
	directory_1 = "#F8D775",
	directory_2 = "#ffc66d",
	rust_icon = "#cc6c1d",
	lua_icon = "#000080",
	javascript_icon = "#F0DB4F",
	html_icon = "#E44D26",
	css_icon = "#264de4",
	toml_icon = "#9c4221",
	json_icon = "#eed49f",
	snacks_picker = "#2B2D30",
	snacks_picker_dir = "#FFFFFF",
	snacks_picker_file = "#FFFFFF",
	diagnostic_warn = "#A4A4A4",
	snacks_picker_git_status_untracked = "#FC8864",
	docker_icon = "#1D63ED",
	xml_icon = "#f29c1f",
	svg_icon = "#ffb300",
	nginx_icon = "#43a047",
}

local function apply()
	vim.api.nvim_set_hl(0, "DirectoryIcon", {
		fg = c.directory_1,
	})

	vim.api.nvim_set_hl(0, "DirectoryIconAlt", {
		fg = c.directory_2,
	})

	vim.api.nvim_set_hl(0, "RustIcon", {
		fg = c.rust_icon,
	})

	vim.api.nvim_set_hl(0, "LuaIcon", {
		fg = c.lua_icon,
	})

	vim.api.nvim_set_hl(0, "JsIcon", {
		fg = c.javascript_icon,
	})

	vim.api.nvim_set_hl(0, "HtmlIcon", {
		fg = c.html_icon,
	})

	vim.api.nvim_set_hl(0, "CssIcon", {
		fg = c.css_icon,
	})

	vim.api.nvim_set_hl(0, "TomlIcon", {
		fg = c.toml_icon,
	})

	vim.api.nvim_set_hl(0, "SnacksPicker", {
		fg = c.snacks_picker,
	})

	vim.api.nvim_set_hl(0, "Directory", {
		fg = c.snacks_picker_dir,
	})

	vim.api.nvim_set_hl(0, "SnacksPickerFile", {
		fg = c.snacks_picker_file,
	})

	vim.api.nvim_set_hl(0, "DiagnosticWarn", {
		fg = c.diagnostic_warn,
	})

	vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", {
		fg = c.snacks_picker_git_status_untracked,
	})

	vim.api.nvim_set_hl(0, "DockerIcon", {
		fg = c.docker_icon,
	})

	vim.api.nvim_set_hl(0, "XmlIcon", {
		fg = c.xml_icon,
	})

	vim.api.nvim_set_hl(0, "SvgIcon", {
		fg = c.svg_icon,
	})

	vim.api.nvim_set_hl(0, "JsonIcon", {
		fg = c.json_icon,
	})

	vim.api.nvim_set_hl(0, "NginxIcon", {
		fg = c.nginx_icon,
	})
end

-- Apply immediately
apply()

-- Reapply whenever the colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = apply,
})

return c
