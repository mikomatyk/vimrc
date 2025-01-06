" Configuration file for Vim text editor
"
" Latest revision: 2025-01-05
"
" Written and unlicensed by Mikołaj Bartnicki <mikolaj@bartnicki.org>;
" please read LICENSE file for details.
"
" Known bug:
" Formatting code using [F7] in Normal mode resets the cursor position

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

	" force tabs for Rust code indentation (FileType plugin uses 4 spaces)
	autocmd FileType rust setlocal noexpandtab shiftwidth=8

	" use spaces for code indentation in YAML files, as required by YAML
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
	if executable("gofmt")
		autocmd BufWritePre *.go :1,$!gofmt
	endif

	" format Rust source code on save
	if executable("rustfmt")
		autocmd BufWritePre *.rs :1,$!rustfmt
	endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" center the view on the next search result
nnoremap n nzz
nnoremap N Nzz

" press [F1] to toggle displaying line numbers (default for [F1] is :help)
nnoremap <F1> :set number!<CR>
inoremap <F1> <C-o>:set number!<CR>

" press [Ctrl]+[F1] to toggle showing non-printable characters
nnoremap <C-F1> :set list!<CR>
inoremap <C-F1> <C-o>:set list!<CR>

" press [Alt]+[F1] to toggle background between light and dark
nnoremap <M-F1> :let &bg = (&bg == "dark" ? "light" : "dark")<CR>
inoremap <M-F1> <C-o>:let &bg = (&bg == "dark" ? "light" : "dark")<CR>

" press [F2] to set tabstop/shiftwidth to 2 columns
nnoremap <F2> :set tabstop=2 softtabstop=2 shiftwidth=2<CR>
inoremap <F2> <C-o>:set tabstop=2 softtabstop=2 shiftwidth=2<CR>

" press [F3] to set tabstop/shiftwidth to 4 columns
nnoremap <F3> :set tabstop=4 softtabstop=4 shiftwidth=4<CR>
inoremap <F3> <C-o>:set tabstop=4 softtabstop=4 shiftwidth=4<CR>

" press [F4] to set tabstop/shiftwidth to 8 columns
nnoremap <F4> :set tabstop=8 softtabstop=8 shiftwidth=8<CR>
inoremap <F4> <C-o>:set tabstop=8 softtabstop=8 shiftwidth=8<CR>

" press [F5] to turn search results highlight off
nnoremap <F5> :nohl<CR>
inoremap <F5> <C-o>:nohl<CR>

" press [F6] to English spellcheck (z= for proposed corrections)
nnoremap <F6> :set spell! spelllang=en<CR>
inoremap <F6> <Esc>:set spell! spelllang=en<CR>

" press [Ctrl]+[F6] to Polish spellcheck (z= for proposed corrections)
nnoremap <C-F6> :set spell! spelllang=pl<CR>
inoremap <C-F6> <Esc>:set spell! spelllang=pl<CR>

" press [F7] to fix indentation in the whole file
nnoremap <F7> mxggVG=`xzz
inoremap <F7> <Esc>mxggVG=`xzza

" press [Ctrl]+[F7] to justify current paragraph (macros/justify.vim required)
nmap <C-F7> mxvip_j`xzz
imap <C-F7> <Esc>mxvip_j`xzza

" press [Alt]+[F7] to justify the whole file (macros/justify.vim required)
nmap <M-F7> mx_j`xzz
imap <M-F7> <Esc>mx_j`xzza

" press [F8] to sort current paragraph
nnoremap <F8> mxvip:sort<CR>`xzz
inoremap <F8> <Esc>mxvip:sort<CR>`xzza

" press [Ctrl]+[F8] to sort current paragraph removing duplicate lines
nnoremap <C-F8> mxvip:sort u<CR>`xzz
inoremap <C-F8> <Esc>mxvip:sort u<CR>`xzza

" press [F9] to automatically break long lines at 50th column
nnoremap <F9> :set textwidth=50<CR>
inoremap <F9> <C-o>:set textwidth=50<CR>

" press [F10] to automatically break long lines at 72nd column
nnoremap <F10> :set textwidth=72<CR>
inoremap <F10> <C-o>:set textwidth=72<CR>

" press [F11] to automatically break long lines at 80th column
nnoremap <F11> :set textwidth=80<CR>
inoremap <F11> <C-o>:set textwidth=80<CR>

" press [F12] to disable breaking long lines
nnoremap <F12> :set textwidth=0<CR>
inoremap <F12> <C-o>:set textwidth=0<CR>
