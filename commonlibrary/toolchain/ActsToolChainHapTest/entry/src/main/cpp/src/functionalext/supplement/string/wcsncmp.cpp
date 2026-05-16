/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include <cstring>
#include <cwchar>
#include "test.h"

/**
 * @tc.name      : Wcsncmp0100
 * @tc.desc      : test the wcsncmp function to compare the first n bits of two wide strings
 * @tc.level     : Level 0
 */
void Wcsncmp0100(void)
{
    int result = wcsncmp(L"aaaa", L"aaab", 3);
    if (result != 0) {
        t_error("%s wcsncmp get result is %d are not 0", __func__, result);
    }
}

/**
 * @tc.name      : Wcsncmp0200
 * @tc.desc      : test the wcsncmp result when comparing the top 0 bits
 * @tc.level     : Level 1
 */
void Wcsncmp0200(void)
{
    int result = wcsncmp(L"foo", L"bar", 0);
    if (result != 0) {
        t_error("%s wcsncmp get result is %d are not 0", __func__, result);
    }
}

/**
 * @tc.name      : Wcsncmp0300
 * @tc.desc      : test wcsncmp result when first wide string is lexicographically lower than second wide string
 * @tc.level     : Level 1
 */
void Wcsncmp0300(void)
{
    int result = wcsncmp(L"aaaa", L"aaab", 4);
    if (result >= 0) {
        t_error("%s wcsncmp get result is %d are not less 0", __func__, result);
    }
}

/**
 * @tc.name      : Wcsncmp0400
 * @tc.desc      : test wcsncmp result when first wide string is lexicographically higher than second wide string
 * @tc.level     : Level 1
 */
void Wcsncmp0400(void)
{
    int result = wcsncmp(L"aaab", L"aaaa", 4);
    if (result <= 0) {
        t_error("%s wcsncmp get result is %d are not more 0", __func__, result);
    }
}

static int WcsncmpTestImpl(int argc, char* argv[])
{
    Wcsncmp0100();
    Wcsncmp0200();
    Wcsncmp0300();
    Wcsncmp0400();
    return T_STATUS;
}

int WcsncmpTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcsncmpTestImpl(1, libcArgvStub);
}
