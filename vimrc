call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'SirVer/ultisnips'
Plug 'fatih/molokai'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'leafgarland/typescript-vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'angular/angular-cli'
Plug 'Yggdroot/indentLine'
call plug#end()

set updatetime=100
set number
colo desert
syntax on
set smartindent
set linespace=9
filetype plugin indent on
filetype plugin on

" go-vim
set autowrite
let mapleader = ","
let maplocalleader = "\\"

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
map <leader>c :make


" errorbells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" set spacing
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab 
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype erlang setlocal ts=2 sts=2 sw=2 expandtab

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" molokai color scheme
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai


" erlang settings
autocmd BufNewFile,BufRead *.erl setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.hrl setlocal expandtab tabstop=2 shiftwidth=2

" nunjucks settings
autocmd BufNewFile,BufRead *.js  setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.njk setlocal expandtab tabstop=2 shiftwidth=2
au BufReadPost *.njk set syntax=html

autocmd FileType erlang nmap <leader>c <Plug>(:make)

" go settings
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

"autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>d <Plug>(go-doc)
autocmd FileType go nmap <Leader>a <Plug>(go-describe)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rac'

" NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

au VimEnter * NERDTreeFind

" typescript
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


