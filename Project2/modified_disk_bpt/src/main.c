#include "bpt.h"
#include <time.h>

clock_t clock(void);
int num_of_split, num_of_coalesce;

int main(){
    double start, end;
    int64_t input;
    char instruction;
    char buf[120];
    char *result;
    //start time checking
    start = (double)clock() / CLOCKS_PER_SEC;
    open_table("test.db");
    while (scanf("%c", &instruction) != EOF) {
        switch(instruction){
            case 'i':
                scanf("%ld %s", &input, buf);
                db_insert(input, buf);
                break;
            case 'f':
                scanf("%ld", &input);
                result = db_find(input);
                if (result) {
                    printf("Key: %ld, Value: %s\n", input, result);
                }
                else {
                    printf("Not Exists\n");
                }
                fflush(stdout);
                break;
            case 'd':
                scanf("%ld", &input);
                db_delete(input);
                break;
            case 'q':
                //stop time checking
                end = ((double)clock()) / CLOCKS_PER_SEC;
                //when quit the program, print the total number of split and coalesce and total execution time
                printf("Split : %d\nCoalesce : %d\n", num_of_split, num_of_coalesce);
                printf("Execution time : %lf\n", (end - start));
                while (getchar() != (int)'\n');
                return EXIT_SUCCESS;
                break;   
        }
        while (getchar() != (int)'\n');
    }
    printf("\n");
    return 0;
}

