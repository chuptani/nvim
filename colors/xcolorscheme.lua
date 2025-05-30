-- ========================================
-- Function to get colors from xresources
-- ========================================
local function get_xresources_color(c)
  local command = io.popen("xrdb -query | grep " .. c .. " -m 1 | cut -f 2")
  local color = command:read("*l")
  return color
end

-- local function get_xresources_color(c)
--    local command = io.popen('xrdb -query -all | grep ' .. c .. ' -m 1 | cut -f 2')
--    local color = command:read("*l")
--    return color
-- end

-- ======================================
-- funtion to get lighter color
-- ======================================
local function get_lighter_color(c, hex)
  local before_color = get_xresources_color(c)
  local t = tostring(before_color)
  local s = string.sub(t, 2, 7)
  local after_color = tonumber("0x" .. s) + hex
  local final_color = "#" .. string.format("%x", after_color)
  return final_color
end

-- ======================================
-- funtion to get darker color
-- ======================================
local function get_darker_color(c, hex)
  local before_color = get_xresources_color(c)
  local t = tostring(before_color)
  local s = string.sub(t, 2, 7)
  local after_color = tonumber("0x" .. s) - hex
  local final_color = "#" .. string.format("%x", after_color)
  return final_color
end

-- =================
-- Color properties
-- =================
local xresources = {
  fg = get_xresources_color("foreground"),
  bg = get_xresources_color("background"),
  black = get_xresources_color("color0"),
  red = get_xresources_color("color1"),
  green = get_xresources_color("color2"),
  yellow = get_xresources_color("color3"),
  blue = get_xresources_color("color4"),
  purple = get_xresources_color("color5"),
  cyan = get_xresources_color("color6"),
  white = get_xresources_color("color7"),
  light_black = get_xresources_color("color8"),
  light_red = get_xresources_color("color9"),
  light_green = get_xresources_color("color10"),
  light_yellow = get_xresources_color("color11"),
  light_blue = get_xresources_color("color12"),
  light_purple = get_xresources_color("color13"),
  light_cyan = get_xresources_color("color14"),
  light_white = get_xresources_color("color15"),
  -- grey = vim.o.background == 'light' and get_darker_color('background', 0xf0f10) or get_lighter_color('background', 0xf0f10);
  -- grey1 = vim.o.background == 'light' and get_darker_color('background', 0x363940) or get_lighter_color('background', 0x363940);
  none = "NONE",
}

-- ======================
-- Terminal colors
-- ======================
function xresources.terminal_color()
  vim.g.terminal_color_0 = xresources.bg
  vim.g.terminal_color_1 = xresources.red
  vim.g.terminal_color_2 = xresources.green
  vim.g.terminal_color_3 = xresources.yellow
  vim.g.terminal_color_4 = xresources.blue
  vim.g.terminal_color_5 = xresources.purple
  vim.g.terminal_color_6 = xresources.cyan
  vim.g.terminal_color_7 = xresources.fg
  vim.g.terminal_color_8 = xresources.bg
  vim.g.terminal_color_9 = xresources.red
  vim.g.terminal_color_10 = xresources.green
  vim.g.terminal_color_11 = xresources.yellow
  vim.g.terminal_color_12 = xresources.blue
  vim.g.terminal_color_13 = xresources.purple
  vim.g.terminal_color_14 = xresources.cyan
  vim.g.terminal_color_15 = xresources.fg
end

