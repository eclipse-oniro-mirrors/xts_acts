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

#include <clocale>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include "test.h"

/**
 * @tc.name      : wcsnrtombs_0100
 * @tc.desc      : Convert wn wide characters in a wide string to a multibyte string
 * @tc.level     : Level 0
 */
static void Wcsnrtombs0100(void)
{
    const wchar_t src[] = L"test wcsnrtombs";
    const wchar_t *p;
    mbstate_t mbs;
    char buffer[32];
    int wn = 4;
    int n = 4;
    mbrlen(nullptr, 0, &mbs);
    memset(buffer, 0, sizeof(buffer));
    p = src;
    int result = wcsnrtombs(buffer, &p, wn, n, &mbs);
    if (result < 0) {
        t_error("%s, get result failed", __func__);
    }
    if (strcmp(buffer, "test")) {
        t_error("%s string in buffer is not right", __func__);
    }
}

/**
 * @tc.name      : wcsnrtombs_0200
 * @tc.desc      : Conversion of wide characters to multibyte characters when wn < n
 * @tc.level     : Level 1
 */
void Wcsnrtombs0200(void)
{
    const wchar_t src[] = L"test wcsnrtombs";
    const wchar_t *p;
    mbstate_t mbs;
    char buffer[32];
    int wn = 4;
    int n = 5;
    mbrlen(nullptr, 0, &mbs);
    memset(buffer, 0, sizeof(buffer));
    p = src;
    int result = wcsnrtombs(buffer, &p, wn, n, &mbs);
    if (result < 0) {
        t_error("%s get result failed", __func__);
    }
    if (strcmp(buffer, "test")) {
        t_error("%s string in buffer is not right", __func__);
    }
}

/**
 * @tc.name      : wcsnrtombs_0300
 * @tc.desc      : Conversion of wide characters to multibyte characters when dst=nullptr
 * @tc.level     : Level 2
 */
void Wcsnrtombs0300(void)
{
    const wchar_t src[] = L"test wcsnrtombs";
    const wchar_t *p;
    mbstate_t mbs;
    char *buffer = nullptr;
    int wn = 4;
    int n = 4;
    mbrlen(nullptr, 0, &mbs);
    p = src;
    int result = wcsnrtombs(buffer, &p, wn, n, &mbs);
    if (result < 0) {
        t_error("%s get result failed", __func__);
    }
    if (result != wn) {
        t_error("%s get result is not equal to %d", __func__, wn);
    }
}

static int WcsnrtombsTestImpl(int argc, char *argv[])
{
    Wcsnrtombs0100();
    Wcsnrtombs0200();
    Wcsnrtombs0300();
    return g_tStatus;
}

int WcsnrtombsTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return WcsnrtombsTestImpl(1, libcArgv);
}
