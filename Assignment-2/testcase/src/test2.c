#include<stdbool.h>
void src(){
};
void sink(){
};

int main(){
        int a = 1;
        while ( a <=1){
                src();
                a++;
        }
        sink();
        return 0;
};
