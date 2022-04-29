hi clear
syntax reset
let g:colors_name = "kit"
set background=dark
set t_Co=256

let background_color = ["#000000", "#111111", "#222222", "#333333", "#444444"]
let foreground_color = ["#ffffff", "#dddddd", "#bbbbbb", "#999999", "#777777"]
let kit_exclusive_green = ["#00a88f", "#00bca9", "#72ccbf", "#acdfd6", "#d4ede9"]
let kit_exclusive_blue = ["#2075b8", "#6f93c8", "#94acd5", "#bbc8e4", "#dbe3f1"]
let kit_may_green = ["#68c152", "#97d07e", "#b3dba0", "#d0e8c3", "#e6f2df"]
let kit_yellow = ["#ffe844", "#ffef7b", "#fff2a1", "#fff7c5", "#ffeeda"]
let kit_orange = ["#fd9c3a", "#ffb86c", "#ffcb91", "#ffddb8", "#ffddb8", "#ffeeda"]
let kit_brown = ["#b48640", "#c8a36c", "#d5b98e", "#e4d1b6", "#f2e7d7"]
let kit_red = ["#c62033", "#d56959", "#df8f7d", "#ecb8a8", "#f4d9ce"]
let kit_lila = ["#c2028a", "#d067a9", "#db91be", "#e8bad6", "#f2dae9"]
let kit_cyan_blue = ["#00ace6", "#0cbfeb", "#75cef0", "#afe0f5", "#d6eff9"]

func SetColor(comp, color, ...)
  if a:0 > 0
    let bg = a:1
  else
    let bg = "NONE"
  end
  exe 'hi! ' . a:comp . ' guifg=' . a:color . ' guibg=' . bg
endf


call SetColor("Normal", foreground_color[1], background_color[3])
call SetColor("EndOfBuffer", foreground_color[1], background_color[3])

call SetColor("Error", foreground_color[0], kit_red[0])
call SetColor("Todo", background_color[0], foreground_color[0])

call SetColor("Comment", foreground_color[4])

call SetColor("Underlined", kit_exclusive_green[1])

" Constant
call SetColor("Constant", kit_lila[1])
call SetColor("String", kit_yellow[2])

" Identifier
call SetColor("Identifier", kit_exclusive_green[2])
call SetColor("Function", kit_exclusive_blue[0])

" Statement
call SetColor("Statement", kit_exclusive_green[0])
call SetColor("Keyword", kit_exclusive_green[0])

" Special
call SetColor("Special", kit_cyan_blue[1])


call SetColor("PreProc", kit_exclusive_green[0])

call SetColor("Type", kit_exclusive_blue[1])
