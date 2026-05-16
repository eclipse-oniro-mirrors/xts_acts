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
#include "asctime_data.h"
#include "functionalext.h"
#include "strptime_data.h"

static int16_t g_bufferSize = 256;
static time_t g_time = 1659177614;
static int16_t g_yearBase = 1900;

/**
 * @tc.name      : Strptime0100
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime0100(void)
{
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(test_asctime_data) / sizeof(test_asctime_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_asctime_data[i].tz);
        if (!handlerChar) {
            t_error("Strptime0100 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        char buffer[g_bufferSize];
        struct tm* timeptr = localtime(&g_time);
        if (!timeptr) {
            EXPECT_PTRNE("Strptime0100", timeptr, nullptr);
            return;
        }
        size_t cnt = strftime(buffer, sizeof(buffer) - 1, "%c", timeptr);
        EXPECT_TRUE("Strptime0100", cnt > 0);

        struct tm tmTime = { 0 };
        strptime(buffer, "%c", &tmTime);
        char* result = asctime(&tmTime);
        if (result == nullptr) {
            EXPECT_FALSE("Strptime0100", result == nullptr);
            return;
        }
        result[strlen(result) - 1] = 0x00;
        EXPECT_STREQ("Strptime0100", test_asctime_data[i].result, result);
    }
}

/**
 * @tc.name      : Strptime0200
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime0200(void)
{
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(test_strptime_data) / sizeof(test_strptime_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_strptime_data[i].tz);
        if (!handlerChar) {
            t_error("Strptime0200 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        char buffer[g_bufferSize];
        struct tm* timeptr = localtime(&g_time);
        if (!timeptr) {
            EXPECT_TRUE("Strptime0200", timeptr == nullptr);
            return;
        }
        size_t len = strftime(buffer, sizeof(buffer) - 1, "%c %Z%z", timeptr);
        EXPECT_TRUE("Strptime0200", len > 0);
        struct tm tmTime = { 0 };
        strptime(buffer, "%c %Z%z", &tmTime);
        char buffResult[g_bufferSize];

        int cnt = sprintf(buffResult,
                          "%d-%d-%d %d:%d:%d wday=%d,yday=%d,isdst=%d,gmtoff=%ld,zone=%s",
                          (tmTime.tm_year + g_yearBase),
                          tmTime.tm_mon,
                          tmTime.tm_mday,
                          tmTime.tm_hour,
                          tmTime.tm_min,
                          tmTime.tm_sec,
                          tmTime.tm_wday,
                          tmTime.tm_yday,
                          tmTime.tm_isdst,
                          tmTime.tm_gmtoff,
                          tmTime.tm_zone);
        EXPECT_TRUE("Strptime0200", cnt > 0);
        EXPECT_STREQ("Strptime0200", test_strptime_data[i].result, buffResult);
    }
}

/**
 * @tc.name      : Strptime0300
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime0300(void)
{
    char* buffer = "2022-04-10";
    struct tm tmTime = { 0 };
    strptime(buffer, "%F", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%04d-%02d-%02d", (tmTime.tm_year + g_yearBase), tmTime.tm_mon + 1, tmTime.tm_mday);
    EXPECT_TRUE("Strptime0300", cnt > 0);
    EXPECT_STREQ("Strptime0300", buffer, buffResult);
}

/**
 * @tc.name      : Strptime0400
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime0400(void)
{
    char* buffer = "23";
    struct tm tmTime = { 0 };
    strptime(buffer, "%g", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d", tmTime.tm_year);
    EXPECT_TRUE("Strptime0400", cnt > 0);
    EXPECT_STREQ("Strptime0400", buffer, buffResult);
}

/**
 * @tc.name      : Strptime0500
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime0500(void)
{
    const char* buffer = "16";
    struct tm tmTime = { 0 };
    strptime(buffer, " %k", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d", tmTime.tm_hour);
    EXPECT_TRUE("Strptime0500", cnt > 0);
    EXPECT_STREQ("Strptime0500", buffer, buffResult);
}

/**
 * @tc.name      : Strptime0600
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime0600(void)
{
    const char* buffer = " 4";
    struct tm tmTime = { 0 };
    strptime(buffer, " %l", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d", tmTime.tm_hour);
    EXPECT_TRUE("Strptime0600", cnt > 0);
    EXPECT_STREQ("Strptime0600", "4", buffResult);
}

/**
 * @tc.name      : Strptime0700
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime0700(void)
{
    const char* buffer = "1659177614";
    const char* handlerChar = TEST_HANDLE_PATH(test_asctime_data[0].tz);
    if (!handlerChar) {
        t_error("Strptime0700 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    time_t second = 0;
    struct tm tmTime = { 0 };
    strptime(buffer, "%s", &tmTime);
    second = mktime(&tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%lld", second);
    EXPECT_TRUE("Strptime0700", cnt > 0);
    EXPECT_STREQ("Strptime0700", buffer, buffResult);
}

/**
 * @tc.name      : Strptime0800
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime0800(void)
{
    const char* buffer = "1";
    struct tm tmTime = { 0 };
    strptime(buffer, "%u", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d", tmTime.tm_wday);
    EXPECT_TRUE("Strptime0800", cnt > 0);
    EXPECT_STREQ("Strptime0800", buffer, buffResult);
}

/**
 * @tc.name      : Strptime0900
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime0900(void)
{
    const char* buffer = "30-Oct-2021";
    struct tm tmTime = { 0 };
    strptime(buffer, "%v", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d-%d-%d", (tmTime.tm_year + g_yearBase), tmTime.tm_mon, tmTime.tm_mday);
    EXPECT_TRUE("Strptime0900", cnt > 0);
    EXPECT_STREQ("Strptime0900", "2021-9-30", buffResult);
}

/**
 * @tc.name      : Strptime1000
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 1
 */
