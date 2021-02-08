# SVF-Teaching
Teaching Software Analysis via SVF

## 1. Setup the assignment environment 
This assignment requested the supports of the svf library. To compile the execuateable, you need to set up the svf library on your device. 


<summary> Install svf-lib using npm (tested on both Ubuntu and MacOS)</summary>

```
npm i --silent svf-lib --prefix ${HOME}
```
 

After the svf-lib has been installed, you can run the **env. sh** script which is in your assignment folder to set up the environment.
```
source ./env.sh
```

While the environment has been set up, you are now able to start your assignment.

## 2. Coding your solution

## 3. Build and submit your solution
Your submission should include all your changing code.   

Once you complete the assignment, you need to run the **build. sh** script. This script will build your solution automatically and generate the executable  file which called **svf-ex**.  If your are working on Repl.it, you can click the run button to run the **build. sh** script to build the project. You can also run this script in the shell build your solution.
```
./build.sh
```

Finally, you are requested to commit and push your code and all other changing files via the git command.
```
git add <source code and the executable  file>
git commit -m'<commit message>'
git push
```

After the submission, your work will be automatically marked by the system and you are able to check your mark at the assignment GitHub repository.



# 2021 Autumn 41094 v1 Software Engineering Studio 1B


## Table of Content
---
1. Introduction
2. Set up for ENV
    - Accept your github classroom assignment
    - Download Docker
    - Download VS-Code
3. Submit your project

## Introduction
---
The goal of document is to finished four assissment projects in this semester. Please follow up the time line of the 41094 SES-1B subject outline. 

Four subject projects have been packaged in docker container, please make sure you are all getting familiar to implement and deploy the docker on your desktop or on remote servers.

Everyone is welcomed to use any IDE/programming editor to finish, while we give the instruction about using VS-Code and docker implementations

## Set up project environment
----

### 1. Clone/accept github classroom repository
```
git clone url 
```


### 2. Download and install the Docker
https://www.docker.com/get-started

For further understanding docker, you can have useful following links:
- [12 mins video to understand Docker](https://www.youtube.com/watch?v=YFl2mCHdv24)
- [Docker commandlines](https://docs.docker.com/get-started/part2/#recap-and-cheat-sheet-optional)
- [Creating Dockerfile](https://odewahn.github.io/docker-jumpstart/building-images-with-dockerfiles.html)
- [Setting up a Docker repo](https://www.1and1.com/cloud-community/learn/containers/docker/setting-up-a-docker-repository)


### 3. Download and install vscode
https://code.visualstudio.com/download

Select your pc system version then open the vscode editor.

For further using tips and vs-code related resources, you can use the link - [Learn with VS Code](https://code.visualstudio.com/learn)

![VS_Code_entry_window]("https://github.com/charles32110/svfpic/vs_entry_window.png")

### 4. Download the docker extension on vscode

![Press the Extension on tool bar]("https://github.com/charles32110/svfpic/extension1.jpeg")

![Install the Docker extension]("https://github.com/charles32110/svfpic/extension2.jpeg")


![]("https://github.com/charles32110/svfpic/dockerbuild.png")
![ ]("https://github.com/charles32110/svfpic/dockerbuild2.jpg")
![ ]("https://github.com/charles32110/svfpic/dockerbuild3.jpg")
![ ]("https://github.com/charles32110/svfpic/dockerbuild4.png")
![]("https://github.com/charles32110/svfpic/dockerbuild5.jpg")


![]("https://github.com/charles32110/svfpic/connect1.jpg")
![]("https://github.com/charles32110/svfpic/connect2.png")
![](https://github.com/charles32110/svfpic/connect3.png")
![]("https://github.com/charles32110/svfpic/connect4.jpg")
![]("https://github.com/charles32110/svfpic/connect5.jpg")
![]("https://github.com/charles32110/svfpic/connect6.jpg")
![]("https://github.com/charles32110/svfpic/connect7.jpg")


![]("https://github.com/charles32110/svfpic/dockerdb1.jpg")
![]("https://github.com/charles32110/svfpic/dockerdb2.jpg")
![]("https://github.com/charles32110/svfpic/dockerdb3.jpg")
![]("https://github.com/charles32110/svfpic/dockerdb4.jpg")




```
compile_commands.json
[
{
  "directory": "/home/SVF-example/SVF-example/src",
  "command": "/usr/bin/c++   -I/home/SVF-master/llvm-10.0.0.obj/include -I/home/SVF-master/include  -fPIC -std=gnu++14 -O0 -fno-rtti -Wno-deprecated -g   -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -std=gnu++14 -o CMakeFiles/svf-ex.dir/svf-ex.cpp.o -c /home/SVF-example/src/svf-ex.cpp",
  "file": "/home/SVF-example/src/svf-ex.cpp"
}
]
```
