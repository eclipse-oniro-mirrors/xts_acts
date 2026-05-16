/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <arpa/inet.h>
#include <arpa/nameser.h>
#include <cctype>
#include <cerrno>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dlfcn.h>
#include <fcntl.h>
#include <net/if.h>
#include <netdb.h>
#include <poll.h>
#include <pthread.h>
#include <resolv.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <unistd.h>
#include "functionalext.h"

typedef void (*TEST_FUN)();
unsigned char g_testIoctlAccessTokenId = 'A';
unsigned int g_getTokenId = 1;
unsigned int g_setTokenId = 2;
const char DEVICE_TOKENID[] = "/dev/access_token_id";
constexpr int IFREQ_BUFFER_COUNT = 3;
#define TEST_TOKENID_GET_TOKENID _IOR(g_testIoctlAccessTokenId, g_getTokenId, unsigned long long)
#define TEST_TOKENID_SET_TOKENID _IOW(g_testIoctlAccessTokenId, g_setTokenId, unsigned long long)
static unsigned long long GetRand64(void)
{
    unsigned long long randValue = 0;
    int randFd = open("/dev/random", O_RDONLY);
    if (randFd > 0) {
        read(randFd, &randValue, sizeof(unsigned long long));
    }
    close(randFd);
    return randValue;
}

/**
 * @tc.name      : Ioctl0100
 * @tc.desc      : Verify ioctl management of character device.
 * @tc.level     : Level 0
 */
void Ioctl0100(void)
{
    unsigned long long tokenGet;
    unsigned long long token = GetRand64();
    int fd = open(DEVICE_TOKENID, O_RDWR);
    if (fd < 0) {
        printf("open %s failed\n", DEVICE_TOKENID);
        return;
    }
    int ret = ioctl(fd, TEST_TOKENID_GET_TOKENID, &token);
    EXPECT_EQ("Ioctl0100", 0, ret);
    ret = ioctl(fd, TEST_TOKENID_GET_TOKENID, &tokenGet);
    EXPECT_EQ("Ioctl0100", 0, ret);
    EXPECT_EQ("Ioctl0100", 0, ret);
}

/**
 * @tc.name      : Ioctl0200
 * @tc.desc      : Verify ioctl management of network device.
 * @tc.level     : Level 0
 */
void Ioctl0200(void)
{
    int sockFd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockFd < 0) {
        printf("socket failed\n");
        return;
    }
    EXPECT_NE("Ioctl0200", -1, sockFd);
    struct ifreq ifr[IFREQ_BUFFER_COUNT];
    struct ifconf ifc = { 0 };
    ifc.ifc_len = IFREQ_BUFFER_COUNT * sizeof(struct ifreq);
    ifc.ifc_buf = reinterpret_cast<char*>(ifr);
    int ret = ioctl(sockFd, SIOCGIFCONF, &ifc);
    if (ret != 0) {
        close(sockFd);
        return;
    }
    int ifrCount = ifc.ifc_len / sizeof(struct ifreq);
    for (int i = 0; i < ifrCount; i++) {
        printf("interface name: %s\n", ifr[i].ifr_name);
        printf("address: %s\n", inet_ntoa((reinterpret_cast<struct sockaddr_in*>(&(ifr[i].ifr_addr)))->sin_addr));
    }
    if (ifrCount == 0) {
        close(sockFd);
        return;
    }
    char interName[128];
    strcpy(interName, ifr[0].ifr_name);
    char interAddr[128];
    strcpy(interAddr, inet_ntoa((reinterpret_cast<struct sockaddr_in*>(&(ifr[0].ifr_addr)))->sin_addr));
    struct ifreq ifrAddr = { 0 };
    strcpy(ifrAddr.ifr_name, interName);
    ret = ioctl(sockFd, SIOCGIFADDR, &ifrAddr);
    if (ret != 0) {
        close(sockFd);
        return;
    }
    struct sockaddr_in* srvAddr = reinterpret_cast<struct sockaddr_in*>(&ifrAddr.ifr_addr);
    EXPECT_STREQ("Ioctl0200", interAddr, inet_ntoa(srvAddr->sin_addr));
    close(sockFd);
}

static TEST_FUN g_gFunArray[] = {
    Ioctl0100,
    Ioctl0200,
};

static int IoctlTestImpl(int argc, char* argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int IoctlTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return IoctlTestImpl(1, libcArgv);
}
