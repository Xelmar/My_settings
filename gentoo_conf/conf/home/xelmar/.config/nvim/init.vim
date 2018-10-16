" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes


" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'davidhalter/jedi-vim'

" PEP check
Plug 'vim-syntastic/syntastic' ", { 'on': 'SyntasticToggleMode' }

" [|],{|},'|'
Plug 'jiangmiao/auto-pairs'

" Fast up
Plug 'easymotion/vim-easymotion'

" Initialize plugin system
call plug#end()

" let g:syntastic_python_checkers = ['pylint']
cabbrev h vert bo h

" My colorscheme
syntax on
colorscheme xelmar

set incsearch
set hlsearch

" syntastic
" SyntasticToggleMode
let g:syntastic_check_on_open = 0
let b:syntastic_skip_checks = 0
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "<img draggable="false" class="emoji" alt="⚠" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/26a0.svg">"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_exec='~/.local/bin/pylint'
let g:syntastic_python_pylint_post_args = '-j 6 --msg-template="{path}:{line}:{column}:{C}: [{symbol} {msg_id}] {msg}"'
" let g:syntastic_python_pylint_post_args = '-j 6 --msg-template="{path}:{line}:{column}:{C}: [{symbol} {msg_id}] {msg}"'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

highlight LineNr ctermfg=DarkGray
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

let g:mapleader=','

" mapping
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
map <C-m> :call Pylint()<CR>
" map <S-m> :SyntasticToggleMode<CR>

let w:pylint_flag = 0
function! Pylint()
	if (w:pylint_flag == 0)
		let w:pylint_flag = 1
		exec "SyntasticCheck"
	else
		let w:pylint_flag = 0
		exec "SyntasticToggleMode"
	endif

endfunction

map <C-q> :q<CR>
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction
