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

#include <resolv.h>
#include "functionalext.h"

namespace {
constexpr int K_DNS_BUF_BYTES = 1024;
constexpr int K_WWW_BAIDU_DN_COMP_LEN = 15;
constexpr int K_OVERLONG_DNS_NAME_LOOP = 260;
} // namespace

/**
 * @tc.name      : DnComp0100
 * @tc.desc      : Verify domain name compression (all parameters are valid)
 * @tc.level     : Level 0
 */
void DnComp0100(void)
{
    char name[K_DNS_BUF_BYTES] = "www.baidu.com";
    unsigned char buf[K_DNS_BUF_BYTES] = "\0";
    int result = dn_comp(name, buf, K_DNS_BUF_BYTES, nullptr, nullptr);
    EXPECT_EQ("DnComp0100", result, K_WWW_BAIDU_DN_COMP_LEN);
}

/**
 * @tc.name      : DnComp0200
 * @tc.desc      : Verify that the domain name cannot be compressed (SRC parameter invalid, length 1)
 * @tc.level     : Level 1
 */
void DnComp0200(void)
{
    char name[K_DNS_BUF_BYTES] = ".";
    unsigned char buf[K_DNS_BUF_BYTES] = "\0";
    int result = dn_comp(name, buf, K_DNS_BUF_BYTES, nullptr, nullptr);
    EXPECT_EQ("DnComp0200", result, 1);
}

/**
 * @tc.name      : DnComp0300
 * @tc.desc      : Verify that the domain name cannot be compressed (SRC parameter invalid, length greater than 253)
 * @tc.level     : Level 2
 */
void DnComp0300(void)
{
    char name[K_DNS_BUF_BYTES];
    for (int i = 0; i < K_OVERLONG_DNS_NAME_LOOP; i++) {
        name[i] = 'w';
    }
    unsigned char buf[K_DNS_BUF_BYTES] = "\0";
    int result = dn_comp(name, buf, K_DNS_BUF_BYTES, nullptr, nullptr);
    EXPECT_EQ("DnComp0300", result, -1);
}

/**
 * @tc.name      : DnComp0400
 * @tc.desc      : Verify that the domain name cannot be compressed (the space parameter is invalid, equal to 0)
 * @tc.level     : Level 2
 */
void DnComp0400(void)
{
    char name[K_DNS_BUF_BYTES] = "www.baidu.com";
    unsigned char buf[K_DNS_BUF_BYTES] = "\0";
    int result = dn_comp(name, buf, 0, nullptr, nullptr);
    EXPECT_EQ("DnComp0400", result, -1);
}

/**
 * @tc.name      : DnComp0500
 * @tc.desc      : Verify that the domain name cannot be compressed (space argument is invalid, less than 0)
 * @tc.level     : Level 2
 */
void DnComp0500(void)
{
    char name[K_DNS_BUF_BYTES] = "www.baidu.com";
    unsigned char buf[K_DNS_BUF_BYTES] = "\0";
    int result = dn_comp(name, buf, -1, nullptr, nullptr);
    EXPECT_EQ("DnComp0500", result, -1);
}

/**
 * @tc.name      : DnComp0600
 * @tc.desc      : Verify that the domain name cannot be compressed (space argument is invalid, equal to 1)
 * @tc.level     : Level 2
 */
void DnComp0600(void)
{
    char name[K_DNS_BUF_BYTES] = "www.baidu.com";
    unsigned char buf[K_DNS_BUF_BYTES] = "\0";
    int result = dn_comp(name, buf, 1, nullptr, nullptr);
    EXPECT_EQ("DnComp0600", result, -1);
}

static int DnCompTestWithArgs(int argc, char* argv[])
{
    DnComp0100();
    DnComp0200();
    DnComp0300();
    DnComp0400();
    DnComp0500();
    DnComp0600();
    return T_STATUS;
}

int DnCompTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return DnCompTestWithArgs(1, libcArgvStub);
}
