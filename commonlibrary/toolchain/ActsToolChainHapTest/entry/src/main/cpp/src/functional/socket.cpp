/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstdio>
#include <cerrno>
#include <cstring>
#include <sys/socket.h>
#include <netinet/in.h>
#include <sys/time.h>
#include <fcntl.h>
#include "test.h"

#define TEST(c, ...) ((c) ? 1 : (t_error(#c" failed: " __VA_ARGS__), 0))
#define TESTE(c) (errno=0, TEST(c, "errno = %s\n", strerror(errno)))

static int SocketTestImpl(void)
{
    struct sockaddr_in sa = { .sin_family = AF_INET };
    int s;
    int c;
    int t;
    char buf[100];

    TESTE((s=socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP))>=0);
    TESTE(bind(s, reinterpret_cast<struct sockaddr*>(&sa), sizeof sa)==0);
    socklen_t saLen = sizeof sa;
    TESTE(getsockname(s, reinterpret_cast<struct sockaddr*>(&sa), &saLen)==0);

    struct timeval tv = {.tv_usec=1};
    TESTE(setsockopt(s, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(struct timeval))==0);

    TESTE((c=socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP))>=0);
    sa.sin_addr.s_addr = htonl(0x7f000001);
    TESTE(sendto(c, "x", 1, 0, reinterpret_cast<struct sockaddr*>(&sa), sizeof sa)==1);
    saLen = sizeof sa;
    TESTE(recvfrom(s, buf, sizeof buf, 0, reinterpret_cast<struct sockaddr*>(&sa), &saLen)==1);
    TEST(buf[0]=='x', "'%c'\n", buf[0]);

    close(c);
    close(s);

    memset(&sa, 0, sizeof sa);
    sa.sin_family = AF_INET;
    TESTE((s=socket(PF_INET, SOCK_STREAM|SOCK_CLOEXEC, IPPROTO_TCP))>=0);
    TEST(fcntl(s, F_GETFD)&FD_CLOEXEC, "SOCK_CLOEXEC did not work\n");
    TESTE(bind(s, reinterpret_cast<struct sockaddr*>(&sa), sizeof sa)==0);
    saLen = sizeof sa;
    TESTE(getsockname(s, reinterpret_cast<struct sockaddr*>(&sa), &saLen)==0);
    sa.sin_addr.s_addr = htonl(0x7f000001);

    TESTE(listen(s, 1)==0);

    TESTE((c=socket(PF_INET, SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP))>=0);
    TEST(fcntl(c, F_GETFL)&O_NONBLOCK, "SOCK_NONBLOCK did not work\n");

    TESTE(connect(c, reinterpret_cast<struct sockaddr*>(&sa), sizeof sa)==0 || errno==EINPROGRESS);

    socklen_t acceptLen = sizeof sa;
    TESTE((t=accept(s, reinterpret_cast<struct sockaddr*>(&sa), &acceptLen))>=0);

    close(t);
    close(c);
    close(s);

    return g_tStatus;
}

int SocketTest(void)
{
    return SocketTestImpl();
}
