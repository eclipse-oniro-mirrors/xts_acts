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
constexpr size_t K_FIVE_WIDE_PREFIX = 5U;
} // namespace

/**
 * @tc.name      : Wmemset0100
 * @tc.desc      : Copies the specified number of wide characters from the source to the destination
 * @tc.level     : Level 0
 */
void Wmemset0100(void)
{
    const int index = 20;
    int count = 10;
    wchar_t ch = L'C';
    wchar_t des[index];
    wmemset(des, ch, count);
    for (int i = 0; i < count; i++) {
        if (des[i] != ch) {
            t_error("%s des[%d] is not C\n", __func__, i);
        }
    }
}

/**
 * @tc.name      : Wmemset0200
 * @tc.desc      : test wmemset when count is 0
 * @tc.level     : Level 1
 */
void Wmemset0200(void)
{
    const int index = 10;
    int count = 0;
    wchar_t ch = L'C';
    wchar_t des[index];
    wmemset(des, ch, count);
    for (int i = 0; i < index; i++) {
        if (des[i] == ch) {
            t_error("%s des[%d] is not want C\n", __func__, i);
        }
    }
}

/**
 * @tc.name      : Wmemset0300
 * @tc.desc      : test wmemset when count is equal to the number characters in dest string
 * @tc.level     : Level 1
 */
void Wmemset0300(void)
{
    const int index = 10;
    int count = 10;
    wchar_t ch = L'C';
    wchar_t des[index];
    wmemset(des, ch, count);
    for (int i = 0; i < index; i++) {
        if (des[i] != ch) {
            t_error("%s des[%d] is not want C\n", __func__, i);
        }
    }
}

/**
 * @tc.name      : Wmemset0400
 * @tc.desc      : Fills array with non-ASCII wide character
 * @tc.level     : Level 0
 */
void Wmemset0400(void)
{
    const int size = 8;
    wchar_t ch = L'中';
    wchar_t des[size];
    wmemset(des, ch, size);
    for (int i = 0; i < size; i++) {
        if (des[i] != ch) {
            t_error("%s des[%d] is not %lc\n", __func__, i, ch);
        }
    }
}

/**
 * @tc.name      : Wmemset0500
 * @tc.desc      : Verifies return value is the destination pointer
 * @tc.level     : Level 1
 */
void Wmemset0500(void)
{
    wchar_t des[10];
    wchar_t* ret = wmemset(des, L'R', K_FIVE_WIDE_PREFIX);
    if (ret != des) {
        t_error("%s Return value is not destination pointer\n", __func__);
    }
}

/**
 * @tc.name      : Wmemset0600
 * @tc.desc      : Fills array with null wide character
 * @tc.level     : Level 1
 */
void Wmemset0600(void)
{
    const int size = 6;
    wchar_t des[size];
    for (int i = 0; i < size; i++) {
        des[i] = L'A' + i;
    }
    wmemset(des, L'\0', size);
    for (int i = 0; i < size; i++) {
        if (des[i] != L'\0') {
            t_error("%s des[%d] is not null character\n", __func__, i);
        }
    }
}

/**
 * @tc.name      : Wmemset0700
 * @tc.desc      : Fills entire array with wide character
 * @tc.level     : Level 0
 */
void Wmemset0700(void)
{
    const int size = 15;
    wchar_t ch = L'X';
    wchar_t des[size];
    wmemset(des, ch, size);
    for (int i = 0; i < size; i++) {
        if (des[i] != ch) {
            t_error("%s des[%d] is not %lc\n", __func__, i, ch);
        }
    }
}

/**
 * @tc.name      : Wmemset0800
 * @tc.desc      : Fills zero elements (n = 0)
 * @tc.level     : Level 1
 */
void Wmemset0800(void)
{
    wchar_t des[10] = { L'A', L'B', L'C', L'D', L'E' };
    wchar_t original[K_FIVE_WIDE_PREFIX];
    std::wcsncpy(original, des, K_FIVE_WIDE_PREFIX);
    wmemset(des, L'Z', 0);
    for (int i = 0; i < static_cast<int>(K_FIVE_WIDE_PREFIX); i++) {
        if (des[i] != original[i]) {
            t_error("%s des[%d] was modified when n=0\n", __func__, i);
        }
    }
}

static int WmemsetTestImpl(int argc, char* argv[])
{
    Wmemset0100();
    Wmemset0200();
    Wmemset0300();
    Wmemset0400();
    Wmemset0500();
    Wmemset0600();
    Wmemset0700();
    Wmemset0800();
    return T_STATUS;
}

int WmemsetTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WmemsetTestImpl(1, libcArgvStub);
}
