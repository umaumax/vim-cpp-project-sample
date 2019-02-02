if $VIM_PROJECT_ROOT == ''
	finish
endif

let include_dirs=[$VIM_PROJECT_ROOT.'include']
let include_dirs_opts=map([]+include_dirs, {k,v -> '-I'.v})
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

" NOTE: format flag settings
augroup auto_format_flag_on
	autocmd!
	autocmd BufWinEnter,TabEnter *.{c,cpp,h,hpp} let g:auto_format_flag=1
	autocmd BufWinEnter,TabEnter *.cmake let g:auto_format_flag=1
	autocmd BufWinEnter,TabEnter CMakeLists.txt let g:auto_format_flag=1
augroup END

lcd $VIM_PROJECT_ROOT
