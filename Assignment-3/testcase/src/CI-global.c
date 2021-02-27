extern void MAYALIAS(void* p, void* q);

int global;
int *p_global;

void foo() {
	p_global = &global;
}

int main() {
	int *p_local;
	p_local = &global;
	foo();
	MAYALIAS(p_local, p_global);
	return 0;
}