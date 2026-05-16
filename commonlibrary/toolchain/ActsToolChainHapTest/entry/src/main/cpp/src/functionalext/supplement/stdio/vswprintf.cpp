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

#include <cstdarg>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include "test.h"

namespace {
constexpr size_t K_FLOAT_WIDE_PREFIX_CHAR_COUNT = 3U;
} // namespace

#define MAX (20)

/**
 * @tc.name      : Vswprintf0100
 * @tc.desc      : Write formatted data %d to string from variable argument list
 * @tc.level     : Level 0
 */
void Vswprintf0100(wchar_t* format, ...)
{
    wchar_t buffer[MAX];
    va_list aptr;
    va_start(aptr, format);
    int result = std::vswprintf(buffer, MAX, format, aptr);
    va_end(aptr);
    if (result < 0) {
        t_error("%s vswprintf get result is less than 0", __func__);
    }
    if (wcscmp(buffer, L"1")) {
        t_error("%s wrong string written to buf", __func__);
    }
}

/**
 * @tc.name      : Vswprintf0200
 * @tc.desc      : Write formatted data %f to string from variable argument list
 * @tc.level     : Level 1
 */
void Vswprintf0200(wchar_t* format, ...)
{
    wchar_t buffer[MAX];
    va_list aptr;
    va_start(aptr, format);
    int result = std::vswprintf(buffer, MAX, format, aptr);
    va_end(aptr);
    if (result < 0) {
        t_error("%s vswprintf get result is less than 0", __func__);
    }
    if (wcsncmp(buffer, L"3.0", K_FLOAT_WIDE_PREFIX_CHAR_COUNT)) {
        t_error("%s wrong string written to buf", __func__);
    }
}

/**
 * @tc.name      : Vswprintf0300
 * @tc.desc      : Write formatted data %s to string from variable argument list
 * @tc.level     : Level 1
 */
void Vswprintf0300(wchar_t* format, ...)
{
    wchar_t buffer[MAX];
    va_list aptr;
    va_start(aptr, format);
    int result = std::vswprintf(buffer, MAX, format, aptr);
    va_end(aptr);
    if (result < 0) {
        t_error("%s vsprintf get result is less than 0", __func__);
    }
    if (wcscmp(buffer, L"vswprintf test")) {
        t_error("%s wrong string written to buf", __func__);
    }
}

static int VswprintfTestImpl(int argc, char* argv[])
{
    int i = 1;
    float f = 3.0f;
    wchar_t str[] = L"vswprintf test";
    Vswprintf0100(L"%d", i);
    Vswprintf0200(L"%f", f);
    Vswprintf0300(L"%ls", str);
    return T_STATUS;
}

int VswprintfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return VswprintfTestImpl(1, libcArgvStub);
}
