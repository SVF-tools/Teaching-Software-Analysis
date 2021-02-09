# SVF-example VScode implementations

## Table of Content
1. Installations
1. Docker project configurations
1. VScode extensions setup
1. Build SVF-example project
1. Debug SVF-example project
---


## 1 Installations

### 1.1 Install docker
https://www.docker.com/get-started

For further understanding docker, you can have useful following links - [12 mins video to understand Docker](https://www.youtube.com/watch?v=YFl2mCHdv24)

### 1.2 Install VScode
https://code.visualstudio.com/download

For further using and learning VScode resources link - [Learn with VS Code](https://code.visualstudio.com/learn)

----
## 2. Build with dockerfile Or pull the docker image

### 2.1 Method 1: Build with dockerfile on your device

- step 1 download the dockerfile: [Dockerfile](https://raw.githubusercontent.com/SVF-tools/SVF-Teaching/main/Dockerfile)
- step 2 enter the command in cmd or terminal: `docker build -t svf-teaching`
- step 3 check the image in cmd or terminal: `docker images`
### 2.1 Method 2: Pull the image in docker hub
- enter the command in cmd or terminal: `docker pull svftools/svf-teaching:latest`


#### * If the above two methods are failed to build, please firstly check up you have successfully download the docker and try again or use the VScode extensions to [Build docker images with vscode]().

### 2.2 Create a container with the docker image
- enter the command in cmd or terminal: `docker run -it svf-teaching:latest /bin/bash`
----
## 3. VScode extensions setup
### 3.1 Download the docker extension on vscode

![Press the Extension on tool bar](https://raw.githubusercontent.com/charles32110/svfpic/main/extension1.jpeg)

![Install the Docker extension](https://raw.githubusercontent.com/charles32110/svfpic/main/extension2.jpeg)

### 3.2 Build docker images with vscode
(* If you successfully build the docker image in section2, you can skip part)

![ ](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerbuild.png)


![ ](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerbuild2.jpg)

![ ](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerbuild3.jpg)

![ ](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerbuild4.png)

![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerbuild5.jpg)

### 3.3 Download Remote-Containers extension to connect the container

![](https://raw.githubusercontent.com/charles32110/svfpic/main/connect1.jpg)
![](https://raw.githubusercontent.com/charles32110/svfpic/main/connect2.png)
![](https://raw.githubusercontent.com/charles32110/svfpic/main/connect3.png)
![](https://raw.githubusercontent.com/charles32110/svfpic/main/connect4.jpg)
![](https://raw.githubusercontent.com/charles32110/svfpic/main/connect5.jpg)
![](https://raw.githubusercontent.com/charles32110/svfpic/main/connect6.png)
![](https://raw.githubusercontent.com/charles32110/svfpic/main/connect7.jpg)


## 4. Build SVF-example
![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerdb1.jpg)
![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerdb2.jpg)
![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerdb3.jpg)
![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerdb4.jpg)

#### You can also store in /SVF-example/src/compile_commands.json to build with cmake-tools
```
[
{
  "directory": "/home/SVF-example/SVF-example/src",
  "command": "/usr/bin/c++   -I/home/SVF-master/llvm-10.0.0.obj/include -I/home/SVF-master/include  -fPIC -std=gnu++14 -O0 -fno-rtti -Wno-deprecated -g   -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -std=gnu++14 -o CMakeFiles/svf-ex.dir/svf-ex.cpp.o -c /home/SVF-example/src/svf-ex.cpp",
  "file": "/home/SVF-example/src/svf-ex.cpp"
}
]
```
---

## 5. Debug SVF-example 

### 5.1 Install C/C++ extension in container

![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerdb5.png)

### 5.2 Setup debugging 

#### If you are the first time to debug in container, please create the /SVF-example/.vscode/launch.json

![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerdb6.jpeg)

![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerdb7.png)

![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerdb8.png)

![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerdb9.jpeg)

##### /SVF-example/.vscode/launch.json
```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "cpp - Build and debug active file",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/bin/svf-ex",
            "args": ["${workspaceFolder}/test1.bc"], // your target input bc file
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "MIMode": "gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ],
            "miDebuggerPath": "/usr/bin/gdb"
        }
    ]
}

```

#### Start your debugging
![](https://raw.githubusercontent.com/charles32110/svfpic/main/dockerdb10.jpeg)
