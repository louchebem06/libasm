#include "../include/test.hpp"

static void print_value_strcpy(const char * dest, const char * src) {
	vector<string> const tab {
		"VarName",
		"Value",
		"Pointer"
	};

	for (string str : tab)
		cout << "|" << setw(14) << str;
	cout << "|" << endl;
	cout << "|" << setw(14) << "src";
	cout << "|" << setw(14) << src;
	cout << "|" << setw(14) << &src << "|" << endl;
	cout << "|" << setw(14) << "dest";
	cout << "|" << setw(14) << dest;
	cout << "|" << setw(14) << &dest << "|" << endl;
	cout << "|" << string((14 * 3) + 2, '-') << "|" << endl;
}

void ft_strcpy_test(void) {
	char *src, *dest;

	src = strdup("Hello World!");
	dest = (char *)calloc(sizeof(char), ft_strlen(src));
	cout << "|" << string(12, '=') <<" Before ft_strcpy() " << string(12, '=') << "|" << endl;
	print_value_strcpy(dest, src);
	dest = ft_strcpy(dest, src);
	cout << "|" << string(12, '=') <<" After ft_strcpy() " << string(13, '=') << "|" << endl;
	print_value_strcpy(dest, src);
	free(src);
	free(dest);
	cout << endl;
}
