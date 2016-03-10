"-----------------------------------------------------------------------------
" Initialization
"-----------------------------------------------------------------------------

set nocompatible "choose no compatibility with legacy vi

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"General
 Plugin 'ap/vim-css-color'
 Plugin 'beloglazov/vim-online-thesaurus'
 Plugin 'chrisbra/Colorizer'
 Plugin 'gmarik/Vundle.vim'
 Plugin 'haya14busa/vim-operator-flashy'
 Plugin 'itchyny/lightline.vim'
 Plugin 'jez/vim-superman'
 Plugin 'justinmk/vim-sneak'
 Plugin 'kana/vim-operator-user'
 Plugin 'kewah/vim-cssfmt'
 Plugin 'mattn/gist-vim'
 Plugin 'mattn/webapi-vim'
 Plugin 'mbbill/undotree'
 Plugin 'myusuf3/numbers.vim'
 Plugin 'reedes/vim-lexical'
 Plugin 'reedes/vim-pencil'
 Plugin 'tpope/vim-eunuch'
 Plugin 'tpope/vim-repeat'
 Plugin 'tpope/vim-rsi'
 Plugin 'tpope/vim-surround'
 Plugin 'xolox/vim-misc'
"Plugin 'KevinGoodsell/vim-csexact'
"Plugin 'LanguageTool'
"Plugin 'Yggdroot/indentLine'
"Plugin 'godlygeek/csapprox'
"Plugin 'junegunn/fzf'
"Plugin 'maxbrunsfeld/vim-yankstack'

"Colourschemes
 Plugin 'badwolf'
 Plugin 'lucy/term.vim'
 Plugin 'morhetz/gruvbox'
 Plugin 'noahfrederick/vim-noctu'
 Plugin 'noahfrederick/vim-hemisu'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'nanotech/jellybeans.vim'
"Plugin 'tomasr/molokai'
"Plugin 'whatyouhide/vim-gotham'
"Plugin 'xolox/vim-colorscheme-switcher'

call vundle#end()   " All plugins must be added before this line

" Machine specific settings if they exist.
silent! source ~/.vimrc-local

"-----------------------------------------------------------------------------
" General Mappings
"-----------------------------------------------------------------------------

noremap ' `|noremap ` '
nnoremap <BS> <Nop>|nnoremap <Del> <Nop>
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"nnoremap <C-n> gt
"nnoremap <C-p> gT
nnoremap <C-y> 2<C-y>
nnoremap <C-e> 2<C-e>

" Don't move around in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Disable arrow keys!
"noremap <up> <nop>
"noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"-----------------------------------------------------------------------------
" Command Mode Mappings
"-----------------------------------------------------------------------------

" command Sudow w !sudo tee % >/dev/null

"-----------------------------------------------------------------------------
" 'Leader' key binds
"-----------------------------------------------------------------------------
  nnoremap <Space> <Nop>
  nmap <space> <leader>

  nnoremap <Leader>V :e ~/.vimrc<CR>
  nnoremap <Leader>N :e ~/notes<CR>
  nnoremap <Leader>p :set invpaste<CR>:set paste?<CR>
  nnoremap <Leader>B :saveas ~/backups/

set switchbuf=useopen,usetab
  nnoremap <Leader>b :ls<cr>:b<space>
  nnoremap <Leader>l :NumbersToggle<CR>

" Diff
  nnoremap <silent> <Leader>dt :diffthis<CR>
  nnoremap <silent> <Leader>do :diffoff<CR>
  nnoremap <silent> <Leader>dd :call DiffToggle()<CR>
  nnoremap <silent> <Leader>d/ /<<<<<<<\\|=======\\|>>>>>>><CR>
    function! DiffToggle()
      if &diff
        diffoff
      else
        diffthis
      endif
    :endfunction

