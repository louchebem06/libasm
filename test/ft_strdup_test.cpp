#include "../include/test.hpp"

void ft_strdup_test(void) {
	char *buff;
	vector<string> const tab = {
		"I am string",
		"4242",
		"Hello World!"
	};

	cout << "== Test ft_strdup() ==" << endl;
	for (string str : tab) {
		buff = ft_strdup(str.c_str());
		cout << buff << endl;
		free(buff);
	}
}
