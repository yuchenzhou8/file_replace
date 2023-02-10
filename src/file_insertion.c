#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

int main(int argc, char const *argv[])
{
	
	FILE* fdp = fopen(argv[1], "w+");
	fseek(fdp, 2, SEEK_SET);
	printf("%ld\n", strlen(argv[2]));
	// fwrite(argv[2], sizeof(uint8_t), strlen(argv[2]) ,fdp);
	fclose(fdp);

	return 0;
}