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

#include <cstdlib>
#include <cwchar>

#include "test.h"

#define BUF_SIZE (40)

/**
 * @tc.name      : Wcstombs0100
 * @tc.desc      : convert a wide-character string to a multibyte string
 * @tc.level     : Level 0
 */
void Wcstombs0100(void)
{
    char buf[BUF_SIZE] = { 0 };
    wchar_t src[] = L"Hello";

    size_t result = wcstombs(buf, src, BUF_SIZE);
    if (result == static_cast<size_t>(-1)) {
        t_error("%s failed: wcstombs. result = %zu\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcstombs0200
 * @tc.desc      : convert a wide-character string to a multibyte string with zero size
 * @tc.level     : Level 1
 */
void Wcstombs0200(void)
{
    char buf[BUF_SIZE] = { 0 };
    wchar_t src[] = L"Hello";

    size_t result = wcstombs(buf, src, 0);
    if (result != 0) {
        t_error("%s failed: wcstombs. result = %zu\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcstombs0300
 * @tc.desc      : convert a wide-character string to nullptr
 * @tc.level     : Level 2
 */
void Wcstombs0300(void)
{
    wchar_t src[] = L"Hello";

    size_t result = wcstombs(nullptr, src, 0);
    if (result != wcslen(src)) {
        t_error("%s failed: wcstombs. result = %zu\n", __func__, result);
    }
}

static int WcstombsTestImpl(int argc, char* argv[])
{
    Wcstombs0100();
    Wcstombs0200();
    Wcstombs0300();

    return T_STATUS;
}

int WcstombsTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcstombsTestImpl(1, libcArgvStub);
}