void Strptime1000(void)
{
    const char* buffer = "2021-01-23";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%G", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%s", result);
    EXPECT_TRUE("Strptime1000", cnt > 0);
    EXPECT_STREQ("Strptime1000", "-01-23", buffResult);
}

/**
 * @tc.name      : Strptime1100
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 1
 */
void Strptime1100(void)
{
    const char* buffer = "23";
    struct tm tmTime = { 0 };
    strptime(buffer, "%j", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d", tmTime.tm_yday);
    EXPECT_TRUE("Strptime1100", cnt > 0);
    EXPECT_STREQ("Strptime1100", "22", buffResult);
}

/**
 * @tc.name      : Strptime1200
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime1200(void)
{
    const char* buffer = "am";
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strptime1200 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strptime1200", timeptr, nullptr);
        return;
    }
    strptime(buffer, "%P", timeptr);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d", timeptr->tm_hour);
    EXPECT_TRUE("Strptime1200", cnt > 0);
    EXPECT_STREQ("Strptime1200", "6", buffResult);
}

/**
 * @tc.name      : Strptime1300
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime1300(void)
{
    const char* buffer = "pm";
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strptime1300 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strptime1300", timeptr, nullptr);
        return;
    }
    strptime(buffer, "%P", timeptr);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d", timeptr->tm_hour);
    EXPECT_TRUE("Strptime1300", cnt > 0);
    EXPECT_STREQ("Strptime1300", "18", buffResult);
}

/**
 * @tc.name      : Strptime1400
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime1400(void)
{
    const char* buffer = "30-Oct-2021";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%U", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%s", result);
    EXPECT_TRUE("Strptime1400", cnt > 0);
    EXPECT_STREQ("Strptime1400", "-Oct-2021", buffResult);
}

/**
 * @tc.name      : Strptime1500
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime1500(void)
{
    const char* buffer = "1";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%w", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d", tmTime.tm_wday);
    EXPECT_TRUE("Strptime1500", cnt > 0);
    EXPECT_STREQ("Strptime1500", "1", buffResult);
}

/**
 * @tc.name      : Strptime1600
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime1600(void)
{
    const char* buffer = "Oct-30-2021";
    struct tm tmTime = { 0 };
    strptime(buffer, "%v", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d-%d-%d", (tmTime.tm_year + g_yearBase), tmTime.tm_mon, tmTime.tm_mday);
    EXPECT_TRUE("Strptime1600", cnt > 0);
    EXPECT_STREQ("Strptime1600", "1900-0-0", buffResult);
}

/**
 * @tc.name      : Strptime1700
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 0
 */
void Strptime1700(void)
{
    const char* buffer = "16-Spring";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%V", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%s", result);
    EXPECT_TRUE("Strptime1700", cnt > 0);
    EXPECT_STREQ("Strptime1700", "-Spring", buffResult);
}

/**
 * @tc.name      : Strptime1800
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 1
 */
void Strptime1800(void)
{
    const char* buffer = "+03";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%Z", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%s", tmTime.__tm_zone);
    EXPECT_TRUE("Strptime1800", cnt > 0);
    EXPECT_STREQ("Strptime1800", "+03", buffResult);
}

/**
 * @tc.name      : Strptime1900
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 1
 */
void Strptime1900(void)
{
    const char* buffer = "-03";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%Z", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%s", tmTime.__tm_zone);
    EXPECT_TRUE("Strptime1900", cnt > 0);
    EXPECT_STREQ("Strptime1900", "-03", buffResult);
}

/**
 * @tc.name      : Strptime2000
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime2000(void)
{
    const char* buffer = "Oct-30-2021";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "test", &tmTime);
    EXPECT_FALSE("Strptime2000", result);
}

/**
 * @tc.name      : Strptime2100
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 1
 */
void Strptime2100(void)
{
    const char* buffer = "2022-4-10";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%+2F", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d", tmTime.tm_mday);
    EXPECT_TRUE("Strptime2100", cnt > 0);
    EXPECT_STREQ("Strptime2100", "10", buffResult);
}

/**
 * @tc.name      : Strptime2200
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime2200(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%c", &tmTime);
    EXPECT_FALSE("Strptime2200", result);
}

/**
 * @tc.name      : Strptime2300
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 1
 */
