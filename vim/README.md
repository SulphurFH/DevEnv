# vim安装步骤

## 1.安装vim

``` shell
brew install vim --with-cscope --with-lua --with-python --enable-gui=yes --override-system-vim
```

## 2.安装vundle

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

将本仓库中的.vimrc(YouCompleteMe)替换本地的.vimrc
```


## 3.安装vundle插件

启动vim，执行 :PluginInstall

## 4.安装依赖软件
> 1. jedi-vim依赖

```
pip install jedi
```

> 2. ale依赖

```
pip install flake8
```

> 3. vim-autopep8依赖

```
pip install autopep8
```

## 5. YouCompleteMe
参考[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

## 7. GoLang Supports

启动vim，执行 :GoInstallBinaries

## 6. onedark主题
参考[onedark.vim](https://github.com/joshdick/onedark.vim)
