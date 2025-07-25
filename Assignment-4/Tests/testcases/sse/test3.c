
// CHECK: ^sat$

extern int nd(void);

#include "stdbool.h"

extern void svf_assert(bool);

int main() {
    int x, y;
    x = 1;
    y = 1;

    if (nd()) {
        x++;
        y++;
    }
    svf_assert(x == y);
    return 0;
}