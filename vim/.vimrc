let mapleader = ","

" Use a line cursor in insert mode 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Use Vim settings, rather than Vi settings (much better!).
set nocompatible

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Syntax highlighting always on
syntax on

" Detect filetype then load plugin file, set syntax highlighting,
" and set indentation accordingly
filetype plugin indent on

" Saves backup, swap, and undo files to ~/.vim/tmp instead of current directory
if !isdirectory($HOME . '/.vim/tmp')
    call mkdir($HOME . '/.vim/tmp', 'p', 0777)
endif

set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp

" Keep a swap file, backup file, and undo file
set swapfile
set backup
set undofile

" Keep 1000 lines of command line history
set history=1000

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" Automatically reload a file if it is changed outside of vim
set autoread

" Enable mouse support
if has('mouse')
    set mouse=a
endif

" Tab settings
set virtualedit=onemore " Allow moving cursor one character past the end of the line
set autoindent
set smartindent
set expandtab
set tabstop=2        " Tab width is 2 spaces
set shiftwidth=2     " Indent also with 2 spaces

" Always show statusline
set laststatus=2

" Override filetype detection for .h files to C
augroup override_filetype_detection
    autocmd!
    autocmd BufRead,BufNewFile *.h set filetype=c
augroup END

" Intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Search settings: Ignore case in searches, but respect case if the search pattern contains uppercase characters
set ignorecase

" Line numbers on
set number

" Relative line numbers on
set relativenumber

" Prevent vim from creating backup files while editing
set nobackup
set nowritebackup

" Better Copy-Pasting: Avoid unexpected effects when pasting text into Vim from outside
set pastetoggle=<F2>
set clipboard=unnamed

" Ctag 
set tags=tags

set wildmenu
set wildmode=longest:full,full

" Ctrl-N starts completion Ctrl-P moves up, Ctrl-L to quickly select the first
" option
inoremap <C-L> <C-N><C-P><C-N>

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice. Bound Enter for
" autocompletiong 
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" something else 
" something lse instead 
nnoremap <Leader>w :w<CR>

" Automatically jump to the end of text you pasted:
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`] 

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Configure vim to jump to the last known cursor position when opening a file
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Load the mapping from cscope_maps.vim everytime Vim starts
" source ~/.vim/configs/cscope_maps.vim

" prettier command for coc . Run :Prettier or it automatically runs on save
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html :CocCommand prettier.formatFile

nnoremap <C-p> :Files<Cr>
nnoremap <C-b> :Buffers<Cr>
nnoremap <C-g> :GFiles<Cr>
nnoremap <C-f> :Rg<Cr>


" Open NERDTree automatically when vim starts up on opening a directory
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']

" Vim-plug settings
call plug#begin('~/.vim/plugged')
" Add your plugins here, for example:
" Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'github/copilot.vim'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'morhetz/gruvbox'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Additional custom settings can be added below
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-clangd',
    \ 'coc-go'
    \ ]

" Coc settings
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <rr> <Plug>(coc-rename)
nmap <Leader>rn <Plug>(coc-rename)
" nmap <silent> gp :call CocAction('doHover')<CR>

:highlight CocFloating ctermbg=DarkGrey
:highlight CocFloating ctermfg=White

" Use K to show documentation in preview window
nnoremap <silent>gp :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Vim-Go 
nnoremap <Leader>ne :cnext<CR> 
nnoremap <Leader>pe :cprevious<CR>
nnoremap <Leader>ce :cclose<CR>

" run :GoTest and GoRun
autocmd FileType go nmap <Leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

autocmd FileType go nmap <Leader>f <Plug>(go-decls-dir)
autocmd FileType go nmap <Leader>l <Plug>(go-decls)

autocmd FileType go nmap <Leader>n :GoRename

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" fugitive git bindings
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>ga :Git add
nnoremap <Leader>gc :Git commit
nnoremap <Leader>gd :Git diff
nnoremap <Leader>gl :Git log
nnoremap <Leader>gb :Git blame
nnoremap <Leader>gp :Git split
nnoremap <Leader>gv :Git vdiffsplit

nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

set bg=dark
set termguicolors
colorscheme gruvbox
