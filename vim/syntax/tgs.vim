" Vim syntax file
" Language: MusicBrainz Picard Tagger Script
" Maintainer: m42i
" Latest Revision: 7 March 2014
" See source: https://github.com/musicbrainz/picard/blob/master/picard/ui/options/scripting.py

" if exists("b:current_syntax")
    " finish
" endif

" Comments are inside $noop() functions
" First we define a functioan that can be inside a comment or inside itself
syn region tgsTransparentFunction start=/$\(noop\)\@![a-zA-Z][_a-zA-Z0-9]*(/ skip=/\\)/ end=/\zs)/ transparent contains=tgsTransparentFunction contained
syn region tgsComment start="$noop(" skip=/\\)/ end=")" contains=tgsTransparentFunction,tgsComment

" All remaining functions
syn region tgsFunction matchgroup=Function start=/$\(noop\)\@![a-zA-Z][_a-zA-Z0-9]*(/ skip=/\\)/ end=/)/ contains=ALL

" Variable that will be written to the music file
syn match tgsWritableTags /%[^_][_a-zA-Z0-9:]*%/
" Variable that is for internal use only
syn match tgsInternalVariable /%_[_a-zA-Z0-9:]*%/

" Non-escaped comma
syn match tgsComma /[^,\\]\+\zs,\ze/ contains=tgsNumbers

let b:current_syntax = "tgs"

" Defines what is inside the function
hi link tgsFunction Statement
hi link tgsComma Function
hi link tgsWritableTags  Constant
hi link tgsInternalVariable Identifier
hi link tgsComment Comment

