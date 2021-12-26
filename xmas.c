#include <stdio.h>
#include <stdlib.h>
#include <time.h>

double rng(long int seed);
void printArr(char arr[], int length);

int main()
{
	double rand;
	int offset = 1, numEmpty = 100, length = 101, size; // Length should be an odd number for best results
	time_t seed = time(NULL); // Get UNIX timestamp
	rand = rng(seed); // Get a random number
	char* out = malloc(sizeof(char) * length);
	
	// Not really needed, but doesn't hurt to have it
	// Should not go into this block anyways
	if (out == NULL)
	{
		fprintf(stderr, "malloc() failed");
		return -1;
	}
	
	// Load up array with '_'
	for (int i = 0; i < length; i++)
		out[i] = '_';
	
	// Set "middle" value to have a '*' and dump merry xmas to stdout
	out[(length - 1) / 2] = '*';
	printf("Merry Christmas!\n");
	printArr(out, length);	
	numEmpty = 100; // Remaining positions

	while (numEmpty != 2) // As long as there's not two "empty" positions, keep filling
	{	
		if (rand > 0.5)
		{
			// > 0.5, load up a '*'
			out[((length - 1) / 2) + offset] = '*';
			out[((length - 1) / 2) - offset] = '*';
		}
		else if (rand <= 0.5)
		{
			// <= 0.5, load up an 'O'
			out[((length - 1) / 2) + offset] = 'O';
			out[((length - 1) / 2) - offset] = 'O';
		}

		printArr(out, length);
		numEmpty = numEmpty - 2;
		offset++; // Set next loading index
		seed++; // Just increment the seed, it's not great but it's good enough
		rand = rng(seed); // Generate the next number
	}
	
	// Reset the array for the stumps
	for (int i = 0; i < length; i++)
		out[i] = '_';

	// Stump will be a square ~16x smaller than the size of the array
	size = length / 16;
	out[(length - 1) / 2] = 'M';
	offset = 1;

	for (int i = 0; i < size; i++)
	{	
		// Load up the stump characters
		out[((length - 1) / 2) + offset] = 'M';
		out[((length - 1) / 2) - offset] = 'M';
		offset++;
	}
	
	// Print out to generate the square
	for (int i = 0; i < size; i++)
		printArr(out, length);

	// Clean up and done
	free(out);
	return 0;
}

// Dump contents to stdout, and print a newline when finished
void printArr(char arr[], int length)
{
	for (int i = 0; i < length; i++)
		printf("%c", arr[i]);
		
	printf("\n");
}

// Algorithm from Fortran 77 by V.A. Dyck, et al.
// Not especially great or secure by any means, but it works for our purposes
// X ~ Unif[0, 1) (generates a random number between 0 (inclusive) and 1)
double rng(long int seed)
{
	// These coefficients could be improved...
	long int temp = seed * 843314861 + 453816693;
	
	// If values are negative, fix it
	if (temp < 0)
		temp = temp + 214783647 + 1;

	// Ugly, but it works for our purposes
	return (temp * .4656612E-9) - (int) (temp * .4656612E-9); 
}
