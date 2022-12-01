" {{{ --- pluginy
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
    Plug 'ayu-theme/ayu-vim'                    " schemat kolorystyczny
    Plug 'bluz71/vim-nightfly-guicolors'        " schemat kolorystyczny
    Plug 'ggandor/leap.nvim'                    " szybkie poruszanie się po pliku
    Plug 'jamessan/vim-gnupg'                   " szyfrowanie za pomcą GnuPG
    Plug 'jssteinberg/hackline.vim'             " statusline
    Plug 'junegunn/fzf'                         " wyszukiwanie plików
    Plug 'junegunn/fzf.vim'                     " wyszukiwanie plików
    Plug 'LunarVim/horizon.nvim'                " schemat kolorystyczny
    Plug 'mbbill/undotree'                      " drzewo zmian
    Plug 'mhinz/vim-signify'                    " wizualna pomoc przy pepozytoriach git
    Plug 'morhetz/gruvbox'                      " schemat kolorystyczny
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ojroques/nvim-osc52'                  " kopiowanie tekstu z Vim przez SSH
    Plug 'overcache/NeoSolarized'               " schemat kolorystyczny
    Plug 'preservim/nerdtree'                   " menadżer plików
    Plug 'rebelot/kanagawa.nvim'                " schemat kolorystyczny
    Plug 'sainnhe/everforest'                   " schemat kolorystyczny
    Plug 'sainnhe/gruvbox-material'             " schemat kolorystyczny
    Plug 'tmsvg/pear-tree'                      " automatyczne zamykanie ''
    Plug 'tpope/vim-commentary'                 " szybkie komentowanie linii
    Plug 'tpope/vim-eunuch'                     " polecenia systemu Linux np: Chmod, Delete
    Plug 'tpope/vim-fugitive'                   " obsługa repozytoriów git
    Plug 'vim-scripts/AutoComplPop'             " automatyczne uzupełnianie
    Plug 'voldikss/vim-floaterm'                " latający terminal
    Plug 'Yggdroot/indentLine'                  " pionowe prowadnice
call plug#end()
" }}} --- pluginy
" {{{ --- opcje
syntax on
set hidden
set number
set relativenumber
set showcmd
set autochdir
set termguicolors
set background=dark
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set smartindent
set nowrap
set whichwrap+=<,>,h,l
set laststatus=2
set incsearch
set ignorecase
set smartcase
set wrapscan
set fillchars=eob:\ ,fold:\  " usuwa znak `~` na końcu bufora
set iskeyword+=-,.,_   " neutralizuje seperatory słowa `-` oraz `.`
set cmdheight=1
set cursorline
set textwidth=100
set colorcolumn=+1
set lazyredraw
set updatetime=300
set timeout
set timeoutlen=500
set ttimeout
set ttimeoutlen=500
set textwidth=100
set conceallevel=0
set splitright
set splitbelow
set autoread
set ttyfast
set noswapfile
set nobackup
set mouse=a
set wildmenu
set wildmode=longest:full,full
set backspace=indent,eol,start
set clipboard+=unnamedplus
set undofile
set undodir=~/.config/nvim/undodir
set viminfo+=n$HOME/.config/nvim/viminfo/viminfo
set viewdir=$HOME/.config/nvim/view
set viewoptions-=options
set signcolumn=yes:1
set foldmethod=marker
colorscheme kanagawa
" }}} --- opcje
" {{{ --- skróty klawiszowe
let mapleader="\<space>"

