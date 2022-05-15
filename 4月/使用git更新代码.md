第一步:查看代码状态

    git status

第二步：更新全部

    git add *

第三步：接着输入git commit -m “更新说明”

    git commit -m “更新说明”

第四步：先git pull,拉取当前分支最新代码（也就是获取GitHub上的最新代码信息，更新本地代码）

    git pull

第五步：push到远程master分支上（修改本地代码后，再更新GitHub上的代码）

    git push origin master


**总之,先pull再push**