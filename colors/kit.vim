" This color scheme was inspired by the KIT corporate design as laid
" out in https://www.sek.kit.edu/downloads/2_Gestaltungsgrundlagen_Farben.pdf.
" Copyright 2022 Max Schik

" Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
" Max Schik wrote this file. As long as you retain this notice you
" can do whatever you want with this stuff. If we meet some day, and you think
" this stuff is worth it, you can buy me a beer or coffee in return


set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "kit"
set t_Co=256
if !exists("g:kit_italic")
  let g:kit_italic = 1
endif
if !exists("g:kit_bold")
  let g:kit_bold = 1
endif
if !exists("g:kit_light")
  let g:kit_light = 0
endif

let background_color = ["#000000", "#050505", "#111111", "#222222", "#333333", "#444444"]
let foreground_color = ["#ffffff", "#dddddd", "#bbbbbb", "#999999", "#777777"]
let kit_exclusive_green = ["#009682", "#00bca9", "#72ccbf", "#acdfd6", "#d4ede9"]
let kit_exclusive_blue = ["#2075b8", "#6f93c8", "#94acd5", "#bbc8e4", "#dbe3f1"]
let kit_may_green = ["#68c152", "#97d07e", "#b3dba0", "#d0e8c3", "#e6f2df"]
let kit_yellow = ["#ffe844", "#ffef7b", "#fff2a1", "#fff7c5", "#ffeeda"]
let kit_orange = ["#fd9c3a", "#ffb86c", "#ffcb91", "#ffddb8", "#ffddb8", "#ffeeda"]
let kit_brown = ["#b48640", "#c8a36c", "#d5b98e", "#e4d1b6", "#f2e7d7"]
let kit_red = ["#c62033", "#d56959", "#df8f7d", "#ecb8a8", "#f4d9ce"]
let kit_lila = ["#c2028a", "#d067a9", "#db91be", "#e8bad6", "#f2dae9"]
let kit_cyan_blue = ["#00ace6", "#0cbfeb", "#75cef0", "#afe0f5", "#d6eff9"]

fun! SetHighlight(comp, settings)
  let command_string = "hi! " . a:comp
  for [key,value] in items(a:settings)
    let value = FilterValue(value)
    if len(value) == 0
      echo value
      continue
    endif
    let command_string .= " " . key . "=" . value
    unlet key value
  endfor
  execute command_string
endf

fun! FilterValue(value)
  let new_value = a:value
  if g:kit_italic == 0 && stridx(new_value, "italic") > -1
    let new_value = substitute(new_value, 'italic\(,\?\)', "", "")
  endif
  if g:kit_bold == 0 && stridx(new_value, "bold") > -1
    let new_value = substitute(new_value, 'bold\(,\?\)', "", "")
  endif
  return new_value
endf

fun! ApplyGroup(group)
  for [comp, settings] in items(a:group)
    call SetHighlight(comp, settings)
    unlet comp settings
  endfor
endf

"
" DARK COLORS
"
" main config
let syntax_groups_dark = {
      \"Normal"       : {"guifg": foreground_color[1], "guibg": background_color[0]},
      \"EndOfBuffer"  : {"guifg": foreground_color[1], "guibg": background_color[0]},
      \"Error"        : {"guifg": foreground_color[0], "guibg": kit_red[0]},
      \"Todo"         : {"guifg": background_color[0], "guibg": foreground_color[0]},
      \"Comment"      : {"guifg": foreground_color[4], "gui": "italic"},
      \"Underlined"   : {"guifg": kit_exclusive_green[1]},
      \"Constant"     : {"guifg": kit_lila[1]},
      \"String"       : {"guifg": kit_cyan_blue[3]},
      \"Identifier"   : {"guifg": kit_exclusive_green[2], "gui": "italic"},
      \"Function"     : {"guifg": kit_exclusive_blue[1]},
      \"Statement"    : {"guifg": kit_exclusive_green[0], "gui": "bold"},
      \"Keyword"      : {"guifg": kit_exclusive_green[0], "gui": "bold"},
      \"Special"      : {"guifg": kit_cyan_blue[1]},
      \"PreProc"      : {"guifg": kit_exclusive_green[0]},
      \"Type"         : {"guifg": kit_exclusive_blue[0], "gui": "italic"},
      \"StorageClass" : {"guifg": kit_exclusive_blue[1], "gui": "italic,bold"},
\}

let line_nr_groups_dark = {
      \"SignColumn" : {"guifg": kit_red[1], "guibg": background_color[2]},
      \"LineNr" : {"guifg": foreground_color[2], "guibg": background_color[2]},
\}

let gui_element_groups_dark = {
      \"WinSeperator" : {"guifg": kit_exclusive_green[0], "guibg": kit_exclusive_green[0]},
      \"Visual"       : {"guifg": kit_exclusive_blue[0], "guibg": kit_exclusive_green[4]},
\}

let pmenu_groups_dark = {
      \"Pmenu"    : {"guifg": foreground_color[2], "guibg": background_color[2]},
      \"PmenuSel" : {"guifg": foreground_color[0], "guibg": kit_exclusive_blue[1]},
\}