" Strip all trailing whitespace in the current file.
 nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Reselect the text that was just pasted
 nnoremap <leader>v V`]

" New tab
 nnoremap <leader><Tab> :tabnew 

"search for trails and bad words
nnoremap <leader>wb /\v(kkk<bar>:wq<bar>:q<bar>nigger<bar>shit<bar>fuck<bar>jjj?)<CR>

" Format css
nnoremap <silent> <leader>cs :Cssfmt<CR>
vnoremap <silent> <leader>cs :CssfmtVisual<CR>

"Highlight colors
nnoremap <leader>ch :ColorToggle<CR>

"-----------------------------------------------------------------------------
" Options
"-----------------------------------------------------------------------------

  set showcmd

  set t_Co=256                    " 256 colours.

  set shortmess+=I                " Hide splash screen.
  set display+=lastline           " Show partial lines.
  set showtabline=1               " Show tabs only when multiple tabs are open.
  set laststatus=2                " Always show the status bar.
" set statusline=%<%t%h%m%r%h%w%y\ %{fugitive#statusline()}%=\ Ln\ %l\/%L\,\ Col\ %-3v\ %P

" Text display.
  syntax on                       " Syntax highlighting.
  set number                      " Shetow line numbers.
  set textwidth=93                " Max line width.
  set colorcolumn=+1              " Vertical line at textwidth.
" set guicursor+=a:blinkon1       " Turn cursor blinking on.
" set guicursor=a:blinkon600-blinkoff400  " Slow down cursor blinking speed
  set hlsearch                    " Search highlighting.
  set scrolloff=3                 " Context lines above and below cursor. :set so=0 to toggle off.
  set wrap                        " Wrapping on.
  set lbr                         " Wrap at word.
  set showbreak=··\               " Line break indicator.
" set list
" Two-space tabs.
  set expandtab                   " Use spaces, not tabs.
  set tabstop=2|set softtabstop=2 " Tabs = 2 spaces.
  set shiftwidth=2

" Editing.
  set autoindent
  set whichwrap+=<,>,h,l,b,s,[,]  " Backspace and arrows can wrap to previous/next line.
  set splitbelow|set splitright   " Open new splits below and to the right.

" Searching and matching.
  set nowrapscan                  " Don't wrap search to beginning of file.
  set incsearch                   " Incremental searching
  set ignorecase                  " searches are case insensitive..                       .
  set smartcase                   " ... unless they contain at least one capital letter
  set gdefault                    " Substitute all matches in a line (i.e. :s///g) by default.
  set showmatch                   " When a bracket is inserted, flash the matching one.

" System.
  filetype plugin indent on       " Load file type plugins + indentation
  set mouse=a                     " Enable the mouse in all possible modes.
  set history=500                 " Keep 1000 lines of command line history.
  set confirm                     " Confirm quit/save/etc.
  set wildmenu                    " Tab completion on.
  set wildmode=longest,full       " Tab complete longest common string, then each full match.
  set cursorline
  set backspace=indent,eol,start  " Backspace through everything in insert mode
" set relativenumber
  set showcmd                     " Display incomplete commands
  set encoding=utf-8
  set clipboard=unnamedplus,autoselect " Use + register (X Window clipboard) as unnamed register

" Tidy swaps
  set directory=$HOME/.vim/swap//
  if !isdirectory(&directory)
    call mkdir(&directory)
  endif

" Tidy backups
  set backupdir=$HOME/.vim/backup//
  if !isdirectory(&backupdir)
    call mkdir(&backupdir)
  endif

  set backupcopy=yes
  set backup
  "
" go to last cursor position when opening files
" autocmd vimrc BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &ft != 'gitcommit'
                              \| exe "normal g'\"" | endif
nmap "" '"

"-----------------------------------------------------------------------------
" Read stupid file formats
"-----------------------------------------------------------------------------

" Read-only .doc through antiword
autocmd BufReadPre *.doc silent set ro
autocmd BufReadPost *.doc silent %!antiword "%"

" Read-only odt/odp through odt2txt
autocmd BufReadPre *.odt,*.odp silent set ro
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"

" Read-only pdf through pdftotext
autocmd BufReadPre *.pdf silent set ro
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78

" Read-only rtf through unrtf
autocmd BufReadPre *.rtf silent set ro
autocmd BufReadPost *.rtf silent %!unrtf --text

" For jpegs
autocmd BufReadPre *.jpg,*.jpeg silent set ro
autocmd BufReadPost *.jpg,*.jpeg silent %!jp2a --width=78 "%"

" For other image formats
autocmd BufReadPre *.png,*.gif,*.bmp silent set ro
autocmd BufReadPost *.png,*.gif,*.bmp silent %!convert "%" jpg:- | jp2a --width=78 -

"-----------------------------------------------------------------------------
" Custom commands
"-----------------------------------------------------------------------------

"  :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -

"-----------------------------------------------------------------------------
" Vim-operator-flashy
"-----------------------------------------------------------------------------

  map y <Plug>(operator-flashy)
  nmap Y <Plug>(operator-flashy)$

"-----------------------------------------------------------------------------
" Lightline
"-----------------------------------------------------------------------------

  set noshowmode
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

"-----------------------------------------------------------------------------
" Ranger
"-----------------------------------------------------------------------------

fun! RangerChooser()
  exec "silent !ranger --choosefile=/tmp/chosenfile " .           expand("%:p:h")
  if filereadable('/tmp/chosenfile')
    exec 'edit ' . system('cat /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun

map <Leader>r :call RangerChooser()<CR>

"-----------------------------------------------------------------------------
" Pencil
"-----------------------------------------------------------------------------

let g:pencil#autoformat = 0      " 0=manual, 1=auto
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

"-----------------------------------------------------------------------------
" `w`ord commands
"-----------------------------------------------------------------------------

let g:online_thesaurus_map_keys = 0
nnoremap <leader>wt :OnlineThesaurusCurrentWord<CR>

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#spelllang = ['en_ca', 'en_us', 'fr_ca']

let g:lexical#spell_key = '<leader>ws'
let g:lexical#dictionary_key = '<leader>wd'
"let g:lexical#thesaurus_key = '<leader>t'


"-----------------------------------------------------------------------------
" Undotree
"-----------------------------------------------------------------------------

nnoremap <F5> :UndotreeToggle<cr>

if has("persistent_undo")
	set undodir=~/.undodir/
	set undofile
endif

"-----------------------------------------------------------------------------
" Gvim
"-----------------------------------------------------------------------------

" by default, hide gui menus
set guioptions=i

nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

filetype plugin indent on    " required

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=40 columns=97
endif

"-----------------------------------------------------------------------------
" Colourscheme
"----------------------------------------------------------------------------

"let g:molokai_original = 1
let g:gruvbox_termcolors=256
"let g:gruvbox_italic=0
"let g:badwolf_darkgutter=1
syntax enable
set background=dark
colorscheme nompus

"if $TERM == 'rxvt-unicode-256color'
"    colorscheme noctu
"elseif $TERM == 'linux'
"    colorscheme sexy-railscasts
"elseif $TERM == 'xterm'
"    colorscheme noctu
"endif

"if $USER == 'root'
"  colorscheme noctu
"endif
