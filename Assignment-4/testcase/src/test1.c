#include <string.h>
#include <stdio.h>
extern void MAYALIAS(void* p, void* q);
extern void broadcast(char* num);
char *tgetstr(){
    // e.g. sql injection init
    static char initstr[25] = "select* From City ..";
    return initstr;
}


int main(){
    char *injection = tgetstr();
    char* s = injection;
    char* b = s;
    MAYALIAS(injection, s);
    broadcast(b);

    return 0;
}