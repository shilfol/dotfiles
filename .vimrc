let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete')

" Unite.vim
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/neomru.vim')

" neosnippets
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

" git tools
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')

" file tree
call dein#add('scrooloose/nerdtree')


" color scheme
call dein#add('tomasr/molokai')
" left-below mode preview
call dein#add('itchyny/lightline.vim')

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

colorscheme molokai

" enable moving right at visual
set virtualedit=block
" enable backspace in insert mode
set backspace=indent,eol,start

set ambiwidth=double

set wildmenu

set autoread

set fenc=utf-8

" search
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

"preview
set noerrorbells

set shellslash

set showmatch matchtime=1

set cinoptions+=:0

set cmdheight=2

set laststatus=2

set showcmd

set display=lastline

set listchars=tab:^\ ,trail:~

set history=10000

hi Comment ctermfg=3

set expandtab

set shiftwidth=2

set softtabstop=2

set tabstop=2
" delete toolbar
set guioptions-=T
" yank to clipboard
set guioptions+=a

set guioptions-=m

set showmatch

set smartindent

set noswapfile

set title
" show number
set number

set clipboard=unnamed,autoselect

nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

syntax on

set nrformats=

set whichwrap=b,s,h,l,<,>,[,],~

set mouse=a

set wildmode=list:longest

set formatoptions+=mM

set ruler

set showmode

set wrap

" Neocomplete settings

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion = 1
let g:neocomplete#max_list = 10
let g:neocomplete#sources#syntax#min_keyword_length = 3
" set start length
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#enable_auto_close_preview = 0

let g:neocomplete#max_keyword_width = 10000




" Neosnippet settings

imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \   "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets'

" NERDtree 
let NERDTreeShowHidden = 1
map <C-o> :NERDTreeToggle<CR>


" Light line settings
let g:lightline = {
    \ 'active': {
    \   'left': [ ['mode','paste'],
    \             ['gitinfo','readonly','filename','modified']]
    \ },
    \ 'component_function': {
    \   'gitinfo': 'Fugitives'
    \ }
    \}

function! Fugitives()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._: ''
    endif
  catch
  endtry
  return ''
endfunction