nnoremap zn zm
nnoremap zm zn
nmap gh 0
nmap gl $
nmap j gj
nmap k gk
nmap dh xd0
nmap dl d$
nmap Y y$
nnoremap J maJ`a
nnoremap gf :edit <cfile><cr>
nmap <cr> o
nmap <s-cr> O
nmap + <c-a>
nmap - <c-x>
" symbol ^M generujemy pomocą kombinacji: <ctrl-v> <shift+enter>
 O  ap

nmap <leader>w :Write<cr>
nmap <leader>x :Write<cr>:quit<cr>
nmap <leader>q :quit<cr>
nmap <leader>z :quit!<cr>
nmap qq :quit<cr>
nmap <leader>v :e $MYVIMRC<cr>
nmap <leader>f :Files<cr>
nmap <leader>g :Rg<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>r :source $MYVIMRC<cr>
nmap <leader>o :only<cr>
nmap <leader>; :
vmap <leader>; :
nmap <leader>l :FileInfo<cr>
nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>u :UndotreeToggle<cr>
nmap <leader>? :ToggleVimTips<cr>
nmap <silent> <leader>, :bp<cr>
nmap <silent> <leader>. :bn<cr>
nmap <leader>d :bd<cr>
nmap <leader>vs :vs<cr>
nmap <leader>sp :sp<cr>
nmap <leader>sx <c-w>q<cr>
nmap <leader>C :call RevBackground()<cr>
nmap <leader>K :call Kolory()<cr>
nmap <tab> :e #<cr>
nmap <bs> daw

nnoremap <esc> :noh<cr><esc>

nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

nnoremap <m-h> <cmd>vertical resize -2<cr>")
nnoremap <m-j> <cmd>resize +2<cr>")
nnoremap <m-k> <cmd>resize -2<cr>")
nnoremap <m-l> <cmd>vertical resize +2<cr>")

tmap <c-h> <c-\><c-n><c-w>h
tmap <c-j> <c-\><c-n><c-w>j
tmap <c-k> <c-\><c-n><c-w>k
tmap <c-l> <c-\><c-n><c-w>l

nmap <c-_> :Commentary<cr>
vmap <c-_> :Commentary<cr>

" lua << EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = { "bash", "lua", "vim" },
"   highlight = {
"     enable = true,
"     additional_vim_regex_highlighting = false,
"   },
" }
" EOF

lua << EOF
    require('osc52').setup {
        max_length = 0,  -- Maximum length of selection (0 for no limit)
        silent = false,  -- Disable message on successful copy
        trim = false,    -- Trim text before copy
    }

    vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
    vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
    vim.keymap.set('x', '<leader>c', require('osc52').copy_visual)
EOF

nnoremap <leader>5 :Write<cr>:!./%<cr>
inoremap <expr> <TAB> pumvisible() ? "<C-y>":"<TAB>"

cmap <c-k> <up>
cmap <c-j> <down>
cmap <c-h> <left>
cmap <c-l> <right>

cmap <c-r>p <c-r>"
cmap <c-cr> <c-r>"

nmap <c-n> <plug>(signify-next-hunk)
nmap <c-p> <plug>(signify-prev-hunk)

let g:floaterm_keymap_toggle = '<leader>t'
let g:floaterm_keymap_kill = '<leader>k'

" poruszanie się po plikach pomocy
autocmd Filetype help nnoremap <leader>l <c-]>
autocmd Filetype help nnoremap <leader>h <c-t>
" }}} --- skróty klawiszowe
" {{{ --- autocmd
autocmd FileType apache setlocal commentstring=#\ %s

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

autocmd Filetype markdown setlocal conceallevel=0

" wyróżnienie kopiowanego tekstu, wyłączone w trybie VISUAL
autocmd TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, higroup="IncSearch", timeout=77}
" }}} --- autocmd
" {{{ --- konfiguracja pluginów
" plugin indentLine
let g:indentLine_first_char = ' '
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude = [ "vimwiki", "help", "undotree", "diff", "nerdtree" ]
let g:indentLine_bufTypeExclude = [ "help", "terminal" ]

" Plugin hackline
let g:hackline_laststatus = 3
let g:hackline_mode = 1
let g:hackline_bufnr = 1
let g:hackline_filetype = 1
let g:hackline_ale = 0
let g:hackline_nvim_lsp = 0
let g:hackline_vim_lsp = 0
let g:hackline_git = 1
let g:hackline_encoding = 1
let g:hackline_tab_info = 1
let g:hackline_label_modified = 2

let g:hackline_sign = "Nvim"
let g:hackline_hostname = "127.0.0.1"

let g:hackline_custom_end = '
            \%(%{&fileformat} %)
            \%l/%L %v
            \%( %{hackline_hostname} %)
            \%{strftime("%H:%M %y-%m-%d")}
            \'

lua require('leap').add_default_mappings()
" }}} --- konfiguracja pluginów
" {{{ --- funkcje
function! RevBackground()
    if &background=="light"
        set background=dark
    else
        set background=light
    endif
endfunction

function! Time()
    let time=strftime("Jest: %T %F")
    echo time
endfunction

" Wstawia tag np. ":Tag code" daje "<code></code>"
function! Tag(name)
    let @"="<" . a:name . "></" . a:name . ">"
    normal! pbbl
    startinsert
endfunction

lua << EOF
    local fn = vim.fn
    MkDir = function()
        local dir = fn.expand("%:p:h")

        if fn.isdirectory(dir) == 0 then
            fn.mkdir(dir, "p")
        end
    end
EOF

function! Write()
    if filereadable(expand("%"))
        for buf in getbufinfo("%")
            if buf.changed
                execute ':silent update'
                echo "Zapisałem" expand("%:p")
            else
                echo "Brak zmian w" expand("%:p")
            endif
        endfor
    else
        execute ':lua MkDir()'
        execute ':silent write'
        echo "Utworzyłem" expand("%:p")
    endif
endfunction

function! GP()
    silent execute ':!$HOME/bin/gp-vim.sh %:p'
    redraw!
endfunction

function! FileInfo()
    let filename=resolve(expand("%:p"))
    let msg=""
    let msg=msg."Mod: ".strftime("%F %T",getftime(filename))." ".filename
    echom msg
endfunction

let g:MyVimTips="off"
function! ToggleVimTips()
    if g:MyVimTips == "on"
        let g:MyVimTips="off"
        pclose
    else
        let g:MyVimTips="on"
        botright pedit ++edit +setlocal\ buftype=nofile\ bufhidden=hide\ nobuflisted\ noswapfile ~/git/dot-files-srv/Vim.md
        wincmd w
        set nornu nonu
        vertical resize 40
    endif
endfunction

function! Kolory()
    let kolory = readfile(expand('$HOME/.config/nvim/kolory'))
    call fzf#run(fzf#wrap({'source': kolory, 'sink' : 'colorscheme'}))
endfunction

function! CD()
    let cd_file = readfile(expand('$HOME/.config/nvim/cd'))
    call fzf#run(fzf#wrap({'source': cd_file,
        \ 'sink' : 'e',
        \ 'options' : '-m -x +s'}))
endfunction

" kopiuje ścieżkę otwartego pliku do schowka systemowego
function! CPP()
    let @+=expand('%:p')
endfunction
" }}} --- funkcje
" {{{ --- komendy
command! CPP call CPP()
command! CD call CD()
command! Kolory call Kolory()
command! ToggleVimTips call ToggleVimTips()
command! FileInfo call FileInfo()
command! GP call GP()
command! S :source %
command! -nargs=1 Tag call Tag(<f-args>)
command! Time call Time()
command! RevBackground call RevBackground()
command! Write call Write()
command! PI :PlugInstall
" }}} --- komendy
" {{{ --- abbr
cabbr time Time
cabbr gp GP
cabbr pi PI
" }}} --- abbr
" {{{ --- custom config
if ! empty(glob('$HOME/.config/nvim/custom.vim'))
    silent! source $HOME/.config/nvim/custom.vim
endif
" }}} --- custom config
