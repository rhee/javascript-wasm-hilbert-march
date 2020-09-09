// directions: 'R', 'L', 'D', 'U'
static int TPL[4][4][3] = {{
                        {0, 1, 3}, // U
                        {1, 1, 0}, // R
                        {1, 0, 0}, // R
                        {0, 0, 2}, // D
                    },
                    {
                        {1, 0, 2}, // D
                        {0, 0, 1}, // L
                        {0, 1, 1}, // L
                        {1, 1, 3}, // U
                    },
                    {
                        {1, 0, 1}, // L
                        {1, 1, 2}, // D
                        {0, 1, 2}, // D
                        {0, 0, 0}, // R
                    },
                    {
                        {0, 1, 0}, // R
                        {0, 0, 3}, // U
                        {1, 0, 3}, // U
                        {1, 1, 1}, // L
                    }};

static int ipow(int base, int exp)
{
    int result = 1;
    for (;;)
    {
        if (exp & 1)
            result *= base;
        exp >>= 1;
        if (!exp)
            break;
        base *= base;
    }

    return result;
}

int c_fractal_num_steps(int rank)
{
    return ipow(4,rank+1);
}

int c_fractal(double arr[],int rank, double size, double dx, double dy, int dir)
{
    if (rank == 0) {
        for (int i=0; i < 4; i++) {
            int* p = TPL[dir][i];
            arr[i*2+0] = dx + p[0] * size;
            arr[i*2+1] = dy + p[1] * size;
        }
        return 4;
    } else {
        double space = size / (ipow(2, rank + 1) - 1);
        double new_size = (size - space) / 2;
        double d2 = new_size + space;
        int pos = 0;
        for (int i=0; i < 4; i++) {
            int* p = TPL[dir][i];
            int num = c_fractal(&arr[pos*2], rank - 1, new_size, dx + p[0] * d2, dy + p[1] * d2, p[2]);
            pos += num;
        }
        return pos;
    }
}

#ifdef TEST_FRACTAL_C
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int main()
{
    int rank = 5;
    int num = c_fractal_num_steps(rank);
    double *arr = (double*)calloc(num, sizeof(double)*2);
    int num_back = c_fractal(arr, rank, 800.0, 15.0, 15.0, 3); // start with dir=3 ('U')
    assert(num == num_back);
    for (int i = 0; i < num; i+=23) {
        printf("%5d: x=%f,y=%f\n",i,arr[i*2],arr[i*2+1]);
    }
    free(arr);
}

/*
 * clang -DTEST_FRACTAL_C -g -Wall -Wpedantic -o fractal fractal.c && ./fractal
 */
#endif /* TEST_FRACTAL_C */
