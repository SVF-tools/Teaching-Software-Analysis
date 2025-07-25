extern int source();
extern void sink(int s);
int foo(int s){
    return s;
}


int main(){
    int a = source();
    int q = foo(a);
    sink(q); 
}