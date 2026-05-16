/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <clocale>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include "functionalext.h"

#define TEST_LC_COUNT 7
#define TEST_LC_LENGTH 18
#define TEST_LC_OFFSET 6
#define PARAM_ERROR_VALUE_1 13
#define PARAM_ERROR_VALUE_2 (-1)

static const int LC_ARRY[TEST_LC_COUNT] = { LC_PAPER,       LC_NAME,           LC_ADDRESS, LC_TELEPHONE,
                                            LC_MEASUREMENT, LC_IDENTIFICATION, LC_ALL };

static const char ENVFORLOCALE[][TEST_LC_LENGTH] = {
    "LC_PAPER", "LC_NAME", "LC_ADDRESS", "LC_TELEPHONE", "LC_MEASUREMENT", "LC_IDENTIFICATION", "LC_ALL",
};

/**
 * @tc.name      : setlocaletest_0100
 * @tc.desc      : Determines whether setlocale returns the default value C
 * when the character set passed in for different data types is nullptr
 * @tc.level     : Level 0
 */
void Setlocale0100(void)
{
    const int num = sizeof(LC_ARRY) / sizeof(LC_ARRY[0]);
    for (int i = 0; i < num; i++) {
        const char* locale = setlocale(LC_ARRY[i], nullptr);
        if (!locale) {
            t_error("[%s] failed\n", "Setlocale0100");
            return;
        }
        EXPECT_EQ("SetlocaleTest_0100", strcmp(locale, "C"), 0);
    }
}

/**
 * @tc.name      : setlocaletest_0200
 * @tc.desc      : Determines whether setlocale returns the default value "C"
 * when the default value "C" is passed in for different LC data types
 * @tc.level     : Level 0
 */
void Setlocale0200(void)
{
    const int num = sizeof(LC_ARRY) / sizeof(LC_ARRY[0]);
    for (int i = 0; i < num; i++) {
        setenv(ENVFORLOCALE[i], "en-US", 1);
        const char* locale = setlocale(LC_ARRY[i], "C");
        if (!locale) {
            t_error("[%s] failed\n", "Setlocale0200");
            return;
        }
        EXPECT_STREQ("SetlocaleTest_0200", locale, "C");
    }
}

/**
 * @tc.name      : setlocaletest_0300
 * @tc.desc      : Asserts whether the result returned is null when an exception LC data type is passed in
 * @tc.level     : Level 2
 */
void Setlocale0300(void)
{
    const char* locale1 = setlocale(PARAM_ERROR_VALUE_1, nullptr);
    if (locale1) {
        t_error("[%s] failed\n", "SetlocaleTest_0300");
    }

    const char* locale2 = setlocale(PARAM_ERROR_VALUE_2, nullptr);
    if (locale2) {
        t_error("[%s] failed\n", "SetlocaleTest_0300");
    }
}

/**
 * @tc.name      : setlocaletest_0400
 * @tc.desc      : Determines whether setlocale returns da_DK
 * when the environment variable is set to da_DK for different LC data types
 * @tc.level     : Level 0
 */
void Setlocale0400(void)
{
    for (unsigned int i = 0; i < sizeof(ENVFORLOCALE) / sizeof(ENVFORLOCALE[0]); i++) {
        setenv(ENVFORLOCALE[i], "da_DK", 1);
        const char* locale = setlocale(LC_ARRY[i], "");
        if (locale) {
            t_error("[%s] failed\n", "Setlocale0400");
            return;
        }
    }
}

/**
 * @tc.name      : setlocaletest_0500
 * @tc.desc      : Determines whether setlocale returns nullptr
 * when the character set passed in for invalid LC data types is set to en_ZA
 * @tc.level     : Level 0
 */
void Setlocale0500(void)
{
    char* rev = setlocale(LC_ALL, "C");
    if (!rev) {
        t_error("[%s] failed\n", "Setlocale0500");
        return;
    }
    for (unsigned int i = 0; i < sizeof(LC_ARRY) / sizeof(LC_ARRY[0]); i++) {
        const char* locale = setlocale(LC_ARRY[i], "en_ZA");
        if (locale) {
            t_error("[%s] failed\n", "Setlocale0500");
            return;
        }
    }
}

/**
 * @tc.name      : setlocaletest_0600
 * @tc.desc      : Verify that the environment variable of different LC data types is set to ar_QA.
 * When the setlocale function is used to pass LC_ALL, the corresponding field returned by the function is ar_QA
 * @tc.level     : Level 0
 */
void Setlocale0600(void)
{
    for (unsigned int i = 0; i < sizeof(ENVFORLOCALE) / sizeof(ENVFORLOCALE[0]); i++) {
        int count = 0;
        char* vec[LC_ALL];
        const char* flag = ";";

        setenv(ENVFORLOCALE[i], "ar_QA", 1);
        char* locale = setlocale(LC_ALL, "");
        if (locale) {
            t_error("[%s] failed\n", "Setlocale0600");
            return;
        }
    }
}

void Setlocale0700(void)
{
    char* str = setlocale(LC_ALL, "sss123456");
    if (str) {
        t_error("Setlocale0700 failed [%s] != nullptr\n", str);
    }
}

static int SetlocaleTestImpl(void)
{
    Setlocale0100();
    Setlocale0200();
    Setlocale0300();
    Setlocale0400();
    Setlocale0500();
    Setlocale0600();
    Setlocale0700();

    return T_STATUS;
}

int SetlocaleTest(void)
{
    return SetlocaleTestImpl();
}
