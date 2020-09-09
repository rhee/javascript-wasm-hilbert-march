int c_interp(double buf[], double t, int num, double steps[], double arr[])
{
    /* find index */
    if (t < steps[0]) {
        buf[0] = arr[0];
        buf[1] = arr[1];
        return 0;
    }
    if (t > steps[num-1]) {
        buf[0] = arr[(num-1)*2+0];
        buf[1] = arr[(num-1)*2+1];
        return num-1;
    }
    int idx, l = 0, r = num - 1;
    while (r - l > 1) {
        idx = l + (r - l) / 2;
        if (t > steps[idx]) {
            l = idx;
        } else {
            r = idx;
        }
    }
    /* now `l` have the start index of step */
    /* interpolate within step */
    int ix = l;
    double dt = t - steps[ix], ds = steps[ix+1]-steps[ix];
    buf[0] = arr[2*ix+0] + dt * (arr[2*(ix+1)+0] - arr[2*ix+0]) / ds;
    buf[1] = arr[2*ix+1] + dt * (arr[2*(ix+1)+1] - arr[2*ix+1]) / ds;
    return ix;
}

#ifdef TEST_INTERP_C
#include <stdio.h>
#include <stdlib.h>
extern int c_fractal_num_steps(int rank);
extern int c_fractal(double arr[], int rank, double size, double dx, double dy, int dir);

int comp_ts(const void* pva, const void* pvb)
{
    double* pa = (double*)pva;
    double* pb = (double*)pvb;
    if (*pa < *pb) {
        return -1;
    }
    if (*pa > *pb) {
        return 1;
    }
    return 0;
}

int main()
{
    int rank = 5;
    int num = c_fractal_num_steps(rank);

    /* build arr */
    double *arr = (double*)calloc(num, sizeof(double)*2);
    c_fractal(arr, 5, 800.0, 15.0, 15.0, 3); // start with dir=3 ('U')

    /* build steps */
    double* steps = (double*)calloc(num,sizeof(double));
    for (int i = 0; i < num; i++) {
        steps[i] = i / (double)num;
    }

    /* test int interp(double t, int num, double* steps, double* arr, double* px, double* py) */
    double ts[20];
    srand(1);
    for (int i = 0; i < 20; i++) {
        ts[i] = (rand() % 10000) / 10000.0;
    }

    qsort(ts, 20, sizeof(double), comp_ts);

    /* run tests */
    for (int i = 0; i < 20; i++) {
        double t = ts[i];
        double buf[2];
        int ix = c_interp(buf, t, num, steps, arr);
        printf("test %3d: t=%f, x=%f,y=%f ix=%d\n",i,t,buf[0],buf[1],ix);
    }

    free(steps);
    free(arr);
}
/*
 * clang -DTEST_INTERP_C -g -Wall -Wpedantic -o interp interp.c fractal.c && ./interp
 */
#endif /* TEST_INTERP_C */
