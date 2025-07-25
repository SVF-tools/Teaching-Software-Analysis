//
// Created by Jiawei Wang on 2/3/22.
//

#include "stdbool.h"
extern void svf_assert(bool);

int getValue(int* arr, int idx) {
    return arr[idx];
}

int main() {
    int arr[2];
    arr[0] = 0;
    arr[1] = 1;
    int v = getValue(arr, 1);
    svf_assert(v == 1);
    return 0;
}