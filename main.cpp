#include <iostream>
#include <iomanip>
#include <vector>
#include "include/libasm.hpp"

using namespace std;

void ft_strlen_test(void) {
	vector<pair<string, size_t> > const test = {
		make_pair("Null value", ft_strlen(NULL)),
		make_pair("Empty", ft_strlen("")),
		make_pair("Hello World!", ft_strlen("Hello World!")),
	};

	cout << "|==== ft_strlen() ====|" << endl;
	for (pair<string, size_t> p : test)
		cout << "| " << p.first << setw(15 - p.first.size()) << ": " << setw(4) << p.second << " |" << endl;
	cout << string(23, '-') << endl;
}

int main(void) {
	ft_strlen_test();
	return (0);
}