filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"""""" Plugins (vim-plug) 

call plug#begin(stdpath('data') . '/plugged')

    " Programming 
    Plug 'dense-analysis/ale'

    " Prose Editing
    Plug 'junegunn/goyo.vim'
    Plug 'reedes/vim-pencil'

    " Language Specific Plugins
    Plug 'lervag/vimtex'
    Plug 'cespare/vim-toml'

call plug#end()

"""""" General Preferences

" Comma as Leader
let mapleader = ","

" Never hide code
set conceallevel=0

" No redrawing when executing macros
set lazyredraw 

" Visual mode: put should not displace yank buffer
vnoremap p "_dP

" Scroll pads
set scrolloff=10

"""""" ALE : LSP Client

let g:ale_linters = {'rust': ['analyzer']}
let g:ale_set_signs = 1
let g:ale_set_highlights = 0

nmap <silent> gd :ALEGoToDefinition <CR>
nmap <silent> gD :ALEGoToImplementation <CR>
nmap <silent> gt :ALEGoToTypeDefinition <CR>

nmap <silent> tt :ALEHover <CR>

"""""" Sign Column (as used by ALE)

highlight SignColumn ctermbg=none
set signcolumn=no

function! SignColumnToggle() 
    if &signcolumn ==# "yes"
        set signcolumn=no
    else
	    set signcolumn=yes
    endif
    echo ""
endfunction

nnoremap <Leader>. :call SignColumnToggle()<cr>


"""""" Goyo (distraction free writing)

function! GoyoToggle()
    Goyo
    echo ""
endfunction

nnoremap <Leader>; :call GoyoToggle()<cr>

"""""" Pencil (prose oriented writing)

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 0

function! DoPencilToggle()
    if PencilMode() ==# ""
    	nnoremap j gj
    	nnoremap gj j
    	nnoremap k gk
    	nnoremap gk k
        SoftPencil
        echo "Enabled Pencil"
    else
    	unmap j
    	unmap gj
    	unmap k
    	unmap gk
    	PencilOff
        echo "Disabled Pencil"
    endif
endfunction

nnoremap <silent> <Leader>, :call DoPencilToggle()<cr>
