-- Eclipse Darker with Darcula as Basetheme after the RR theme
-- Converted from the Eclipse color theme exported on 2025-09-28.
-- Designed for modern Neovim with Treesitter and LSP semantic highlighting.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

local function hl(name, spec)
	vim.api.nvim_set_hl(0, name, spec)
end

vim.g.colors_name = "darcula-eclipse-darker"

local c = {
	bg = "#2B2D30",
	current_line = "#2B2D30",
	fg = "#cccccc",
	line_number = "#454B4E",
	selection_bg = "#303849",
	selection_fg = "#A9BBBB",

	search = "#1B6291",
	find_scope = "#1e789b",
	bracket = "#F9FAF4",
	search_result = "#5E5E5E",

	debug = "#5A5A5A",
	error = "#E11E46",
	muted = "#808080",

	doc_link = "#a99c8c",
	doc_tag = "#9a8c7c",
	keyword = "#cc6c1d",
	operator = "#e6e6fa",

	number = "#6897bb",
	string = "#17c6a3",

	argument = "#79abff",
	constant = "#9876AA",
	field = "#66e1f8",
	inherited_field = "#8f8fbf",
	local_variable = "#a9b7c6",
	static_field = "#6da1ab",

	rust_selfType = "#cc6c1d",
	rust_self = "#d98eb3",

	abstract_method = "#80f6a7",
	free_function_decl = "#1eb540",
	free_function_call = "#ffc66d",
	method_decl = "#1eb540",
	method_call = "#ffc66d",
	trait_method_decl = "#ffc66d",
	trait_function_decl = "#96ec3f",

	class = "#86985D",
	enum = "#86985D",
	enum_member = "#6da1ab",
	interface = "#8d91dc",
	macro = "#4eade5",
	derive_macro = "#bbb529",
	annotation = "#a0a0a0",
	annotation_key = "#eb4b64",
	template_argument = "#b166da",
	template_parameter = "#bfa4a4",
	proc_macro = "#a0a0a0",
}

-- Core UI
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("EndOfBuffer", { fg = c.bg, bg = c.bg })

hl("CursorLine", { bg = c.current_line })
hl("CursorLineNr", { fg = c.fg, bg = c.current_line })
hl("LineNr", { fg = c.line_number, bg = c.bg })

hl("Visual", { fg = c.selection_fg, bg = c.selection_bg })
hl("VisualNOS", { fg = c.selection_fg, bg = c.selection_bg })

hl("Search", { fg = c.fg, bg = c.search })
hl("IncSearch", { fg = c.fg, bg = c.search })
hl("CurSearch", { fg = c.fg, bg = c.search })
hl("MatchParen", { fg = c.bracket, bold = true })

hl("Whitespace", { fg = c.line_number })
hl("NonText", { fg = c.line_number })

-- Float
hl("NormalFloat", {
	fg = "#cdd6f4",
	bg = "#181825",
})

hl("FloatBorder", {
	fg = "#89b4fa",
	bg = "#181825",
})

hl("FloatTitle", {
	fg = "#f9e2af",
	bg = "#181825",
	bold = true,
})

-- Status / diagnostics
hl("Error", { fg = c.error })
hl("ErrorMsg", { fg = c.error })
hl("DiagnosticError", { fg = c.error })
hl("DiagnosticWarn", { fg = c.doc_tag })
hl("DiagnosticInfo", { fg = c.find_scope })
hl("DiagnosticHint", { fg = c.inherited_field })

hl("DiagnosticUnderlineError", { undercurl = true })
hl("DiagnosticDeprecated", { fg = c.muted, strikethrough = true })
hl("Comment", { fg = c.muted })
hl("Todo", { fg = c.doc_tag, bold = true })

hl("DiagnosticError", { fg = "#f38ba8" })
hl("DiagnosticWarn", { fg = "#f9e2af" })
hl("DiagnosticInfo", { fg = "#89b4fa" })
hl("DiagnosticHint", { fg = "#a6e3a1" })

hl("DiagnosticVirtualTextError", {
	fg = "#f38ba8",
	bg = "#2a1f2d",
})

hl("DiagnosticVirtualTextWarn", {
	fg = "#f9e2af",
	bg = "#2a271c",
})
-- Traditional Vim syntax groups
hl("Keyword", { fg = c.keyword, bold = true })
hl("Statement", { fg = c.keyword, bold = true })
hl("Conditional", { fg = c.keyword, bold = true })
hl("Repeat", { fg = c.keyword, bold = true })
hl("Label", { fg = c.keyword, bold = true })
hl("Exception", { fg = c.keyword, bold = true })

