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
#include "strftime_data.h"

static time_t g_time = 1659177614;
static int16_t g_bufferSize = 256;
constexpr int TM_DECEMBER = 11;
constexpr int TM_DAY_28 = 28;
constexpr int TM_DAY_31 = 31;
constexpr int TM_YEAR_124 = 124;
constexpr int TM_YEAR_101 = 101;
constexpr int TM_YEAR_100 = 100;
constexpr int TM_YEAR_200 = 200;
constexpr int TM_YDAY_362 = 362;
constexpr int TM_YDAY_365 = 365;
constexpr int TM_WDAY_1 = 1;
constexpr int TM_WDAY_2 = 2;
constexpr int TM_WDAY_3 = 3;
constexpr int TM_HOUR_13 = 13;
constexpr int TM_YEAR_NEG_1999 = -1999;

/**
 * @tc.name      : Strftime0100
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime0100(void)
{
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(test_asctime_data) / sizeof(test_asctime_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_asctime_data[i].tz);
        if (!handlerChar) {
            t_error("Strftime0100 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        char buffer[g_bufferSize];
        struct tm* timeptr = localtime(&g_time);
        if (!timeptr) {
            EXPECT_PTRNE("Strftime0100", timeptr, NULL);
            return;
        }
        size_t count = strftime(buffer, sizeof(buffer) - 1, "%c", timeptr);
        EXPECT_TRUE("Strftime0100", count > 0);
        EXPECT_STREQ("Strftime0100", buffer, test_asctime_data[i].result);
    }
}

/**
 * @tc.name      : Strftime0200
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime0200(void)
{
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(TEST_STRFTIME_DATA) / sizeof(TEST_STRFTIME_DATA[0])); i++) {
        const char* handlerChar = TestHandlePath(TEST_STRFTIME_DATA[i].tz);
        if (!handlerChar) {
            t_error("Strftime0200 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        struct tm* timeptr = localtime(&g_time);
        if (!timeptr) {
            EXPECT_PTRNE("Strftime0200", timeptr, NULL);
            return;
        }
        char buffer[g_bufferSize];
        size_t count = strftime(buffer, sizeof(buffer) - 1, "%c %Z%z", timeptr);
        EXPECT_TRUE("Strftime0200", count > 0);
        EXPECT_STREQ("Strftime0200", buffer, TEST_STRFTIME_DATA[i].result);
    }
}

/**
 * @tc.name      : Strftime0300
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime0300(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Pacific/Pitcairn");
    if (!handlerChar) {
        t_error("Strftime0300 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime0300", timeptr, NULL);
        return;
    }
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%k", timeptr);
    EXPECT_TRUE("Strftime0300", count > 0);
    EXPECT_STREQ("Strftime0300", buffer, " 2");
}

/**
 * @tc.name      : Strftime0400
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime0400(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime0400 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime0400", timeptr, NULL);
        return;
    }
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%k", timeptr);
    EXPECT_TRUE("Strftime0400", count > 0);
    EXPECT_STREQ("Strftime0400", buffer, "18");
}

/**
 * @tc.name      : Strftime0500
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime0500(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime0500 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime0500", timeptr, NULL);
        return;
    }
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%I", timeptr);
    EXPECT_TRUE("Strftime0500", count > 0);
    EXPECT_STREQ("Strftime0500", buffer, "06");
}

/**
 * @tc.name      : Strftime0600
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime0600(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime0600 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime0600", timeptr, NULL);
        return;
    }
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%P", timeptr);
    EXPECT_TRUE("Strftime0600", count > 0);
    EXPECT_STREQ("Strftime0600", buffer, "pm");
}

/**
 * @tc.name      : Strftime0700
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime0700(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime0700 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime0700", timeptr, NULL);
        return;
    }
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%v", timeptr);
    EXPECT_TRUE("Strftime0700", count > 0);
    EXPECT_STREQ("Strftime0700", buffer, "30-Jul-2022");
}

/**
 * @tc.name      : Strftime0800
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime0800(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime0800 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime0800", timeptr, NULL);
        return;
    }
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%j", timeptr);
    EXPECT_TRUE("Strftime0800", count > 0);
    EXPECT_STREQ("Strftime0800", buffer, "211");
}

/**
 * @tc.name      : Strftime0900
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime0900(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime0900 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime0900", timeptr, NULL);
        return;
    }
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%l", timeptr);
    EXPECT_TRUE("Strftime0900", count > 0);
    EXPECT_STREQ("Strftime0900", buffer, " 6");
}

/**
 * @tc.name      : Strftime1000
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime1000(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime1000 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime1000", timeptr, NULL);
        return;
    }
    timeptr->tm_mday = TM_DAY_31;
    timeptr->tm_mon = TM_DECEMBER;
    timeptr->tm_year = TM_YEAR_124;
    timeptr->tm_wday = TM_WDAY_2;
    timeptr->tm_yday = TM_YDAY_365;

    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%V", timeptr);
    EXPECT_TRUE("Strftime1000", count > 0);
    EXPECT_STREQ("Strftime1000", buffer, "01");
}

/**
 * @tc.name      : Strftime1100
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime1100(void)
{
    struct tm tm = { 0 };
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%l", &tm);
    EXPECT_TRUE("Strftime1100", count > 0);
    EXPECT_STREQ("Strftime1100", buffer, "12");
}

/**
 * @tc.name      : Strftime1200
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void Strftime1200(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime1200 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime1200", timeptr, NULL);
        return;
    }
    timeptr->tm_mday = TM_DAY_28;
    timeptr->tm_mon = TM_DECEMBER + 1;
    timeptr->tm_year = TM_YEAR_200;
    timeptr->tm_wday = TM_WDAY_1;
    timeptr->tm_yday = TM_YDAY_362;

    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%G", timeptr);
    EXPECT_TRUE("Strftime1200", count > 0);
    EXPECT_STREQ("Strftime1200", buffer, "2101");
}

/**
 * @tc.name      : Strftime1300
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime1300(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime1300 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime1300", timeptr, NULL);
        return;
    }
    timeptr->tm_mday = TM_DAY_28;
    timeptr->tm_mon = TM_DECEMBER + 1;
    timeptr->tm_year = TM_YEAR_100;
    timeptr->tm_wday = TM_WDAY_1;
    timeptr->tm_yday = TM_YDAY_362;

    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%G", timeptr);
    EXPECT_TRUE("Strftime1300", count > 0);
    EXPECT_STREQ("Strftime1300", buffer, "2000");
}

/**
 * @tc.name      : Strftime1400
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime1400(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime1400 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime1400", timeptr, NULL);
        return;
    }
    timeptr->tm_mday = TM_DAY_28;
    timeptr->tm_mon = TM_DECEMBER + 1;
    timeptr->tm_year = TM_YEAR_101;
    timeptr->tm_wday = TM_WDAY_1;
    timeptr->tm_yday = TM_YDAY_362;

    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%G", timeptr);
    EXPECT_TRUE("Strftime1400", count > 0);
    EXPECT_STREQ("Strftime1400", buffer, "2002");
}

/**
 * @tc.name      : Strftime1500
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime1500(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime1500 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime1500", timeptr, NULL);
        return;
    }

    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%B", timeptr);
    EXPECT_TRUE("Strftime1500", count > 0);
    EXPECT_STREQ("Strftime1500", buffer, "July");
}

/**
 * @tc.name      : Strftime1600
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime1600(void)
{
    const char* handlerChar = TEST_HANDLE_PATH("Asia/Shanghai");
    if (!handlerChar) {
        t_error("Strftime1600 failed: handlerChar is NULL\n");
        return;
    }

    setenv("TZ", handlerChar, 1);
    tzset();
    struct tm* timeptr = localtime(&g_time);
    if (!timeptr) {
        EXPECT_PTRNE("Strftime1600", timeptr, NULL);
        return;
    }
    timeptr->tm_mon = TM_DECEMBER + 1;

    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%B", timeptr);
    EXPECT_TRUE("Strftime1600", count > 0);
    EXPECT_STREQ("Strftime1600", buffer, "-");
}

/**
 * @tc.name      : Strftime1700
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime1700(void)
{
    struct tm tm = { 0 };
    tm.tm_hour = TM_HOUR_13;
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%l", &tm);
    EXPECT_TRUE("Strftime1700", count > 0);
    EXPECT_STREQ("Strftime1700", buffer, " 1");
}

/**
 * @tc.name      : Strftime1800
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime1800(void)
{
    struct tm tm = { 0 };
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%u", &tm);
    EXPECT_TRUE("Strftime1800", count > 0);
    EXPECT_STREQ("Strftime1800", buffer, "7");
}

/**
 * @tc.name      : Strftime1900
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime1900(void)
{
    struct tm tm = { 0 };
    tm.tm_wday = TM_WDAY_3;
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%u", &tm);
    EXPECT_TRUE("Strftime1900", count > 0);
    EXPECT_STREQ("Strftime1900", buffer, "3");
}

/**
 * @tc.name      : Strftime2000
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime2000(void)
{
    struct tm tm = { 0 };
    tm.tm_year = TM_YEAR_NEG_1999;
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%-y", &tm);
    EXPECT_TRUE("Strftime2000", count > 0);
    EXPECT_STREQ("Strftime2000", buffer, "99");
}

/**
 * @tc.name      : Strftime2100
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime2100(void)
{
    struct tm tm = { 0 };
    tm.tm_isdst = -1;
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%z", &tm);
    EXPECT_TRUE("Strftime2100", count == 0);
    EXPECT_STREQ("Strftime2100", buffer, "");
}

/**
 * @tc.name      : Strftime2200
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime2200(void)
{
    struct tm tm = { 0 };
    tm.tm_isdst = -1;
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%Z", &tm);
    EXPECT_TRUE("Strftime2200", count == 0);
    EXPECT_STREQ("Strftime2200", buffer, "");
}

/**
 * @tc.name      : Strftime2300
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime2300(void)
{
    struct tm tm = { 0 };
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%E%", &tm);
    EXPECT_TRUE("Strftime2300", count > 0);
    EXPECT_STREQ("Strftime2300", buffer, "%");
}

/**
 * @tc.name      : Strftime2200
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 1
 */
void Strftime2400(void)
{
    struct tm tm = { 0 };
    char buffer[g_bufferSize];
    size_t count = strftime(buffer, sizeof(buffer) - 1, "%O%", &tm);
    EXPECT_TRUE("Strftime2400", count > 0);
    EXPECT_STREQ("Strftime2400", buffer, "%");
}

static int StrftimeExtTestImpl(void)
{
    Strftime0100();
    Strftime0200();
    Strftime0300();
    Strftime0400();
    Strftime0500();
    Strftime0600();
    Strftime0700();
    Strftime0800();
    Strftime0900();
    Strftime1000();
    Strftime1100();
    Strftime1200();
    Strftime1300();
    Strftime1400();
    Strftime1500();
    Strftime1600();
    Strftime1700();
    Strftime1800();
    Strftime1900();
    Strftime2000();
    Strftime2100();
    Strftime2200();
    Strftime2300();
    Strftime2400();
    return T_STATUS;
}

int StrftimeExtTest(void)
{
    return StrftimeExtTestImpl();
}
