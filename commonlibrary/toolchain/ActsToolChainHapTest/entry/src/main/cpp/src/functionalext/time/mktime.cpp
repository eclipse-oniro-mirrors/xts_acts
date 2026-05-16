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

#include <cstdlib>
#include <ctime>
#include <dlfcn.h>
#include "functionalext.h"
#include "mktime_data.h"
#include "time64_functions.h"

static time_t g_time = 1659177614;

using Mktime64Func = time_t (*)(struct tm*);
constexpr const char* MKTIME64_SYMBOL = "__mktime64";
/**
 * @tc.name      : mktime_0100
 * @tc.desc      : according to different time zones, convert time to seconds in duration since 1970-1-1
 * @tc.level     : Level 0
 */
static void Mktime0100(void)
{
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(test_mktime_data) / sizeof(test_mktime_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_mktime_data[i].tz);
        if (!handlerChar) {
            t_error("Mktime0100 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        struct tm* timeptr = localtime(&g_time);
        if (!timeptr) {
            EXPECT_PTRNE("Mktime0100", timeptr, NULL);
            return;
        }
        time_t mk = mktime(timeptr);
        EXPECT_EQ("Mktime0100", mk, test_mktime_data[i].result);
    }
}

/**
 * @tc.name      : mktime64_0100
 * @tc.desc      : according to different time zones, convert time to seconds in duration since 1970-1-1
 * @tc.level     : Level 0
 */
void Mktime640100(void)
{
    Mktime64Func mktime64 = reinterpret_cast<Mktime64Func>(dlsym(RTLD_DEFAULT, MKTIME64_SYMBOL));
    if (mktime64 == nullptr) {
        t_error("Mktime640100 failed: dlsym __mktime64 failed\n");
        return;
    }
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(test_mktime_data) / sizeof(test_mktime_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_mktime_data[i].tz);
        if (!handlerChar) {
            t_error("Mktime640100 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        struct tm* timeptr = localtime(&g_time);
        if (!timeptr) {
            EXPECT_PTRNE("Mktime640100", timeptr, NULL);
            return;
        }
        time_t mk = mktime64(timeptr);
        EXPECT_EQ("Mktime640100", mk, test_mktime_data[i].result);
    }
}

static int MktimeTestImpl(void)
{
    Mktime0100();
    Mktime640100();
    return T_STATUS;
}

int MktimeTest(void)
{
    return MktimeTestImpl();
}
