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
#include <cwchar>
#include "test.h"

namespace {
constexpr int K_SWSCANF_EXPECTED_PARSED_INT = 123;
} // namespace

#define BUFF_SIZE (20)
#define RESULT_VAL (2)

/**
 * @tc.name      : Swscanf0100
 * @tc.desc      : Reads data from the wide string ws and stores them according to parameter format
 * @tc.level     : Level 0
 */
void Swscanf0100(void)
{
    wchar_t wstr[] = L"swscanf 123";
    wchar_t tmp[BUFF_SIZE];
    int i;
    int result = std::swscanf(wstr, L"%ls %d", tmp, &i);
    if (result == EOF) {
        t_error("%s swscanf failed\n", __func__);
        return;
    }

    if (i != K_SWSCANF_EXPECTED_PARSED_INT) {
        t_error("%s i = %d is not want 123\n", __func__, i);
    }
    if (wcscmp(tmp, L"swscanf")) {
        t_error("%s wide string is %s not swscanf\n", __func__, tmp);
    }
}

/**
 * @tc.name      : Swscanf0200
 * @tc.desc      : Different formatted data
 * @tc.level     : Level 1
 */
void Swscanf0200(void)
{
    wchar_t wstr[] = L"swscanf 123";
    wchar_t tmp1[BUFF_SIZE];
    wchar_t tmp2[BUFF_SIZE];
    int i;
    int result = std::swscanf(wstr, L"%ls %ls", tmp1, tmp2);
    if (result == EOF) {
        t_error("%s swscanf failed\n", __func__);
        return;
    }
    if (wcscmp(tmp1, L"swscanf")) {
        t_error("%s tmp1 = %s is not want swscanf\n", __func__, tmp1);
    }
    if (wcscmp(tmp2, L"123")) {
        t_error("%s tmp2 = %s is not want 123\n", __func__, tmp2);
    }
}

/**
 * @tc.name      : Swscanf0300
 * @tc.desc      : Formatting exception
 * @tc.level     : Level 2
 */
void Swscanf0300(void)
{
    wchar_t wstr[] = L"swscanf 123";
    int i;
    int j;
    int result = std::swscanf(wstr, L"%d %d", &i, &j);
    if (result >= RESULT_VAL) {
        t_error("%s swscanf expect failed\n", __func__);
    }
}

static int SwscanfTestImpl(int argc, char* argv[])
{
    Swscanf0100();
    Swscanf0200();
    Swscanf0300();
    return T_STATUS;
}

int SwscanfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SwscanfTestImpl(1, libcArgvStub);
}
