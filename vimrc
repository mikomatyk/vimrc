" Configuration file for Vim text editor
"
" Latest revision: 2024-12-24
"
" Written and unlicensed by Mikołaj Bartnicki <mikolaj@bartnicki.org>;
" please read LICENSE file for details.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" work as Vi Improved instead of pure Vi, must be the first one
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" display language
language en_US.utf8

" display encoding
set encoding=utf8

" write encoding
set fileencoding=utf8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" confirm ':q' in case of unsaved changes
set confirm

" don't make backup~ files
set nobackup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't break long lines by default
set textwidth=0

" tabstop size (columns)
set tabstop=8

" use real tab character, don't fill tabs with spaces
set noexpandtab

" number of spaces for [Tab] and [Backspace]
set softtabstop=8

" code indentation depth
set shiftwidth=8

" indentation tuning, see ':help cinoptions-values' for details
set cinoptions=:0g0(0

" keep indentation when breaking long lines
set breakindent

" don't break long lines in the middle of a word
set linebreak

" don't put an extra space after a dot when joining lines
set nojoinspaces

" [Backspace] over everything in INSERT mode
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight search results
set hlsearch

" do incremental search
set incsearch

" do case insensitive search...
set ignorecase

" ...unless a capital letter is used
set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" display cursor position at the bottom of the screen
set ruler

" non-printable characters display when ':set list' command is used
set listchars=eol:$,tab:>-,space:.,trail:.,extends:+,precedes:+,conceal:=,nbsp:_

" use dark background in terminal
set background=dark

" use RetroBox color scheme
colorscheme retrobox

" enable syntax highlighting
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable filetype detection
filetype on

" load plugins specific for file types
filetype plugin on

" automatically indent code
filetype indent on

" enable '_j' keymap for text justification
runtime macros/justify.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gVim-specific settings
if has("gui_running")
	" window geometry: width
	set columns=85

	" window geometry: height
	set lines=25

	" display line numbers on the left margin
	set number

	" use light background
	set background=light

	" use RetroBox color scheme
	colorscheme retrobox

	" fonts for Windows and Linux
	if has("windows")
		set guifont=Consolas:h16:cEASTEUROPE
	elseif has("unix")
		set guifont=Monospace\ 16
	endif
else
	" disable matching parenthesis highlighting in terminal
	" let loaded_matchparen = 1
endif
