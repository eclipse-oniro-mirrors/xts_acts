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
 * @tc.name      : Wcschr0100
 * @tc.desc      : returns a pointer to the first occurrence of the wide character c
 * @tc.level     : Level 0
 */
void Wcschr0100(void)
{
    wchar_t wcs[] = L"This is a c test for wcschr";
    if (*wcschr(wcs, L'c') != L'c') {
        t_error("%s the character pointed to by the pointer is not c", __func__);
    }
}

/**
 * @tc.name      : Wcschr0200
 * @tc.desc      : The target character is empty, returns a pointer to the end of the wide string
 * @tc.level     : Level 1
 */
void Wcschr0200(void)
{
    wchar_t wcs[] = L"This is a c test for wcschr";
    if ((wcschr(wcs, L'\0') - wcs) != wcslen(wcs)) {
        t_error("%s pointer does not point to end of wide string", __func__);
    }
}

/**
 * @tc.name      : Wcschr0300
 * @tc.desc      : The first character of the wide string is the target character
 * @tc.level     : Level 1
 */
void Wcschr0300(void)
{
    wchar_t wcs[] = L"This is a c test for wcschr";
    if (*wcschr(wcs, L't') != L't') {
        t_error("%s the character pointed to by the pointer is not t", __func__);
    }
}

static int WcschrTestImpl(int argc, char* argv[])
{
    Wcschr0100();
    Wcschr0200();
    Wcschr0300();
    return T_STATUS;
}

int WcschrTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcschrTestImpl(1, libcArgvStub);
}
