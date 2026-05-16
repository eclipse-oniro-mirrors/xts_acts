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

#include <ifaddrs.h>
#include "functionalext.h"

/**
 * @tc.name      : Getifaddrs0100
 * @tc.desc      : The parameter is valid, and the information of the local network interface can be obtained.
 * @tc.level     : Level 0
 */
void Getifaddrs0100(void)
{
    struct ifaddrs* ifaddr;
    int ret = getifaddrs(&ifaddr);
    EXPECT_EQ("Getifaddrs0100", ret, 0);
    freeifaddrs(ifaddr);
    ifaddr = nullptr;
}

static int GetifaddrsTestImpl(int argc, char* argv[])
{
    Getifaddrs0100();
    return T_STATUS;
}

int GetifaddrsTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetifaddrsTestImpl(1, libcArgvStub);
}
