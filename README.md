# SVF-Teaching
Teaching Software Analysis via SVF
# Control Flow Reachability Assignment
In this assignment, you are requested to complete a function which will output the path between the source node and sink node.

## 1. Setup the assignment environment 
This assignment requested the supports of the svf library. To compile the execuateable, you need to setup the svf library on your device. 


<summary> Install svf-lib using npm (tested on both Ubuntu and MacOS)</summary>

```
npm i --silent svf-lib --prefix ${HOME}
```
 

After the svf-lib has been installed, you can run the **env. sh** script which is in your assignment folder to setup the environment.
```
source ./env.sh
```

While the environment has been setup, you are now able to start your assignment.

## 2. Coding your solution
For this assignment, you are requested to design a function which will query all reachable paths between the source and sink function.
```
src() is the source function.
sink() is the sink function.
```
## 3. Build and submit your solution
Your submission requests 2 components which are your solution codes and the execuateable file of your solution.   

Once you complete the assignment, you need to run the **build. sh** script. This script will build your solution automatically and generate the execuateable file which called **svf-ex**.
```
./build.sh
```

Finally, you are requested to commit and push your code and the execuateable file via the git command.
```
git add <source code and the execuateable file>
git commit -m'<commit message>'
git push
```
*Note: It is important to submit the execuateable file. Otherwise, your submission will not be marked by the system.*

After the submission, you work will be automatically mark by the system and you are able to checked your mark at the assignment github repository.
