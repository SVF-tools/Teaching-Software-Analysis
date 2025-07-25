extern int source();
extern void sink(int s);
int foo(int s){
    return s;
}
int bar(int s){
    s = s + 1;
    int f = foo(s);
    return f;
}

int main(){
    int a = source();
    int q = bar(a);
    sink(q); 
}