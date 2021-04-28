#include <stdbool.h>

extern void broadcast();
char* getchar(){    return "/0 ";   };   //init a char number
extern void MAYALIAS(void* p, void* q);
int main(){
    bool loopCondition = true;
    bool BranchCondition = true;   
    char* secretToken = getchar();                  // source
    while(loopCondition){
        if(BranchCondition){
            char* a = secretToken;             
            broadcast(a);                            // sink
            MAYALIAS(a,secretToken);                    
        }
        else{
            char* b = "hello";                         
        }
    }
}