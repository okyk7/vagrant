set nocompatible
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set wrapscan
set autoindent
set smartindent
set nobackup
set autoread
set cursorline
set list
set listchars=tab:>-,trail:-,extends:<,precedes:<
highlight specialKey ctermfg=darkgray

inoremap jj <Esc>

"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
    syntax match JISX0208Space "　" display containedin=ALL
    highlight JISX0208Space term=underline ctermbg=LightCyan
endf

"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
    syntax on
        augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call JISX0208SpaceHilight()
    augroup END
endif

if has('unix')
    set fileformat=unix
    set fileformats=unix,dos,mac
    set fileencoding=utf-8
    set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
    set termencoding=
elseif has('win32')
    set fileformat=dos
    set fileformats=dos,unix,mac
    set fileencoding=utf-8
    set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932
    set termencoding=
endif

syntax on
