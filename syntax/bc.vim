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
syn keyword bcKeyword define
syn keyword bcKeyword length read sqrt print
syn keyword bcKeyword abs maxibase maxobase maxscale
syn keyword bcKeyword rand irand maxrand

" Variable
syn keyword bcType auto

" Constant
syn keyword bcConstant scale ibase obase last
syn keyword bcConstant seed
syn keyword bcConstant BC_BASE_MAX BC_DIM_MAX BC_SCALE_MAX BC_STRING_MAX
syn keyword bcConstant BC_LONG_BIT BC_BASE_DIGS BC_BASE_POW BC_OVERFLOW_MAX
syn keyword bcConstant BC_NAME_MAX BC_NUM_MAX
syn keyword bcConstant BC_ENV_ARGS BC_LINE_LENGTH BC_EXPR_EXIT
syn keyword bcConstant POSIXLY_CORRECT

" Any other stuff
syn match bcIdentifier		"[a-z_][a-z0-9_]*"

" String
 syn match bcString		"\"[^"]*\"" contains=@Spell

" Number
syn match bcNumber		"[0-9]\+"
syn match bcNumber		"[0-9]*\.[0-9]\+"
syn match bcNumber		"[0-9]\+e-\=[0-9]\+"
syn match bcNumber		"[0-9]*\.[0-9]\+e-\=[0-9]\+"

syn match bcConstant "\."

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

let b:current_syntax = "bc"
" vim: ts=8