-- ====================
-- Highlight function
-- ====================
function xresources.highlight(group, color)
  local style = color.style and "gui=" .. color.style or "gui=NONE"
  local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
  local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
  local sp = color.sp and "guisp=" .. color.sp or ""
  vim.api.nvim_command("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
end

function xresources.load_syntax()
  local syntax = {

    -- ==================
    -- Syntax group
    -- ===================
    Boolean = { fg = xresources.yellow },
    Comment = { fg = xresources.light_black },
    Constant = { fg = xresources.cyan },
    Character = { fg = xresources.green },
    Conditional = { fg = xresources.purple },
    Debug = {},
    Define = { fg = xresources.purple },
    Delimiter = {},
    Error = { fg = xresources.red },
    Exception = { fg = xresources.purple },
    Float = { fg = xresources.yellow },
    Function = { fg = xresources.blue },
    Identifier = { fg = xresources.red },
    Ignore = {},
    Include = { fg = xresources.blue },
    Keyword = { fg = xresources.red },
    Label = { fg = xresources.purple },
    Macro = { fg = xresources.purple },
    Number = { fg = xresources.yellow },
    Operator = { fg = xresources.purple },
    PreProc = { fg = xresources.yellow },
    PreCondit = { fg = xresources.yellow },
    Repeat = { fg = xresources.purple },
    Statement = { fg = xresources.purple },
    StorageClass = { fg = xresources.yellow },
    Special = { fg = xresources.blue },
    SpecialChar = { fg = xresources.yellow },
    Structure = { fg = xresources.yellow },
    String = { fg = xresources.green },
    SpecialComment = { fg = xresources.light_black },
    Typedef = { fg = xresources.yellow },
    Tag = {},
    Type = { fg = xresources.yellow },
    Todo = { fg = xresources.purple },
    Underlined = { fg = xresources.none, style = "underline" },

    -- =============
    -- Treesitter
    -- ==============
    TSError = { fg = xresources.red },
    TSPunctDelimitter = { fg = xresources.cyan },
    TSPunctBracket = {},
    TSPunctSpecial = { fg = xresources.cyan },
    TSConstant = { fg = xresources.yellow },
    TSConstBuiltin = { fg = xresources.blue },
    TSContMacro = { fg = xresources.purple },
    TSString = { fg = xresources.green },
    TSStringRegex = { fg = xresources.red },
    TSCharacter = { fg = xresources.green },
    TSNumber = { fg = xresources.yellow },
    TSBoolean = { fg = xresources.yellow },
    TSFloat = { fg = xresources.yellow },
    TSAnnotation = { fg = xresources.blue },
    TSAttribute = { fg = xresources.yellow },
    TSNamespace = { fg = xresources.blue },
    TSFunctionBuiltin = { fg = xresources.blue },
    TSFunction = { fg = xresources.blue },
    TSFuncMacro = { fg = xresources.blue },
    TSParameter = { fg = xresources.red },
    TSParameterReference = { fg = xresources.red },
    TSMethod = { fg = xresources.blue },
    TSField = { fg = xresources.yellow },
    TSProperty = { fg = xresources.red },
    TSConstructor = { fg = xresources.blue },
    TSConditional = { fg = xresources.purple },
    TSRepeat = { fg = xresources.purple },
    TSLabel = { fg = xresources.purple },
    TSKeyword = { fg = xresources.purple },
    TSKeywordFunction = { fg = xresources.purple },
    TSKeywordOperator = { fg = xresources.cyan },
    TSOperator = { fg = xresources.cyan },
    TSExeption = { fg = xresources.red },
    TSType = { fg = xresources.blue },
    TSTypeBuiltin = { fg = xresources.red },
    TSStructure = { fg = xresources.yellow },
    TSInclude = { fg = xresources.red },
    TSVariable = { fg = xresources.yellow },
    TSVariableBuiltin = { fg = xresources.blue },
    TSText = {},
    TSStrong = { fg = xresources.purple },
    TSEmphasis = { fg = xresources.cyan },
    TSUnderline = { fg = xresources.yellow },
    TSTitle = { fg = xresources.yellow },
    TSLiteral = { fg = xresources.green },
    TSUri = { fg = xresources.green },
    TSTag = {},
    TSTagDelimitter = {},

    -- ===================
    -- Highlight Group
    -- ===================
    BufferInactive = { fg = xresources.fg, bg = xresources.light_black },
    BufferInactiveTarge = { fg = xresources.fg, bg = xresources.light_black },
    BufferInactiveSign = { fg = xresources.blue, bg = xresources.light_black },
    BufferCurrent = { fg = xresources.yellow, bg = xresources.bg, style = "bold" },
    BufferCurrentSign = { fg = xresources.blue, bg = xresources.bg },
    BufferTabPageFill = { fg = xresources.blue, bg = xresources.bg },
    BufferCurrentMod = { fg = xresources.blue, bg = xresources.bg },
    BufferInactiveMod = { fg = xresources.blue, bg = xresources.light_black },
    ColorColumn = { fg = xresources.none, bg = xresources.light_black },
    Conceal = { fg = xresources.light_black, bg = xresources.none },
    CursorLineNr = { fg = xresources.blue },
    CursorIM = { fg = xresources.none, bg = xresources.none, style = "reverse" },
    CursorColumn = { style = "reverse" },
    CursorLine = { fg = xresources.none, bg = xresources.light_black },
    Cursor = { fg = xresources.none, bg = xresources.none, style = "reverse" },
    DiffAdd = { fg = xresources.bg, bg = xresources.green },
    DiffChange = { fg = xresources.bg, bg = xresources.yellow },
    DiffDelete = { fg = xresources.bg, bg = xresources.red },
    DiffText = { fg = xresources.bg, bg = xresources.fg },
    Directory = { fg = xresources.light_black, bg = xresources.none },
    debugBreakpoint = { fg = xresources.bg, bg = xresources.red },
    EndOfBuffer = { fg = xresources.bg, bg = xresources.none },
    ErrorMsg = { fg = xresources.red, bg = xresources.none, style = "bold" },
    FoldColumn = { fg = xresources.fg, bg = xresources.bg },
    Folded = { fg = xresources.fg, bg = xresources.light_black },
    iCursor = { fg = xresources.none, bg = xresources.none, style = "reverse" },
    IncSearch = { fg = xresources.light_black, bg = xresources.yellow, style = xresources.none },
    lCursor = { fg = xresources.none, bg = xresources.none, style = "reverse" },
    LineNr = { fg = xresources.red, style = "bold" },
    LineNrAbove = { fg = xresources.light_black },
    LineNrBelow = { fg = xresources.light_black },
    ModeMsg = { fg = xresources.fg, bg = xresources.none, style = "bold" },
    MatchParen = { fg = xresources.red, bg = xresources.none },
    Normal = { fg = xresources.fg, bg = xresources.none },
    NormalFloat = { fg = xresources.fg, bg = xresources.bg },
    NonText = { fg = xresources.light_black },
    Pmenu = { fg = xresources.fg, bg = xresources.bg },
    PmenuSel = { fg = xresources.bg, bg = xresources.fg },
    PmenuSelBold = { fg = xresources.fg, g = xresources.bg },
    PmenuSbar = { fg = xresources.fg, bg = xresources.bg },
    PmenuThumb = { fg = xresources.bg, bg = xresources.fg },
    Question = { fg = xresources.yellow },
    QuickFixLine = { fg = xresources.purple, style = "bold" },
    StatusLine = { fg = xresources.light_black, bg = xresources.light_black, style = xresources.none },
    StatusLineNC = { fg = xresources.light_black, bg = xresources.light_black, style = xresources.none },
    SpellBad = { fg = xresources.red, bg = xresources.none, style = "undercurl" },
    SpellCap = { fg = xresources.blue, bg = xresources.none, style = "undercurl" },
    SpellLocal = { fg = xresources.cyan, bg = xresources.none, style = "undercurl" },
    SpellRare = { fg = xresources.purple, bg = xresources.none, style = "undercurl" },
    SignColumn = { fg = xresources.fg, bg = NONE },
    Search = { style = "reverse,bold" },
    SpecialKey = { fg = xresources.light_black },
    TabLine = { fg = xresources.fg, bg = xresources.bg },
    TabLineSel = { fg = xresources.bg, bg = xresources.fg },
    Title = { fg = xresources.green, style = "bold" },
    Terminal = { fg = xresources.fg, bg = xresources.bg },
    TabLineFill = { style = xresources.none },
    VertSplit = { fg = xresources.light_black, bg = xresources.light_black },
    vCursor = { fg = xresources.none, bg = xresources.none, style = "reverse" },
    WarningMsg = { fg = xresources.yellow, bg = xresources.none, style = "bold" },
    Whitespace = { fg = xresources.light_black },
    -- WildMenu = {fg=xresources.fg,bg=xresources.green};
    Visual = { fg = xresources.none, bg = xresources.light_black },
    VisualNOS = { fg = xresources.bg, bg = xresources.fg },
  }
  return syntax
end

-- ================================
-- Language specific highlighting
-- ================================
function xresources.load_plugin_syntax()
  local plugin_syntax = {
    -- ================
    -- CSS
    -- ================
    cssAttrComma = { fg = xresources.purple },
    cssAttributeSelector = { fg = xresources.green },
    cssBraces = { fg = xresources.fg },
    cssClassName = { fg = xresources.yellow },
    cssClassNameDot = { fg = xresources.yellow },
    cssDefinition = { fg = xresources.purple },
    cssFontAttr = { fg = xresources.yellow },
    cssFontDescriptor = { fg = xresources.purple },
    cssFunctionName = { fg = xresources.blue },
    cssIdentifier = { fg = xresources.blue },
    cssImportant = { fg = xresources.purple },
    cssInclude = { fg = xresources.fg },
    cssIncludeKeyword = { fg = xresources.purple },
    cssMediaType = { fg = xresources.yellow },
    cssProp = { fg = xresources.fg },
    cssPseudoClassId = { fg = xresources.yellow },
    cssSelectorOp = { fg = xresources.purple },
    cssSelectorOp2 = { fg = xresources.purple },
    cssTagName = { fg = xresources.red },
    -- ================
    -- GO
    -- =================
    goDeclaration = { fg = xresources.purple },
    goBuiltins = { fg = xresources.cyan },
    goFunctionCall = { fg = xresources.blue },
    goVarDefs = { fg = xresources.red },
    goVarAssign = { fg = xresources.red },
    goVar = { fg = xresources.purple },
    goConst = { fg = xresources.purple },
    goType = { fg = xresources.yellow },
    goTypeName = { fg = xresources.yellow },
    goDeclType = { fg = xresources.cyan },
    goTypeDecl = { fg = xresources.purple },
    -- ==============
    -- JavaScript
    -- ==============
    javaScriptBraces = { fg = xresources.yellow },
    javaScriptFunction = { fg = xresources.purple },
    javaScriptIdentifier = { fg = xresources.purple },
    javaScriptNull = { fg = xresources.yellow },
    javaScriptNumber = { fg = xresources.yellow },
    javaScriptRequire = { fg = xresources.cyan },
    javaScriptReserved = { fg = xresources.purple },
    -- ==============================================
    -- vim-javascript
    -- ==============================================
    jsArrowFunction = { fg = xresources.purple },
    jsClassKeyword = { fg = xresources.purple },
    jsClassMethodType = { fg = xresources.purple },
    jsDocParam = { fg = xresources.blue },
    jsDocTags = { fg = xresources.purple },
    jsExport = { fg = xresources.purple },
    jsExportDefault = { fg = xresources.purple },
    jsExtendsKeyword = { fg = xresources.purple },
    jsFrom = { fg = xresources.purple },
    jsFuncCall = { fg = xresources.blue },
    jsFunction = { fg = xresources.purple },
    jsGenerator = { ffg = xresources.yellow },
    jsGlobalObjects = { fg = xresources.yellow },
    jsImport = { fg = xresources.purple },
    jsModuleAs = { fg = xresources.purple },
    jsModuleWords = { fg = xresources.purple },
    jsModules = { fg = xresources.purple },
    jsNull = { fg = xresources.yellow },
    jsOperator = { fg = xresources.purple },
    jsStorageClass = { fg = xresources.purple },
    jsSuper = { fg = xresources.red },
    jsTemplateBraces = { fg = xresources.red },
    jsTemplateVar = { fg = xresources.green },
    jsThis = { fg = xresources.red },
    jsUndefined = { fg = xresources.yellow },
    -- =====================================
    --  yajs.vim
    -- =====================================
    javascriptArrowFunc = { fg = xresources.purple },
    javascriptClassExtends = { fg = xresources.purple },
    javascriptClassKeyword = { fg = xresources.purple },
    javascriptDocNotation = { fg = xresources.purple },
    javascriptDocParamName = { fg = xresources.blue },
    javascriptDocTags = { fg = xresources.purple },
    javascriptEndColons = { fg = xresources.fg },
    javascriptExport = { fg = xresources.purple },
    javascriptFuncArg = { fg = xresources.fg },
    javascriptFuncKeyword = { fg = xresources.purple },
    javascriptIdentifier = { fg = xresources.red },
    javascriptImport = { fg = xresources.purple },
    javascriptMethodName = { fg = xresources.fg },
    javascriptObjectLabel = { fg = xresources.fg },
    javascriptOpSymbol = { fg = xresources.cyan },
    javascriptOpSymbols = { fg = xresources.cyan },
    javascriptPropertyName = { fg = xresources.green },
    javascriptTemplateSB = { fg = xresources.red },
    javascriptVariable = { fg = xresources.purple },
    -- ============
    -- Vim
    -- ============
    vimCommentTitle = { fg = xresources.light_black },
    vimLet = { fg = xresources.yellow },
    vimVar = { fg = xresources.cyan },
    vimFunction = { fg = xresources.purple },
    vimIsCommand = { fg = xresources.fg },
    vimCommand = { fg = xresources.blue },
    vimNotFunc = { fg = xresources.purple },
    vimUserFunc = { fg = xresources.yellow },
    vimFuncName = { fg = xresources.yellow },
    -- =================
    -- Git stuff
    -- ===================
    -- Vim GitGutter
    -- ==================
    GitGutterAdd = { fg = xresources.green },
    GitGutterChange = { fg = xresources.blue },
    GitGutterDelete = { fg = xresources.red },
    GitGutterChangeDelete = { fg = xresources.purple },
    -- =======
    -- Diff
    -- ========
    diffAdded = { fg = xresources.green },
    diffRemoved = { fg = xresources.red },
    diffChanged = { fg = xresources.blue },
    diffOldFile = { fg = xresources.yellow },
    diffNewFile = { fg = xresources.yellow },
    diffFile = { fg = xresources.cyan },
    diffLine = { fg = xresources.light_black },
    diffIndexLine = { fg = xresources.purple },
    -- ========
    -- Commit
    -- ========
    gitcommitSummary = { fg = xresources.red },
    gitcommitUntracked = { fg = xresources.light_black },
    gitcommitDiscarded = { fg = xresources.light_black },
    gitcommitSelected = { fg = xresources.light_black },
    gitcommitUnmerged = { fg = xresources.light_black },
    gitcommitOnBranch = { fg = xresources.light_black },
    gitcommitArrow = { fg = xresources.light_black },
    gitcommitFile = { fg = xresources.green },
    --- ===========================================
    -- vista.vim
    -- =============================================
    Vistacyan = { fg = xresources.light_black },
    VistaChildrenNr = { fg = xresources.yellow },
    VistaKind = { fg = xresources.purple },
    VistaScope = { fg = xresources.red },
    VistaScopeKind = { fg = xresources.blue },
    VistaTag = { fg = xresources.purple, style = "bold" },
    VistaPrefix = { fg = xresources.light_black },
    VistaColon = { fg = xresources.purple },
    VistaIcon = { fg = xresources.yellow },
    VistaLineNr = { fg = xresources.fg },
    -- ===========
    -- vim-signify
    -- ===========
    SignifySignAdd = { fg = xresources.green },
    SignifySignChange = { fg = xresources.blue },
    SignifySignDelete = { fg = xresources.red },
    -- ==============
    -- vim-dadbod-ui
    -- ==============
    dbui_tables = { fg = xresources.blue },
    -- =================
    -- dashboard-nvim
    -- =================
    DashboardShortCut = { fg = xresources.purple },
    DashboardHeader = { fg = xresources.yellow },
    DashboardCenter = { fg = xresources.blue },
    DashboardFooter = { fg = xresources.light_black },
    -- =========================
    -- Neovim LSP
    -- =========================
    DiagnosticError = { fg = xresources.red },
    DiagnosticWarn = { fg = xresources.yellow },
    DiagnosticInfo = { fg = xresources.green },
    DiagnosticHint = { fg = xresources.cyan },
    DiagnosticUnderlineError = { style = "undercurl", sp = xresources.red },
    DiagnosticUnderlineWarn = { style = "undercurl", sp = xresources.yellow },
    DiagnosticUnderlineInfo = { style = "undercurl", sp = xresources.green },
    DiagnosticUnderlineHint = { style = "undercurl", sp = xresources.cyan },
    DiagnosticLualineError = { fg = xresources.red },
    DiagnosticLualineWarn = { fg = xresources.yellow },
    -- ===============
    -- vim-cursorword
    -- ===============
    CursorWord0 = { bg = xresources.light_black },
    CursorWord1 = { bg = xresources.light_black },
    -- ==================
    -- Nvim Tree
    -- ==================
    NvimTreeEmptyFolderName = { fg = xresources.cyan },
    NvimTreeOpenedFolderName = { fg = xresources.cyan },
    NvimTreeFolderName = { fg = xresources.cyan },
    NvimTreeExecFile = { stye = "NONE" },
    NvimTreeGitDirty = { fg = xresources.yellow },
    --NvimTreeRootFolder = {fg=xresources.red};
    NvimTreeSpecialFile = { fg = xresources.fg, bg = xresources.none, stryle = "NONE" },
    NvimTreeFolderIcon = { fg = xresources.yellow },
    -- ==================
    -- Telescope Nvim
    -- ==================
    TelescopeBorder = { fg = xresources.cyan },
    TelescopePromptBorder = { fg = xresources.blue },

    Whitespace = { bg = xresources.none, fg = xresources.light_black },

    Floaterm = { bg = xresources.none },
    FloatermBorder = { bg = xresources.none, fg = xresources.blue },

    Winseparator = { bg = xresources.none },

    TabLineIconSel = { fg = xresources.bg },
    TabLineIcon = { fg = xresources.fg },

    DapBreakpoint = { fg = xresources.red },
    DapLogPoint = { fg = xresources.blue },
    DapStopped = { fg = xresources.green },

    -- ==================
    -- dap-ui
    -- ==================

    DapUIBreakpointsCurrentLine = { fg = xresources.green, style = "bold" },
    DapUIBreakpointsDisabledLine = { fg = xresources.light_black },
    DapUIBreakpointsInfo = { fg = xresources.green },
    DapUIBreakpointsPath = { fg = xresources.blue },
    DapUIDecoration = { fg = xresources.blue },
    DapUIFloatBorder = { fg = xresources.blue },
    DapUILineNumber = { fg = xresources.blue },
    DapUIModifiedValue = { fg = xresources.blue, style = "bold" },
    DapUIPlayPause = { fg = xresources.green },
    DapUIRestart = { fg = xresources.green },
    DapUIScope = { fg = xresources.blue },
    DapUISource = { fg = xresources.purple },
    DapUIStepBack = { fg = xresources.blue },
    DapUIStepInto = { fg = xresources.blue },
    DapUIStepOut = { fg = xresources.blue },
    DapUIStepOver = { fg = xresources.blue },
    DapUIStop = { fg = xresources.red },
    DapUIStoppedThread = { fg = xresources.blue },
    DapUIThread = { fg = xresources.green },
    DapUIType = { fg = xresources.purple },
    DapUIUnavailable = { fg = xresources.light_black },
    DapUIWatchesEmpty = { fg = xresources.red },
    DapUIWatchesError = { fg = xresources.red },
    DapUIWatchesValue = { fg = xresources.green },
    DapUIWinSelect = { fg = xresources.blue, style = "bold" },
    DapUIBreakpointsLine = { fg = xresources.blue },
    DapUICurrentFrameName = { fg = xresources.green, style = "bold" },
    DapUIEndofBuffer = { fg = xresources.bg, bg = xresources.none },
    DapUIFloatNormal = { fg = xresources.fg, bg = xresources.bg },
    DapUIFrameName = { fg = xresources.fg, bg = xresources.none },
    DapUINormal = { fg = xresources.fg, bg = xresources.none },
    DapUIValue = { fg = xresources.fg, bg = xresources.none },
    DapUIVariable = { fg = xresources.fg, bg = xresources.none },

    -- ==================
    -- coc menu
    -- ==================
    CocSearch = { bg = xresources.black, fg = xresources.white },
    CocMenuSel = { bg = xresources.green, fg = xresources.black },
  }
  return plugin_syntax
end

local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
  xresources.terminal_color()
  local syntax = xresources.load_plugin_syntax()
  for group, colors in pairs(syntax) do
    xresources.highlight(group, colors)
  end
  async_load_plugin:close()
end))

function xresources.colorscheme()
  vim.api.nvim_command("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "xresources"
  local syntax = xresources.load_syntax()
  for group, colors in pairs(syntax) do
    xresources.highlight(group, colors)
  end
  async_load_plugin:send()
end

xresources.colorscheme()

return xresources
