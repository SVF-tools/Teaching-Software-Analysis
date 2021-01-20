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
