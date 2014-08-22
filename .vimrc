execute pathogen#infect()
let $VIM='~/.vim'
let mapleader = " "
let localleader = "\\"

source $VIM/macros/matlab.vim

filetype on
filetype plugin on
filetype indent on

set number
set ai
set ruler
set tabstop=4
set tw=72
set shiftwidth=4
set autoindent
set smartindent
set expandtab

syntax on
set background=dark
colorscheme wombat 

filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Maps
nnoremap <leader><CR> :noh<CR>
noremap _ ^DkPlDjPk^  " Move a line up 
noremap - ddp         " Move a line down
noremap <leader>d 0D  " Delete a line (nice)
inoremap jk <esc>
inoremap kj <esc>

nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <silent> <leader>= :exe "resize " . (winheight(0) *3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) *2/3)<CR>

nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>

nnoremap <leader>qq :q!<CR>
nnoremap <leader>xx :x<CR>
nnoremap <leader>ww :w<CR>

" Add quotes/parens around cursor
nnoremap <leader>" ea"<esc>F a"<esc> 
nnoremap <leader>' ea'<esc>F a'<esc> 
nnoremap <leader>( ea)<esc>F a(<esc> 
nnoremap <leader>[ ea]<esc>F a[<esc> 
" Add space around cursor
nnoremap <leader>s bi <esc>ea <esc>

" Nice buffer helpers
nnoremap gb :buffers<CR>:buffer<Space>

" for Eclim
" ( see http://eclim.org/vim/java/ )
"nnoremap <silent> <buffer> <leader>i :JavaImport<CR>
"nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<CR>
"nnoremap <silent> <buffer> <leader>cs :JavaSearchContext<CR>
"nnoremap <silent> <buffer> <leader>cc :JavaCorrect<CR>
"nnoremap <silent> <buffer> <leader>vv :Validate<CR>

" Abbreviations
iabbrev adn and
iabbrev teh the
iabbrev waht what

" Spelling
set dictionary=/usr/share/dict/words
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
function! SpellToggle()
	if( &spell == 1 )
		setlocal nospell
	else
		setlocal spell spelllang=en_us
	endif
endfunc
noremap <F6> <Esc>:call SpellToggle()<CR>
noremap <silent> F8> :TlistToggle<CR> 

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline " cursorcolumn
  au WinLeave * setlocal nocursorline
augroup END

function! NumberToggle()
	if(&relativenumber==1)
		" If relativenumber is on, turn numbers off
		set relativenumber!
	elseif(&number==1)
		" If absolute line numbering is on,
		" switch to relative numbering
		set relativenumber
	else
		" If no numbers are displayed, turn
		" on absolute numbering
		set number 
	endif
endfunc
noremap <C-h> :call NumberToggle()<CR>

" csv highlighting
hi CSVColumnEven term=bold ctermbg=9 guibg=LightBlue
hi CSVColumnOdd  term=bold ctermbg=0 guibg=LightMagenta

" *********************
" Under consideration *
" *********************
" " Use r for [right-angle braces] and a for <angle braces> like
" vim-surround
" vnoremap ir i]
" vnoremap ar a]
" vnoremap ia i>
" vnoremap aa a>
" onoremap ir i]
" onoremap ar a]
" onoremap ia i>
" onoremap aa a>
