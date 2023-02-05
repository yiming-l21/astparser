func factorial(n uint64)(result uint64) {
	int result = 1;
    for (int i = 2; i <= n; ++i) {
        result *= i;
    }
    return result;
}
