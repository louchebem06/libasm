#include "../include/test.hpp"

void ft_atoi_base_test(void) {
	vector<pair<string, string> > const tab = {
		make_pair("125", "0123456789"),
		make_pair("1111101", "01"),
		make_pair("7D", "0123456789ABCDEF"),
		make_pair("uoi", "choumi"),
		make_pair("error", "-asd"),
		make_pair("error", "1"),
		make_pair("error", ""),
		make_pair("error", "abcdefgha"),
		make_pair("error", "abcdefghzabcdefgh")
	};

	for (pair<string, string> p : tab) {
		int ret = ft_atoi_base((char *)p.first.c_str(), (char *)p.second.c_str());
		cout << ret << endl;
		cout << ((ret == ((p.first == "error") ? 0 : 125)) ? "✅" : "❌") << endl;
	}
}
