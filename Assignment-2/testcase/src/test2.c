#include<stdbool.h>
void source(){
};
void sink(){
};

int main(){
        int a = 1;
        while ( a <= 1 ){
                source();
                a++;
        }
        sink();
        return 0;
};
