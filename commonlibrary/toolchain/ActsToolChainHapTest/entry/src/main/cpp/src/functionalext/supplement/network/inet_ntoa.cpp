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
#include "functionalext.h"

/**
 * @tc.name      : InetNtoa0100
 * @tc.desc      : Validation converts a network binary number to an IP address string
 * @tc.level     : Level 0
 */
void InetNtoa0100()
{
    struct in_addr a = { (htonl)(0x7f000001) };
    char* result = inet_ntoa(a);
    EXPECT_STREQ("InetNtoa0100", result, "127.0.0.1");
}

static int InetNtoaTestImpl(int argc, char* argv[])
{
    InetNtoa0100();

    return T_STATUS;
}

int InetNtoaTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return InetNtoaTestImpl(1, libcArgvStub);
}
