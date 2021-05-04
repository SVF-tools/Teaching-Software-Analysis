#include <stdbool.h>
extern char* getchar();
extern void broadcast();
char* foo(char* token){     return token;   }
extern void NOALIAS(void* p, void* q);
int main(){
    bool loopCondition = true;
    bool BranchCondition = false;   
    char* secretToken = getchar();              // source  
    char* publicToken = "hello";             
    while(loopCondition){
        if(BranchCondition){
            char* b =foo(secretToken);                
        }
        else{
            char* a = foo(publicToken);
            broadcast(a);                               // sink
            NOALIAS(secretToken,a);
        }
    }
}