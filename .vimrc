execute pathogen#infect()
syntax on
filetype plugin indent on

syntax enable

set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" if has('gui_running')
"    set background=light
" else
"    set background=dark
" endif

set background=dark
colorscheme solarized

function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  if !has('gui_running')
    let g:solarized_termcolors=256
  endif
  colors solarized
endfunction

function! s:goyo_enter()
	if has('gui_running')
		set fullscreen
		set background=light
		set linespace=7
	endif
endfunction

function! s:goyo_leave()
	if has('gui_running')
		set nofullscreen
		set background=dark
		set linespace=0
	endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

