1.打开VScode，点开Extensions，搜索C++插件点击安装

2.在任意目录下建立新文件夹（VScode通过文件夹管理工程文件），例我直接在桌面建立

3.在VScode中打开该文件夹

4.在其中建立新文件main.cpp，打开main.cpp，按F5或者点击Run->Starting Debugging，弹出选择环境的框框，选择c++，选择配置则选择第一个g++（大概无所谓吧，反正后面修改配置文件直接全部替换掉）

5.上一步之后将自动生成launch.json，若没出现，则再次点击F5。打开launch.json，将默认生成的文件全部替换为如下

```json
{
 
 // Use IntelliSense to learn about possible attributes.
 
 // Hover to view descriptions of existing attributes.
 
 // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
 
 "version": "0.2.0",
 
 "configurations": [
 
 {
 
 "name": "(gdb) Launch",
 
 "type": "cppdbg",
 
 "request": "launch",
 
 "program": "${workspaceFolder}/${fileBasenameNoExtension}.out",
 
 "args": [],
 
 "stopAtEntry": false,
 
 "cwd": "${workspaceFolder}",
 
 "environment": [],
 
 "externalConsole": true,
 
 "MIMode": "gdb",
 
 "preLaunchTask": "build",
 
 "setupCommands": [
 
 {
 
  "description": "Enable pretty-printing for gdb",
 
  "text": "-enable-pretty-printing",
 
  "ignoreFailures": true
 
 }
 
 ]
 
 }
 
 ]
 
}
```

6.修改完launch.json文件后，再次按F5，这次将会出现提示：

> “No task to run found. configure tasks...”
>
> 然后依次选择
>
> > Create tasks.json file from template
> >
> > Others Example to run an arbitrary external command.
>
> 打开task.json后，将其默认生成文件全部替换为如下：

```json
{
 
 // See https://go.microsoft.com/fwlink/?LinkId=733558
 
 // for the documentation about the tasks.json format
 
 "version": "2.0.0",
 
 "tasks": [
 
 {
 
 "label": "build",
 
 "type": "shell",
 
 "command": "g++",
 
 "args": ["-g", "${file}", "-std=c++11", "-o", "${fileBasenameNoExtension}.out"]
 
 }
 
 ]
 
}
```

按下F5，输出“Hello world”将在终端中显示，至此完成配置工作！