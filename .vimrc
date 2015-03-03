" Fish shell breaks vim.
set shell=/bin/sh

" NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible " Be iMproved

" Required:
  if has("macunix")
    set runtimepath+=/Users/davileen/.vim/bundle/neobundle.vim/
  elseif has("unix")
    set runtimepath+=/home/local/ANT/davileen/.vim/bundle/neobundle.vim/
  endif
endif

" Required:
if has("macunix")
  call neobundle#begin(expand('/Users/davileen/.vim/bundle'))
elseif has("unix")
  call neobundle#begin(expand('/home/local/ANT/davileen/.vim/bundle'))
endif

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:

" Autocomplete, YouCompleteMe is an option
" but neocomplete seems nicer for now.
NeoBundle 'Shougo/neocomplete.vim'
" Disable vim autocomplete
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Undo the completion without having to backspace everything.
inoremap <expr><C-g>     neocomplete#undo_completion()
" If you have typed NeoC... and there's a bunch of NeoComplete* options
" then this will complete the Complete section so you don't have to type it
" all out.
inoremap <expr><C-l>     neocomplete#complete_common_string()
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Recommended key-mappings.
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1


" Snippets for most languages, works nicely
" with neocomplete.
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" " Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Changes snippets presented based on different
" contexts. Not sure if this is heavily used.
NeoBundle 'Shougo/context_filetype.vim'
" Git integration, I mostly use for :Gblame and the statusline.
NeoBundle 'tpope/vim-fugitive'

" Awesome fuzzy file matching, search buffers etc.
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" Keep the cache around, helps me remember what I was looking at.
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
" Have the working directory be the first parent that contains .git or
" the dir of the current file (with exceptions, see help).
let g:ctrlp_working_path_mode = 'ra'
" Start with the buffer, nicer than :ls.
let g:ctrlp_cmd = 'CtrlPBuffer'
" If buffer is already open somewhere then ctrlp won't try to jump to it.
let g:ctrlp_switch_buffer = 0

" Solarized colorscheme.
NeoBundle 'flazz/vim-colorschemes'
" Highlight all spurious whitespace.
NeoBundle 'ntpeters/vim-better-whitespace'

" Nicer status line.
NeoBundle 'bling/vim-airline'
" Use same theme as rest of vim.
let g:airline_theme = 'solarized'
" User powerline like the rest of vim.
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" vim-airline has its own status bar so hide the default one or you'll get
" stuff like INSERT twice.
set noshowmode

NeoBundle 'tpope/vim-surround'
NeoBundle 'honza/vim-snippets'
NeoBundle '907th/vim-auto-save'
NeoBundle 'pangloss/vim-javascript'
" Awesome display of undo tree
NeoBundle 'sjl/gundo.vim'
nnoremap <leader>gu :GundoToggle<cr>

" For Clojure lol
NeoBundle 'tpope/vim-leiningen'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
NeoBundle 'tpope/vim-repeat'
NeoBundle 'guns/vim-sexp'
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on " enable file-specific plugins/settings

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let mapleader = ","

" Colorscheme.
set background=dark
colorscheme solarized

" Syntax highlighting.
syntax enable

set timeoutlen=1000 ttimeoutlen=0


" ================ General Config ====================
"set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell t_vb=            "No sounds
set autoread                    "Reload files changed outside vim
set nowrap
set wildmenu
set cursorline
set cursorcolumn

nnoremap ' `
nnoremap ` '

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

set laststatus=2

"default indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" universal text encoding, compatible with ascii
set encoding=utf-8

set autoindent
set wildmode=list:longest
set ttyfast
set undofile

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Mitigate hitting F1 instead of escape.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

au FocusLost * :wa

" Use jj to escape in insert mode.
inoremap jj <ESC>


" Highlight searches.
set hlsearch

" Clear highlighted search matches.
nnoremap <leader><space> :noh<cr>

set incsearch

set ignorecase
set smartcase

set shortmess=atI




" cut down key stroke for normal mode
nnoremap ; :

" git commit message
autocmd Filetype gitcommit setlocal spell textwidth=72

" The Silver Searcher, http://robots.thoughtbot.com/faster-grepping-in-vim/
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor


set wrap linebreak textwidth=0

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=8
set sidescrolloff=15
set sidescroll=1



set colorcolumn=80
let &colorcolumn="80,".join(range(120,320),",")

let g:auto_save = 1



:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
