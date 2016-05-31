"-----------------------------------------------------------------------------
" Initialization
"-----------------------------------------------------------------------------
set nocompatible "choose no compatibility with legacy vi

call plug#begin('~/.vim/plugged')

"General
 Plug 'ap/vim-css-color'
 Plug 'beloglazov/vim-online-thesaurus'
 Plug 'chrisbra/Colorizer'
 Plug 'gmarik/Vundle.vim'
 Plug 'haya14busa/vim-operator-flashy'
 Plug 'itchyny/lightline.vim'
 Plug 'jez/vim-superman'
 Plug 'junegunn/fzf'
 Plug 'junegunn/goyo.vim'
 Plug 'justinmk/vim-sneak'
 Plug 'kana/vim-operator-user'
 Plug 'kana/vim-arpeggio'
 Plug 'mattn/gist-vim'
 Plug 'mattn/webapi-vim'
 Plug 'mbbill/undotree'
 Plug 'reedes/vim-lexical'
 Plug 'reedes/vim-pencil'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-eunuch'
 Plug 'tpope/vim-markdown'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-rsi'
 Plug 'tpope/vim-surround'
 Plug 'xolox/vim-misc'
 Plug 'kewah/vim-stylefmt'
"Plug 'myusuf3/numbers.vim'
"Plug 'kewah/vim-cssfmt'
"Plug 'etnadji/vim-epub'
"Plug 'vim-scripts/dbext.vim'
"Plug 'KevinGoodsell/vim-csexact'
"Plug 'LanguageTool'
"Plug 'Yggdroot/indentLine'
"Plug 'godlygeek/csapprox'
"Plug 'maxbrunsfeld/vim-yankstack'

"Colourschemes
 Plug 'airodactyl/hybrid-krompus.vim'
 Plug 'badwolf'
 Plug 'chriskempson/base16-vim'
 Plug 'jonathanfilip/vim-lucius'
 Plug 'lucy/term.vim'
 Plug 'morhetz/gruvbox'
 Plug 'nanotech/jellybeans.vim'
 Plug 'noahfrederick/vim-hemisu'
 Plug 'noahfrederick/vim-noctu'
 Plug 'romainl/apprentice'
"Plug 'altercation/vim-colors-solarized'
"Plug 'flazz/vim-colorschemes'
"Plug 'tomasr/molokai'
"Plug 'whatyouhide/vim-gotham'
"Plug 'xolox/vim-colorscheme-switcher'

call plug#end()

" Machine specific settings if they exist.
silent! source ~/.vimrc-local

"-----------------------------------------------------------------------------
" General Mappings
"-----------------------------------------------------------------------------

" Arpeggio {{{
" otherwise vim complains
autocmd VimEnter * call s:arpeggio_maps()

" works great with low timeout except during lag (due to neocomplete mostly)
function! s:arpeggio_maps()
  Arpeggio inoremap st <c-w>
  Arpeggio inoremap ie <end>
  Arpeggio inoremap ne <esc>
  Arpeggio inoremap se <cr>
" Arpeggio inoremap wf <c-r>+
endfunction

let g:arpeggio_timeoutlen=11

" }}}

 noremap ' `|noremap ` '
 nnoremap <BS> <Nop>|nnoremap <Del> <Nop>
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l
 nnoremap <C-h> <C-w>h
 nnoremap <C-w><C-l> gt
 nnoremap <C-w><C-h> gT
 nnoremap <C-n> gj
 nnoremap <C-p> gk
 nnoremap j gj
 nnoremap k gk
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
 nnoremap <Space>             <Nop>
 nmap     <Space>             <leader>
 vmap     <Space>             <leader>

 nnoremap <Leader>V           :e ~/.vimrc<CR>
 nnoremap <Leader>N           :e ~/notes<CR>
 nnoremap <Leader>p           :set invpaste<CR>:set paste?<CR>
 nnoremap <Leader>B           :saveas ~/backups/
 nnoremap yp                  :let @+=expand("%:p")<CR>

 set switchbuf=useopen,usetab
 nnoremap <Leader>b           :ls<cr>:b<space>
 nnoremap <Leader>tnu         :set nu<CR>
 nnoremap <Leader>tno         :set nonu<CR>

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
 nnoremap <c-w>t :tabnew 

" Search for trails and bad words
 nnoremap <leader>wb /\v(kkk<bar>:wq<bar>:q<bar>nigger<bar>shit<bar>fuck<bar>jjj?)<CR>

