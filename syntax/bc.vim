" Vim syntax file
" Language:	bc - An arbitrary precision calculator language
" Maintainer:	Vladimir Scholtz <vlado@gjh.sk>
" Last change:	2020 Apr 17
" 		(Dominique Pelle added @Spell)
" 		(Gavin D. Howard added extensions)
" Available on:	www.gjh.sk/~vlado/bc.vim

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case ignore

" Keywords
syn keyword bcKeyword if else while for break continue return limits halt quit
syn keyword bcKeyword define auto print

" Special keywords
syn keyword bcType length read sqrt
syn keyword bcType abs maxibase maxobase maxscale
syn keyword bcType rand irand maxrand
syn keyword bcType scale ibase obase last
syn keyword bcType seed modexp divmod asciify stream

" Constant
syn keyword bcConstant BC_BASE_MAX BC_DIM_MAX BC_SCALE_MAX BC_STRING_MAX
syn keyword bcConstant BC_LONG_BIT BC_BASE_DIGS BC_BASE_POW BC_OVERFLOW_MAX
syn keyword bcConstant BC_NAME_MAX BC_NUM_MAX
syn keyword bcConstant BC_ENV_ARGS BC_LINE_LENGTH BC_EXPR_EXIT
syn keyword bcConstant POSIXLY_CORRECT

" String
 syn match bcString		"\"[^"]*\"" contains=@Spell

" Number
syn match bcNumber		"\<\([A-Z0-9]\+\)\>"
syn match bcNumber		"\<\([0-9A-Z]*\.[0-9A-Z]\+\)\>"
syn match bcNumber		"\<\([0-9A-Z]\+e-\=[0-9A-Z]\+\)\>"
syn match bcNumber		"\<\([0-9A-Z]*\.[0-9A-Z]\+e-\=[0-9A-Z]\+\)\>"

" Any other stuff
syn match bcIdentifier		"\<\([a-z_][a-z0-9_]*\)\>"

syn match bcFunc		"\<\([a-z_][a-z0-9_]*\)\>("hs=s,he=e-1,ms=s,me=e-1

syn match bcType "\."

" Only highlight 'void' where it is a keyword
syn match bcKeyword		"\svoid\s\+\([a-z_][a-z0-9_]*(\)\@="hs=s+1,he=s+5

" Comment
syn match bcComment		"\#.*" contains=@Spell
syn region bcComment		start="/\*" end="\*/" contains=@Spell

" Parent ()
syn cluster bcAll contains=bcList,bcIdentifier,bcNumber,bcKeyword,bcType,bcConstant,bcString,bcParenError
syn region bcList		matchgroup=Delimiter start="(" skip="|.\{-}|" matchgroup=Delimiter end=")" contains=@bcAll
syn region bcList		matchgroup=Delimiter start="\[" skip="|.\{-}|" matchgroup=Delimiter end="\]" contains=@bcAll
syn match bcParenError			"]"
syn match bcParenError			")"

syn case match

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link bcKeyword		Statement
hi def link bcType		Type
hi def link bcConstant		Constant
hi def link bcNumber		Number
hi def link bcComment		Comment
hi def link bcString		String
hi def link bcSpecialChar		SpecialChar
hi def link bcParenError		Error
hi def link bcIdentifier		None
hi def link bcFunc				Function

syn keyword bcTodo contained TODO FIXME XXX NOTE
syn cluster bcCommentGroup contains=bcTodo
syn region bcComment start="/\*" end="\*/" contains=@bcCommentGroup fold
syn region bcComment start="#" end="$" contains=bcTodo

hi def link bcTodo        Todo

let b:current_syntax = "bc"
" vim: ts=8
