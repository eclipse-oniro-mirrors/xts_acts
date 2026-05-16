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

#include <climits>
#include <cstdlib>
#include <ctime>
#include "functionalext.h"
#include "gmtime_data.h"

static time_t g_time = 1659177614;
static int16_t g_yearBase = 1900;
static int16_t g_bufferSize = 500;

/**
 * @tc.name      : gmtime_r_0100
 * @tc.desc      : according to different time zones, convert date and time to GMT time
 * @tc.level     : Level 0
 */
void GmtimeR0100(void)
{
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(test_gmtime_data) / sizeof(test_gmtime_data[0])); i++) {
        const char* handlerChar = TestHandlePath(test_gmtime_data[i].tz);
        if (!handlerChar) {
            t_error("GmtimeR0100 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        struct tm res = { 0 };
        struct tm* gmtm = gmtime_r(&g_time, &res);
        char buff[g_bufferSize];
        int cnt = sprintf(buff,
                          "%d-%d-%d %d:%d:%d wday=%d,yday=%d,isdst=%d,gmtoff=%ld,zone=%s",
                          (gmtm->tm_year + g_yearBase),
                          gmtm->tm_mon,
                          gmtm->tm_mday,
                          gmtm->tm_hour,
                          gmtm->tm_min,
                          gmtm->tm_sec,
                          gmtm->tm_wday,
                          gmtm->tm_yday,
                          gmtm->tm_isdst,
                          gmtm->tm_gmtoff,
                          gmtm->tm_zone);
        EXPECT_TRUE("GmtimeR0100", cnt > 0);
        EXPECT_STREQ("GmtimeR0100", test_gmtime_data[i].result, buff);
    }
}

/**
 * @tc.name      : gmtime_r_0200
 * @tc.desc      : test gmtime_r() with invalid input paramter
 * @tc.level     : Level 2
 */
void GmtimeR0200(void)
{
    time_t invalidTime = INT_MAX * 31622400LL + 1;
    struct tm res = { 0 };
    struct tm* gmtm = gmtime_r(&invalidTime, &res);
    EXPECT_TRUE("GmtimeR0200", static_cast<void*>(gmtm) == nullptr);
}

static int GmtimeRTestImpl(void)
{
    GmtimeR0100();
    GmtimeR0200();
    return T_STATUS;
}

int GmtimeRTest(void)
{
    return GmtimeRTestImpl();
}