hl("Operator", { fg = c.operator })
hl("rustSigil", { fg = c.local_variable })
hl("rustStorage", { fg = c.keyword, bold = true })
hl("Delimiter", { fg = c.bracket })
hl("String", { fg = c.string })
hl("Character", { fg = c.string })
hl("Number", { fg = c.number })
hl("Float", { fg = c.number })
hl("rustBoolean", { fg = c.keyword })
hl("rustConst", { fg = c.constant, italic = true, bold = true })
hl("rustDerive", { fg = c.method_decl })
hl("rustDeriveTrait", { fg = c.interface })
hl("rustSelf", { fg = c.rust_self })
hl("rustQuestionMark", { fg = c.keyword, bold = true })

hl("Function", { fg = c.free_function_decl })
hl("Method", { fg = c.method_call })
hl("Type", { fg = c.class })
hl("Structure", { fg = c.class })
hl("Constant", { fg = c.constant, bold = true, italic = true })
hl("Identifier", { fg = c.local_variable })
hl("Special", { fg = c.annotation })
hl("Tag", { fg = c.find_scope })
hl("Attribute", { fg = c.annotation_key })

hl("Underlined", { fg = c.doc_link, underline = true })

-- Treesitter captures
hl("@comment", { link = "Comment" })
hl("@comment.documentation", { fg = c.muted })
hl("@comment.todo", { fg = c.doc_tag, bold = true })

hl("@keyword.function", { fg = c.keyword, bold = true })
hl("@keyword.operator", { fg = c.keyword, bold = true })
hl("@keyword.return", { fg = c.keyword, bold = true })
hl("@operator", { fg = c.operator })

hl("@string", { fg = c.string })
hl("@string.escape", { fg = c.doc_link })
hl("@string.special", { fg = c.doc_link })
hl("@number", { fg = c.number })
hl("@boolean", { fg = c.number })
hl("@boolean.rust", { fg = c.keyword, bold = true })

hl("@variable", { fg = c.local_variable })
hl("@variable.builtin", { fg = c.constant, bold = true, italic = true })
hl("@variable.parameter", { fg = c.argument })
hl("@variable.parameter.builtin", { fg = c.argument })
hl("@constant", { fg = c.constant, bold = true, italic = true })
hl("@constant.rust", { fg = c.constant, italic = true })
hl("@constant.builtin", { fg = c.constant, bold = true, italic = true })
hl("@constant.builtin.rust", { fg = c.enum_member, italic = true })
hl("@field", { fg = c.field })
hl("@property", { fg = c.field })

hl("@function", { fg = c.free_function_decl })
hl("@function.call", { fg = c.free_function_call })
hl("@function.rust", { fg = c.free_function_decl })
hl("@function.call.rust", { fg = c.free_function_call })

hl("@function.method", { fg = c.method_decl, italic = true })
hl("@function.method.call", { fg = c.method_call, italic = true })
hl("@function.builtin", { fg = c.method_decl })
hl("@function.macro.rust", { fg = c.macro })
hl("@method.call", { fg = c.method_call, italic = true })

hl("@type", { fg = c.class })
hl("@type.builtin", { fg = c.interface })
hl("@type.definition", { fg = c.class })
hl("@type.qualifier", { fg = c.interface })
hl("@type.rust", { fg = c.class })

hl("@namespace", { fg = c.class })
hl("@namespace.rust", { fg = c.local_variable })

hl("@attribute", { fg = c.annotation, italic = true })
hl("@attribute.builtin", { fg = c.annotation, italic = true })
hl("@tag", { fg = c.find_scope })
hl("@tag.attribute", { fg = c.annotation_key })
hl("@tag.delimiter", { fg = c.bracket })

hl("@punctuation.bracket", { fg = c.bracket })
hl("@punctuation.delimiter", { fg = c.bracket })
hl("@punctuation.special", { fg = c.bracket })

hl("@label", { fg = c.keyword })

-- LSP semantic tokens
hl("@lsp.type.parameter", { fg = c.argument })
hl("@lsp.type.variable", { fg = c.local_variable })
hl("@lsp.type.property", { fg = c.field })
hl("@lsp.type.field", { fg = c.field })
hl("@lsp.type.enumMember", { fg = c.enum_member, italic = true })
hl("@lsp.type.enum", { fg = c.enum })
hl("@lsp.type.class", { fg = c.class })
hl("@lsp.type.interface", { fg = c.interface })
hl("@lsp.type.type", { fg = c.keyword })
hl("@lsp.type.function", { fg = c.free_function_decl })
hl("@lsp.type.method", { fg = c.method_decl })
hl("@lsp.type.decorator", { fg = c.proc_macro, italic = true })
hl("@lsp.type.namespace", { fg = c.local_variable })

