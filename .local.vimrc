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

let include_dirs=[$VIM_PROJECT_ROOT.'include']
let include_dirs_opts=map(include_dirs, {k,v -> '-I'.v})
let include_dirs_opt=join(include_dirs_opts, ' ')

let g:deoplete#sources#clang#flags += include_dirs_opts

let s:options='-std=c++11 -Wall '.include_dirs_opt
let g:ale_cpp_clang_options = s:options
let g:ale_cpp_gcc_options = s:options
let g:ale_cpp_cpplint_options = '--linelength=160 --filter=-readability/todo,-legal/copyright,-whitespace/line_length,-build/header_guard'

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

" NOTE: format flag settings
augroup auto_format_flag_on
	autocmd!
	autocmd BufWinEnter,TabEnter *.{c,cpp,h,hpp} let g:auto_format_flag=1
	autocmd BufWinEnter,TabEnter *.cmake let g:auto_format_flag=1
	autocmd BufWinEnter,TabEnter CMakeLists.txt let g:auto_format_flag=1
augroup END

" 仮に，すべてプロジェクトルートで処理を行うとすると`.clang-format`のシンボリックリンクは不要となる
lcd $VIM_PROJECT_ROOT

""""""""""""""""""""""""""""""""""""""""""""""""""""""

" command! Make call system("(./build/.make.sh |& webcat) &")