let misc_groups_dark = {
      \"Title"  : {"guifg": foreground_color[0]},
      \"Search" : {"guifg": background_color[1], "guibg": kit_may_green[1]},
      \"ColorColumn" : {"guifg": foreground_color[3], "guibg": background_color[3]},
      \"DiffAdd" : {"guifg": kit_may_green[0], "guibg": background_color[0]},
      \"DiffDelete" : {"guifg": kit_red[0], "guibg": background_color[0]},
      \"DiffChange" : {"guifg": kit_orange[0], "guibg": background_color[0]},
      \"Folded"       : {"guifg": kit_exclusive_green[2],  "guibg": background_color[3]},
\}

let lsp_groups_dark = {
      \"LspReferenceText" : {"guifg": foreground_color[1], "guibg": kit_lila[1]},
      \"LspReferenceRead" : {"guifg": foreground_color[1], "guibg": kit_lila[1]},
      \"LspReferenceWrite" : {"guifg": foreground_color[1], "guibg": kit_red[1]},
\}
let plugin_groups_dark = {
      \"IndentBlanklineChar" : {"guifg": background_color[5], "gui": "nocombine"},
      \"IndentBlanklineSpaceChar" : {"guifg": background_color[5], "gui": "nocombine"},
      \"CursorLine" : {"guibg": background_color[3]},
      \"CursorLineNr" : {"guifg": kit_exclusive_green[0]},
\}

"
" LIGHT COLORS
"
" main config
let syntax_groups_light = {
      \"Normal"       : {"guifg": background_color[0], "guibg": foreground_color[0]},
      \"EndOfBuffer"  : {"guifg": background_color[0], "guibg": foreground_color[0]},
      \"Error"        : {"guifg": background_color[0], "guibg": kit_red[0]},
      \"Todo"         : {"guifg": background_color[0], "guibg": background_color[0]},
      \"Comment"      : {"guifg": background_color[4], "gui": "italic"},
      \"Underlined"   : {"guifg": kit_exclusive_green[0]},
      \"Constant"     : {"guifg": kit_lila[0]},
      \"String"       : {"guifg": kit_cyan_blue[0]},
      \"Identifier"   : {"guifg": kit_exclusive_green[0], "gui": "italic"},
      \"Function"     : {"guifg": kit_exclusive_blue[0]},
      \"Statement"    : {"guifg": kit_exclusive_green[0], "gui": "bold"},
      \"Keyword"      : {"guifg": kit_exclusive_green[0], "gui": "bold"},
      \"Special"      : {"guifg": kit_cyan_blue[0]},
      \"PreProc"      : {"guifg": kit_exclusive_green[0]},
      \"Type"         : {"guifg": kit_exclusive_blue[0], "gui": "italic"},
      \"StorageClass" : {"guifg": kit_exclusive_blue[1], "gui": "italic,bold"},
\}

let line_nr_groups_light = {
      \"SignColumn" : {"guifg": kit_red[1], "guibg": foreground_color[0]},
      \"LineNr" : {"guifg": background_color[2], "guibg": foreground_color[0]},
\}

let gui_element_groups_light = {
      \"WinSeperator" : {"guifg": kit_exclusive_green[0], "guibg": kit_exclusive_green[0]},
      \"Visual"       : {"guifg": kit_exclusive_blue[0], "guibg": kit_exclusive_green[4]},
\}

let pmenu_groups_light = {
      \"Pmenu"    : {"guifg": kit_exclusive_green[0], "guibg": background_color[3]},
      \"PmenuSel" : {"guifg": foreground_color[0], "guibg": kit_exclusive_blue[1]},
\}

let misc_groups_light = {
      \"Title"  : {"guifg": foreground_color[0]},
      \"Search" : {"guifg": background_color[1], "guibg": kit_may_green[1]},
      \"ColorColumn" : {"guifg": foreground_color[3], "guibg": background_color[3]},
      \"DiffAdd" : {"guifg": kit_may_green[0], "guibg": background_color[1]},
      \"DiffDelete" : {"guifg": kit_red[0], "guibg": background_color[1]},
      \"DiffChange" : {"guifg": kit_orange[0], "guibg": background_color[1]},
      \"Folded"       : {"guifg": kit_exclusive_green[2],  "guibg": background_color[3]},
\}

let lsp_groups_light = {
      \"LspReferenceText" : {"guifg": foreground_color[1], "guibg": kit_lila[1]},
      \"LspReferenceRead" : {"guifg": foreground_color[1], "guibg": kit_lila[1]},
      \"LspReferenceWrite" : {"guifg": foreground_color[1], "guibg": kit_red[1]},
\}


if (g:kit_light == 0)
  call ApplyGroup(syntax_groups_dark)
  call ApplyGroup(line_nr_groups_dark)
  call ApplyGroup(gui_element_groups_dark)
  call ApplyGroup(pmenu_groups_dark)
  call ApplyGroup(misc_groups_dark)
  call ApplyGroup(plugin_groups_dark)
else
  call ApplyGroup(syntax_groups_light)
  call ApplyGroup(line_nr_groups_light)
  call ApplyGroup(gui_element_groups_light)
  call ApplyGroup(pmenu_groups_light)
  call ApplyGroup(misc_groups_light)
endif

