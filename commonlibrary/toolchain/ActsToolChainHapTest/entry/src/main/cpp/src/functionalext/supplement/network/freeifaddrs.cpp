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

#include <cstdio>
#include <cstring>
#include <ifaddrs.h>
#include <netinet/in.h>
#include "test.h"

/**
 * @tc.name      : Freeifaddrs0100
 * @tc.desc      : Verifies that the specified memory can be freed (parameter valid)
 * @tc.level     : Level 0
 */
void Freeifaddrs0100(void)
{
    struct ifaddrs* addrs = nullptr;
    struct ifaddrs* loInet4 = nullptr;
    struct ifaddrs* loInet6 = nullptr;
    struct ifaddrs* loPacket = nullptr;

    int result = getifaddrs(&addrs);
    if (result != 0) {
        t_error("%s getifaddrs failed\n", __func__);
    }
    if (!addrs) {
        t_error("%s addrs is nullptr\n", __func__);
    }

    for (struct ifaddrs* addr = addrs; addr != nullptr; addr = addr->ifa_next) {
        if (addr->ifa_name && strcmp(addr->ifa_name, "lo") == 0) {
            if (addr->ifa_addr && addr->ifa_addr->sa_family == AF_INET) {
                loInet4 = addr;
            } else if (addr->ifa_addr && addr->ifa_addr->sa_family == AF_INET6) {
                loInet6 = addr;
            } else if (addr->ifa_addr && addr->ifa_addr->sa_family == AF_PACKET) {
                loPacket = addr;
            }
        }
    }

    if (loInet4 == nullptr) {
        t_error("%s loInet4 is nullptr\n", __func__);
    }
    if (loInet6 == nullptr) {
        t_error("%s loInet6 is nullptr\n", __func__);
    }
    if (loPacket == nullptr) {
        t_error("%s loPacket is nullptr\n", __func__);
    }

    freeifaddrs(addrs);
}

static int FreeifaddrsTestImpl(int argc, char* argv[])
{
    Freeifaddrs0100();
    return T_STATUS;
}

int FreeifaddrsTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return FreeifaddrsTestImpl(1, libcArgvStub);
}
