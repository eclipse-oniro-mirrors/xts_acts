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

#include <cstddef>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include "test.h"

namespace {
constexpr size_t K_WCSRCHR_LAST_L_OFFSET_WIDE = 10U;
} // namespace

/**
 * @tc.name      : Wcsrchr0100
 * @tc.desc      : test wcsrchr to get the position of the last occurrence of the target wide character in the wide
 *                 string
 * @tc.level     : Level 0
 */
void Wcsrchr0100(void)
{
    wchar_t* ch = L"hello, world";
    wchar_t* result = wcsrchr(ch, L'h');
    if (wcscmp(result, ch) != 0) {
        t_error("%s wcsrchr get result is %s are not want 'hello, world'\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsrchr0200
 * @tc.desc      : wcsrchr returns result when testing multiple occurrences of target character in wide string
 * @tc.level     : Level 1
 */
void Wcsrchr0200(void)
{
    wchar_t* ch = L"hello, world";
    wchar_t* result = wcsrchr(ch, L'l');
    if (wcscmp(result, ch + K_WCSRCHR_LAST_L_OFFSET_WIDE) != 0) {
        t_error("%s wcsrchr get result is %s are not want 'ld'\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcsrchr0300
 * @tc.desc      : The test wide string does not contain the target wide character is the wcsrchr result
 * @tc.level     : Level 1
 */
void Wcsrchr0300(void)
{
    wchar_t* ch = L"hello, world";
    wchar_t* result = wcsrchr(ch, L'a');
    if (result) {
        t_error("%s wcsrchr get result is %s are not want ''\n", __func__, result);
    }
}

static int WcsrchrTestImpl(int argc, char* argv[])
{
    Wcsrchr0100();
    Wcsrchr0200();
    Wcsrchr0300();
    return T_STATUS;
}

int WcsrchrTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcsrchrTestImpl(1, libcArgvStub);
}