void Strptime2300(void)
{
    const char* buffer = "2022";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%C", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%s", result);
    EXPECT_TRUE("Strptime2300", cnt > 0);
    EXPECT_STREQ("Strptime2300", "22", buffResult);
}

/**
 * @tc.name      : Strptime2400
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime2400(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%D", &tmTime);
    EXPECT_FALSE("Strptime2400", result);
}

/**
 * @tc.name      : Strptime2500
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime2500(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%F", &tmTime);
    EXPECT_FALSE("Strptime2500", result);
}

/**
 * @tc.name      : Strptime2600
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 1
 */
void Strptime2600(void)
{
    const char* buffer = " 1";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%n%t", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%s", result);
    EXPECT_TRUE("Strptime2600", cnt > 0);
    EXPECT_STREQ("Strptime2600", "1", buffResult);
}

/**
 * @tc.name      : Strptime2700
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 1
 */
void Strptime2700(void)
{
    const char* buffer = "08:38:20";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%r", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d:%d:%d", tmTime.tm_hour, tmTime.tm_min, tmTime.tm_sec);
    EXPECT_TRUE("Strptime2700", cnt > 0);
    EXPECT_STREQ("Strptime2700", "8:38:20", buffResult);
}

/**
 * @tc.name      : Strptime2800
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime2800(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%r", &tmTime);
    EXPECT_FALSE("Strptime2800", result);
}

/**
 * @tc.name      : Strptime2900
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime2900(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%R", &tmTime);
    EXPECT_FALSE("Strptime2900", result);
}

/**
 * @tc.name      : Strptime3000
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime3000(void)
{
    const char* buffer = "+1";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%s", &tmTime);
    EXPECT_FALSE("Strptime3000", result);
}

/**
 * @tc.name      : Strptime3100
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime3100(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%T", &tmTime);
    EXPECT_FALSE("Strptime3100", result);
}

/**
 * @tc.name      : Strptime3200
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime3200(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%u", &tmTime);
    EXPECT_FALSE("Strptime3200", result);
}

/**
 * @tc.name      : Strptime3300
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime3300(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%V", &tmTime);
    EXPECT_FALSE("Strptime3300", result);
}

/**
 * @tc.name      : Strptime3400
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 1
 */
void Strptime3400(void)
{
    const char* buffer = "04/10/22";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%x", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d/%d/%d", (tmTime.tm_mon + 1), tmTime.tm_mday, (tmTime.tm_year + g_yearBase));
    EXPECT_TRUE("Strptime3400", cnt > 0);
    EXPECT_STREQ("Strptime3400", "4/10/2022", buffResult);
}

/**
 * @tc.name      : Strptime3500
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime3500(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%x", &tmTime);
    EXPECT_FALSE("Strptime3500", result);
}

/**
 * @tc.name      : Strptime3600
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 1
 */
void Strptime3600(void)
{
    const char* buffer = "08:10:20";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%X", &tmTime);
    char buffResult[g_bufferSize];
    int cnt = sprintf(buffResult, "%d:%d:%d", tmTime.tm_hour, tmTime.tm_min, tmTime.tm_sec);
    EXPECT_TRUE("Strptime3600", cnt > 0);
    EXPECT_STREQ("Strptime3600", "8:10:20", buffResult);
}

/**
 * @tc.name      : Strptime3700
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime3700(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%X", &tmTime);
    EXPECT_FALSE("Strptime3700", result);
}

/**
 * @tc.name      : Strptime3800
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime3800(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%%", &tmTime);
    EXPECT_FALSE("Strptime3800", result);
}

/**
 * @tc.name      : Strptime3900
 * @tc.desc      : according to different time zones, convert a string to a time
 * type according to a specific time format
 * @tc.level     : Level 2
 */
void Strptime3900(void)
{
    const char* buffer = "";
    struct tm tmTime = { 0 };
    char* result = strptime(buffer, "%&", &tmTime);
    EXPECT_FALSE("Strptime3900", result);
}

static int StrptimeExtTestImpl(void)
{
    Strptime0100();
    Strptime0200();
    Strptime0300();
    Strptime0400();
    Strptime0500();
    Strptime0600();
    Strptime0700();
    Strptime0800();
    Strptime0900();
    Strptime1000();
    Strptime1100();
    Strptime1200();
    Strptime1300();
    Strptime1400();
    Strptime1500();
    Strptime1600();
    Strptime1700();
    Strptime1800();
    Strptime1900();
    Strptime2000();
    Strptime2100();
    Strptime2200();
    Strptime2300();
    Strptime2400();
    Strptime2500();
    Strptime2600();
    Strptime2700();
    Strptime2800();
    Strptime2900();
    Strptime3000();
    Strptime3100();
    Strptime3200();
    Strptime3300();
    Strptime3400();
    Strptime3500();
    Strptime3600();
    Strptime3700();
    Strptime3800();
    Strptime3900();
    return T_STATUS;
}

int StrptimeExtTest(void)
{
    return StrptimeExtTestImpl();
}
