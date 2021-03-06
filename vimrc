call plug#begin('~/.vim/plugged')
"autosave feature
"Plug 'vim-scripts/vim-auto-save' "(no need now...)
"pretty nice status bar
Plug 'vim-airline/vim-airline'
"themes for status bar higher
Plug 'vim-airline/vim-airline-themes'
"detects root of projects
Plug 'airblade/vim-rooter'
"plugin for git diff (shows -, + or ~ on the fields)
Plug 'airblade/vim-gitgutter'
"Plugin for git commands and nice interface (do i need it?)
Plug 'tpope/vim-fugitive'
"Easy to change 'hello world' on [hello world] (to change: cs'[ ; to delete: ds')
Plug 'tpope/vim-surround'
"plugin for autoformat (default formatters can see on the Internet)
"just type :Autoformat (works with tabs and spaces after function name)
Plug 'Chiel92/vim-autoformat'
"here we go again...
Plug 'ryanoasis/vim-devicons'
"plugin for markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"latex preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"plugin for syntax highlighting
Plug 'sheerun/vim-polyglot'
"show git changes on the fields (for nerd tree)
Plug 'Xuyuanp/nerdtree-git-plugin'
"multifile project
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"automatically adds second `(` and etc.
Plug 'jiangmiao/auto-pairs'
"plugin for autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"finder of the file in the project (ctrl + p and the name of the file)
Plug 'kien/ctrlp.vim'
"Just hit "\cm" (i = individual, m - minimal, check repo for info)
"to leave a comment (also works in visual mode)
Plug 'scrooloose/nerdcommenter'
"here is plugin with many different themes (can find on github)
Plug 'rafi/awesome-vim-colorschemes'
"css color show (activate: ColorHighlight)
Plug 'chrisbra/Colorizer'
"header/source plugin
Plug 'vim-scripts/a.vim'
"\di - start, \ds - stop
Plug 'vim-scripts/DrawIt'
"close all buffers except current
Plug 'vim-scripts/BufOnly.vim'
"start screen with MRU files
"Plug 'mhinz/vim-startify'
"ranger in vim
"Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
call plug#end()

"set cursorline
set number
set relativenumber
set nofixendofline
" change mode if I'm not focused on the win (realativenumber -> number)
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
set expandtab
"set encoding=UTF-8
set tabstop=4
set shiftwidth=4

"use X-windows clipboard (main clipboard of system)
"set clipboard=unnamedplus

syntax on

"theme for tabs and panel
let g:airline_theme='violet' "'tender', luna, deus, minimalist, bubblegum
let g:airline#extensions#tabline#enabled = 1

"theme for whole vim
colorscheme onedark "challenger_deep, dogrun, onedark, gruvbox, oceanic_material, space-vim-dark, hybrid
set background=dark
"resetting background must be after colorscheme configuration
highlight Normal ctermbg=NONE

if has('gui_running')
    set guifont=Monaco\ 10
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    highlight Normal guibg=#202020
    colorscheme atom
endif

" files, defining roots of projects
let g:rooter_patterns = ['.git', 'Makefile', "Cargo.toml", "mix.exs"]

let g:ctrlp_custom_ignore = 'node_modules\|target\|git'

set is
set hls
"set ignorecase
"need this to show tabs if they exists
set list
set listchars=tab:>-
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

nnoremap <C-n> :NERDTreeToggle<CR>

"use ranger instead of nerdtree
"map <C-n> :RangerWorkingDirectory<CR>
"replace default dir viewer with ranger
"let g:ranger_replace_netrw = 1

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов

nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

au BufWrite *.rs :Autoformat

let g:sql_type_default = 'pgsql'

"CONFIGURATION FOR COC

let g:coc_global_extensions = ['coc-clangd', 'coc-snippets', 'coc-emmet', 'coc-json', 'coc-pyright', 'coc-highlight', 'coc-html', 'coc-css', 'coc-texlab', 'coc-tsserver', 'coc-rust-analyzer', 'coc-elixir'] "coc-rls, coc-rust-analyzer
"coc.preferences.jumpCommand": "drop"

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
