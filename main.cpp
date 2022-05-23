#include <iostream>
#include <iomanip>
#include <vector>
#include <string>
#include <cstring>
#include "include/libasm.h"

using namespace std;

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

void print_value_strcpy(const char * dest, const char * src) {
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

void print_strcmp(vector<pair<string, string> > const & tab) {
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

int main(void) {
	ft_strlen_test();
	ft_strcpy_test();
	ft_strcmp_test();
	return (0);
}
