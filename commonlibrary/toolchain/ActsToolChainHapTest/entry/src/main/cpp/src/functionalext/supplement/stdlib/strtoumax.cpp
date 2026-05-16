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

#include <cinttypes>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "test.h"

/**
 * @tc.name      : Strtoumax0100
 * @tc.desc      : test the strtoumax function to interpret the string content as a base 10 integer
 * @tc.level     : Level 0
 */
void Strtoumax0100(void)
{
    char* p = nullptr;
    uintmax_t want = 18737357U;
    uintmax_t result = strtoumax("18737357foobar12", &p, 10);
    if (result != want) {
        t_error("%s strtoumax get result is %" PRIuMAX " are not 18737357U\n", __func__, result);
    }
    if (strcmp(p, "foobar12") != 0) {
        t_error("%s strtoumax get is '%s' are not 'foobar12'\n", __func__, p);
    }
}

/**
 * @tc.name      : Strtoumax0200
 * @tc.desc      : test the strtoumax function to interpret the string content as a base 16 integer
 * @tc.level     : Level 1
 */
void Strtoumax0200(void)
{
    char* p = nullptr;
    uintmax_t want = 0x18737357fU;
    uintmax_t result = strtoumax("18737357foobar12", &p, 16);
    if (result != want) {
        t_error("%s strtoumax get result is %" PRIuMAX " are not 0x18737357fU\n", __func__, result);
    }
    if (strcmp(p, "oobar12") != 0) {
        t_error("%s strtoumax get is '%s' are not 'oobar12'\n", __func__, p);
    }
}

/**
 * @tc.name      : Strtoumax0300
 * @tc.desc      : test that strtoumax interprets negative string contents as base 10 integers
 * @tc.level     : Level 1
 */
void Strtoumax0300(void)
{
    char* p = nullptr;
    uintmax_t subnum = 18737357;
    uintmax_t result = strtoumax("-18737357foobar12", &p, 10);
    if (result != UINTMAX_MAX - subnum + 1) {
        t_error("%s strtoumax get result error is %" PRIuMAX "\n", __func__, result);
    }
    if (strcmp(p, "foobar12") != 0) {
        t_error("%s strtoumax get is '%s' are not 'foobar12'\n", __func__, p);
    }
}

static int StrtoumaxTestImpl(int argc, char* argv[])
{
    Strtoumax0100();
    Strtoumax0200();
    Strtoumax0300();
    return T_STATUS;
}

int StrtoumaxTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return StrtoumaxTestImpl(1, libcArgvStub);
}
