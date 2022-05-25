#include "../include/test.hpp"

void ft_read_test(void) {
	char buff[2][1024];
	typedef ssize_t (*ptrRead)(int, void *, size_t);
	ptrRead rd[2] = { &FT_READ, &read };
	int ret;

	cout << "== Test file ==" << endl;
	for (int i = 0; i < 2; i++) {
		int fd = open("test/text.txt", O_RDONLY);
		ret = rd[i](fd, buff[i], 1024);
		(ret == -1) ? perror((!i) ? "FT" : "STD") : (void)(cout << buff[i] << "RET : " << ret << endl);
		close(fd);
		cout << endl;
	}
	cout << "== Test invalid fd ==" << endl;
	for (int i = 0; i < 2; i++) {
		ret = rd[i](-42, buff[i], 1024);
		(ret == -1) ? perror((!i) ? "FT" : "STD") : (void)(cout << buff[i] << endl << "RET : " << ret << endl);
	}
	cout << endl;
}