hl("@lsp.type.selfKeyword.rust", { fg = c.rust_self, italic = false })
hl("@lsp.type.selfTypeKeyword.rust", { fg = c.rust_selfType, bold = true })
hl("@lsp.type.builtinType.rust", { fg = c.keyword, bold = true })
hl("@lsp.type.macro.rust", { fg = c.macro })
hl("@lsp.type.procMacro.rust", { fg = c.macro })
hl("@lsp.type.constant.rust", { fg = c.constant, italic = true })
hl("@lsp.type.method.rust", { fg = c.method_call })
hl("@lsp.type.decorator.rust", { fg = c.derive_macro })
hl("@lsp.type.attributeBracket.rust", { fg = c.derive_macro })
hl("@lsp.type.formatSpecifier.rust", { fg = c.keyword })
hl("@lsp.type.operator.rust", { fg = c.keyword })
hl("@lsp.type.deriveHelper.rust", { fg = c.derive_macro })
hl("@lsp.type.enumMember.rust", { fg = c.enum_member, italic = true })
hl("@lsp.type.derive.rust", { fg = c.free_function_decl })

hl("@lsp.typemod.typeAlias.declaration.rust", { fg = c.class, italic = true })
hl("@lsp.typemod.typeAlias.library.rust", { fg = c.class })
hl("@lsp.typemod.method.declaration.rust", { fg = c.method_call, italic = true })
hl("@lsp.typemod.function.library.rust", { fg = c.free_function_call })
hl("@lsp.typemod.method.trait.rust", { fg = c.trait_method_decl, italic = true })
hl("@lsp.typemod.builtinAttribute.attribute.rust", { fg = c.derive_macro })
hl("@lsp.typemod.generic.attribute.rust", { fg = c.derive_macro })
hl("@lsp.typemod.const.constant.rust", { fg = c.constant, italic = true })
hl("@lsp.typemod.property.declaration.rust", { fg = c.field })
hl("@lsp.typemod.variable.declaration.rust", { fg = c.local_variable })
hl("@lsp.typemod.struct.declaration.rust", { fg = c.class })
hl("@lsp.typemod.derive.defaultLibrary.rust", { fg = c.interface })
hl("@lsp.mod.trait.rust", { fg = c.trait_method_decl, italic = true })

hl("@lsp.mod.static", { fg = c.method_call, italic = true })
hl("@lsp.mod.abstract", { fg = c.abstract_method })
hl("@lsp.mod.deprecated", { fg = c.muted, strikethrough = true })
hl("@lsp.mod.crateRoot.rust", { fg = c.interface })

-- Floating windows / completion UI
hl("Pmenu", { fg = c.fg, bg = c.current_line })
hl("PmenuSel", { fg = c.selection_fg, bg = c.selection_bg })
hl("PmenuSbar", { bg = c.search_result })
hl("PmenuThumb", { bg = c.line_number })
hl("FloatBorder", { fg = c.line_number, bg = c.bg })

-- Search highlighting
hl("Substitute", { fg = c.fg, bg = c.find_scope })

-- Fold / diff
hl("Folded", { fg = c.muted, bg = c.current_line })
hl("DiffAdd", { fg = c.inherited_field, bg = c.current_line })
hl("DiffChange", { fg = c.find_scope, bg = c.current_line })
hl("DiffDelete", { fg = c.error, bg = c.current_line })
hl("DiffText", { fg = c.selection_fg, bg = c.search })

-- Common UI
hl("SignColumn", { bg = c.bg })
hl("FoldColumn", { fg = c.line_number, bg = c.bg })
hl("WinSeparator", { fg = c.line_number, bg = c.bg })
hl("StatusLine", { fg = c.fg, bg = c.current_line })
hl("StatusLineNC", { fg = c.muted, bg = c.current_line })

-- Rust / trait-specific captures
hl("@trait", { fg = c.interface })
hl("@trait.definition", { fg = c.interface })
hl("@trait.definition.rust", { fg = c.interface })
hl("@trait.function.definition", { fg = c.method_decl })
hl("@trait.method.definition", { fg = c.trait_method_decl, italic = true })
hl("@trait.impl.function.definition", { fg = c.trait_function_decl, italic = true })
hl("@trait.impl.method.definition", { fg = c.trait_method_decl, italic = true })

hl("@function.definition", { fg = c.free_function_decl })
hl("@function.definition.rust", { link = "@function.definition" })

hl("@associated.function.definition", { fg = c.trait_function_decl, italic = true })
hl("@associated.function.definition.rust", { fg = c.trait_function_decl, italic = true })

hl("@method.definition", { fg = c.method_decl })
hl("@method.definition.rust", { fg = c.method_decl, italic = false })

hl("@function.call.rust", { fg = c.free_function_call })
hl("@function.method.call.rust", { fg = c.method_call, italic = true })
hl("@method.call.rust", { fg = c.method_call, italic = true })

hl("@trait.member.definition", { fg = c.trait_method_decl })
hl("@trait.member.definition.rust", { fg = c.trait_method_decl, italic = true })
hl("@trait.member.call.rust", { fg = c.method_call, italic = true })
