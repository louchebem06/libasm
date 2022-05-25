#include "../include/test.hpp"

void ft_read_test(void) {
	char buff[2][1024];
	typedef ssize_t (*ptrRead)(int, void *, size_t);
	ptrRead rd[2] = { &func_read, &read };
	int ret;

	cout << "== read() ==" << endl;
	for (int i = 0; i < 2; i++) {
		cout << "Please input for test READ " << (!i ? "FT" : "STD") << ": " << flush;
		ret = rd[i](1, buff[i], 1024);
		(ret == -1) ? perror((!i) ? "FT" : "STD") : (void)(cout << buff[i] << endl << "RET : " << ret << endl);
	}
	cout << "== Test file ==" << endl;
	for (int i = 0; i < 2; i++) {
		ret = rd[i](1, buff[i], 1024);
		int fd = open("text.txt", O_RDONLY);
		(ret == -1) ? perror((!i) ? "FT" : "STD") : (void)(cout << buff[i] << endl << "RET : " << ret << endl);
		close(fd);
	}
	cout << "== Test invalid fd ==" << endl;
	for (int i = 0; i < 2; i++) {
		ret = rd[i](1, buff[i], 1024);
		(ret == -1) ? perror((!i) ? "FT" : "STD") : (void)(cout << buff[i] << endl << "RET : " << ret << endl);
	}
	cout << endl;
}
