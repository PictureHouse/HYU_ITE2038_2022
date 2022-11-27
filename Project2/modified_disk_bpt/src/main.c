#include "bpt.h"

int num_of_split, num_of_coalesce, num_of_transfer;

int main(){
    int64_t input;
    char instruction;
    char buf[120];
    char *result;
    open_table("test.db");
    while(scanf("%c", &instruction) != EOF){
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
                else
                    printf("Not Exists\n");

                fflush(stdout);
                break;
            case 'd':
                scanf("%ld", &input);
                db_delete(input);
                break;
            case 'q':
                printf("Split : %d\nCoalesce : %d\nTransfer : %d\n", num_of_split, num_of_coalesce, num_of_transfer);
                while (getchar() != (int)'\n');
                return EXIT_SUCCESS;
                break;   

        }
        while (getchar() != (int)'\n');
    }
    printf("\n");
    return 0;
}



