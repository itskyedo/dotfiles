-- Made with 'mini.colors' module of https://github.com/echasnovski/mini.nvim

if vim.g.colors_name ~= nil then vim.cmd('highlight clear') end
vim.g.colors_name = "eminence"

-- Highlight groups
local hi = vim.api.nvim_set_hl

hi(0, "@annotation", { fg = "#a390ff" })
hi(0, "@attribute", { fg = "#56c3f9" })
hi(0, "@character", { fg = "#c9c7be" })
hi(0, "@comment", { fg = "#8a8a8a" })
hi(0, "@comment.danger", { bg = "#f07178", fg = "#333333" })
hi(0, "@comment.note", { bg = "#36a3d9", fg = "#000000" })
hi(0, "@comment.todo", { bg = "#e5e5e5", fg = "#33363c" })
hi(0, "@comment.warning", { bg = "#ffee99", fg = "#333333" })
hi(0, "@constant", { fg = "#c9c7be" })
hi(0, "@constant.builtin", { fg = "#ffee99" })
hi(0, "@constant.macro", { fg = "#c9c7be" })
hi(0, "@constructor", { fg = "#56c3f9" })
hi(0, "@definition", { sp = "#33363c", underline = true })
hi(0, "@diff.delta", { fg = "#6B6F77" })
hi(0, "@diff.minus", { fg = "#f07178" })
hi(0, "@diff.plus", { fg = "#bfd084" })
hi(0, "@error", { fg = "#c9c7be" })
hi(0, "@function", { fg = "#cdf861" })
hi(0, "@function.builtin", { fg = "#cdf861" })
hi(0, "@function.call", { fg = "#cdf861" })
hi(0, "@function.macro", { fg = "#c9c7be" })
hi(0, "@function.method", { fg = "#cdf861" })
hi(0, "@function.method.call", { fg = "#cdf861" })
hi(0, "@ibl.indent.char.1", { fg = "#24272d", nocombine = true })
hi(0, "@ibl.scope.char.1", { fg = "#33363c", nocombine = true })
hi(0, "@ibl.scope.underline.1", { bg = "#333333" })
hi(0, "@ibl.whitespace.char.1", { fg = "#8a8a8a" })
hi(0, "@keyword", { fg = "#ffb454" })
hi(0, "@keyword.conditional", { fg = "#ffb454" })
hi(0, "@keyword.conditional.ternary", { fg = "#ffb454" })
hi(0, "@keyword.directive", { fg = "#56c3f9" })
hi(0, "@keyword.directive.define", { fg = "#ffb454" })
hi(0, "@keyword.exception", { fg = "#c9c7be" })
hi(0, "@keyword.function", { fg = "#ffb454" })
hi(0, "@keyword.import", { link = "Include" })
hi(0, "@keyword.operator", { fg = "#ffb454" })
hi(0, "@keyword.repeat", { fg = "#ffb454" })
hi(0, "@keyword.return", { fg = "#ffb454" })
hi(0, "@keyword.storage", { fg = "#56c3f9" })
hi(0, "@markup.heading", { fg = "#cdf861" })
hi(0, "@markup.link", { fg = "#c9c7be" })
hi(0, "@markup.link.label", { fg = "#ffb454" })
hi(0, "@markup.link.url", { fg = "#ffee99", underline = true })
hi(0, "@markup.list", { fg = "#c9c7be" })
hi(0, "@markup.quote", { bg = "#333333" })
hi(0, "@markup.raw", { fg = "#ffee99" })
hi(0, "@module", { fg = "#c9c7be" })
hi(0, "@number", { fg = "#ffee99" })
hi(0, "@number.float", { fg = "#ffee99" })
hi(0, "@operator", { fg = "#c9c7be" })
hi(0, "@parameter", { fg = "#a390ff" })
hi(0, "@property", { fg = "#c9c7be" })
hi(0, "@punctuation.bracket", { fg = "#a390ff" })
hi(0, "@punctuation.delimiter", { fg = "#a390ff" })
hi(0, "@reference", { fg = "#c9c7be" })
hi(0, "@scope", { bold = true })
hi(0, "@string", { fg = "#bfd084" })
hi(0, "@string.escape", { fg = "#ffb454" })
hi(0, "@string.regex", { fg = "#ffb454" })
hi(0, "@symbol", { fg = "#bfd084" })
hi(0, "@tag", { fg = "#56c3f9" })
hi(0, "@tag.attribute", { fg = "#a390ff" })
hi(0, "@tag.delimiter", { fg = "#95e6cb" })
hi(0, "@text", { fg = "#c9c7be" })
hi(0, "@text.emphasis", { fg = "#ffee99" })
hi(0, "@text.strike", { fg = "#a390ff", strikethrough = true })
hi(0, "@type.builtin", { fg = "#56c3f9" })
hi(0, "@variable", { fg = "#c9c7be" })
hi(0, "@variable.builtin", { fg = "#ffee99" })
hi(0, "@variable.member", { fg = "#c9c7be" })
hi(0, "@variable.member.key", { fg = "#c9c7be" })
hi(0, "@variable.parameter", { fg = "#c9c7be" })
hi(0, "Added", { fg = "#bfd084" })
hi(0, "Bold", { bold = true })
hi(0, "Boolean", { fg = "#ffee99" })
hi(0, "Changed", { fg = "#e7c547" })
hi(0, "Character", { fg = "#c9c7be" })
hi(0, "CmpBorder", { fg = "#8a8a8a" })
hi(0, "CmpDoc", { bg = "#000000" })
hi(0, "CmpDocBorder", { bg = "#000000", fg = "#000000" })
hi(0, "CmpItemAbbr", { fg = "#e5e5e5" })
hi(0, "CmpItemAbbrDeprecatedDefault", { fg = "#8a8a8a" })
hi(0, "CmpItemAbbrMatch", { bold = true, fg = "#36a3d9" })
hi(0, "CmpItemKindClass", { fg = "#74c5aa" })
hi(0, "CmpItemKindClassDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindCodeium", { fg = "#cdf861" })
hi(0, "CmpItemKindColor", { fg = "#e5e5e5" })
hi(0, "CmpItemKindColorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindConstant", { fg = "#ffee99" })
hi(0, "CmpItemKindConstantDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindConstructor", { fg = "#36a3d9" })
hi(0, "CmpItemKindConstructorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindCopilot", { fg = "#bfd084" })
hi(0, "CmpItemKindDefault", { fg = "#ffb454" })
hi(0, "CmpItemKindEnum", { fg = "#36a3d9" })
hi(0, "CmpItemKindEnumDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindEnumMember", { fg = "#a390ff" })
hi(0, "CmpItemKindEnumMemberDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindEvent", { fg = "#e7c547" })
hi(0, "CmpItemKindEventDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindField", { fg = "#c9c7be" })
hi(0, "CmpItemKindFieldDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFile", { fg = "#d9d7ce" })
hi(0, "CmpItemKindFileDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFolder", { fg = "#d9d7ce" })
hi(0, "CmpItemKindFolderDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFunction", { fg = "#cdf861" })
hi(0, "CmpItemKindFunctionDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindIdentifier", { fg = "#c9c7be" })
hi(0, "CmpItemKindInterface", { fg = "#bfd084" })
hi(0, "CmpItemKindInterfaceDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindKeyword", { fg = "#d9d7ce" })
hi(0, "CmpItemKindKeywordDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindMethod", { fg = "#cdf861" })
hi(0, "CmpItemKindMethodDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindModule", { fg = "#56c3f9" })
hi(0, "CmpItemKindModuleDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindOperator", { fg = "#c9c7be" })
hi(0, "CmpItemKindOperatorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindProperty", { fg = "#c9c7be" })
hi(0, "CmpItemKindPropertyDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindReference", { fg = "#c9c7be" })
hi(0, "CmpItemKindReferenceDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindSnippet", { fg = "#f07178" })
hi(0, "CmpItemKindSnippetDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindStruct", { fg = "#ffb454" })
hi(0, "CmpItemKindStructDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindStructure", { fg = "#ffb454" })
hi(0, "CmpItemKindSuperMaven", { fg = "#e7c547" })
hi(0, "CmpItemKindTabNine", { fg = "#ff949b" })
hi(0, "CmpItemKindText", { fg = "#bfd084" })
hi(0, "CmpItemKindTextDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindType", { fg = "#56c3f9" })
hi(0, "CmpItemKindTypeParameter", { fg = "#c9c7be" })
hi(0, "CmpItemKindTypeParameterDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindUnit", { fg = "#ffb454" })
hi(0, "CmpItemKindUnitDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindValue", { fg = "#95e6cb" })
hi(0, "CmpItemKindValueDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindVariable", { fg = "#ffb454" })
hi(0, "CmpItemKindVariableDefault", { link = "CmpItemKind" })
hi(0, "CmpPmenu", { bg = "#000000" })
hi(0, "CmpSel", { bg = "#ff9445", fg = "#000000" })
hi(0, "ColorColumn", { bg = "#333333" })
hi(0, "Comment", { fg = "#8a8a8a" })
hi(0, "Conceal", {})
hi(0, "Conditional", { fg = "#ffb454" })
hi(0, "Constant", { fg = "#c9c7be" })
hi(0, "Cursor", { bg = "#c9c7be", fg = "#000000" })
hi(0, "CursorColumn", { bg = "#000000" })
hi(0, "CursorLine", { bg = "#333333" })
hi(0, "CursorLineNr", { fg = "#e5e5e5" })
hi(0, "Debug", { fg = "#c9c7be" })
hi(0, "Define", { fg = "#ffb454" })
hi(0, "Delimiter", { fg = "#a390ff" })
hi(0, "DiagnosticError", { fg = "#f07178" })
hi(0, "DiagnosticHint", { fg = "#a390ff" })
hi(0, "DiagnosticInfo", { fg = "#bfd084" })
hi(0, "DiagnosticWarn", { fg = "#e7c547" })
hi(0, "DiffAdd", { fg = "#36a3d9" })
hi(0, "DiffAdded", { fg = "#bfd084" })
hi(0, "DiffChange", { fg = "#6B6F77" })
hi(0, "DiffChangeDelete", { fg = "#f07178" })
hi(0, "DiffDelete", { fg = "#f07178" })
hi(0, "DiffModified", { fg = "#ffa455" })
hi(0, "DiffRemoved", { fg = "#f07178" })
hi(0, "DiffText", { bg = "#333333", fg = "#e5e5e5" })
hi(0, "Directory", { fg = "#cdf861" })
hi(0, "DressingSelectIdx", { link = "Special" })
hi(0, "Error", { bg = "#c9c7be", fg = "#000000" })
hi(0, "ErrorMsg", { bg = "#000000", fg = "#c9c7be" })
hi(0, "Exception", { fg = "#c9c7be" })
hi(0, "Float", { fg = "#ffee99" })
hi(0, "FloatBorder", { fg = "#36a3d9" })
hi(0, "FloatTitle", { bg = "#33363c", fg = "#e5e5e5" })
hi(0, "FoldColumn", { bg = "#000000", fg = "#ffb454" })
hi(0, "Folded", { bg = "#333333", fg = "#6B6F77" })
hi(0, "Function", { fg = "#cdf861" })
hi(0, "GitSignsStagedAdd", { fg = "#5f6842" })
hi(0, "GitSignsStagedAddCul", { fg = "#5f6842" })
hi(0, "GitSignsStagedAddLn", { fg = "#1b516c" })
hi(0, "GitSignsStagedAddNr", { fg = "#5f6842" })
hi(0, "GitSignsStagedChange", { fg = "#736223" })
hi(0, "GitSignsStagedChangeCul", { fg = "#736223" })
hi(0, "GitSignsStagedChangeLn", { fg = "#2a2b2e" })
hi(0, "GitSignsStagedChangeNr", { fg = "#736223" })
hi(0, "GitSignsStagedChangedelete", { fg = "#736223" })
hi(0, "GitSignsStagedChangedeleteCul", { fg = "#736223" })
hi(0, "GitSignsStagedChangedeleteLn", { fg = "#2a2b2e" })
hi(0, "GitSignsStagedChangedeleteNr", { fg = "#736223" })
hi(0, "GitSignsStagedDelete", { fg = "#78383c" })
hi(0, "GitSignsStagedDeleteCul", { fg = "#78383c" })
hi(0, "GitSignsStagedDeleteNr", { fg = "#78383c" })
hi(0, "GitSignsStagedTopdelete", { fg = "#78383c" })
hi(0, "GitSignsStagedTopdeleteCul", { fg = "#78383c" })
hi(0, "GitSignsStagedTopdeleteNr", { fg = "#78383c" })
hi(0, "IblChar", { fg = "#24272d" })
hi(0, "IblIndent", { fg = "#24272d" })
hi(0, "IblScope", { fg = "#33363c" })
hi(0, "IblScopeChar", { fg = "#33363c" })
hi(0, "IblWhitespace", { link = "NonText" })
hi(0, "Identifier", { fg = "#c9c7be" })
hi(0, "IncSearch", { bg = "#ffee99", fg = "#000000" })
hi(0, "Include", { fg = "#cdf861" })
hi(0, "Italic", { italic = true })
hi(0, "Keyword", { fg = "#ffb454" })
hi(0, "Label", { fg = "#56c3f9" })
hi(0, "LazyBackdrop", { bg = "#000000" })
hi(0, "LazyBold", { bold = true })
hi(0, "LazyButton", { bg = "#4d4d4d", fg = "#6c7077" })
hi(0, "LazyCommit", { fg = "#bfd084" })
hi(0, "LazyCommitIssue", { fg = "#ff8087" })
hi(0, "LazyDir", { fg = "#c9c7be" })
hi(0, "LazyH1", { bg = "#bfd084", fg = "#000000" })
hi(0, "LazyH2", { bold = true, fg = "#f07178", underline = true })
hi(0, "LazyItalic", { italic = true })
hi(0, "LazyNoCond", { fg = "#f07178" })
hi(0, "LazyOperator", { fg = "#e5e5e5" })
hi(0, "LazyProgressDone", { fg = "#bfd084" })
hi(0, "LazyReasonCmd", { fg = "#f0df8a" })
hi(0, "LazyReasonEvent", { fg = "#e7c547" })
hi(0, "LazyReasonFt", { fg = "#a390ff" })
hi(0, "LazyReasonImport", { fg = "#e5e5e5" })
hi(0, "LazyReasonKeys", { fg = "#74c5aa" })
hi(0, "LazyReasonPlugin", { fg = "#f07178" })
hi(0, "LazyReasonRuntime", { fg = "#43b0e6" })
hi(0, "LazyReasonSource", { fg = "#95e6cb" })
hi(0, "LazyReasonStart", { fg = "#e5e5e5" })
hi(0, "LazySpecial", { fg = "#36a3d9" })
hi(0, "LazyTaskOutput", { fg = "#e5e5e5" })
hi(0, "LazyUrl", { fg = "#c9c7be" })
hi(0, "LazyValue", { fg = "#74c5aa" })
hi(0, "LineNr", { fg = "#6B6F77" })
hi(0, "LspInlayHint", { bg = "#333333", fg = "#6B6F77" })
hi(0, "LspReferenceRead", { bg = "#e5e5e5", fg = "#000000" })
hi(0, "LspReferenceText", { bg = "#e5e5e5", fg = "#000000" })
hi(0, "LspReferenceWrite", { bg = "#e5e5e5", fg = "#000000" })
hi(0, "LspSignatureActiveParameter", { bg = "#bfd084", fg = "#000000" })
hi(0, "Macro", { fg = "#c9c7be" })
hi(0, "MasonHeader", { bg = "#f07178", fg = "#000000" })
hi(0, "MasonHeaderSecondary", { link = "MasonHighlightBlock" })
hi(0, "MasonHighlight", { fg = "#36a3d9" })
hi(0, "MasonHighlightBlock", { bg = "#bfd084", fg = "#000000" })
hi(0, "MasonHighlightBlockBold", { link = "MasonHighlightBlock" })
hi(0, "MasonMuted", { fg = "#6B6F77" })
hi(0, "MasonMutedBlock", { bg = "#4d4d4d", fg = "#6B6F77" })
hi(0, "MatchParen", { link = "MatchWord" })
hi(0, "MatchWord", { bg = "#4d4d4d" })
hi(0, "ModeMsg", { fg = "#bfd084" })
hi(0, "MoreMsg", { fg = "#bfd084" })
hi(0, "NonText", { fg = "#8a8a8a" })
hi(0, "Normal", { fg = "#c9c7be" })
hi(0, "NormalFloat", { bg = "#000000" })
hi(0, "Number", { fg = "#ffee99" })
hi(0, "NvimInternalError", { fg = "#f07178" })
hi(0, "NvimTreeCursorLine", { bg = "#333333" })
hi(0, "NvimTreeEmptyFolderName", { fg = "#98a3af" })
hi(0, "NvimTreeEndOfBuffer", { fg = "#000000" })
hi(0, "NvimTreeFolderArrowClosed", { fg = "#8a8a8a" })
hi(0, "NvimTreeFolderArrowOpen", { fg = "#98a3af" })
hi(0, "NvimTreeFolderIcon", { fg = "#98a3af" })
hi(0, "NvimTreeFolderName", { fg = "#98a3af" })
hi(0, "NvimTreeGitDeleted", { fg = "#f07178" })
hi(0, "NvimTreeGitDeletedIcon", { link = "NvimTreeGitDeleted" })
hi(0, "NvimTreeGitDirty", { fg = "#f07178" })
hi(0, "NvimTreeGitDirtyIcon", { link = "NvimTreeGitDirty" })
hi(0, "NvimTreeGitIgnored", { fg = "#6B6F77" })
hi(0, "NvimTreeGitIgnoredIcon", { link = "NvimTreeGitIgnored" })
hi(0, "NvimTreeGitNew", { fg = "#e7c547" })
hi(0, "NvimTreeGitNewIcon", { link = "NvimTreeGitNew" })
hi(0, "NvimTreeIndentMarker", { fg = "#1f2227" })
hi(0, "NvimTreeNormal", { bg = "#000000" })
hi(0, "NvimTreeNormalNC", { bg = "#000000" })
hi(0, "NvimTreeOpenedFolderName", { fg = "#98a3af" })
hi(0, "NvimTreeRootFolder", { bold = true, fg = "#f07178" })
hi(0, "NvimTreeSpecialFile", { bold = true, fg = "#e7c547" })
hi(0, "NvimTreeWinSeparator", { bg = "#000000", fg = "#000000" })
hi(0, "NvimTreeWindowPicker", { bg = "#333333", fg = "#f07178" })
hi(0, "Operator", { fg = "#c9c7be" })
hi(0, "Pmenu", { bg = "#4d4d4d" })
hi(0, "PmenuSbar", { bg = "#4d4d4d" })
hi(0, "PmenuSel", { bg = "#ff9445", fg = "#000000" })
hi(0, "PmenuThumb", { bg = "#33363c" })
hi(0, "PreProc", { fg = "#56c3f9" })
hi(0, "Question", { fg = "#cdf861" })
hi(0, "QuickFixLine", { bg = "#000000" })
hi(0, "Removed", { fg = "#f07178" })
hi(0, "RenamerBorder", { fg = "#f07178" })
hi(0, "RenamerTitle", { bg = "#f07178", fg = "#000000" })
hi(0, "Repeat", { fg = "#56c3f9" })
hi(0, "ScrollbarCursor", { ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarCursorHandle", { bg = "#333333", blend = 30, ctermbg = 15, ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarError", { ctermfg = 0, fg = "#ffc0b9" })
hi(0, "ScrollbarErrorHandle", { bg = "#333333", blend = 30, ctermbg = 15, ctermfg = 0, fg = "#ffc0b9" })
hi(0, "ScrollbarGitAdd", { ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarGitAddHandle", { bg = "#333333", blend = 30, ctermbg = 15, ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarGitChange", { ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarGitChangeHandle", { bg = "#333333", blend = 30, ctermbg = 15, ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarGitDelete", { ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarGitDeleteHandle", { bg = "#333333", blend = 30, ctermbg = 15, ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarHandle", { bg = "#333333", blend = 30, ctermbg = 15 })
hi(0, "ScrollbarHint", { ctermfg = 0, fg = "#a6dbff" })
hi(0, "ScrollbarHintHandle", { bg = "#333333", blend = 30, ctermbg = 15, ctermfg = 0, fg = "#a6dbff" })
hi(0, "ScrollbarInfo", { ctermfg = 0, fg = "#8cf8f7" })
hi(0, "ScrollbarInfoHandle", { bg = "#333333", blend = 30, ctermbg = 15, ctermfg = 0, fg = "#8cf8f7" })
hi(0, "ScrollbarMisc", { ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarMiscHandle", { bg = "#333333", blend = 30, ctermbg = 15, ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarSearch", { ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarSearchHandle", { bg = "#333333", blend = 30, ctermbg = 15, ctermfg = 0, fg = "#c9c7be" })
hi(0, "ScrollbarWarn", { ctermfg = 0, fg = "#fce094" })
hi(0, "ScrollbarWarnHandle", { bg = "#333333", blend = 30, ctermbg = 15, ctermfg = 0, fg = "#fce094" })
hi(0, "Search", { bg = "#56c3f9", fg = "#000000" })
hi(0, "SignColumn", { fg = "#8a8a8a" })
hi(0, "Special", { fg = "#ffb454" })
hi(0, "SpecialChar", { fg = "#a390ff" })
hi(0, "SpecialKey", { fg = "#8a8a8a" })
hi(0, "SpellBad", { sp = "#c9c7be", undercurl = true })
hi(0, "SpellCap", { sp = "#cdf861", undercurl = true })
hi(0, "SpellLocal", { sp = "#ffb454", undercurl = true })
hi(0, "SpellRare", { sp = "#ffb454", undercurl = true })
hi(0, "St_CommandMode", { bg = "#bfd084", bold = true, fg = "#000000" })
hi(0, "St_CommandModeSep", { bg = "#33363c", fg = "#bfd084" })
hi(0, "St_ConfirmMode", { bg = "#74c5aa", bold = true, fg = "#000000" })
hi(0, "St_ConfirmModeSep", { bg = "#33363c", fg = "#74c5aa" })
hi(0, "St_EmptySpace", { bg = "#24272d", fg = "#33363c" })
hi(0, "St_InsertMode", { bg = "#a390ff", bold = true, fg = "#000000" })
hi(0, "St_InsertModeSep", { bg = "#33363c", fg = "#a390ff" })
hi(0, "St_Lsp", { bg = "#000000", fg = "#43b0e6" })
hi(0, "St_LspHints", { bg = "#000000", fg = "#a390ff" })
hi(0, "St_LspInfo", { bg = "#000000", fg = "#bfd084" })
hi(0, "St_LspMsg", { bg = "#000000", fg = "#bfd084" })
hi(0, "St_NTerminalMode", { bg = "#e7c547", bold = true, fg = "#000000" })
hi(0, "St_NTerminalModeSep", { bg = "#33363c", fg = "#e7c547" })
hi(0, "St_NormalMode", { bg = "#43b0e6", bold = true, fg = "#000000" })
hi(0, "St_NormalModeSep", { bg = "#33363c", fg = "#43b0e6" })
hi(0, "St_ReplaceMode", { bg = "#ffa455", bold = true, fg = "#000000" })
hi(0, "St_ReplaceModeSep", { bg = "#33363c", fg = "#ffa455" })
hi(0, "St_SelectMode", { bg = "#36a3d9", bold = true, fg = "#000000" })
hi(0, "St_SelectModeSep", { bg = "#33363c", fg = "#36a3d9" })
hi(0, "St_TerminalMode", { bg = "#bfd084", bold = true, fg = "#000000" })
hi(0, "St_TerminalModeSep", { bg = "#33363c", fg = "#bfd084" })
hi(0, "St_VisualMode", { bg = "#95e6cb", bold = true, fg = "#000000" })
hi(0, "St_VisualModeSep", { bg = "#33363c", fg = "#95e6cb" })
hi(0, "St_cwd_icon", { bg = "#f07178", fg = "#4d4d4d" })
hi(0, "St_cwd_sep", { bg = "#000000", fg = "#f07178" })
hi(0, "St_cwd_text", { bg = "#24272d", fg = "#e5e5e5" })
hi(0, "St_file", { bg = "#24272d", fg = "#e5e5e5" })
hi(0, "St_file_sep", { bg = "#000000", fg = "#24272d" })
hi(0, "St_gitIcons", { bg = "#000000", bold = true, fg = "#676b72" })
hi(0, "St_lspError", { bg = "#000000", fg = "#f07178" })
hi(0, "St_lspWarning", { bg = "#000000", fg = "#e7c547" })
hi(0, "St_pos_icon", { bg = "#bfd084", fg = "#000000" })
hi(0, "St_pos_sep", { bg = "#24272d", fg = "#bfd084" })
hi(0, "St_pos_text", { bg = "#24272d", fg = "#bfd084" })
hi(0, "Statement", { fg = "#c9c7be" })
hi(0, "StatusLine", { bg = "#000000" })
hi(0, "StatusLineNC", { bg = "#000000" })
hi(0, "StorageClass", { fg = "#56c3f9" })
hi(0, "String", { fg = "#bfd084" })
hi(0, "Structure", { fg = "#56c3f9" })
hi(0, "Substitute", { bg = "#c9c7be", fg = "#000000" })
hi(0, "TabLine", { fg = "#8a8a8a", bg = "#000000" })
hi(0, "TabLineFill", { bg = "#2a2a2a" })
hi(0, "TabLineSel", { fg = "#000000", bg = "#56c3f9", bold = true })
hi(0, "TBTabTitle", { fg = "#000000" })
hi(0, "Tag", { fg = "#56c3f9" })
hi(0, "TbBufOff", { fg = "#6B6F77" })
hi(0, "TbBufOffClose", { fg = "#6B6F77" })
hi(0, "TbBufOffModified", { fg = "#f07178" })
hi(0, "TbBufOn", { fg = "#e5e5e5" })
hi(0, "TbBufOnClose", { fg = "#f07178" })
hi(0, "TbBufOnModified", { fg = "#bfd084" })
hi(0, "TbCloseAllBufsBtn", { bold = true, fg = "#000000" })
hi(0, "TbTabCloseBtn", { fg = "#000000" })
hi(0, "TbTabNewBtn", { fg = "#e5e5e5" })
hi(0, "TbTabOff", { fg = "#e5e5e5" })
hi(0, "TbTabOn", { fg = "#f07178" })
hi(0, "TbThemeToggleBtn", { bold = true, fg = "#e5e5e5" })
hi(0, "TelescopeBorder", { bg = "#000000", fg = "#6b6b6b" })
hi(0, "TelescopeMatching", { bg = "#4d4d4d", fg = "#36a3d9" })
hi(0, "TelescopeNormal", { bg = "#000000" })
hi(0, "TelescopePreviewTitle", { bg = "#36a3d9", fg = "#000000" })
hi(0, "TelescopePromptBorder", { fg = "#6b6b6b" })
hi(0, "TelescopePromptNormal", { bg = "#000000" })
hi(0, "TelescopePromptPrefix", { bg = "#000000", fg = "#f07178" })
hi(0, "TelescopePromptTitle", { bg = "#f07178", fg = "#000000" })
hi(0, "TelescopeResultsDiffAdd", { fg = "#bfd084" })
hi(0, "TelescopeResultsDiffChange", { fg = "#e7c547" })
hi(0, "TelescopeResultsDiffDelete", { fg = "#f07178" })
hi(0, "TelescopeResultsTitle", { bg = "#bfd084", fg = "#000000" })
hi(0, "TelescopeSelection", { bg = "#333333", fg = "#e5e5e5" })
hi(0, "Title", { fg = "#cdf861" })
hi(0, "Todo", { bg = "#000000", fg = "#56c3f9" })
hi(0, "TooLong", { fg = "#c9c7be" })
hi(0, "Type", { fg = "#56c3f9" })
hi(0, "Typedef", { fg = "#56c3f9" })
hi(0, "Variable", { fg = "#c9c7be" })
hi(0, "Visual", { bg = "#4d4d4d" })
hi(0, "VisualNOS", { fg = "#c9c7be" })
hi(0, "WarningMsg", { fg = "#c9c7be" })
hi(0, "WhichKey", { fg = "#36a3d9" })
hi(0, "WhichKeyDesc", { fg = "#f07178" })
hi(0, "WhichKeyGroup", { fg = "#bfd084" })
hi(0, "WhichKeySeparator", { fg = "#6B6F77" })
hi(0, "WhichKeyValue", { fg = "#bfd084" })
hi(0, "WildMenu", { bg = "#56c3f9", fg = "#c9c7be" })
hi(0, "WinSeparator", { fg = "#54575d" })
hi(0, "diffNewFile", { fg = "#36a3d9" })
hi(0, "diffOldFile", { fg = "#ff949b" })
hi(0, "gitcommitBranch", { bold = true, fg = "#ffee99" })
hi(0, "gitcommitComment", { fg = "#8a8a8a" })
hi(0, "gitcommitDiscarded", { fg = "#8a8a8a" })
hi(0, "gitcommitDiscardedFile", { bold = true, fg = "#c9c7be" })
hi(0, "gitcommitDiscardedType", { fg = "#cdf861" })
hi(0, "gitcommitHeader", { fg = "#ffb454" })
hi(0, "gitcommitOverflow", { fg = "#c9c7be" })
hi(0, "gitcommitSelected", { fg = "#8a8a8a" })
hi(0, "gitcommitSelectedFile", { bold = true, fg = "#bfd084" })
hi(0, "gitcommitSelectedType", { fg = "#cdf861" })
hi(0, "gitcommitSummary", { fg = "#bfd084" })
hi(0, "gitcommitUnmergedFile", { bold = true, fg = "#c9c7be" })
hi(0, "gitcommitUnmergedType", { fg = "#cdf861" })
hi(0, "gitcommitUntracked", { fg = "#8a8a8a" })
hi(0, "gitcommitUntrackedFile", { fg = "#56c3f9" })
hi(0, "healthSuccess", { bg = "#bfd084", fg = "#000000" })
hi(0, "lCursor", { bg = "#c9c7be", fg = "#000000" })
hi(0, "luaTSField", { fg = "#cdf861" })

-- No terminal colors defined
