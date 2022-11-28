#include <stdio.h>

int main() {
    FILE *fp;
    fp = fopen("test.txt", "w");
    for (int i = 0; i < 100000; i++) {
        fprintf(fp, "i %d a\n", i);
    }
    fprintf(fp, "f 256\n");
    fprintf(fp, "d 256\n");
    fprintf(fp, "f 256\n");
    fprintf(fp, "i 256 a\n");
    fprintf(fp, "f 256\n");
    for (int i = 0; i < 100000; i++) {
        fprintf(fp, "d %d\n", i);
    }
    fprintf(fp, "q\n");
    fclose(fp);
    return 0;
}
