" Setup
" -----

syntax on
set nocompatible

filetype off

call pathogen#runtime_append_all_bundles()

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" Bundles
" -------

Bundle 'AndrewRadev/multichange.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'SirVer/ultisnips'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ciaranm/detectindent'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'koron/nyancat-vim'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sickill/vim-pasta'
Bundle 'sjl/gundo.vim'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'


" Builtin Settings
" ----------------

filetype plugin indent on

" Keep the backup files in ~/.vim/backup.
set backupdir=$HOME/.vim/backup

" Keep the undp files in ~/.vim/undo.
set undodir=$HOME/.vim/undo

" Keep the swap files in ~/.vim/swap.
set directory=$HOME/.vim/swap

set wildmenu
set number
set nowrap
set showmode
set lazyredraw
set ttyfast

set hlsearch

set ignorecase
set smartcase

set modeline

set clipboard+=unnamed

set completeopt-=preview
set completeopt+=longest

set listchars=tab:▸\ ,eol:¬

if has('mouse')
  set mouse=a
endif

" Make you keyboard actually do something while you are switched to Cyrillic
" layout. Ripped of @StanAngeloff
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" Widely ignore vim swapfiles, tilda backups, python bytecode, .git dirs and
" node modules. Some plugins actually respect those.
set wildignore+=*.sw?,*.un~*~,*py?,.git,node_modules

" Plugin settings
" ---------------

" Tell detectindet to use one tab, if it is confused.
let g:detectindent_preferred_expandtab=1

" Ignore tilda editor leftovers and python junk in the NERDTree. Keep those as
" NERDTree seem not to respect wildignore
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$']

" Use a minimal UI for the NERDTree. No wasted space on 'Press ? for help'
" headers.
let NERDTreeMinimalUI=1

" Just use one NERDTree on all tabs and don't show it on startup.
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=0

" Tell syntastic not to jump to errors and skip /c(++)?/ files.
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_disabled_filetypes=['c', 'cc', 'cpp', 'h', 'hh', 'hpp']

" Add some fancy symbols for the error and warning messages.
let g:syntastic_error_symbol='→'
let g:syntastic_warning_symbol='→'

" Style settings
" --------------

" Style a bit the syntastic messages.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Use light background by default.
set background=light

" Style powerline for fancy symbols and the solarized theme.
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarized256'

" I use gnome-terminal - its not slow, but its not fast either. Sometimes I
" need more snappier feel. The GUI one gives me that.
if has('gui_running')
  " Set the GUI solarized theme.
  colorscheme solarized

  " Set-up a powerline capable font.
  set guifont=Ubuntu\ Mono\ 13

  " If we are running in a gui like GVim, make sure to hide every annoying UI
  " piece. I don't like the GTK tabs, scrollbars and especially the toolbar.
  set guioptions=
else
  " Use 256 colors on the terminal.
  set t_Co=256

  " Use light solarized theme on a transparent terminal. Its important to set
  " the termtrans before the colorscheme.
  let g:solarized_termtrans=1
  colorscheme solarized
endif

" Custom settings
" ---------------

if has('autocmd')
  " Have rainbow parantheses everywhere
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces

  " Save the last position in a file.
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd BufReadPost * :DetectIndent

  autocmd FileType python     set expandtab tabstop=4 shiftwidth=4 softtabstop=4 omnifunc=pythoncomplete#Complete
  autocmd FileType c          set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=ccomplete#Complete
  autocmd FileType ruby       set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=rubycomplete#Complete
  autocmd FileType javascript set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=javascriptcomplete#Complete
  autocmd FileType coffee     set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=coffeecomplete#Complete
  autocmd FileType html       set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=htmlcomplete#Complete
  autocmd FileType css        set expandtab tabstop=2 shiftwidth=2 softtabstop=2 omnifunc=csscomplete#Complete

  highlight                  ExtraWhitespace ctermbg=red guibg=red
  autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
endif

" Mappings
" --------

nnoremap <F5> :NERDTreeTabsToggle<CR>
nnoremap <F6> :GundoToggle<CR>
nnoremap <F7> :TagbarToggle<CR>
nnoremap <F8> :set paste!<CR>

" Navigate through tabs with Tab and Shift-Tab.
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Jump to syntastic errors with Shift-{Up,Down}.
map <S-Up> <ESC>:lprev<CR>
map <S-Down> <ESC>:lnext<CR>

" Write using `sudo` in COMMAND mode if the file is read-only.
" Ripped off @StanAngeloff.
cnoremap w!! w !sudo tee % >/dev/null

" Format a paragraph to fit in `textwidth`.
nnoremap <leader>f gqip

" Restore last visual selection in Visual mode.
nnoremap <leader>v V`]

" I always mess these up on my Das Keyboard. Trying to work around them at
" least in Visual mode.
vnoremap u y
vnoremap U U

" Custom commands
" ---------------

command Light execute "set background=light"
command Dark execute "set background=dark"

" Local settings
" --------------

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" vim: set et ts=2 sts=2:
