"========================================================
" Highlight All Macro
"========================================================
syn match   cMacro display "\<[A-Z_][A-Z_0-9]*\>\s*"
hi cMacro gui=NONE cterm=bold  ctermfg=darkred

"========================================================
" Highlight All Function
"========================================================
syn match   cFunctions display "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match   cFunctions display "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunctions gui=NONE cterm=bold  ctermfg=DarkCyan

"========================================================
" Highlight All Math Operator
"========================================================
" C math operators
syn match       cMathOperator     display "[-+\*/%=]"

" C pointer operators
syn match       cPointerOperator  display "->\|\."

" C logical   operators - boolean results
syn match       cLogicalOperator  display "[!<>]=\="
syn match       cLogicalOperator  display "=="

" C bit operators
syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
syn match       cBinaryOperator   display "\~"
syn match       cBinaryOperatorError display "\~="

" More C logical operators - highlight in preference to binary
syn match       cLogicalOperator  display "&&\|||"
syn match       cLogicalOperatorError display "\(&&\|||\)="

" Math Operator
hi cMathOperator            gui=NONE cterm=bold ctermfg=green
hi cPointerOperator         gui=NONE cterm=bold ctermfg=green
hi cLogicalOperator         gui=NONE cterm=bold ctermfg=green
hi cBinaryOperator          gui=NONE cterm=bold ctermfg=green
hi cBinaryOperatorError     gui=NONE cterm=bold ctermfg=green
hi cLogicalOperator         gui=NONE cterm=bold ctermfg=green
hi ccLogicalOperator        gui=NONE cterm=bold ctermfg=green
hi cLogicalOperatorError    gui=NONE cterm=bold ctermfg=green

"========================================================
" Highlight Over 80 bytes
"========================================================
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%161v.\+/

"========================================================
" Highlight All Comment 
"========================================================
hi Comment gui=NONE cterm=bold ctermfg=darkblue
