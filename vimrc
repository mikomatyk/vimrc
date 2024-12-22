" Configuration file for Vim text editor
"
" Latest revision: 2024-12-22
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

" gVim-specific settings
if has("gui_running")
	" gVim fonts for Windows and Linux
	if has("windows")
		set guifont=Consolas:h16:cEASTEUROPE
	elseif has("unix")
		set guifont=Monospace\ 16
	endif
endif
