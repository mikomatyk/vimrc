" Configuration file for Vim text editor
"
" Latest revision: 2024-12-23
"
" Written and unlicensed by Mikołaj Bartnicki <mikolaj@bartnicki.org>;
" please read LICENSE file for details.

" work as Vi Improved instead of pure Vi, must be the first one
set nocompatible

" display language
language en_US.utf8

" display encoding
set encoding=utf8

" write encoding
set fileencoding=utf8

" use dark background in terminal
set background=dark

" use RetroBox color scheme
colorscheme retrobox

" enable syntax highlighting
syntax on

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
endif
