#include "../include/test.hpp"

void ft_write_test(void) {
	vector<pair<int, string> > const tab = {
		make_pair(1, "Hello World!\n"),
		make_pair(1, "\n"),
		make_pair(1, "4242\n"),
		make_pair(1, "99999999\n"),
		make_pair(-1, "Hello World!\n"),
		make_pair(-11, "\n"),
		make_pair(-42, "4242\n"),
		make_pair(-9, "99999999\n"),
	};
	typedef ssize_t (*ptrWrite)(int, const void *, size_t);
	ptrWrite wrt[2] = { &func_write, &write };

	cout << "== write() ==" << endl;
	for (pair<int, string> p : tab)
	{
		for (int i = 0; i < 2; i++, errno = 0)
		{
			int ret = wrt[i](p.first, p.second.c_str(), p.second.size());
			(ret == -1) ? perror((i == 0) ? "FT" : "STD") : (void)(cout << ret << endl);
		}
	}
	cout << endl;
}
