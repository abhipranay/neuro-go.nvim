local M = {}

function M.setup()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "neurogo"

	-- The Abyss Black Aurora Palette
	local colors = {
		bg = "#0D161D", -- Editor Background: A deep, rich, dark teal
		ui_bg = "#111C26", -- Tool Windows: Just slightly lighter for the explorer
		border = "#1E2C3A", -- Visible separators: Adjusted to match the blue/teal hue
		ui_bg_dim = "#080E13", -- Borders & Prompts: Very dark teal-black
		ui_bg_light = "#1A2733", -- Lighter UI elements (selected items)

		-- The syntax colors remain the exact same IntelliJ mapping
		fg = "#CFD8DC",
		fg_dim = "#8A9BA8", -- Dimmed foreground for inactive elements
		keyword = "#BB719B",
		string = "#549EFF",
		variable = "#05C0A6",
		property = "#7ACEF5",
		type = "#BAA5FF",
		static = "#D193BB",
		global_var = "#73D379",
		comment = "#5E8299",
		error = "#FF6B68",
		warning = "#FFC66D",
		info = "#549EFF",
		hint = "#05C0A6",
		ok = "#73D379",

		-- Additional semantic colors
		deprecated = "#7A6A5A", -- Strikethrough for deprecated
		readonly = "#8FBCBB", -- Slightly different for readonly
		enum = "#CE9178", -- Enum members
		macro = "#DCDCAA", -- Macros/decorators
		escape = "#D7BA7D", -- String escapes
		regex = "#D16969", -- Regex patterns
		todo = "#FF8C00", -- TODO comments
		note = "#10B981", -- NOTE comments
		fixme = "#EF4444", -- FIXME comments

		-- Mode colors for statusline
		mode_normal = "#549EFF",
		mode_insert = "#73D379",
		mode_visual = "#BB719B",
		mode_replace = "#FF6B68",
		mode_command = "#FFC66D",
		mode_terminal = "#05C0A6",
	}

	local highlights = {
		-- ==========================================
		-- 1. BASE NEOVIM UI
		-- ==========================================
		Normal = { bg = colors.bg, fg = colors.fg },
		NormalNC = { bg = colors.bg, fg = colors.fg },
		LineNr = { bg = colors.bg, fg = colors.comment },
		CursorLine = { bg = colors.ui_bg },
		CursorLineNr = { bg = colors.ui_bg, fg = colors.property, bold = true },
		Search = { bg = colors.variable, fg = colors.bg },
		IncSearch = { bg = colors.warning, fg = colors.bg },
		CurSearch = { bg = colors.warning, fg = colors.bg, bold = true },
		Visual = { bg = "#254B5C" },
		VisualNOS = { bg = "#254B5C" },
		Comment = { fg = colors.comment, italic = true },
		WinSeparator = { fg = colors.border, bg = colors.bg },
		SignColumn = { bg = colors.bg },
		ColorColumn = { bg = colors.ui_bg },
		Folded = { bg = colors.ui_bg, fg = colors.comment },
		FoldColumn = { bg = colors.bg, fg = colors.comment },
		Cursor = { bg = colors.fg, fg = colors.bg },
		lCursor = { bg = colors.fg, fg = colors.bg },
		CursorIM = { bg = colors.fg, fg = colors.bg },
		TermCursor = { bg = colors.variable, fg = colors.bg },
		TermCursorNC = { bg = colors.comment, fg = colors.bg },

		-- ==========================================
		-- 1.5. CORE VIM UI & FALLBACKS
		-- ==========================================
		StatusLine = { bg = colors.ui_bg, fg = colors.fg },
		StatusLineNC = { bg = colors.bg, fg = colors.comment },
		TabLine = { bg = colors.ui_bg, fg = colors.comment },
		TabLineFill = { bg = colors.ui_bg_dim },
		TabLineSel = { bg = colors.bg, fg = colors.fg, bold = true },
		WinBar = { bg = colors.bg, fg = colors.fg },
		WinBarNC = { bg = colors.bg, fg = colors.comment },
		MsgArea = { bg = colors.bg, fg = colors.fg },
		ModeMsg = { fg = colors.string, bold = true },
		MoreMsg = { fg = colors.info },
		Question = { fg = colors.info },
		Title = { fg = colors.property, bold = true },
		Conceal = { fg = colors.comment },
		NonText = { fg = colors.comment },
		SpecialKey = { fg = colors.comment },
		Whitespace = { fg = colors.border },
		EndOfBuffer = { fg = colors.bg },
		MatchParen = { bg = colors.ui_bg_dim, fg = colors.warning, bold = true },
		Directory = { fg = colors.property },
		ErrorMsg = { fg = colors.error, bold = true },
		WarningMsg = { fg = colors.warning },
		Pmenu = { bg = colors.ui_bg, fg = colors.fg },
		PmenuSel = { bg = colors.ui_bg_light, fg = colors.fg },
		PmenuSbar = { bg = colors.ui_bg_dim },
		PmenuThumb = { bg = colors.comment },
		WildMenu = { bg = colors.ui_bg_light, fg = colors.fg },
		QuickFixLine = { bg = colors.ui_bg_light },
		Substitute = { bg = colors.error, fg = colors.bg },
		DiffAdd = { bg = "#1E3A2F" },
		DiffChange = { bg = "#2A3A4A" },
		DiffDelete = { bg = "#3A2A2A", fg = colors.error },
		DiffText = { bg = "#3A4A5A" },
		SpellBad = { sp = colors.error, undercurl = true },
		SpellCap = { sp = colors.warning, undercurl = true },
		SpellLocal = { sp = colors.info, undercurl = true },
		SpellRare = { sp = colors.hint, undercurl = true },

		-- Classic Syntax Fallbacks (For plugins that don't use Tree-sitter)
		Statement = { fg = colors.keyword },
		PreProc = { fg = colors.keyword },
		Identifier = { fg = colors.variable },
		Constant = { fg = colors.static },
		Type = { fg = colors.type },
		Special = { fg = colors.property },
		String = { fg = colors.string },
		Character = { fg = colors.string },
		Number = { fg = colors.string },
		Float = { fg = colors.string },
		Boolean = { fg = colors.keyword },
		Function = { fg = colors.property },
		Operator = { fg = colors.fg },
		Keyword = { fg = colors.keyword },
		Conditional = { fg = colors.keyword },
		Repeat = { fg = colors.keyword },
		Label = { fg = colors.keyword },
		Exception = { fg = colors.keyword },
		Include = { fg = colors.keyword },
		Define = { fg = colors.keyword },
		Macro = { fg = colors.macro },
		PreCondit = { fg = colors.keyword },
		StorageClass = { fg = colors.keyword },
		Structure = { fg = colors.type },
		Typedef = { fg = colors.type },
		Tag = { fg = colors.property },
		SpecialChar = { fg = colors.escape },
		Delimiter = { fg = colors.fg },
		SpecialComment = { fg = colors.todo, bold = true },
		Debug = { fg = colors.warning },
		Underlined = { underline = true },
		Ignore = { fg = colors.comment },
		Error = { fg = colors.error },
		Todo = { fg = colors.todo, bold = true },

		-- ==========================================
		-- 2. FLOATING WINDOWS (LSP Hover, Mason, Lazy)
		-- ==========================================
		NormalFloat = { bg = colors.ui_bg },
		FloatBorder = { bg = colors.ui_bg, fg = colors.border },
		FloatTitle = { bg = colors.ui_bg, fg = colors.property, bold = true },
		FloatFooter = { bg = colors.ui_bg, fg = colors.comment },

		-- ==========================================
		-- 3. SNACKS.NVIM (Explorer & Picker)
		-- ==========================================
		SnacksPickerNormal = { bg = colors.ui_bg, fg = colors.fg },
		SnacksPickerBorder = { bg = colors.ui_bg, fg = colors.border },
		SnacksPickerTitle = { bg = colors.ui_bg, fg = colors.property, bold = true },
		SnacksPickerToggle = { bg = colors.ui_bg, fg = colors.variable },
		SnacksPickerBadge = { bg = colors.ui_bg, fg = colors.comment },
		SnacksPickerPrompt = { bg = colors.ui_bg_dim, fg = colors.fg },
		SnacksPickerList = { bg = colors.ui_bg },
		SnacksPickerPreview = { bg = colors.bg },
		SnacksPickerDir = { fg = colors.comment },
		SnacksPickerFile = { fg = colors.fg },
		SnacksPickerMatch = { fg = colors.variable, bold = true },
		SnacksIndent = { fg = colors.border },
		SnacksExplorerNormal = { bg = colors.ui_bg, fg = colors.fg },
		SnacksExplorerBorder = { bg = colors.ui_bg, fg = colors.border },
		SnacksExplorerDir = { fg = colors.fg },

		-- ==========================================
		-- 4. WHICH-KEY
		-- ==========================================
		WhichKey = { fg = colors.property },
		WhichKeyGroup = { fg = colors.keyword },
		WhichKeyDesc = { fg = colors.string },
		WhichKeyFloat = { bg = colors.ui_bg },
		WhichKeySeparator = { fg = colors.comment },
		WhichKeyValue = { fg = colors.comment },

		-- ==========================================
		-- 5. DIAGNOSTICS (Complete Coverage)
		-- ==========================================
		-- Base diagnostics
		DiagnosticError = { fg = colors.error },
		DiagnosticWarn = { fg = colors.warning },
		DiagnosticInfo = { fg = colors.info },
		DiagnosticHint = { fg = colors.hint },
		DiagnosticOk = { fg = colors.ok },

		-- Underlines
		DiagnosticUnderlineError = { sp = colors.error, undercurl = true },
		DiagnosticUnderlineWarn = { sp = colors.warning, undercurl = true },
		DiagnosticUnderlineInfo = { sp = colors.info, undercurl = true },
		DiagnosticUnderlineHint = { sp = colors.hint, undercurl = true },
		DiagnosticUnderlineOk = { sp = colors.ok, undercurl = true },

		-- Virtual text
		DiagnosticVirtualTextError = { fg = colors.error, bg = "#2D1F1F", italic = true },
		DiagnosticVirtualTextWarn = { fg = colors.warning, bg = "#2D2A1F", italic = true },
		DiagnosticVirtualTextInfo = { fg = colors.info, bg = "#1F2A2D", italic = true },
		DiagnosticVirtualTextHint = { fg = colors.hint, bg = "#1F2D2A", italic = true },
		DiagnosticVirtualTextOk = { fg = colors.ok, bg = "#1F2D1F", italic = true },

		-- Floating windows
		DiagnosticFloatingError = { fg = colors.error },
		DiagnosticFloatingWarn = { fg = colors.warning },
		DiagnosticFloatingInfo = { fg = colors.info },
		DiagnosticFloatingHint = { fg = colors.hint },
		DiagnosticFloatingOk = { fg = colors.ok },

		-- Signs in gutter
		DiagnosticSignError = { fg = colors.error, bg = colors.bg },
		DiagnosticSignWarn = { fg = colors.warning, bg = colors.bg },
		DiagnosticSignInfo = { fg = colors.info, bg = colors.bg },
		DiagnosticSignHint = { fg = colors.hint, bg = colors.bg },
		DiagnosticSignOk = { fg = colors.ok, bg = colors.bg },

		-- Deprecated (strikethrough)
		DiagnosticDeprecated = { strikethrough = true, fg = colors.deprecated },

		-- Unnecessary (dim)
		DiagnosticUnnecessary = { fg = colors.comment, italic = true },

		-- ==========================================
		-- 6. LSP REFERENCES & CODE ACTIONS
		-- ==========================================
		LspReferenceText = { bg = colors.ui_bg_light },
		LspReferenceRead = { bg = colors.ui_bg_light },
		LspReferenceWrite = { bg = "#2A3A3A" },
		LspCodeLens = { fg = colors.comment, italic = true },
		LspCodeLensSeparator = { fg = colors.border },
		LspSignatureActiveParameter = { fg = colors.warning, bold = true, underline = true },
		LspInlayHint = { fg = colors.comment, bg = colors.ui_bg_dim, italic = true },

		-- ==========================================
		-- 7. TREE-SITTER (Complete Coverage)
		-- ==========================================
		-- Identifiers
		["@variable"] = { fg = colors.variable },
		["@variable.builtin"] = { fg = colors.global_var },
		["@variable.parameter"] = { fg = colors.type },
		["@variable.parameter.builtin"] = { fg = colors.type },
		["@variable.member"] = { fg = colors.property },

		-- Constants
		["@constant"] = { fg = colors.static },
		["@constant.builtin"] = { fg = colors.static, bold = true },
		["@constant.macro"] = { fg = colors.macro },

		-- Modules
		["@module"] = { fg = colors.fg },
		["@module.builtin"] = { fg = colors.fg },
		["@label"] = { fg = colors.keyword },

		-- Strings
		["@string"] = { fg = colors.string },
		["@string.documentation"] = { fg = colors.comment },
		["@string.regexp"] = { fg = colors.regex },
		["@string.escape"] = { fg = colors.escape },
		["@string.special"] = { fg = colors.escape },
		["@string.special.symbol"] = { fg = colors.static },
		["@string.special.path"] = { fg = colors.string },
		["@string.special.url"] = { fg = colors.string, underline = true },

		-- Characters
		["@character"] = { fg = colors.string },
		["@character.special"] = { fg = colors.escape },

		-- Booleans & Numbers
		["@boolean"] = { fg = colors.keyword },
		["@number"] = { fg = colors.string },
		["@number.float"] = { fg = colors.string },

		-- Types
		["@type"] = { fg = colors.type },
		["@type.builtin"] = { fg = colors.type },
		["@type.definition"] = { fg = colors.type },
		["@type.qualifier"] = { fg = colors.keyword },

		-- Attributes & Properties
		["@attribute"] = { fg = colors.macro },
		["@attribute.builtin"] = { fg = colors.macro },
		["@property"] = { fg = colors.property },

		-- Functions
		["@function"] = { fg = colors.property },
		["@function.builtin"] = { fg = colors.property, italic = true },
		["@function.call"] = { fg = colors.property },
		["@function.macro"] = { fg = colors.macro },
		["@function.method"] = { fg = colors.property },
		["@function.method.call"] = { fg = colors.property },

		-- Constructors
		["@constructor"] = { fg = colors.type },

		-- Operators
		["@operator"] = { fg = colors.fg },

		-- Keywords
		["@keyword"] = { fg = colors.keyword },
		["@keyword.coroutine"] = { fg = colors.keyword, italic = true },
		["@keyword.function"] = { fg = colors.keyword },
		["@keyword.operator"] = { fg = colors.keyword },
		["@keyword.import"] = { fg = colors.keyword },
		["@keyword.type"] = { fg = colors.keyword },
		["@keyword.modifier"] = { fg = colors.keyword },
		["@keyword.repeat"] = { fg = colors.keyword },
		["@keyword.return"] = { fg = colors.keyword },
		["@keyword.debug"] = { fg = colors.warning },
		["@keyword.exception"] = { fg = colors.keyword },
		["@keyword.conditional"] = { fg = colors.keyword },
		["@keyword.conditional.ternary"] = { fg = colors.keyword },
		["@keyword.directive"] = { fg = colors.keyword },
		["@keyword.directive.define"] = { fg = colors.keyword },

		-- Punctuation
		["@punctuation.bracket"] = { fg = colors.fg },
		["@punctuation.delimiter"] = { fg = colors.fg },
		["@punctuation.special"] = { fg = colors.keyword },

		-- Comments
		["@comment"] = { fg = colors.comment, italic = true },
		["@comment.documentation"] = { fg = colors.comment, italic = true },
		["@comment.error"] = { fg = colors.error, bold = true },
		["@comment.warning"] = { fg = colors.warning, bold = true },
		["@comment.todo"] = { fg = colors.todo, bold = true },
		["@comment.note"] = { fg = colors.note, bold = true },

		-- Markup (Markdown, etc.)
		["@markup"] = { fg = colors.fg },
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { fg = colors.property, bold = true },
		["@markup.heading.1"] = { fg = colors.property, bold = true },
		["@markup.heading.2"] = { fg = colors.property, bold = true },
		["@markup.heading.3"] = { fg = colors.property, bold = true },
		["@markup.heading.4"] = { fg = colors.property },
		["@markup.heading.5"] = { fg = colors.property },
		["@markup.heading.6"] = { fg = colors.property },
		["@markup.quote"] = { fg = colors.comment, italic = true },
		["@markup.math"] = { fg = colors.string },
		["@markup.link"] = { fg = colors.string, underline = true },
		["@markup.link.label"] = { fg = colors.property },
		["@markup.link.url"] = { fg = colors.string, underline = true },
		["@markup.raw"] = { fg = colors.string },
		["@markup.raw.block"] = { fg = colors.string },
		["@markup.list"] = { fg = colors.keyword },
		["@markup.list.checked"] = { fg = colors.ok },
		["@markup.list.unchecked"] = { fg = colors.comment },

		-- Diff
		["@diff.plus"] = { fg = colors.ok },
		["@diff.minus"] = { fg = colors.error },
		["@diff.delta"] = { fg = colors.info },

		-- Tags (HTML, JSX)
		["@tag"] = { fg = colors.keyword },
		["@tag.builtin"] = { fg = colors.keyword },
		["@tag.attribute"] = { fg = colors.property },
		["@tag.delimiter"] = { fg = colors.fg },

		-- ==========================================
		-- 8. LSP SEMANTIC TOKENS (Complete)
		-- ==========================================
		-- Types
		["@lsp.type.namespace"] = { fg = colors.fg },
		["@lsp.type.type"] = { fg = colors.type },
		["@lsp.type.class"] = { fg = colors.type },
		["@lsp.type.enum"] = { fg = colors.type },
		["@lsp.type.interface"] = { fg = colors.type, italic = true },
		["@lsp.type.struct"] = { fg = colors.type },
		["@lsp.type.typeParameter"] = { fg = colors.type, italic = true },
		["@lsp.type.parameter"] = { fg = colors.type },
		["@lsp.type.variable"] = { fg = colors.variable },
		["@lsp.type.property"] = { fg = colors.property },
		["@lsp.type.enumMember"] = { fg = colors.enum },
		["@lsp.type.function"] = { fg = colors.property },
		["@lsp.type.method"] = { fg = colors.property },
		["@lsp.type.macro"] = { fg = colors.macro },
		["@lsp.type.decorator"] = { fg = colors.macro },
		["@lsp.type.comment"] = { fg = colors.comment, italic = true },
		["@lsp.type.string"] = { fg = colors.string },
		["@lsp.type.keyword"] = { fg = colors.keyword },
		["@lsp.type.number"] = { fg = colors.string },
		["@lsp.type.regexp"] = { fg = colors.regex },
		["@lsp.type.operator"] = { fg = colors.fg },
		["@lsp.type.event"] = { fg = colors.property },
		["@lsp.type.modifier"] = { fg = colors.keyword },

		-- Modifiers
		["@lsp.mod.declaration"] = {},
		["@lsp.mod.definition"] = {},
		["@lsp.mod.readonly"] = { fg = colors.readonly },
		["@lsp.mod.static"] = { fg = colors.static },
		["@lsp.mod.deprecated"] = { strikethrough = true, fg = colors.deprecated },
		["@lsp.mod.abstract"] = { italic = true },
		["@lsp.mod.async"] = { italic = true },
		["@lsp.mod.modification"] = {},
		["@lsp.mod.documentation"] = { italic = true },
		["@lsp.mod.defaultLibrary"] = { italic = true },

		-- Type + Modifier combinations (common patterns)
		["@lsp.typemod.function.declaration"] = { fg = colors.property },
		["@lsp.typemod.function.definition"] = { fg = colors.property },
		["@lsp.typemod.function.readonly"] = { fg = colors.property },
		["@lsp.typemod.variable.readonly"] = { fg = colors.readonly },
		["@lsp.typemod.variable.static"] = { fg = colors.static },
		["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.global_var },
		["@lsp.typemod.variable.global"] = { fg = colors.global_var },
		["@lsp.typemod.property.readonly"] = { fg = colors.readonly },
		["@lsp.typemod.class.declaration"] = { fg = colors.type },
		["@lsp.typemod.class.defaultLibrary"] = { fg = colors.type, italic = true },
		["@lsp.typemod.type.defaultLibrary"] = { fg = colors.type },
		["@lsp.typemod.method.defaultLibrary"] = { fg = colors.property, italic = true },
		["@lsp.typemod.function.defaultLibrary"] = { fg = colors.property, italic = true },
		["@lsp.typemod.parameter.declaration"] = { fg = colors.type },

		-- ==========================================
		-- 9. BUFFERLINE.NVIM
		-- ==========================================
		BufferLineFill = { bg = colors.ui_bg_dim },
		BufferLineBackground = { bg = colors.ui_bg_dim, fg = colors.comment },
		BufferLineBuffer = { bg = colors.ui_bg_dim, fg = colors.comment },
		BufferLineBufferVisible = { bg = colors.ui_bg, fg = colors.fg_dim },
		BufferLineBufferSelected = { bg = colors.bg, fg = colors.fg, bold = true },
		BufferLineTab = { bg = colors.ui_bg_dim, fg = colors.comment },
		BufferLineTabSelected = { bg = colors.bg, fg = colors.fg, bold = true },
		BufferLineTabSeparator = { bg = colors.ui_bg_dim, fg = colors.ui_bg_dim },
		BufferLineTabSeparatorSelected = { bg = colors.bg, fg = colors.bg },
		BufferLineTabClose = { bg = colors.ui_bg_dim, fg = colors.comment },
		BufferLineCloseButton = { bg = colors.ui_bg_dim, fg = colors.comment },
		BufferLineCloseButtonVisible = { bg = colors.ui_bg, fg = colors.fg_dim },
		BufferLineCloseButtonSelected = { bg = colors.bg, fg = colors.error },
		BufferLineModified = { bg = colors.ui_bg_dim, fg = colors.warning },
		BufferLineModifiedVisible = { bg = colors.ui_bg, fg = colors.warning },
		BufferLineModifiedSelected = { bg = colors.bg, fg = colors.warning },
		BufferLineDuplicate = { bg = colors.ui_bg_dim, fg = colors.comment, italic = true },
		BufferLineDuplicateVisible = { bg = colors.ui_bg, fg = colors.fg_dim, italic = true },
		BufferLineDuplicateSelected = { bg = colors.bg, fg = colors.fg, italic = true },
		BufferLineSeparator = { bg = colors.ui_bg_dim, fg = colors.ui_bg_dim },
		BufferLineSeparatorVisible = { bg = colors.ui_bg, fg = colors.ui_bg },
		BufferLineSeparatorSelected = { bg = colors.bg, fg = colors.ui_bg_dim },
		BufferLineIndicatorVisible = { bg = colors.ui_bg, fg = colors.ui_bg },
		BufferLineIndicatorSelected = { bg = colors.bg, fg = colors.variable },
		BufferLineOffsetSeparator = { bg = colors.ui_bg, fg = colors.border },
		BufferLineTruncMarker = { bg = colors.ui_bg_dim, fg = colors.comment },
		-- Diagnostics in bufferline
		BufferLineError = { bg = colors.ui_bg_dim, fg = colors.error },
		BufferLineErrorVisible = { bg = colors.ui_bg, fg = colors.error },
		BufferLineErrorSelected = { bg = colors.bg, fg = colors.error },
		BufferLineErrorDiagnostic = { bg = colors.ui_bg_dim, fg = colors.error },
		BufferLineErrorDiagnosticVisible = { bg = colors.ui_bg, fg = colors.error },
		BufferLineErrorDiagnosticSelected = { bg = colors.bg, fg = colors.error },
		BufferLineWarning = { bg = colors.ui_bg_dim, fg = colors.warning },
		BufferLineWarningVisible = { bg = colors.ui_bg, fg = colors.warning },
		BufferLineWarningSelected = { bg = colors.bg, fg = colors.warning },
		BufferLineWarningDiagnostic = { bg = colors.ui_bg_dim, fg = colors.warning },
		BufferLineWarningDiagnosticVisible = { bg = colors.ui_bg, fg = colors.warning },
		BufferLineWarningDiagnosticSelected = { bg = colors.bg, fg = colors.warning },
		BufferLineInfo = { bg = colors.ui_bg_dim, fg = colors.info },
		BufferLineInfoVisible = { bg = colors.ui_bg, fg = colors.info },
		BufferLineInfoSelected = { bg = colors.bg, fg = colors.info },
		BufferLineInfoDiagnostic = { bg = colors.ui_bg_dim, fg = colors.info },
		BufferLineInfoDiagnosticVisible = { bg = colors.ui_bg, fg = colors.info },
		BufferLineInfoDiagnosticSelected = { bg = colors.bg, fg = colors.info },
		BufferLineHint = { bg = colors.ui_bg_dim, fg = colors.hint },
		BufferLineHintVisible = { bg = colors.ui_bg, fg = colors.hint },
		BufferLineHintSelected = { bg = colors.bg, fg = colors.hint },
		BufferLineHintDiagnostic = { bg = colors.ui_bg_dim, fg = colors.hint },
		BufferLineHintDiagnosticVisible = { bg = colors.ui_bg, fg = colors.hint },
		BufferLineHintDiagnosticSelected = { bg = colors.bg, fg = colors.hint },
		BufferLineNumbers = { bg = colors.ui_bg_dim, fg = colors.comment },
		BufferLineNumbersVisible = { bg = colors.ui_bg, fg = colors.fg_dim },
		BufferLineNumbersSelected = { bg = colors.bg, fg = colors.fg },
		BufferLinePick = { bg = colors.ui_bg_dim, fg = colors.error, bold = true },
		BufferLinePickVisible = { bg = colors.ui_bg, fg = colors.error, bold = true },
		BufferLinePickSelected = { bg = colors.bg, fg = colors.error, bold = true },

		-- ==========================================
		-- 10. LUALINE.NVIM
		-- ==========================================
		-- Mode highlights (used by lualine themes)
		lualine_a_normal = { bg = colors.mode_normal, fg = colors.bg, bold = true },
		lualine_b_normal = { bg = colors.ui_bg_light, fg = colors.fg },
		lualine_c_normal = { bg = colors.ui_bg, fg = colors.fg },
		lualine_a_insert = { bg = colors.mode_insert, fg = colors.bg, bold = true },
		lualine_b_insert = { bg = colors.ui_bg_light, fg = colors.fg },
		lualine_c_insert = { bg = colors.ui_bg, fg = colors.fg },
		lualine_a_visual = { bg = colors.mode_visual, fg = colors.bg, bold = true },
		lualine_b_visual = { bg = colors.ui_bg_light, fg = colors.fg },
		lualine_c_visual = { bg = colors.ui_bg, fg = colors.fg },
		lualine_a_replace = { bg = colors.mode_replace, fg = colors.bg, bold = true },
		lualine_b_replace = { bg = colors.ui_bg_light, fg = colors.fg },
		lualine_c_replace = { bg = colors.ui_bg, fg = colors.fg },
		lualine_a_command = { bg = colors.mode_command, fg = colors.bg, bold = true },
		lualine_b_command = { bg = colors.ui_bg_light, fg = colors.fg },
		lualine_c_command = { bg = colors.ui_bg, fg = colors.fg },
		lualine_a_terminal = { bg = colors.mode_terminal, fg = colors.bg, bold = true },
		lualine_b_terminal = { bg = colors.ui_bg_light, fg = colors.fg },
		lualine_c_terminal = { bg = colors.ui_bg, fg = colors.fg },
		lualine_a_inactive = { bg = colors.ui_bg, fg = colors.comment },
		lualine_b_inactive = { bg = colors.ui_bg, fg = colors.comment },
		lualine_c_inactive = { bg = colors.ui_bg, fg = colors.comment },
		-- Lualine component-specific highlights
		lualine_x_filetype_DevIconLua_normal = { fg = colors.string, bg = colors.ui_bg },

		-- ==========================================
		-- 11. INDENT-BLANKLINE.NVIM
		-- ==========================================
		IblIndent = { fg = colors.border },
		IblWhitespace = { fg = colors.border },
		IblScope = { fg = colors.comment },
		IndentBlanklineChar = { fg = colors.border },
		IndentBlanklineSpaceChar = { fg = colors.border },
		IndentBlanklineSpaceCharBlankline = { fg = colors.border },
		IndentBlanklineContextChar = { fg = colors.comment },
		IndentBlanklineContextStart = { sp = colors.comment, underline = true },

		-- ==========================================
		-- 12. NVIM-NAVIC (Breadcrumbs)
		-- ==========================================
		NavicText = { fg = colors.fg },
		NavicSeparator = { fg = colors.comment },
		NavicIconsFile = { fg = colors.fg },
		NavicIconsModule = { fg = colors.keyword },
		NavicIconsNamespace = { fg = colors.fg },
		NavicIconsPackage = { fg = colors.keyword },
		NavicIconsClass = { fg = colors.type },
		NavicIconsMethod = { fg = colors.property },
		NavicIconsProperty = { fg = colors.property },
		NavicIconsField = { fg = colors.property },
		NavicIconsConstructor = { fg = colors.type },
		NavicIconsEnum = { fg = colors.type },
		NavicIconsInterface = { fg = colors.type },
		NavicIconsFunction = { fg = colors.property },
		NavicIconsVariable = { fg = colors.variable },
		NavicIconsConstant = { fg = colors.static },
		NavicIconsString = { fg = colors.string },
		NavicIconsNumber = { fg = colors.string },
		NavicIconsBoolean = { fg = colors.keyword },
		NavicIconsArray = { fg = colors.fg },
		NavicIconsObject = { fg = colors.type },
		NavicIconsKey = { fg = colors.keyword },
		NavicIconsNull = { fg = colors.keyword },
		NavicIconsEnumMember = { fg = colors.enum },
		NavicIconsStruct = { fg = colors.type },
		NavicIconsEvent = { fg = colors.property },
		NavicIconsOperator = { fg = colors.fg },
		NavicIconsTypeParameter = { fg = colors.type },

		-- ==========================================
		-- 13. NVIM-CMP (Completion)
		-- ==========================================
		CmpItemAbbr = { fg = colors.fg },
		CmpItemAbbrDeprecated = { fg = colors.deprecated, strikethrough = true },
		CmpItemAbbrMatch = { fg = colors.variable, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = colors.variable, bold = true },
		CmpItemKind = { fg = colors.property },
		CmpItemKindClass = { fg = colors.type },
		CmpItemKindColor = { fg = colors.string },
		CmpItemKindConstant = { fg = colors.static },
		CmpItemKindConstructor = { fg = colors.type },
		CmpItemKindCopilot = { fg = colors.hint },
		CmpItemKindEnum = { fg = colors.type },
		CmpItemKindEnumMember = { fg = colors.enum },
		CmpItemKindEvent = { fg = colors.property },
		CmpItemKindField = { fg = colors.property },
		CmpItemKindFile = { fg = colors.fg },
		CmpItemKindFolder = { fg = colors.property },
		CmpItemKindFunction = { fg = colors.property },
		CmpItemKindInterface = { fg = colors.type },
		CmpItemKindKeyword = { fg = colors.keyword },
		CmpItemKindMethod = { fg = colors.property },
		CmpItemKindModule = { fg = colors.keyword },
		CmpItemKindOperator = { fg = colors.fg },
		CmpItemKindProperty = { fg = colors.property },
		CmpItemKindReference = { fg = colors.variable },
		CmpItemKindSnippet = { fg = colors.warning },
		CmpItemKindStruct = { fg = colors.type },
		CmpItemKindText = { fg = colors.fg },
		CmpItemKindTypeParameter = { fg = colors.type },
		CmpItemKindUnit = { fg = colors.string },
		CmpItemKindValue = { fg = colors.string },
		CmpItemKindVariable = { fg = colors.variable },
		CmpItemMenu = { fg = colors.comment },

		-- ==========================================
		-- 14. TELESCOPE.NVIM
		-- ==========================================
		TelescopeNormal = { bg = colors.ui_bg, fg = colors.fg },
		TelescopeBorder = { bg = colors.ui_bg, fg = colors.border },
		TelescopeTitle = { fg = colors.property, bold = true },
		TelescopePromptNormal = { bg = colors.ui_bg_dim, fg = colors.fg },
		TelescopePromptBorder = { bg = colors.ui_bg_dim, fg = colors.border },
		TelescopePromptTitle = { fg = colors.property, bold = true },
		TelescopePromptPrefix = { fg = colors.variable },
		TelescopePromptCounter = { fg = colors.comment },
		TelescopeResultsNormal = { bg = colors.ui_bg, fg = colors.fg },
		TelescopeResultsBorder = { bg = colors.ui_bg, fg = colors.border },
		TelescopeResultsTitle = { fg = colors.property },
		TelescopePreviewNormal = { bg = colors.bg, fg = colors.fg },
		TelescopePreviewBorder = { bg = colors.bg, fg = colors.border },
		TelescopePreviewTitle = { fg = colors.property },
		TelescopeSelection = { bg = colors.ui_bg_light, fg = colors.fg },
		TelescopeSelectionCaret = { fg = colors.variable },
		TelescopeMultiSelection = { bg = colors.ui_bg_light, fg = colors.fg },
		TelescopeMultiIcon = { fg = colors.variable },
		TelescopeMatching = { fg = colors.variable, bold = true },

		-- ==========================================
		-- 15. GITSIGNS.NVIM
		-- ==========================================
		GitSignsAdd = { fg = colors.ok },
		GitSignsChange = { fg = colors.info },
		GitSignsDelete = { fg = colors.error },
		GitSignsAddNr = { fg = colors.ok },
		GitSignsChangeNr = { fg = colors.info },
		GitSignsDeleteNr = { fg = colors.error },
		GitSignsAddLn = { bg = "#1E3A2F" },
		GitSignsChangeLn = { bg = "#2A3A4A" },
		GitSignsDeleteLn = { bg = "#3A2A2A" },
		GitSignsAddInline = { bg = "#2E4A3F" },
		GitSignsChangeInline = { bg = "#3A4A5A" },
		GitSignsDeleteInline = { bg = "#4A3A3A" },
		GitSignsCurrentLineBlame = { fg = colors.comment, italic = true },

		-- ==========================================
		-- 16. NEO-TREE.NVIM
		-- ==========================================
		NeoTreeNormal = { bg = colors.ui_bg, fg = colors.fg },
		NeoTreeNormalNC = { bg = colors.ui_bg, fg = colors.fg },
		NeoTreeVertSplit = { bg = colors.ui_bg, fg = colors.border },
		NeoTreeWinSeparator = { bg = colors.ui_bg, fg = colors.border },
		NeoTreeEndOfBuffer = { bg = colors.ui_bg, fg = colors.ui_bg },
		NeoTreeRootName = { fg = colors.property, bold = true },
		NeoTreeGitAdded = { fg = colors.ok },
		NeoTreeGitConflict = { fg = colors.error },
		NeoTreeGitDeleted = { fg = colors.error },
		NeoTreeGitIgnored = { fg = colors.comment },
		NeoTreeGitModified = { fg = colors.warning },
		NeoTreeGitUnstaged = { fg = colors.warning },
		NeoTreeGitUntracked = { fg = colors.hint },
		NeoTreeGitStaged = { fg = colors.ok },
		NeoTreeIndentMarker = { fg = colors.border },
		NeoTreeSymbolicLinkTarget = { fg = colors.hint },
		NeoTreeDirectoryIcon = { fg = colors.property },
		NeoTreeDirectoryName = { fg = colors.fg },
		NeoTreeFileName = { fg = colors.fg },
		NeoTreeFileIcon = { fg = colors.fg },
		NeoTreeModified = { fg = colors.warning },
		NeoTreeFloatBorder = { bg = colors.ui_bg, fg = colors.border },
		NeoTreeFloatTitle = { bg = colors.ui_bg, fg = colors.property, bold = true },
		NeoTreeCursorLine = { bg = colors.ui_bg_light },

		-- ==========================================
		-- 17. LAZY.NVIM
		-- ==========================================
		LazyNormal = { bg = colors.ui_bg, fg = colors.fg },
		LazyButton = { bg = colors.ui_bg_dim, fg = colors.fg },
		LazyButtonActive = { bg = colors.ui_bg_light, fg = colors.fg, bold = true },
		LazyComment = { fg = colors.comment },
		LazyCommit = { fg = colors.comment },
		LazyCommitIssue = { fg = colors.string },
		LazyCommitScope = { fg = colors.property },
		LazyCommitType = { fg = colors.keyword },
		LazyDir = { fg = colors.property },
		LazyH1 = { bg = colors.variable, fg = colors.bg, bold = true },
		LazyH2 = { fg = colors.property, bold = true },
		LazyLocal = { fg = colors.warning },
		LazyProgressDone = { fg = colors.ok },
		LazyProgressTodo = { fg = colors.comment },
		LazyProp = { fg = colors.comment },
		LazyReasonCmd = { fg = colors.keyword },
		LazyReasonEvent = { fg = colors.property },
		LazyReasonFt = { fg = colors.string },
		LazyReasonImport = { fg = colors.fg },
		LazyReasonKeys = { fg = colors.variable },
		LazyReasonPlugin = { fg = colors.type },
		LazyReasonRuntime = { fg = colors.warning },
		LazyReasonSource = { fg = colors.hint },
		LazyReasonStart = { fg = colors.ok },
		LazySpecial = { fg = colors.info },
		LazyTaskError = { fg = colors.error },
		LazyTaskOutput = { fg = colors.fg },
		LazyUrl = { fg = colors.string, underline = true },
		LazyValue = { fg = colors.string },

		-- ==========================================
		-- 18. MASON.NVIM
		-- ==========================================
		MasonNormal = { bg = colors.ui_bg, fg = colors.fg },
		MasonHeader = { bg = colors.variable, fg = colors.bg, bold = true },
		MasonHeaderSecondary = { bg = colors.keyword, fg = colors.bg, bold = true },
		MasonHighlight = { fg = colors.variable },
		MasonHighlightBlock = { bg = colors.variable, fg = colors.bg },
		MasonHighlightBlockBold = { bg = colors.variable, fg = colors.bg, bold = true },
		MasonHighlightBlockBoldSecondary = { bg = colors.keyword, fg = colors.bg, bold = true },
		MasonHighlightBlockSecondary = { bg = colors.keyword, fg = colors.bg },
		MasonHighlightSecondary = { fg = colors.keyword },
		MasonMuted = { fg = colors.comment },
		MasonMutedBlock = { bg = colors.ui_bg_dim, fg = colors.comment },
		MasonMutedBlockBold = { bg = colors.ui_bg_dim, fg = colors.comment, bold = true },

		-- ==========================================
		-- 19. NOICE.NVIM
		-- ==========================================
		NoiceVirtualText = { fg = colors.comment, italic = true },
		NoiceCmdline = { fg = colors.fg },
		NoiceCmdlineIcon = { fg = colors.variable },
		NoiceCmdlineIconSearch = { fg = colors.warning },
		NoiceCmdlinePopup = { bg = colors.ui_bg },
		NoiceCmdlinePopupBorder = { fg = colors.border },
		NoiceCmdlinePopupTitle = { fg = colors.property },
		NoiceConfirm = { bg = colors.ui_bg },
		NoiceConfirmBorder = { fg = colors.border },
		NoiceFormatConfirm = { bg = colors.ui_bg },
		NoiceFormatConfirmDefault = { bg = colors.variable, fg = colors.bg },
		NoiceMini = { bg = colors.ui_bg },
		NoicePopup = { bg = colors.ui_bg },
		NoicePopupBorder = { fg = colors.border },
		NoiceScrollbar = { bg = colors.ui_bg_dim },
		NoiceScrollbarThumb = { bg = colors.comment },

		-- ==========================================
		-- 20. NOTIFY.NVIM
		-- ==========================================
		NotifyERRORBorder = { fg = colors.error },
		NotifyERRORIcon = { fg = colors.error },
		NotifyERRORTitle = { fg = colors.error },
		NotifyERRORBody = { fg = colors.fg },
		NotifyWARNBorder = { fg = colors.warning },
		NotifyWARNIcon = { fg = colors.warning },
		NotifyWARNTitle = { fg = colors.warning },
		NotifyWARNBody = { fg = colors.fg },
		NotifyINFOBorder = { fg = colors.info },
		NotifyINFOIcon = { fg = colors.info },
		NotifyINFOTitle = { fg = colors.info },
		NotifyINFOBody = { fg = colors.fg },
		NotifyDEBUGBorder = { fg = colors.comment },
		NotifyDEBUGIcon = { fg = colors.comment },
		NotifyDEBUGTitle = { fg = colors.comment },
		NotifyDEBUGBody = { fg = colors.fg },
		NotifyTRACEBorder = { fg = colors.hint },
		NotifyTRACEIcon = { fg = colors.hint },
		NotifyTRACETitle = { fg = colors.hint },
		NotifyTRACEBody = { fg = colors.fg },
		NotifyBackground = { bg = colors.ui_bg },

		-- ==========================================
		-- 21. FLASH.NVIM
		-- ==========================================
		FlashBackdrop = { fg = colors.comment },
		FlashLabel = { bg = colors.error, fg = colors.bg, bold = true },
		FlashMatch = { bg = colors.variable, fg = colors.bg },
		FlashCurrent = { bg = colors.warning, fg = colors.bg },
		FlashCursor = { reverse = true },

		-- ==========================================
		-- 22. MINI.NVIM
		-- ==========================================
		MiniIndentscopeSymbol = { fg = colors.comment },
		MiniIndentscopePrefix = { nocombine = true },
		MiniStatuslineDevinfo = { bg = colors.ui_bg_light, fg = colors.fg },
		MiniStatuslineFileinfo = { bg = colors.ui_bg_light, fg = colors.fg },
		MiniStatuslineFilename = { bg = colors.ui_bg, fg = colors.fg },
		MiniStatuslineInactive = { bg = colors.ui_bg, fg = colors.comment },
		MiniStatuslineModeCommand = { bg = colors.mode_command, fg = colors.bg, bold = true },
		MiniStatuslineModeInsert = { bg = colors.mode_insert, fg = colors.bg, bold = true },
		MiniStatuslineModeNormal = { bg = colors.mode_normal, fg = colors.bg, bold = true },
		MiniStatuslineModeOther = { bg = colors.hint, fg = colors.bg, bold = true },
		MiniStatuslineModeReplace = { bg = colors.mode_replace, fg = colors.bg, bold = true },
		MiniStatuslineModeVisual = { bg = colors.mode_visual, fg = colors.bg, bold = true },
		MiniSurround = { bg = colors.warning, fg = colors.bg },
		MiniTablineCurrent = { bg = colors.bg, fg = colors.fg, bold = true },
		MiniTablineFill = { bg = colors.ui_bg_dim },
		MiniTablineHidden = { bg = colors.ui_bg_dim, fg = colors.comment },
		MiniTablineModifiedCurrent = { bg = colors.bg, fg = colors.warning, bold = true },
		MiniTablineModifiedHidden = { bg = colors.ui_bg_dim, fg = colors.warning },
		MiniTablineModifiedVisible = { bg = colors.ui_bg, fg = colors.warning },
		MiniTablineTabpagesection = { bg = colors.ui_bg_light, fg = colors.fg },
		MiniTablineVisible = { bg = colors.ui_bg, fg = colors.fg },
		MiniJump = { bg = colors.error, fg = colors.bg, bold = true },
		MiniJump2dSpot = { fg = colors.error, bold = true },
		MiniCursorword = { bg = colors.ui_bg_light },
		MiniCursorwordCurrent = { bg = colors.ui_bg_light },

		-- ==========================================
		-- 23. RENDER-MARKDOWN.NVIM
		-- ==========================================
		RenderMarkdownH1 = { fg = colors.property, bold = true },
		RenderMarkdownH1Bg = { bg = "#1A2A3A" },
		RenderMarkdownH2 = { fg = colors.keyword, bold = true },
		RenderMarkdownH2Bg = { bg = "#2A1A2A" },
		RenderMarkdownH3 = { fg = colors.variable, bold = true },
		RenderMarkdownH3Bg = { bg = "#1A2A2A" },
		RenderMarkdownH4 = { fg = colors.type, bold = true },
		RenderMarkdownH4Bg = { bg = "#1A1A2A" },
		RenderMarkdownH5 = { fg = colors.string, bold = true },
		RenderMarkdownH5Bg = { bg = "#1A1A2A" },
		RenderMarkdownH6 = { fg = colors.comment, bold = true },
		RenderMarkdownH6Bg = { bg = "#1A1A1A" },
		RenderMarkdownCode = { bg = colors.ui_bg },
		RenderMarkdownCodeInline = { bg = colors.ui_bg },
		RenderMarkdownBullet = { fg = colors.keyword },
		RenderMarkdownQuote = { fg = colors.comment, italic = true },
		RenderMarkdownDash = { fg = colors.border },
		RenderMarkdownLink = { fg = colors.string, underline = true },
		RenderMarkdownMath = { fg = colors.string },
		RenderMarkdownChecked = { fg = colors.ok },
		RenderMarkdownUnchecked = { fg = colors.comment },

		-- ==========================================
		-- 24. TROUBLE.NVIM
		-- ==========================================
		TroubleNormal = { bg = colors.ui_bg, fg = colors.fg },
		TroubleNormalNC = { bg = colors.ui_bg, fg = colors.fg },
		TroubleCount = { bg = colors.ui_bg_light, fg = colors.fg },
		TroubleFile = { fg = colors.property },
		TroubleLocation = { fg = colors.comment },
		TroublePreview = { bg = colors.ui_bg_light },
		TroubleSource = { fg = colors.comment },
		TroubleText = { fg = colors.fg },
		TroubleCode = { fg = colors.comment },
		TroubleIndent = { fg = colors.border },
		TroubleIndentWs = { fg = colors.border },
		TroubleIndentTop = { fg = colors.border },
		TroubleIndentMiddle = { fg = colors.border },
		TroubleIndentLast = { fg = colors.border },
		TroubleIndentFoldClosed = { fg = colors.border },
		TroubleIndentFoldOpen = { fg = colors.border },
		TroubleFoldIcon = { fg = colors.comment },
		TroubleIconArray = { fg = colors.fg },
		TroubleIconBoolean = { fg = colors.keyword },
		TroubleIconClass = { fg = colors.type },
		TroubleIconConstant = { fg = colors.static },
		TroubleIconConstructor = { fg = colors.type },
		TroubleIconDirectory = { fg = colors.property },
		TroubleIconEnum = { fg = colors.type },
		TroubleIconEnumMember = { fg = colors.enum },
		TroubleIconEvent = { fg = colors.property },
		TroubleIconField = { fg = colors.property },
		TroubleIconFile = { fg = colors.fg },
		TroubleIconFunction = { fg = colors.property },
		TroubleIconInterface = { fg = colors.type },
		TroubleIconKey = { fg = colors.keyword },
		TroubleIconMethod = { fg = colors.property },
		TroubleIconModule = { fg = colors.keyword },
		TroubleIconNamespace = { fg = colors.fg },
		TroubleIconNull = { fg = colors.keyword },
		TroubleIconNumber = { fg = colors.string },
		TroubleIconObject = { fg = colors.type },
		TroubleIconOperator = { fg = colors.fg },
		TroubleIconPackage = { fg = colors.keyword },
		TroubleIconProperty = { fg = colors.property },
		TroubleIconString = { fg = colors.string },
		TroubleIconStruct = { fg = colors.type },
		TroubleIconTypeParameter = { fg = colors.type },
		TroubleIconVariable = { fg = colors.variable },

		-- ==========================================
		-- 25. DAP (Debug Adapter Protocol)
		-- ==========================================
		DapBreakpoint = { fg = colors.error },
		DapBreakpointCondition = { fg = colors.warning },
		DapBreakpointRejected = { fg = colors.comment },
		DapLogPoint = { fg = colors.info },
		DapStopped = { fg = colors.ok },
		DapStoppedLine = { bg = "#2A3A2A" },
		-- DAP UI
		DapUIVariable = { fg = colors.variable },
		DapUIScope = { fg = colors.property, bold = true },
		DapUIType = { fg = colors.type },
		DapUIValue = { fg = colors.string },
		DapUIModifiedValue = { fg = colors.warning, bold = true },
		DapUIDecoration = { fg = colors.property },
		DapUIThread = { fg = colors.ok },
		DapUIStoppedThread = { fg = colors.ok },
		DapUIFrameName = { fg = colors.fg },
		DapUISource = { fg = colors.keyword },
		DapUILineNumber = { fg = colors.comment },
		DapUIFloatNormal = { bg = colors.ui_bg },
		DapUIFloatBorder = { fg = colors.border },
		DapUIWatchesEmpty = { fg = colors.comment },
		DapUIWatchesValue = { fg = colors.ok },
		DapUIWatchesError = { fg = colors.error },
		DapUIBreakpointsPath = { fg = colors.property },
		DapUIBreakpointsInfo = { fg = colors.info },
		DapUIBreakpointsCurrentLine = { fg = colors.ok, bold = true },
		DapUIBreakpointsLine = { fg = colors.comment },
		DapUIBreakpointsDisabledLine = { fg = colors.comment },
		DapUICurrentFrameName = { fg = colors.ok, bold = true },
		DapUIStepOver = { fg = colors.info },
		DapUIStepInto = { fg = colors.info },
		DapUIStepBack = { fg = colors.info },
		DapUIStepOut = { fg = colors.info },
		DapUIStop = { fg = colors.error },
		DapUIPlayPause = { fg = colors.ok },
		DapUIRestart = { fg = colors.ok },
		DapUIUnavailable = { fg = colors.comment },
		DapUIWinSelect = { fg = colors.variable, bold = true },
		DapUIEndofBuffer = { fg = colors.ui_bg },

		-- ==========================================
		-- 26. COPILOT.LUA
		-- ==========================================
		CopilotSuggestion = { fg = colors.comment, italic = true },
		CopilotAnnotation = { fg = colors.comment, italic = true },

		-- ==========================================
		-- 27. GO-SPECIFIC HIGHLIGHTS
		-- ==========================================
		NeuroGoErr = { fg = colors.error, italic = true },
		-- Go built-in functions (make, len, cap, append, etc.)
		["@function.builtin.go"] = { fg = colors.property, italic = true },
		-- Channel operations
		["@type.builtin.go"] = { fg = colors.type },
		-- defer/panic/recover emphasis
		["@keyword.coroutine.go"] = { fg = colors.keyword, bold = true, italic = true },

		-- ==========================================
		-- 28. TERMINAL
		-- ==========================================
		TerminalNormal = { bg = colors.bg, fg = colors.fg },
		TerminalBorder = { bg = colors.bg, fg = colors.border },
	}

	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	-- Set terminal colors
	vim.g.terminal_color_0 = colors.ui_bg_dim
	vim.g.terminal_color_1 = colors.error
	vim.g.terminal_color_2 = colors.ok
	vim.g.terminal_color_3 = colors.warning
	vim.g.terminal_color_4 = colors.info
	vim.g.terminal_color_5 = colors.keyword
	vim.g.terminal_color_6 = colors.variable
	vim.g.terminal_color_7 = colors.fg
	vim.g.terminal_color_8 = colors.comment
	vim.g.terminal_color_9 = colors.error
	vim.g.terminal_color_10 = colors.ok
	vim.g.terminal_color_11 = colors.warning
	vim.g.terminal_color_12 = colors.info
	vim.g.terminal_color_13 = colors.keyword
	vim.g.terminal_color_14 = colors.variable
	vim.g.terminal_color_15 = colors.fg

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "go",
		callback = function()
			vim.fn.matchadd("NeuroGoErr", "\\<err\\>")
		end,
	})
end

return M
