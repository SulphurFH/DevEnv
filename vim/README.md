# vim安装步骤

## 1.安装vim

``` shell
brew install vim --with-cscope --with-lua --with-python --enable-gui=yes --override-system-vim
```

## 2.安装vundle

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
将本仓库中的.vimrc替换本地的.vimrc```


## 3.安装vundle插件

启动vim，执行 :PluginInstall

## 4.安装依赖软件
> 1. jedi-vim依赖
    
```
pip install jedi
```

> 2. syntastic依赖

```
pip install flake8
brew install tidy-html5
```

> 3. vim-autopep8依赖

```
pip install autopep8
```

> 4. editorconfig-vim依赖

```
brew install editorconfig
```
    
> 5. vim-instant-markdown依赖
```
npm -g install instant-markdown-d
```

> 6. Tagbar
```
brew install ctags
```
## 5. onedark主题
参考[onedark.vim](https://github.com/joshdick/onedark.vim)
