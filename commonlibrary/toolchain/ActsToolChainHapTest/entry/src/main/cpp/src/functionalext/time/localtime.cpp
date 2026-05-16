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
#include "localtime_data.h"
#include "time64_functions.h"

static time_t g_time = 1659177614;
static int16_t g_yearBase = 1900;
static int16_t g_bufferSize = 500;

using Localtime64Func = struct tm* (*)(const time_t*);
constexpr const char* LOCALTIME64_SYMBOL = "__localtime64";
/**
 * @tc.name      : localtime_0100
 * @tc.desc      : according to different time zones, converts the time in seconds from 1970-1-1 0:00
 * to the current time system offset to local time
 * @tc.level     : Level 0
 */
void Localtime0100(void)
{
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(test_localtime_data) / sizeof(test_localtime_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_localtime_data[i].tz);
        if (!handlerChar) {
            t_error("Localtime0100 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        struct tm* localtm = localtime(&g_time);
        char buff[g_bufferSize];
        int cnt = sprintf(buff,
                          "%d-%d-%d %d:%d:%d wday=%d,yday=%d,isdst=%d,gmtoff=%ld,zone=%s",
                          (localtm->tm_year + g_yearBase),
                          localtm->tm_mon,
                          localtm->tm_mday,
                          localtm->tm_hour,
                          localtm->tm_min,
                          localtm->tm_sec,
                          localtm->tm_wday,
                          localtm->tm_yday,
                          localtm->tm_isdst,
                          localtm->tm_gmtoff,
                          localtm->tm_zone);
        EXPECT_TRUE("Localtime0100", cnt > 0);
        EXPECT_STREQ("Localtime0100", test_localtime_data[i].result, buff);
    }
}

/**
 * @tc.name      : localtime64_0100
 * @tc.desc      : according to different time zones, converts the time in seconds from 1970-1-1 0:00
 * to the current time system offset to local time
 * @tc.level     : Level 0
 */
void Localtime640100(void)
{
    Localtime64Func localtime64 = reinterpret_cast<Localtime64Func>(dlsym(RTLD_DEFAULT, LOCALTIME64_SYMBOL));
    if (localtime64 == nullptr) {
        t_error("Localtime640100 failed: dlsym __localtime64 failed\n");
        return;
    }
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(test_localtime_data) / sizeof(test_localtime_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_localtime_data[i].tz);
        if (!handlerChar) {
            t_error("Localtime640100 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        struct tm* localtm = localtime64(&g_time);
        char buff[g_bufferSize];
        int cnt = sprintf(buff,
                          "%d-%d-%d %d:%d:%d wday=%d,yday=%d,isdst=%d,gmtoff=%ld,zone=%s",
                          (localtm->tm_year + g_yearBase),
                          localtm->tm_mon,
                          localtm->tm_mday,
                          localtm->tm_hour,
                          localtm->tm_min,
                          localtm->tm_sec,
                          localtm->tm_wday,
                          localtm->tm_yday,
                          localtm->tm_isdst,
                          localtm->tm_gmtoff,
                          localtm->tm_zone);
        EXPECT_TRUE("Localtime640100", cnt > 0);
        EXPECT_STREQ("Localtime640100", test_localtime_data[i].result, buff);
    }
}

static int LocaltimeTestImpl(void)
{
    Localtime0100();
    Localtime640100();
    return T_STATUS;
}

int LocaltimeTest(void)
{
    return LocaltimeTestImpl();
}
