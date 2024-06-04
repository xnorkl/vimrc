"------general configs

"------sanity
set shell=/bin/bash
set mouse=a
set number
set nospell
set hlsearch
set laststatus=2
set encoding=utf-8
set expandtab
set textwidth=0
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set backspace=indent,eol,start
set incsearch
set ignorecase
set ruler
set wildmenu
set smarttab
syntax on

"-------usefual mappings
let mapleader = ";"
map <leader>l :bn<cr>
map <leader>h :bp<cr>
map <leader>j :bd<cr>

set background=dark

"--------highlights
hi Error ctermfg=Black
hi Error ctermbg=Red
hi BadWhiteSpace ctermfg=Black ctermbg=Yellow

"--------file
filetype indent on
filetype plugin on
filetype on

"--------cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"--------clipboard
if has('unnamedplus')
   set clipboard=unnamed,unnamedplus
endif

"---------buffer
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

"--------language-specific
"--------Python, C, Haskell, etc
au BufNewFile,BufRead *.py,*.c,*.h,*.pl,*.php set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=99
au BufNewFile,BufRead *.py,*.c,*.h set expandtab smartindent

"--------haskell
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_typeroles = 1

"--------python
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = "2"

au BufNewFile,BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufNewFile,BufRead *.py,*.c,*.h match BadWhiteSpace /\s\+\%#\@<!$/

"--------full stack web dev
au BufNewFile,BufRead *.js,*.html,*.css,*.json,*.xml,*.yml set tabstop=2 expandtab


"--------powershell
let ps1_nofold_blocks=1
"let ps1_nofold_sig=1
"let ps1_nofold_region=1

"--------plugin-specific

"--------latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set runtimepath=~/.vim,~/.vim/colors,$VIM/vimgiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

"--------ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1
let g:ale_set_ballons = 0
let g:ale_python_flake8_executable = 'python3'
let g:ale_set_highlights = 1
nnoremap<Leader>ht :GhcModType<cr>
nnoremap<Leader>htc :GhcModTypeClear<cr>
autocmd FileType haskell nnoremap<buffer><leader>?:call ale#cursor#ShowCursorDetail()<cr>

"--------ranger
let g:ranger_replace_netrw = 1

"--------vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
autocmd Bufenter *.hs set formatprg = pointfree

"--------vim-latex-live
autocmd Filetype tex setl updatetime=1
"let g:livepreview_previewer = 'open -a zathura'

"--------plugins

call plug#begin()
" i should add descriptions to all this shit

Plug 'vim-scripts/OmniCppComplete'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-obsession'
Plug 'ap/vim-buftabline'
Plug 'wincent/command-t'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'honza/vim-snippets'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim'
Plug 'w0rp/ale'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'eagletmt/ghcmod-vim'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'raichoo/haskell-vim'
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim'
Plug 'francoiscabrol/ranger.vim'
Plug 'davidhalter/jedi-vim'
Plug 'dhruvasagar/vim-prosession'
Plug 'SirVer/ultisnips', { 'for': [] }
Plug 'PProvost/vim-ps1'
Plug 'danielepiccone/vim-css-indent'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
augroup load_ultisnips
  autocmd!
  autocmd FileType php,javascript,ruby,haskell call plug#load('ultisnips')
    \| execute 'autocmd! load_ultisnips' | doautocmd FileType
augroup END
call plug#end()            
filetype plugin indent on    
