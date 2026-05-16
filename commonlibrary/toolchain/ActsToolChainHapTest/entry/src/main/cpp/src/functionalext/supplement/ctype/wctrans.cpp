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

#include <cctype>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include <cwctype>
#include "test.h"

/**
 * @tc.name      : Wctrans0100
 * @tc.desc      : test that wctrans returns a character conversion of a scalar type
 * @tc.level     : Level 0
 */
void Wctrans0100(void)
{
    if (!wctrans("tolower")) {
        t_error("%s wctrans error get result is nullptr\n", __func__);
    }
}

/**
 * @tc.name      : Wctrans0200
 * @tc.desc      : test result of wctrans when incoming uppercase conversion
 * @tc.level     : Level 1
 */
void Wctrans0200(void)
{
    if (!wctrans("toupper")) {
        t_error("%s wctrans error get result is nullptr\n", __func__);
    }
}

/**
 * @tc.name      : Wctrans0300
 * @tc.desc      : test the result of wctrans when passing in an exception parameter
 * @tc.level     : Level 2
 */
void Wctrans0300(void)
{
    if (wctrans("monkeys")) {
        t_error("%s wctrans error get result is not nullptr\n", __func__);
    }
}

/**
 * @tc.name : Wctrans0400
 * @tc.desc : test that wctrans returns different values for tolower/toupper
 * @tc.level : Level 1
 */
void Wctrans0400(void)
{
    if (wctrans("tolower") == wctrans("toupper")) {
        t_error("%s wctrans error: tolower and toupper should return different values\n", __func__);
    }
}

/**
 * @tc.name : Wctrans0500
 * @tc.desc : test that wctrans is case-sensitive for conversion names
 * @tc.level : Level 2
 */
void Wctrans0500(void)
{
    if (wctrans("TOLOWER")) {
        t_error("%s wctrans error: should be case-sensitive\n", __func__);
    }
}

/**
 * @tc.name : Wctrans0600
 * @tc.desc : test that wctrans returns nullptr for unknown conversion
 * @tc.level : Level 1
 */
void Wctrans0600(void)
{
    if (wctrans("unknown")) {
        t_error("%s wctrans error: should return nullptr for unknown conversion\n", __func__);
    }
}

/**
 * @tc.name : Wctrans0700
 * @tc.desc : test that wctrans handles long invalid strings correctly
 * @tc.level : Level 2
 */
void Wctrans0700(void)
{
    const char* longStr = "this_is_a_very_long_string_that_is_not_a_valid_conversion_type";
    if (wctrans(longStr)) {
        t_error("%s wctrans error: should return nullptr for long invalid strings\n", __func__);
    }
}

static int WctransTestImpl(int argc, char* argv[])
{
    Wctrans0100();
    Wctrans0200();
    Wctrans0300();
    Wctrans0400();
    Wctrans0500();
    Wctrans0600();
    Wctrans0700();
    return T_STATUS;
}

int WctransTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WctransTestImpl(1, libcArgvStub);
}
