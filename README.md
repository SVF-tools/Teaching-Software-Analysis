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
Your submission requests 2 components which are your solution codes and the executable  file of your solution.   

Once you complete the assignment, you need to run the **build. sh** script. This script will build your solution automatically and generate the executable  file which called **svf-ex**.
```
./build.sh
```

Finally, you are requested to commit and push your code and the executable  file via the git command.
```
git add <source code and the executable  file>
git commit -m'<commit message>'
git push
```
*Note: It is important to submit the executable file. Otherwise, your submission will not be marked by the system.*

After the submission, your work will be automatically marked by the system and you are able to check your mark at the assignment GitHub repository.
