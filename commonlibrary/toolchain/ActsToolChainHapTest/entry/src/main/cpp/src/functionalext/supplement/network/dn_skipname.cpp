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
constexpr int K_DN_SKIPNAME0200_EXPECTED = 2;
} // namespace

/**
 * @tc.name      : DnSkipname0100
 * @tc.desc      : Verify that the domain name can be compressed (parameters are valid)
 * @tc.level     : Level 0
 */
void DnSkipname0100(void)
{
    unsigned char s[10] = { 0, 2, 34, 45, 75, 23, 12, 192, 87, 254 };
    int result = dn_skipname(&s[0], &s[1]);
    EXPECT_EQ("DnSkipname0100", result, 1);
}

/**
 * @tc.name      : DnSkipname0200
 * @tc.desc      : Verify that the domain name can be compressed (parameters are valid)
 * @tc.level     : Level 1
 */
void DnSkipname0200(void)
{
    unsigned char s[10] = { 0, 2, 34, 45, 75, 23, 12, 192, 87, 254 };
    int result = dn_skipname(&s[7], &s[9]);
    EXPECT_EQ("DnSkipname0200", result, K_DN_SKIPNAME0200_EXPECTED);
}

/**
 * @tc.name      : DnSkipname0300
 * @tc.desc      : Verify that the domain name cannot be compressed (s and end are equal)
 * @tc.level     : Level 2
 */
void DnSkipname0300(void)
{
    unsigned char s[10] = { 0, 2, 2, 45, 75, 23, 12, 192, 87, 254 };
    int result = dn_skipname(&s[1], &s[2]);
    EXPECT_EQ("DnSkipname0300", result, -1);
}

static int DnSkipnameTestWithArgs(int argc, char* argv[])
{
    DnSkipname0100();
    DnSkipname0200();
    DnSkipname0300();

    return T_STATUS;
}

int DnSkipnameTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return DnSkipnameTestWithArgs(1, libcArgvStub);
}
