### 
ssh-keygen -t rsa -C "xxxxx@xxxxx.com"  
cat ~/.ssh/id_rsa.pub
ssh -T git@git.oschina.net
http://git.oschina.net/oschina/git-osc/wikis/%E5%B8%AE%E5%8A%A9#ssh-keys

### clone项目
git clone git@github.com:dzh/jframe.git jframe

### 配置个人信息
* cd jframe  
* config your personal info  
<pre>
eg:
git config user.name dzh  
git config user.email archer.dzh@gmail.com   
</pre>

## 使用git
### git in eclipse
[EGit](http://eclipse.org/egit/) is a eclipse pluign of git  
### 常用命令
* git add file                  //加入文件到git缓存  
* git commit -a -m 'initial commit'     //提交   
* git commit --amend            //重新提交  
* git status                    //查看状态  
* git rm --cache file           //从git缓存中删除文件  
* git mv file_from file_to              //重命名文件  
* git log --stat                        //查看日志  
* git diff --staged                     //暂存和上次提交之间的差异
* git push                      //推送改变到服务器
* git pull                      //从服务器获取最新的数据
* git checkout -- A             //撤销对文件A的修改


### 分支
* git branch bname                      //创建分支   
* git checkout -b bname         //创建并切换到分析bname   
* git merge hotfix                      //合并hotfix到当前分支   
* git branch -d hotfix          //删除分析htofix   
* git mergetool                 //调用可视化工具编辑冲突
* git branch -v                 //查看分支最后一次commit信息  
* git branch -merge                     //查看分支合并状态   
* git branch --no-merged                //查看分支未合并的状态  

### 远程仓库
* git remote -v                         //列出远程仓库信息  
* git remote show [remote-name]         //查看某个远程仓库的详细信息  
* git remote add A remoteurl            //添加远程仓库到本地，取名A  
* git remote rename A toB        //重命名本地的远程仓库名A为B
* git remote rm A                //移除本地的远程仓库A
* git fetch origin               //从origin更新数据  
* git push origin A:B            //推送本地分支A到B  
* git push origin  :B            //删除远程分支B  
* git check -b A origin/B        //检出B到本地，名字为A  

### 标签
* git tag                       //查看标签   
* git tag -l 'v1.4.2.*'         //查看指定标签   
* git tag -a v1.4 -m 'my version 1.4'    //创建标签   
* git show tag-name                //查看标签信息   
* git tag -s v1.5 -m 'my signed 1.5 tag'    //用 GPG 来签署标签   
* git tag -v [tag-name]             //验证已经签署的标签  
* git push origin [tagname]         //推送标签   
* git push origin --tags            //一次推送所有标签    

### 日志
* git log --pretty=oneline          //   
*   

### 其他
* git config --global alias.co checkout  //设置别名   
* git last                               //查看最后提交信息   
* git reset --hard origin/master  












