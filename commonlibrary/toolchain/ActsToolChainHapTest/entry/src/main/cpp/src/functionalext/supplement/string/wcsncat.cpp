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
 * @tc.name      : Wcsncat0100
 * @tc.desc      : test the wcsncat method to pass the source wide string into the target wide string according to the
 *                 number passed in
 * @tc.level     : Level 0
 */
void Wcsncat0100(void)
{
    wchar_t dst[32] = { 0 };
    wchar_t* result = std::wcsncat(dst, L"hello, world!", 5);
    if (wcscmp(dst, result) != 0) {
        t_error("%s wcsncat get result is %s are not %s\n", __func__, dst, result);
    }
    if (wcscmp(dst, L"hello") != 0) {
        t_error("%s wcsncat get result is %s are not 'hello'\n", __func__, dst);
    }
}

/**
 * @tc.name      : Wcsncat0200
 * @tc.desc      : test the result of the function wcsncat when the number of incoming copies is 0
 * @tc.level     : Level 1
 */
void Wcsncat0200(void)
{
    wchar_t dst[32] = { 0 };
    wchar_t* result = std::wcsncat(dst, L"hello, world!", 0);
    if (wcscmp(dst, result) != 0) {
        t_error("%s wcsncat get result is %s are not %s\n", __func__, dst, result);
    }
    if (wcscmp(dst, L"") != 0) {
        t_error("%s wcsncat get result is %s are not 'hello'\n", __func__, dst);
    }
}

/**
 * @tc.name      : Wcsncat0300
 * @tc.desc      : test the result of the wcsncat function when the number of incoming copies is greater than the
 *                 source string
 * @tc.level     : Level 1
 */
void Wcsncat0300(void)
{
    wchar_t dst[32] = { 0 };
    wchar_t* result = std::wcsncat(dst, L"hello, world!", 16);
    if (wcscmp(dst, result) != 0) {
        t_error("%s wcsncat get result is %s are not %s\n", __func__, dst, result);
    }
    if (wcscmp(dst, L"hello, world!") != 0) {
        t_error("%s wcsncat get result is %s are not 'hello, world!'\n", __func__, dst);
    }
}

static int WcsncatTestImpl(int argc, char* argv[])
{
    Wcsncat0100();
    Wcsncat0200();
    Wcsncat0300();
    return T_STATUS;
}

int WcsncatTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcsncatTestImpl(1, libcArgvStub);
}
