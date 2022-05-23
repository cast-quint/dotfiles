"""""""""""""""""""""""""
"       plugins         "
"""""""""""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'xuhdev/vim-latex-live-preview'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'matze/vim-move'
Plug 'fladson/vim-kitty'
Plug 'tibabit/vim-templates'
Plug 'ntpeters/vim-better-whitespace'
Plug 'justinmk/vim-syntax-extra'

call plug#end()

"""""""""""""""""""""""""
"   lightline config    "
"""""""""""""""""""""""""

let g:lightline = { 'colorscheme': 'molokai' }

"""""""""""""""""""""""""

set number relativenumber   " enable relative line numbers
set termguicolors           " enable truecolor (i think)
set showmatch               " show matching
syntax on                   " syntax highlighting
colorscheme afterglow       " set the colorscheme

let g:afterglow_blackout=1

set incsearch               " incremental search
set hlsearch                " highlight search
set ignorecase              " case insensitive

filetype plugin indent on   " allow auto-indenting depending on file type
set tabstop=4               " number of columns occupied by a tab
set expandtab               " converts tabs to white space
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set autoindent              " indent a new line the same amount as the line just typed
set shiftwidth=4            " width for autoindents

set mouse=a                 " enable mouse click
set clipboard+=unnamedplus  " using system clipboard

set noshowmode              " dont show current mode, handled by lighline.vim
set ttyfast                 " Speed up scrolling in Vim
set noswapfile              " disable creating swap file

set backspace=2             " make backspace work like most other programs

set keymap=greek_utf-8
set iminsert=0

" vim-better-whitespace settings
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

let mapleader = ";"        " set the leader to ';'

" Quickly edit init.vim
nnoremap <Leader>ve :tabnew $MYVIMRC<CR>

" Clear highlighted search text after pressing enter, and do it silently
nnoremap <silent> <CR> :nohlsearch<CR><CR> :echon ''<CR>

" Toggle NERDTree
nnoremap <Space><Space> :NERDTreeToggle<CR>

" Sane tab navigation
nnoremap <C-n>   :tabnew<CR>
nnoremap <C-w>   :tabclose<CR>
nnoremap <S-Tab> :tabn<CR>

" Sane split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make Ctrl-Backspace delete previous word in insert mode (gui-like)
noremap! <C-BS> <C-w>
noremap! <C-h>  <C-w>

" Make Tab change indent in visual mode (gui-like)
vmap <Tab>   >gv
vmap <S-Tab> <gv

" Use // to search for visualy selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Make scripts executable on exit
autocmd BufWinLeave *.py,*.sh !chmod +x %:p

" C mappings
autocmd FileType c inoremap cc<CR> /*  */<esc>2hi

" LaTex mappings
autocmd FileType tex nnoremap <Leader>p :LLPStartPreview<CR>
autocmd FileType tex inoremap lra<CR> \Leftrightarrow
autocmd FileType tex inoremap bf<CR> \textbf{++}<Esc>/++<CR>NciB
"autocmd FileType tex inoremap fle<CR> \foreignlanguage{english}{++}<Esc>/++<CR>NciB
autocmd FileType tex inoremap flg<CR> \foreignlanguage{greek}{++}<Esc>/++<CR>NciB
autocmd FileType tex inoremap fr<CR> \frac{++}{++}<Esc>/++<CR>NNciB
autocmd FileType tex inoremap d<CR> \cdot
autocmd FileType tex inoremap ex<CR> \begin{exercise}<CR><CR>++<CR><CR>\end{exercise}<Esc>/++<CR>Nciw
autocmd FileType tex inoremap gq<CR> \begin{gquestion}<CR><CR>++<CR><CR>\end{gquestion}<Esc>/++<CR>Nciw
autocmd FileType tex inoremap q<CR> \begin{question}<CR><CR>++<CR><CR>\end{question}<Esc>/++<CR>Nciw
autocmd FileType tex inoremap li<CR> \begin{itemize}<CR>\item ++<CR>\end{itemize}<Esc>/++<CR>Nciw
autocmd FileType tex inoremap fi<CR> \begin{figure}[h!]<CR>\includegraphics[width=\linewidth]{++}<CR>\caption{++}<CR>\end{figure}<Esc>

autocmd FileType tex inoremap sle<CR> \selectlanguage{english}<CR>
autocmd FileType tex inoremap slg<CR> \selectlanguage{greek}<CR>
autocmd FileType tex inoremap ma<CR>  \begin{vmatrix} \end{vmatrix}

" VIM-TEMPLATES SETTINGS
let g:tmpl_search_paths = [stdpath('config') . '/templates']
let g:tmpl_author_email = 'dummy@dummy.com'

" Source COC settings
source $XDG_CONFIG_HOME/nvim/coc-settings.vim

