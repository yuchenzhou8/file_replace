#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <stdint.h>
#include <time.h>

int main(int argc, char const *argv[])
{
	FILE* fp = fopen("file_replacement.bin","r+");
	uint8_t random_data[4] = {0};

	srand(time(NULL));   // Initialization, should only be called once.
	int r = rand()%256;      // Returns a pseudo-random integer between 0 and RAND_MAX.

	for(int i = 0; i < 4; i++)
	{
		random_data[i] = rand()%256;
		printf("%d. 0X%X\n", i, random_data[i]);
	}

	if(fp)
	{
		fseek(fp, 4, SEEK_SET);
		fwrite(random_data, 1, 4, fp);
		fclose(fp);

	}

	return 0;
}