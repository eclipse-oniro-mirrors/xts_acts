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
#include "timegm_data.h"

using Timegm64Func = time_t (*)(struct tm*);
constexpr const char* TIMEGM64_SYMBOL = "__timegm_time64";
static time_t g_time = 1659177614;

/**
 * @tc.name      : timegm_0100
 * @tc.desc      : according to different time zones, return a timestamp from 1970-1-1 to the specified date
 * @tc.level     : Level 0
 */
void Timegm0100(void)
{
    time_t timeThis;
    for (int32_t i = 0; i < (int32_t)(sizeof(test_timegm_data) / sizeof(test_timegm_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_timegm_data[i].tz);
        if (!handlerChar) {
            t_error("Timegm0100 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        struct tm* timeptr = localtime(&g_time);
        if (!timeptr) {
            EXPECT_PTRNE("Timegm0100", timeptr, NULL);
            return;
        }
        timeThis = timegm(timeptr);
        EXPECT_EQ("Timegm0100", test_timegm_data[i].result, timeThis);
    }
}

/**
 * @tc.name      : timegm_time64_0100
 * @tc.desc      : according to different time zones, return a timestamp from 1970-1-1 to the specified date
 * @tc.level     : Level 0
 */
void TimegmTime640100(void)
{
    Timegm64Func timegm64 = reinterpret_cast<Timegm64Func>(dlsym(RTLD_DEFAULT, TIMEGM64_SYMBOL));
    if (timegm64 == nullptr) {
        t_error("TimegmTime640100 failed: dlsym __timegm_time64 failed\n");
        return;
    }
    time_t timeThis;
    for (int32_t i = 0; i < (int32_t)(sizeof(test_timegm_data) / sizeof(test_timegm_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_timegm_data[i].tz);
        if (!handlerChar) {
            t_error("TimegmTime640100 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        struct tm* timeptr = localtime(&g_time);
        if (!timeptr) {
            EXPECT_PTRNE("TimegmTime640100", timeptr, NULL);
            return;
        }
        timeThis = timegm64(timeptr);
        EXPECT_EQ("TimegmTime640100", test_timegm_data[i].result, timeThis);
    }
}

static int TimegmTestImpl(void)
{
    Timegm0100();
    TimegmTime640100();
    return T_STATUS;
}

int TimegmTest(void)
{
    return TimegmTestImpl();
}
