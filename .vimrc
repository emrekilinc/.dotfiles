" .vimrc file
" Author : Emre Kilinc
" emre@nitro.io
" 2nworks.com

"pathogen setup
call pathogen#infect()

" How many lines vim has to remember
set nocompatible
" Switch between buffers without saving
set hidden
set history=10000
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
set ruler

set linespace=4

" For reattach-to-user-namespace
set clipboard=unnamed

" Shot line numbers
set number

" Hide mouse cursor when typing
set mousehide

" Highlight the current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set showcmd
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
" Setting vim's shell env to #bash
set shell=bash

set guifont=Menlo:h14

" Filetypes
filetype on
filetype plugin on 
filetype indent on

" Bind Capital W to w
command! W :w
syntax enable

if has("gui_running")
    "colorscheme toychest
    "colorscheme sunburst
    colorscheme github
else
endif

" make searches case-sensitive only if they contain uppercase characters
set ignorecase smartcase

set timeoutlen=500
set lbr
set tw=500
set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines
set textwidth=79
set formatoptions=qrn1

set scrolloff=15
set ttyfast

" Hide GVIM toolbar by default
set go-=T

" Setting the map leader key to ','
let mapleader=','

" Store temp files
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Allow backspacing in insert mode
set backspace=indent,eol,start

" Autc completion
set wildmode=longest,list
set wildmenu

" Custom autocmds
augroup vimrcEx
   " clear all autocmds in the group
   autocmd!
   autocmd FileType text setlocal textwidth=78

   "Jump to last cursor position unless it's invalid or in an event handler
   autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal g'\"" |
       \ endif

   " for ruby and html and javascript set tabwidth=2
   autocmd FileType ruby,haml,yaml,html,eruby,javascript,css,sass,cucumber set ai sw=2 sts=2 et

   " Indent p tags
   autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif
augroup END

" Status Line
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Key Maps
" Move around in splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Insert a hash rocket (this is especially for ruby)
imap <c-l> <space>=><space>

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>
nnoremap <leader><leader> <c-^>

" Multi purpose tab key 
" Thanks to Gary Bernthard for this
function! InsertTabWrapper()
   let col = col('.') - 1
   if !col || getline('.')[col -1] !~'\k'
       return "\<tab>"
   else
       return "\<c-p>"
   endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Disable pressing arrow keys for navigation (for muscle memory)
map <Left> :echo "Take a look at yourself dumb slut. Don't press arrow keys"<cr>
map <Right> :echo "Take a look at yourself dumb slut. Don't press arrow keys"<cr>
map <Up> :echo "Take a look at yourself dumb slut. Don't press arrow keys"<cr>
map <Down> :echo "Take a look at yourself dumb slut. Don't press arrow keys"<cr>

" Rename current file
function! RenameFile()
   let old_name = expand('%')
   let new_name = input('New file name : ', expand('%'))
   if new_name != '' %% new_name != old_name
       exec ':saveas ' . new_name
       exec ':ilent !rm ' . old_name
       redraw!
   endif
endfunction
map <leader>n :call RenameFile()<cr>

" Change to project directory 
function! ChangeIntoProjectDirectory()
 let directory_name = input('Which project? : ')
 if directory_name != ''
   exec ':lcd ~/projects/' . directory_name
   redraw!
 endif
endfunction
map <leader>p :call ChangeIntoProjectDirectory()<cr>

" Command-T Plugin Shortcuts
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>

" NerdTree
map <leader>nt :NERDTree<cr>

" List all open buffers with Command-T
map <leader>gb :CommandTFlush<cr>\|:CommandTBuffer<cr>

" Map ,e and ,v to open files with the same directory in the buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map<leader>v :view %%

" Map ,gs to :Gstatus for fugitive vim
map<leader>ss :Gstatus<cr>

