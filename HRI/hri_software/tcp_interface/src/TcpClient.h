#ifndef __TCPCLIENT_H__
#define __TCPCLIENT_H__

#include <stdio.h>
#include <errno.h>
#include <sys/types.h>
#include <stdlib.h>
#include <cstring>
#include <string>

#ifdef WIN32
	#include <winsock2.h>
	#include <io.h>
#else
	#include <sys/socket.h>
	#include <netinet/in.h>
	#include <arpa/inet.h>
	#include <unistd.h>
	#include <netdb.h>
#endif


class TcpClient {
public:
	int sockfd;
	
protected:
	struct sockaddr_in serv_addr;
    std::string name, host; int port;
	
public:
    TcpClient(std::string n);
    virtual ~TcpClient();
	bool connect(const char* host, int port);
	bool connect(std::string host, int port);
	void close();
	bool send(const void* buffer, int len);
	bool send(const char* buffer);
	int receive(char *buffer, int len);

	bool connected;
	std::string getHostPort_string();
    std::string getHost_string();
    std::string getName_string();
		
};

#endif
