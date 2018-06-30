if $VIM_PROJECT_ROOT == ''
	finish
endif

let s:wd=expand('%:p:h')

function! SymbolicLink(file)
	let orig_path=$VIM_PROJECT_ROOT.'/'.a:file
	let sym_path=s:wd.'/'.a:file
	if filereadable(orig_path) && !filereadable(sym_path)
		let cmd='ln -sf '.orig_path.' '.sym_path
		echom cmd
		call system(cmd)
	endif
endfunction

" augroup local_vimrc_cpp_file_event
" 	autocmd!
" 	autocmd Filetype cpp :call SymbolicLink('.clang-format')
" augroup END

let s:include_dir=$VIM_PROJECT_ROOT.'/include'
let g:deoplete#sources#clang#flags += ['-I'.s:include_dir]

let s:options='-std=c++11 -Wall -I'.s:include_dir
let g:ale_cpp_clang_options = s:options
let g:ale_cpp_gcc_options = s:options

" ctags setting
if has('path_extra') && filereadable($VIM_PROJECT_ROOT.'/.tags')
	set tags=$VIM_PROJECT_ROOT/.tags
endif

" run rdm daemon if not running
if executable('rdm')
	call system('pgrep rdm || rdm --daemon')
endif

augroup local_vimrc_auto_cmd
	autocmd!
	" 	" for jsfaint/gen_tags.vim (lcdしたくない場合)
	" 	autocmd VimEnter * let $GTAGSROOT = $VIM_PROJECT_ROOT
augroup END
" disalbe my auto lcd command
let g:auto_lcd_basedir=0

" 仮に，すべてプロジェクトルートで処理を行うとすると`.clang-format`のシンボリックリンクは不要となる
lcd $VIM_PROJECT_ROOT
