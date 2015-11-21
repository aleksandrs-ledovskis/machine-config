scriptencoding utf-8 " Use Unicode characters in .nvimrc

set nocompatible " turn off vi mode

" Begin Plug magic
filetype off " Disable filetype detection for duration of Plug loading
call plug#begin('~/.nvim/plugged')

Plug 'bling/vim-airline' " Statusbar/tabline. Powerline replacement
Plug 'mileszs/ack.vim' " Grep-like searcher, using Ack/Ag
Plug 'scrooloose/nerdtree' " File treeview browser
Plug 'chriskempson/base16-vim' " Base16 color scheme support
Plug 'tpope/vim-fugitive' " Git stuff
Plug 'tpope/vim-rails'  " Rails syntax support & spec generators
Plug 'tpope/vim-endwise' " Somewhat better block construct/delimeter auto-placement
Plug 'tpope/vim-commentary' " Trigger code comments easily
Plug 'junegunn/vim-easy-align' " Alignment plugin with nice list of bundled rules (e.g. can handle Ruby 1.9+ hash OOB)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' } " Fuzzy file finder
Plug 'vim-ruby/vim-ruby' " Edge version of Vim's Ruby syntax support
Plug 'simnalamburt/vim-mundo' " Treeview of file changes. Fork of Gundo
Plug 'jeffkreeftmeijer/vim-numbertoggle' " Toggle between relative and absolute line numbers automatically
Plug 'christoomey/vim-tmux-navigator' " Fast switching between Vim <-> Tmux
Plug 'airblade/vim-gitgutter' " Git diff in the gutter
Plug 'ctrlpvim/ctrlp.vim' " For buffer management
Plug 'benekastah/neomake'

" Migrated from vimrc, but unreviewed
Plug 'Colorizer--Brabandt' "  Display colors, as for example is CSS #F00B44 declarations
Plug 'ervandew/supertab' "  Better <TAB> completion/IntelliSense
Plug 'tpope/vim-unimpaired' "  Useful bracket maps
Plug 'majutsushi/tagbar' "  Source code tag browser
Plug 'mattn/emmet-vim' "  HTML & CSS zen coding (ultra-fast expansion)
Plug 'embear/vim-localvimrc' "  Local custom/per-project .lvimrc files
Plug 'editorconfig/editorconfig-vim' "  EditorConfig support (editor agnostic format configs)
Plug 'gregsexton/gitv' "  Extra insight power in Git related tasks. Uses fugitive.
Plug 'terryma/vim-expand-region' "  Quickly select increasingly larger regions of text
Plug 'kana/vim-textobj-user' "  Support custom text objects. For vim-expand-region
Plug 'kana/vim-textobj-line' "  Current line text object
Plug 'kana/vim-textobj-entire' "  Entire buffer text object
Plug 'nathanaelkane/vim-indent-guides' "  Display indent guides as color blocks
Plug 'slim-template/vim-slim' "  Slim templating engine syntax highlight

call plug#end()
filetype plugin indent on " Re-enable filetype plugin
" End Plug magic"

" Basic
set number " Show absolute line numbers
set relativenumber " ... and show relative as well. So called 'hybrid mode'
set ruler " Show line and column number
syntax enable " Turn on syntax highlighting allowing local overrides
set encoding=utf-8 " Set default encoding to UTF-8
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" No EOL (`set binary` must preceed Whitespace block options)
set binary
au BufNewFile * set noeol

" Whitespace
set nowrap " don't wrap lines
set expandtab " use spaces, not tabs
set tabstop=2 " a tab is two spaces
set shiftwidth=2 " an autoindent (with <<) is two spaces
set list " Show invisible characters
set backspace=indent,eol,start " backspace through everything in insert mode

" List chars
set listchars=" " " Reset the listchars
set listchars=tab:₋⁻ " a tab should display as "₋⁻"
set listchars+=trail:⋅ " show trailing spaces as "⋅"
set listchars+=extends:→ " The character to show in the last column when wrap is off and the line continues beyond the right of the screen
set listchars+=precedes:← " The character to show in the first column when wrap is off and the line continues beyond the left of the screen

" Searching
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter

" Backups
set backupdir^=~/.nvim/_backup// " where to put backup files.
set directory^=~/.nvim/_temp//  " where to put swap files.

