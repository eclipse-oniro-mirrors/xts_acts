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
 * @tc.name      : Wprintf0100
 * @tc.desc      : Print formatted characters to stdout
 * @tc.level     : Level 0
 */
void Wprintf0100(void)
{
    int result = wprintf(L"%lc\n", L'a');
    if (result < 0) {
        t_error("%s print formatted characters to stdout failed\n", __func__);
    }
}

/**
 * @tc.name      : Wprintf0200
 * @tc.desc      : Print formatted decimals to stdout
 * @tc.level     : Level 1
 */
void Wprintf0200(void)
{
    int result = wprintf(L"%d, %ld\n", 123, 650000L);
    if (result < 0) {
        t_error("%s failed to format decimals\n", __func__);
    }
}

/**
 * @tc.name      : Wprintf0300
 * @tc.desc      : Print formatted wide string to stdout
 * @tc.level     : Level 1
 */
void Wprintf0300(void)
{
    int result = wprintf(L"%ls\n", L"wprintf test");
    if (result < 0) {
        t_error("%s failed to format wide string\n", __func__);
    }
}

static int WprintfTestImpl(int argc, char* argv[])
{
    Wprintf0100();
    Wprintf0200();
    Wprintf0300();
    return T_STATUS;
}

int WprintfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WprintfTestImpl(1, libcArgvStub);
}
