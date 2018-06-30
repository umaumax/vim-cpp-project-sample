# vim-cpp-project-sample

vimのcppをプロジェクトように扱うサンプル

* rtags,gtagsの自動生成
* cmake
* clang-format

## required
* [direnv/direnv: Unclutter your \.profile]( https://github.com/direnv/direnv )
* rtags
* gtags
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

`<Leader>rj` at vim

### gtags
[jsfaint/gen\_tags\.vim: Async plugin for vim and neovim to ease the use of ctags/gtags]( https://github.com/jsfaint/gen_tags.vim )
`:GenGTAGS`
`K`
`<C-o>`: go back

FYI
```
nmap <silent> K :<C-u>exe("Gtags ".expand('<cword>'))<CR>
nmap <silent> R :<C-u>exe("Gtags -r ".expand('<cword>'))<CR>
````
[vimコマンドとGNU GLOBALを組み合わせたエディタ環境の構築と使い方一覧 : Linuxコマンド・bashの使い方実例]( http://linux-bash.com/archives/8936957.html )
