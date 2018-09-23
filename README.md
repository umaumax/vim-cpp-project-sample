# vim-cpp-project-sample

vimのcppをプロジェクトように扱うサンプル

* rtags,gtagsの自動生成
* cmake
* clang-format

## required
* [direnv/direnv: Unclutter your \.profile]( https://github.com/direnv/direnv )
* rtags
* gtags
	* 'jsfaint/gen_tags.vim' needs `ctags` to generate tags
* clang-format

## how to compile
```
mkdir build
cd build
cmake ..
make
```

## how to use
### rtags
```
cd build
cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1
rdm
rc -J .
```

#### vim
* `<Leader>rj`: jump
* `<Leader>rp`: 関数の先頭へ移動
* `<Leader>rj`: 定義元へ移動(`rS`:h split,`rV`: v split,`rT`: new tab)
* `<Leader>rb`: Jump to previous location
* `<C-o>`: go prev window
* `<C-i>`: go next window

```
   <Leader>rd   * :call rtags#Diagnostics()<CR>
   <Leader>rc   * :call rtags#FindSubClasses()<CR>
   <Leader>rC   * :call rtags#FindSuperClasses()<CR>
   <Leader>rb   * :call rtags#JumpBack()<CR>
   <Leader>rv   * :call rtags#FindVirtuals()<CR>
   <Leader>rw   * :call rtags#RenameSymbolUnderCursor()<CR>
   <Leader>rl   * :call rtags#ProjectList()<CR>
   <Leader>rr   * :call rtags#ReindexFile()<CR>
   <Leader>rs   * :call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
   <Leader>rn   * :call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
   <Leader>rF   * :call rtags#FindRefsCallTree()<CR>
   <Leader>rf   * :call rtags#FindRefs()<CR>
   <Leader>rp   * :call rtags#JumpToParent()<CR>
   <Leader>rT   * :call rtags#JumpTo(g:NEW_TAB)<CR>
   <Leader>rV   * :call rtags#JumpTo(g:V_SPLIT)<CR>
   <Leader>rS   * :call rtags#JumpTo(g:H_SPLIT)<CR>
   <Leader>rJ   * :call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR>
   <Leader>rj   * :call rtags#JumpTo(g:SAME_WINDOW)<CR>
   <Leader>ri   * :call rtags#SymbolInfo()<CR>
```

#### original command
```
:HelpRtag
```

### gtags
[jsfaint/gen\_tags\.vim: Async plugin for vim and neovim to ease the use of ctags/gtags]( https://github.com/jsfaint/gen_tags.vim )

#### vim
* `:GenGTAGS`: gen tags
* `K`: jump
* `<C-o>`: go prev window
* `<C-i>`: go next window
* `:cn`: go to the next entry
* `:cp`: go to the previous entry
* `:cc{N}`: gi to the {N}th entry
* `:cl`: list all entries

#### FYI
```
nmap <silent> K :<C-u>exe("Gtags ".expand('<cword>'))<CR>
nmap <silent> R :<C-u>exe("Gtags -r ".expand('<cword>'))<CR>
````
[vimコマンドとGNU GLOBALを組み合わせたエディタ環境の構築と使い方一覧 : Linuxコマンド・bashの使い方実例]( http://linux-bash.com/archives/8936957.html )
