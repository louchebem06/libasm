#include "../include/test.hpp"

void ft_atoi_base_test(void) {
	vector<pair<string, string> > const tab = {
		make_pair("125", "0123456789"),
		make_pair("1111101", "01"),
		make_pair("7D", "0123456789ABCDEF"),
		make_pair("uoi", "choumi"),
		make_pair("error", "-asd")
	};

	for (pair<string, string> p : tab) {
		int ret = ft_atoi_base(p.first, p.second);
		cout << ret << endl;
		cout << ((ret == ((p.first == "error") ? 0 : 125)) ? "✅" : "❌") << endl;
	}
}
