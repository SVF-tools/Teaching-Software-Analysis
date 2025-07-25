extern int source();
extern void sink(int s);

int main(){
    int a = source();
    int b = source();
    sink(a);
    sink(b);
}