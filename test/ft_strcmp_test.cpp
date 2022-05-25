#include "../include/test.hpp"

static void print_strcmp(vector<pair<string, string> > const & tab) {
	for (pair<string, string> p : tab) {
		int ft, lib;
		ft = ft_strcmp(p.first.c_str(), p.second.c_str());
		lib = strcmp(p.first.c_str(), p.second.c_str());
		cout << "ft_strcmp(" << (p.first.size() == 0 ? "Empty" : p.first) << ", " << (p.second.size() == 0 ? "Empty" : p.second) << ");" << endl;
		cout << "result : " << ft << endl;
		cout << "strcmp(" << (p.first.size() == 0 ? "Empty" : p.first) << ", " << (p.second.size() == 0 ? "Empty" : p.second) << ");" << endl;
		cout << "result : " << lib << endl;
		cout << "TEST : " << ((ft == lib) ? "✅" : "❌") << endl;
		cout << endl;
	}
}

void ft_strcmp_test(void) {
	vector<pair<string, string> > const tab {
		make_pair("HBCD", "abcd"),
		make_pair("abcd", "ABCD"),
		make_pair("A", "A"),
		make_pair("AB", "A"),
		make_pair("A", "AB"),
		make_pair("", "")
	};
	
	print_strcmp(tab);
}
