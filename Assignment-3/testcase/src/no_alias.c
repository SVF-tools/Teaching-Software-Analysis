extern void NOALIAS(void* p, void* q);


int global_obj_f;
int *global_ptr_f = &global_obj_f;
int main(){

    int a = 5;
    NOALIAS(global_ptr_f,&a);
    return 0;

}