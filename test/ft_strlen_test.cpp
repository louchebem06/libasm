#include "../include/test.hpp"

void ft_strlen_test(void) {
	vector<pair<string, size_t> > const test = {
		make_pair("Empty", ft_strlen("")),
		make_pair("Hello World!", ft_strlen("Hello World!")),
	};

	cout << "|" << string(4, '=') <<" ft_strlen() " << string(4, '=') << "|" << endl;
	for (pair<string, size_t> p : test)
		cout << "| " << p.first << setw(15 - p.first.size()) << ": " << setw(4) << p.second << " |" << endl;
	cout << string(23, '-') << endl;
	cout << endl;
}
