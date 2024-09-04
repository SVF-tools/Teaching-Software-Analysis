#include<stdbool.h>
extern int source();
extern void sink(int s);
int bar(int s){
    return s;
}
void foo(int* p) {
    *p = 1;
}

int main() {
    int a = source();
    foo(&a);
    foo(&a);
    sink(a);
}