" Configuration file for gVim text editor
"
" GUI-specific settings for gVim that complement the shared configurations
" defined in the 'vimrc' file. This file is an extension of 'vimrc' and does
" not replace it. Make sure both are properly loaded.
"
" Latest revision: 2025-01-18
"
" Created and unlicensed by Mikołaj Bartnicki <mikolaj@bartnicki.org>;
" please read UNLICENSE file for details.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set window width - number of columns.
set columns=85

" Set window height - number of lines.
set lines=25

" Display line numbers on the left margin.
set number

" Use light background.
set background=light

" Use 'retrobox' color scheme.
colorscheme retrobox

" Set font face and size.
" - size: desired font size.
function! Set_font(size)
	if has("windows")
		execute 'set guifont=Consolas:h' . a:size . ':cEASTEUROPE'
	elseif has("unix")
		execute 'set guifont=Monospace\ ' . a:size
	endif
endfunction

" Set the default font size.
call Set_font(12)

" Press [Ctrl]+[F2] to set font size to 12.
nnoremap <C-F2> :call Set_font("12")<CR>
inoremap <C-F2> <C-o>:call Set_font("12")<CR>

" Press [Ctrl]+[F3] to set font size to 14.
nnoremap <C-F3> :call Set_font("14")<CR>
inoremap <C-F3> <C-o>:call Set_font("14")<CR>

" Press [Ctrl]+[F4] to set font size to 16.
nnoremap <C-F4> :call Set_font("16")<CR>
inoremap <C-F4> <C-o>:call Set_font("16")<CR>
