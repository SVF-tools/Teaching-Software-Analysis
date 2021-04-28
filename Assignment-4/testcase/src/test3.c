#include <stdbool.h>
extern char* getchar();
extern void broadcast();
char* foo(char* token){     return token;   }
extern void MAYALIAS(void* p, void* q);
int main(){
    bool loopCondition = true;
    bool BranchCondition = false;                  
    while(loopCondition){
        if(BranchCondition){
            char* secretToken = getchar();              // source
            char* b =foo(secretToken);                
        }
        else{
            char* publicToken = "hello";
            char* a = foo(publicToken);
            broadcast(a);                               // sink
        }
    }
}