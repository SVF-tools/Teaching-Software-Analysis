extern void MAYALIAS(void* p, void* q);


void foo(int *m, int *n)
{
	MAYALIAS(m,n);
}

int main()
{
	int *p, *q;
	int a,b;
	if (a) {
		p = &a;
		q = &b;
		foo(p,q);
	}
	else {
		p = &b;
		q = &a;
		foo(p,q);
	}
	return 0;
}