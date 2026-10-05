-- deepSky.lua

local M = {}

local colors = {
	bg        = "#0b0f14",
	cursor    = "#2c313c",
	bg_alt    = "#12171d",
	fg        = "#C9D1D9",
	comment   = "#4c5c68",
	red       = "#d16d6d",
	orange    = "#cfa06e",
	yellow    = "#d4b97a",
	green     = "#7fa98f",
	navy_blue = "#4d9ccf",
	blue      = "#58A6FF",
	cyan      = "#7fb2c9",
	accent    = "#79C0FF",
	white     = "#cfd7df",
	black     = "#05080a",
	visual    = "#1a2129",
	none      = "NONE",
}

function M.setup()
	local function safe_hi(group, opts)
		pcall(vim.api.nvim_set_hl, 0, group, opts)
	end

	local highlights = {

		-- Base UI
		Normal        	= { fg = colors.fg, bg = colors.bg },
		NormalNC      	= { fg = colors.fg, bg = colors.bg},
		SignColumn    	= { bg = colors.none },
		EndOfBuffer   	= { fg = colors.bg_alt, bg = colors.none },

		Visual        	= { bg = colors.visual },

		CursorLineNr    = { bg = colors.bg },
		CursorLine 	= { bg = colors.cursor },
		CursorColumn  	= { bg = colors.cursor, fg = colors.accent },

		VertSplit     	= { fg = colors.bg_alt },

		StatusLine    	= { fg = colors.accent, bg = colors.alt_bg },
		LineNr        	= { fg = colors.comment },

		FloatBorder   	= { fg = colors.blue, bg = colors.none },
		NormalFloat   	= { fg = colors.fg, bg = colors.alt_bg },

		Pmenu         	= { fg = colors.fg, bg = colors.bg_alt },
		PmenuSel      	= { bg = colors.alt_bg , fg = colors.blue },

		MatchParen    	= { bg = colors.bg_alt },

		----------------------------------------------------
		-- Syntax
		----------------------------------------------------

		Comment   = { bg = colors.comment, fg = colors.bg , cterm = 'italic', gui = 'italic' },

		Identifier = { fg = colors.cyan },
		Function = { fg = colors.blue, bold = true },

		Statement  = { fg = colors.navy_blue },
		Keyword = { fg = colors.navy_blue },

		Type = { fg = colors.cyan },

		String = { fg = colors.green },
		Number = { fg = colors.orange },
		Constant   = { fg = colors.cyan },

		Operator = { fg = colors.fg },

		PreProc    = { fg = colors.accent },

		----------------------------------------------------
		-- Tree-sitter
		----------------------------------------------------

		["@variable"] = { fg = colors.accent },
		["@function"] = { fg = colors.blue },
		["@constant"] = { fg = colors.cyan },
		["@keyword"]  = { fg = colors.navy_blue },
		["@type"]     = { fg = colors.green },
		["@string"]   = { fg = colors.green },
		["@number"]   = { fg = colors.orange },

		----------------------------------------------------
		-- Diagnostics
		----------------------------------------------------

		DiagnosticSignError = { fg = colors.red },
		DiagnosticSignWarn  = { fg = colors.yellow },
		DiagnosticSignInfo  = { fg = colors.blue },
		DiagnosticSignHint  = { fg = colors.cyan },

		DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
		DiagnosticUnderlineWarn  = { undercurl = true, sp = colors.yellow },
		DiagnosticUnderlineInfo  = { undercurl = true, sp = colors.blue },
		DiagnosticUnderlineHint  = { undercurl = true, sp = colors.cyan },

		LspInfoBorder        = { fg = colors.blue, bg = colors.none },
		DiagnosticFloatTitle = { fg = colors.blue, bg = colors.none },

		DiagnosticVirtualTextError = { fg = colors.red, bg = colors.none },
		DiagnosticVirtualTextWarn  = { fg = colors.yellow, bg = colors.none },
		DiagnosticVirtualTextInfo  = { fg = colors.blue, bg = colors.none },
		DiagnosticVirtualTextHint  = { fg = colors.cyan, bg = colors.none },

		----------------------------------------------------
		-- Telescope
		----------------------------------------------------

		TelescopeNormal  = { bg = colors.bg },
		TelescopeBorder  = { fg = colors.cyan, bg = colors.bg },

		TelescopePromptTitle  = { fg = colors.blue },
		TelescopeResultsTitle = { fg = colors.navy_blue },
		TelescopePreviewTitle = { fg = colors.green },

		----------------------------------------------------
		-- Neo-tree
		----------------------------------------------------

		NeoTreeNormal        = { fg = colors.fg, bg = colors.none },
		NeoTreeNormalNC      = { fg = colors.fg, bg = colors.none },

		NeoTreeWinSeparator  = { fg = colors.bg_alt, bg = colors.none },

		NeoTreeDirectoryName = { fg = colors.blue },
		NeoTreeDirectoryIcon = { fg = colors.blue },

		NeoTreeRootName      = { fg = colors.navy_blue, bold = true },

		NeoTreeSymbolicLinkTarget = { fg = colors.cyan },

		NeoTreeFileName       = { fg = colors.fg },
		NeoTreeFileNameOpened = { fg = colors.white, bold = true },

		NeoTreeHiddenByName   = { fg = colors.green },
		NeoTreeFilteredByName = { fg = colors.green },

		NeoTreeGitAdded     = { fg = colors.green },
		NeoTreeGitDeleted   = { fg = colors.red },
		NeoTreeGitModified  = { fg = colors.yellow },
		NeoTreeGitConflict  = { fg = colors.orange },
		NeoTreeGitUntracked = { fg = colors.cyan },

		--NeoTreeCursorLine  = { bg = colors.bg_alt },

		NeoTreeIndentMarker = { fg = colors.bg_alt },
		NeoTreeExpander     = { fg = colors.green },

		NeoTreeFileSize             = { fg = colors.fg },
		NeoTreeFileLastModified     = { fg = colors.fg },
		NeoTreeFileSizeTitle        = { fg = colors.fg },
		NeoTreeFileLastModifiedTitle= { fg = colors.fg },

		----------------------------------------------------
		-- GitSigns
		----------------------------------------------------

		GitSignsAdd    = { fg = colors.green },
		GitSignsChange = { fg = colors.yellow },
		GitSignsDelete = { fg = colors.red },

		----------------------------------------------------
		-- CMP
		----------------------------------------------------

		CmpItemAbbr           = { fg = colors.fg },
		CmpItemAbbrMatch      = { fg = colors.blue },
		CmpItemAbbrMatchFuzzy = { fg = colors.cyan },

		CmpItemKindFunction = { fg = colors.blue },
		CmpItemKindVariable = { fg = colors.fg },
		CmpItemKindKeyword  = { fg = colors.navy_blue },

		----------------------------------------------------
		-- ToggleTerm
		----------------------------------------------------

		ToggleTerm        = { bg = colors.none },
		ToggleTermNormal  = { bg = colors.none },
		ToggleTermSign    = { bg = colors.none },
	}

	for group, opts in pairs(highlights) do
		safe_hi(group, opts)
	end

	local ts_links = {
		["@lsp.type.variable"] = "@variable",
		["@lsp.type.function"] = "@function",
		["@lsp.type.constant"] = "@constant",
		["@lsp.type.keyword"]  = "@keyword",
		["@lsp.type.type"]     = "@type",
		["@lsp.type.string"]   = "@string",
		["@lsp.type.number"]   = "@number",
	}

	for new_group, old_group in pairs(ts_links) do
		safe_hi(new_group, { link = old_group })
	end
end

M.setup()
