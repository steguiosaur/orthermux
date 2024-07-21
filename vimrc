" ===================== OPTIONS =====================
set number " show numberline
set relativenumber " relative numberline

set expandtab " enables space for tabs
set tabstop=4 " number of spaces in a tab
set softtabstop=4 " spaces per <Tab> and <Backspace>
set autoindent " copy indent from previous line
set shiftwidth=4 " space for indentation

set hlsearch " highlight searched words
set incsearch " show search current matched patterns
set ignorecase " case insensitive search
set smartcase " override 'ignorecase'
set cursorline " highlight current cursor line
set showmatch " show matching parenthesis and brackets

set wrap " wrap lines extending the window
set breakindent " linebreak follows indentation
set breakat+=" ^!@*-+;:,./?" " linebreakable characters
set linebreak " break long lines in 'breakat'
set conceallevel=0 " reveal syntax on Markdown files
set fileencoding=utf8 " file encoding in buffer
set textwidth=80 " no string limitation
set colorcolumn=+1
set shortmess+=af " shorten message prompts

set scrolloff=5 " lines above and below cursor
set mouse=a " mouse support

set laststatus=2 " last window statusline enable
set showtabline=1 " shows tabline
set signcolumn=yes " shows signcolumn
set modeline " file specific options on comments
set clipboard^=unnamed
set confirm " confirm on exit

set wildmenu " command completion on <Tab>
set wildmode=longest,full " event on <Tab>
set wildignore=*.o,*.docx,*.pdf,*.jpg,*.png,*.gif,*.img

set termguicolors " enable 24-bit RGB color in the TUI
set hidden " hide current unsaved edited file on :e
set title " show filename and directory on titlestring
set undofile " persistent undo
set pumheight=10 " visible
set noswapfile " swapfiles for recovery
set updatetime=250

" =================== COLORSCHEME ===================

colorscheme sorbet

" ===================== KEYMAPS =====================
let mapleader = " "
let maplocalleader = " "

" line navigation
nnoremap <S-j> }
nnoremap <S-k> {
vnoremap <S-j> }
vnoremap <S-k> {
nnoremap <S-n> <C-d>
nnoremap <S-m> <C-u>
vnoremap <S-n> <C-d>
vnoremap <S-m> <C-u>

" insert mode navigation
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" move text up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" change word 
" nnoremap <leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
" disable yank on paste
vnoremap p "_dP

" vertical and horizontal window
nnoremap <leader>v <C-w>v
nnoremap <leader>h <C-w>s

" window navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" window resize
nnoremap<silent> <C-Up> <cmd>resize +2<cr>
nnoremap<silent> <C-Down> <cmd>resize -2<cr>
nnoremap<silent> <C-Left> <cmd>vertical resize -2<cr>
nnoremap<silent> <C-Right> <cmd>vertical resize +2<cr>

" window vertical to horizontal (vice versa)
nnoremap <C-S-Up> <C-w><S-k>
nnoremap <C-S-Down> <C-w><S-j>
nnoremap <C-S-Left> <C-w><S-h>
nnoremap <C-S-Right> <C-w><S-l>

" buffer navigation
nnoremap<silent> <S-l> :bn<cr>
nnoremap<silent> <S-h> :bp<cr>
nnoremap<silent> <S-q> :bw<cr>

" save and quit
nnoremap<silent> <leader>q :q<cr>
nnoremap<silent> <leader>w :w<cr>

" fast Esc
imap jj <esc>
" line navigation on visual linebreak
vnoremap <S-j> gj
vnoremap <S-k> gk
" remove highlight
nnoremap<silent> <esc><esc> :noh<return>
" word count
nnoremap <G-g> g<C-g>
" file explorer
nmap<silent> <leader>e :Explore<cr>

syntax on
filetype on
