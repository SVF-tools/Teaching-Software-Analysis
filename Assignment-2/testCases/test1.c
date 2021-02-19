#include<stdbool.h>
void sink();
void src(int *s){
	sink();
};
void sink(){
        //risky consequences from src effects
};

int main(){
        int a = 1;
        while ( a <=1){
                src(&a);
                a++;
        }
        return 0;
};