" Misc
set showmatch  " Show matching brackets.
set matchtime=5 " Bracket blinking.
set novisualbell " No blinking
set noerrorbells  " No noise.
set vb t_vb= " disable any beeps or flashes on error
set mouse-=a  " Disable mouse
set mousehide " Hide mouse after chars typed
set splitbelow " Horizontal split - current pane stays on top
set splitright " Vertical split - current pane is on left side
set cursorcolumn " Visually show current cursor column
set lazyredraw " This makes hybrid (relative) numbering usable for some larger files
set regexpengine=1 " Ditto, above

" Colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " Enable 24-bit colors
set background=dark " Make vim dark-terminal friendlier
"set guicolors
colorscheme base16-twilight " Specific color scheme from Base16 collection

" Cursorline
set cursorline " Visually show current cursor line
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline cursorcolumn
autocmd WinLeave * setlocal nocursorline nocursorcolumn
highlight CursorLine guibg=#303000 ctermbg=234
highlight CursorColumn guibg=#303000 ctermbg=234

" Speedups
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>Q :q<CR>
nnoremap <Leader>Z :q!<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>s :sp<CR>
nnoremap <Leader>v :vnew<CR>
nnoremap <Leader><Leader> V
noremap q: :q
nnoremap Q <Nop>
imap jk <Esc>
nnoremap <Leader><CR> G
nnoremap <Leader><BS> gg

" Airline
let g:airline_powerline_fonts = 1 " Enable fancy fonts
let g:airline#extensions#tabline#enabled = 1 " Enable smarter tabline
let g:airline#extensions#tabline#tab_nr_type = 1 " Show tab number
let g:airline#extensions#tabline#show_close_button = 0 " Don't need no buttons

" NERDTree
map <F2> :NERDTreeToggle<CR>

" Mundo/Gundo
nnoremap <F5> :GundoToggle<CR>
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.nvim/_undo

" Neomake
"" Ruby
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop', 'reek']
"" JavaScript
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake " Run on file write
nnoremap <Leader>l :lopen<CR>

" numbertoggle
let g:NumberToggleTrigger="<F3>" " Switch between hybrid and absolute numbering

" Ack
let g:ackprg = 'ag --vimgrep'
let g:ackhighlight = 1
nnoremap <Leader>a :Ack<space>
vnoremap <Leader>as :<C-u>exec VAckSearch()<CR>

" Fzf
nnoremap <Leader>f :FZF<CR>

" vim-commentar
let g:commentary_map_backslash = 0 " Do not use deprecated \\ combo for commenting

" CtrlP (buffer-works)
nnoremap <Leader>b :CtrlPBuffer<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Tabs
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
nnoremap <silent> <LocalLeader>] :tabnext<CR>

" Clear search highlight
map <Space>n :noh<CR>

" Last file position jump, except Git commit files
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
au BufRead,BufNewFile {COMMIT_EDITMSG} set ft=gitcommit

" PL/SQL file syntax highlights
au BufRead,BufNewFile *.pkb, *.pkh, *.pks, *.plb setfiletype plsql

" Ack support functions
" From https://github.com/mileszs/ack.vim/issues/27#issuecomment-37412668
function! VAckSearch()
  norm! gv"sy
  return ':Ack "' . EscapeAllString(@s) . '"'
endfunction

function! EscapeAllString(text)
  return substitute(escape(a:text, '*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction

" Migrated stuff

" Colorizer
let g:colorizer_auto_filetype='css,html,erb'

" Tagbar
noremap <Leader>rt :TagbarToggle<CR>
let g:tagbar_type_plsql = {
    \ 'ctagstype' : 'sql',
    \ 'kinds'     : [
        \ 'P:packages',
        \ 'd:prototypes',
        \ 'c:cursors',
        \ 'f:functions',
        \ 'F:record fields',
        \ 'L:block label',
        \ 'p:procedures',
        \ 's:subtypes',
        \ 't:tables',
        \ 'v:variables',
        \ 'i:indexes',
        \ 'V:views',
        \ 'n:synonyms',
    \ ]
\ } " plsql filetype (.pls/.plb) support

"EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1 "  Autorun
let g:indent_guides_auto_colors = 1  " Allow custom colors for terminal Vim
