# vim_config


配置vim环境：
第一步：
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

第二步:
    讲_vimrc文件拷贝到~/.vimrc

第三步:
    在/home/zhangji 目录下创建gopath目录
    在.bashrc后面添加配置：
        export GOROOT="/usr/local/go"
        export GOLIBPATH="/home/zhangji/gopath"
        export GOWORKPATH="/home/zhangji/work/sm-goapi"
        export GOPATH="$GOLIBPATH:$GOWORKPATH"
        export GOBIN="$GOLIBPATH/bin"
        export PATH="$GOBIN:$GOROOT/bin:$PATH"

    执行 source .bashrc

第四步:
    打开vim,执行:PlugInstall

第五步:
    执行:GoInstallBinaries

 至此，环境配置完成

