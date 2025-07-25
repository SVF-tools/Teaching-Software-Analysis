extern void MAYALIAS(void* p, void* q);
extern void NOALIAS(void* p, void* q);

typedef struct {
    int *ptr1;
    int value;
    int *ptr2;
} MyStruct;

int main() {
    int a = 10;
    int b = 20;
    MyStruct s1, s2;

    s1.ptr1 = &a;
    s1.ptr2 = &a;
    s2.ptr1 = &b;
    s2.ptr2 = &a;

    MAYALIAS(s1.ptr1, s1.ptr2);

    MAYALIAS(s1.ptr2, s2.ptr2);

    return 0;
}
