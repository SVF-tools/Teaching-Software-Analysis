#include <string.h>
#include <stdio.h>
extern void MAYALIAS(void* p, void* q);
char *src(){
    // e.g. sql injection init
    static char initstr[25] = "select* From City ..";
    return initstr;
}

char *sink(char* s){
    return s;
}

int main(){
    char *injection = src();
    char *s = sink(injection);
    MAYALIAS(s,injection);
    return 0;
}