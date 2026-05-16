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

namespace {
constexpr size_t K_SOURCE_STR_BUF_ELEMS = 14U;
constexpr size_t K_SOURCE_STR_LAST_IDX = 13U;
constexpr size_t K_EMPTY_DST_ELEMS = 1U;
constexpr size_t K_SINGLE_CHAR_DST_ELEMS = 2U;
constexpr size_t K_SINGLE_CHAR_LAST_IDX = 1U;
constexpr size_t K_SPECIAL_STR_BUF_ELEMS = 16U;
constexpr size_t K_SPECIAL_STR_LAST_IDX = 15U;
constexpr size_t K_BUFFER_EXACT_ELEMS = 7U;
constexpr size_t K_BUFFER_LAST_IDX = 6U;
} // namespace

/**
 * @tc.name      : Wcpcpy0100
 * @tc.desc      : test the wcpcpy method to copy a wide string in bits
 * @tc.level     : Level 0
 */
void Wcpcpy0100(void)
{
    wchar_t src[] = L"Source string";
    wchar_t dst[K_SOURCE_STR_BUF_ELEMS];
    wchar_t* result = wcpcpy(dst, src);
    if (wcscmp(result, dst + K_SOURCE_STR_LAST_IDX) != 0) {
        t_error("%s wcpcpy get result is %ls are not want %ls\n", __func__, result, dst + K_SOURCE_STR_LAST_IDX);
    }
    if (wcscmp(src, dst) != 0) {
        t_error("%s wcpcpy get dst is %ls are not want %ls\n", __func__, dst, src);
    }
}

/**
 * @tc.name      : Wcpcpy0200
 * @tc.desc      : Copy empty wide string
 * @tc.level     : Level 0
 */
void Wcpcpy0200(void)
{
    wchar_t src[] = L"";
    wchar_t dst[K_EMPTY_DST_ELEMS];
    wchar_t* result = wcpcpy(dst, src);

    if (result != dst) {
        t_error("%s wcpcpy get result is %p are not want %p\n", __func__, result, dst);
    }

    if (dst[0] != L'\0') {
        t_error("%s wcpcpy get dst is not empty string\n", __func__);
    }
}

/**
 * @tc.name      : Wcpcpy0300
 * @tc.desc      : Copy single character wide string
 * @tc.level     : Level 0
 */
void Wcpcpy0300(void)
{
    wchar_t src[] = L"A";
    wchar_t dst[K_SINGLE_CHAR_DST_ELEMS];
    wchar_t* result = wcpcpy(dst, src);

    if (wcscmp(result, dst + K_SINGLE_CHAR_LAST_IDX) != 0) {
        t_error("%s wcpcpy get result is %ls are not want %ls\n", __func__, result, dst + K_SINGLE_CHAR_LAST_IDX);
    }

    if (wcscmp(src, dst) != 0) {
        t_error("%s wcpcpy get dst is %ls are not want %ls\n", __func__, dst, src);
    }
}

/**
 * @tc.name      : Wcpcpy0400
 * @tc.desc      : Copy wide string with special characters
 * @tc.level     : Level 1
 */
void Wcpcpy0400(void)
{
    wchar_t src[] = L"test\nString\t123";
    wchar_t dst[K_SPECIAL_STR_BUF_ELEMS];
    wchar_t* result = wcpcpy(dst, src);

    if (wcscmp(result, dst + K_SPECIAL_STR_LAST_IDX) != 0) {
        t_error("%s wcpcpy get result is %ls are not want %ls\n", __func__, result, dst + K_SPECIAL_STR_LAST_IDX);
    }

    if (wcscmp(src, dst) != 0) {
        t_error("%s wcpcpy get dst is %ls are not want %ls\n", __func__, dst, src);
    }
}

/**
 * @tc.name      : Wcpcpy0500
 * @tc.desc      : Copy to exactly sized buffer
 * @tc.level     : Level 1
 */
void Wcpcpy0500(void)
{
    wchar_t src[] = L"Buffer";
    wchar_t dst[K_BUFFER_EXACT_ELEMS];
    wchar_t* result = wcpcpy(dst, src);

    if (wcscmp(result, dst + K_BUFFER_LAST_IDX) != 0) {
        t_error("%s wcpcpy get result is %ls are not want %ls\n", __func__, result, dst + K_BUFFER_LAST_IDX);
    }

    if (wcscmp(src, dst) != 0) {
        t_error("%s wcpcpy get dst is %ls are not want %ls\n", __func__, dst, src);
    }
}

static int WcpcpyTestImpl(int argc, char* argv[])
{
    Wcpcpy0100();
    Wcpcpy0200();
    Wcpcpy0300();
    Wcpcpy0400();
    Wcpcpy0500();
    return T_STATUS;
}

int WcpcpyTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcpcpyTestImpl(1, libcArgvStub);
}
