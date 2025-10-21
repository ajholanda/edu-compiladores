#include <stdio.h>

int sum (int x, int y) 
{
	return x+y;
}

int main(int argc, char**argv) {
	int a, b, c;

	a = 1<<2;
	b = 1<<3;
	c = sum(a, b);

	if (c > a) 	
		printf("c=a+b=%d+%d=%d\n", a, b, c);

	return 0;
}
