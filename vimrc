" Configuration file for Vim text editor
"
" Latest revision: 2024-12-25
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatic commands
if has("autocmd")
	" wrap lines at 80th column in Plain Text files
	autocmd FileType text setlocal textwidth=80

	" wrap lines at 80th column in Markdown files
	autocmd FileType markdown setlocal textwidth=80

	" wrap lines at 72nd column in git commit messages
	autocmd BufNewFile,BufReadPre COMMIT_EDITMSG setlocal textwidth=72

	" wrap lines at 72nd column in alpine e-mail client
	autocmd BufNewFile,BufReadPre /tmp/pico.* setlocal textwidth=72

	" use spaces for code indentation in YAML files
	autocmd FileType yaml setlocal expandtab

	" delete empty or whitespace-only lines at the end of file
	autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

	" reduce each group of empty or whitespace-only lines to one empty line
	autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

	" delete all trailing white spaces (caution when editing Markdown)
	autocmd BufWritePre * :%s/\s\+$//ge

	" restore a trailing space in e-mail signature separator (for Alpine)
	autocmd BufWritePre /tmp/pico.* :%s/^--$/--\ /ge

	" format Go source code on save
	autocmd BufWritePre *.go :1,$!gofmt
endif