" Format css
 nnoremap <silent> <leader>cs :Stylefmt<CR>
 vnoremap <silent> <leader>cs :StylefmtVisual<CR>

" Toggles
" Goyo
 nnoremap <leader>tg :Goyo<CR>
" Highlight colors
 nnoremap <leader>tc :ColorToggle<CR>

" Pencil
 nnoremap <leader>tp :TogglePencil<CR>
 nnoremap <leader>wh :PencilHard<CR>

" Syntax
:map <leader>ts :if exists("g:syntax_on") <Bar>
  \   syntax off <Bar>
  \ else <Bar>
  \   syntax enable <Bar>
  \ endif <CR>

" Search highlight
 nnoremap <leader>th :noh <CR>

"-----------------------------------------------------------------------------
" Options
"-----------------------------------------------------------------------------

 set showcmd

"set browsedir=buffer
 set t_Co=256                    " 256 colours.

 set shortmess+=I                " Hide splash screen.
 set display+=lastline           " Show partial lines.
 set showtabline=1               " Show tabs only when multiple tabs are open.
 set laststatus=2                " Always show the status bar.
" set statusline=%<%t%h%m%r%h%w%y\ %{fugitive#statusline()}%=\ Ln\ %l\/%L\,\ Col\ %-3v\ %P

" Text display.
 syntax on                       " Syntax highlighting.
 set number                      " Show line numbers.
 set textwidth=92                " Max line width.
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
 set list lcs=trail:·,precedes:«,extends:»,tab:▸\  " eol:¬

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
 set clipboard=unnamedplus "(autoselect) " Use + register (X Window clipboard) as unnamed register

" Tidy swaps
  set directory=$HOME/.vim/swap/
  if !isdirectory(&directory)
    call mkdir(&directory)
  endif

" Tidy backups
  set backupdir=$HOME/.vim/backup/
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
 autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -89

" Read-only rtf through unrtf
 autocmd BufReadPre *.rtf silent set ro
 autocmd BufReadPost *.rtf silent %!unrtf --text

" For jpegs
 autocmd BufReadPre *.jpg,*.jpeg silent set ro
 autocmd BufReadPost *.jpg,*.jpeg silent %!jp2a --width=87 "%"

" For other image formats
"autocmd BufReadPre *.png,*.gif,*.bmp silent set ro
"autocmd BufReadPost *.png,*.gif,*.bmp silent %!convert "%" jpg:- | jp2a --width=87 -

" For epub
 au BufReadCmd   *.epub      call zip#Browse(expand("<amatch>"))

"-----------------------------------------------------------------------------
" Custom commands
"-----------------------------------------------------------------------------

"  :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -

vmap ?? "zy:let @z = substitute(@z,'[[:space:]]','+','g')<CR>
 \ :silent !start /usr/bin/firefox
 \ [http://www.google.com/search?q=<C-R>z<CR> http://www.google.com/search?q=<C-R>z<CR>];

" ix.io paste range and copy to clipboard.
command! -range=% IX silent execute <line1> . "," . <line2> . "w !curl -F 'f:1=<-' ix.io | tr -d '\\n' | xclip -selection clipboard"

command! -range=% PB silent execute <line1> . "," . <line2> . "w !curl -F 'c=@-' https://ptpb.pw/ | sed -n 's/^url: //p' | xclip -selection clipboard"

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
      \ 'colorscheme': 'krompuslight',
      \ 'subseparator': {
      \   'right': '' },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ }

"-----------------------------------------------------------------------------
" Goyo
"-----------------------------------------------------------------------------

 let g:goyo_width = 90
 let g:goyo_height = 90
 let g:goyo_linenr = 0

function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

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
" FZF
"-----------------------------------------------------------------------------

nnoremap <c-t> :FZF<CR>
" ctrl-[a-z], alt-[a-z], f[1-4], or any single character
let g:fzf_action = {
  \ 'ctrl-m': 'e',
  \ 'ctrl-t': 'tabedit',
  \ 'ctrl-j':  'botright split',
  \ 'ctrl-k':  'topleft split',
  \ 'ctrl-h':  'vertical topleft split',
  \ 'ctrl-l':  'vertical botright split' }

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

let g:lexical#spelllang = ['en_ca', 'en_us', 'fr']

let g:lexical#spell_key = '<leader>ws'
let g:lexical#dictionary_key = '<leader>wd'
"let g:lexical#thesaurus_key = '<leader>wt'


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
colorscheme mine

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
