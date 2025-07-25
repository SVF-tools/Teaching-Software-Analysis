
#include "stdbool.h"
extern void svf_assert(bool);
int main() {
    int a = 10;
    int b = 5;
    int c = a / b;
    int d = a % b;
    svf_assert(c == 2 && d == 0);
    return 0;
}