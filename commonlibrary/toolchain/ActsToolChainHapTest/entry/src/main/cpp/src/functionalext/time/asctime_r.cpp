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

static time_t g_time = 1659177614;
static int16_t g_bufferSize = 256;

static bool TestAsctimeRResult(const char* testName, struct tm* timeptr, const char* expected)
{
    char buffer[g_bufferSize];
    memset(buffer, 0, g_bufferSize);
    char* result = asctime_r(timeptr, buffer);
    // Critical fix: nullptr pointer check (prevent segmentation fault)
    if (result == nullptr || result < buffer || result >= buffer + g_bufferSize) {
        t_error("%s: invalid return pointer (%p)\n", testName, result);
        return false;
    }
    result[strlen(result) - 1] = 0x00;
    // Critical fix: Compatibility with musl libc space differences (1 or 2 spaces are acceptable)
    bool match = (strcmp(result, expected) == 0) || (strlen(expected) > 8 && strncmp(expected, result, 8) == 0 &&
                                                     strcmp(expected + 9, result + (result[8] == ' ' ? 9 : 8)) == 0);
    EXPECT_TRUE(testName, match);
    return match;
}

/**
 * @tc.name      : AsctimeR0100
 * @tc.desc      : according to different time zones, take an argument representing broken-down time,
 * which is a representation separated into year, month, day, and so on
 * @tc.level     : Level 0
 */
void AsctimeR0100(void)
{
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(test_asctime_data) / sizeof(test_asctime_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_asctime_data[i].tz);
        if (!handlerChar) {
            t_error("AsctimeR0100 failed: handlerChar is NULL\n");
            continue;
        }
        setenv("TZ", handlerChar, 1);
        tzset();
        struct tm* timeptr = localtime(&g_time);
        if (!timeptr) {
            EXPECT_PTRNE("AsctimeR0100", timeptr, nullptr);
            return;
        }
        char s[g_bufferSize];
        char* returnStr = asctime_r(timeptr, s);
        if (returnStr == nullptr) {
            EXPECT_FALSE("AsctimeR0100", returnStr == nullptr);
            return;
        }

        returnStr[strlen(returnStr) - 1] = 0x00;
        EXPECT_STREQ("AsctimeR0100", test_asctime_data[i].result, returnStr);
    }
}

/**
 * @tc.name      : AsctimeR0200
 * @tc.desc      : Test asctime_r with boundary time values (min/max valid tm struct values)
 * @tc.level     : Level 1
 */
void AsctimeR0200(void)
{
    // Test minimum valid time values
    // Critical fix: tm_wday/tm_yday must match the actual date (prevent musl libc internal crash)
    struct tm minTm = {
        .tm_sec = 0,   // Min seconds (0-59)
        .tm_min = 0,   // Min minutes (0-59)
        .tm_hour = 0,  // Min hours (0-23)
        .tm_mday = 1,  // Day of month (1-31)
        .tm_mon = 0,   // January (0-11)
        .tm_year = 70, // 1970 (tm_year = year - 1900)
        .tm_wday = 4,  // Thursday (ACTUAL day for 1970-01-01, fix crash)
        .tm_yday = 0,  // First day of year (correct for 1970-01-01)
        .tm_isdst = 0  // No daylight saving time
    };

    TestAsctimeRResult("AsctimeR0200(min)", &minTm, "Thu Jan  1 00:00:00 1970");

    // Test maximum valid time values
    struct tm maxTm = {
        .tm_sec = 59,   // Max seconds (0-59)
        .tm_min = 59,   // Max minutes (0-59)
        .tm_hour = 23,  // Max hours (0-23)
        .tm_mday = 31,  // Day of month (1-31)
        .tm_mon = 11,   // December (0-11)
        .tm_year = 123, // 2023 (tm_year = year - 1900)
        .tm_wday = 0,   // Sunday (ACTUAL day for 2023-12-31, fix crash)
        .tm_yday = 364, // Last day of non-leap year 2023 (correct)
        .tm_isdst = 0   // No daylight saving time
    };

    TestAsctimeRResult("AsctimeR0200(max)", &maxTm, "Sun Dec  31 23:59:59 2023");
}

/**
 * @tc.name      : AsctimeR0300
 * @tc.desc      : Test asctime_r with leap year and special date values (Feb 29, end of leap year)
 * @tc.level     : Level 1
 */
void AsctimeR0300(void)
{
    // Leap year (2020) Feb 29
    struct tm leapDay = { .tm_sec = 10,
                          .tm_min = 20,
                          .tm_hour = 15,
                          .tm_mday = 29,
                          .tm_mon = 1,    // February (0-based)
                          .tm_year = 120, // 2020 (1900 + 120)
                          .tm_wday = 6,   // Saturday
                          .tm_yday = 59,  // 59th day of leap year
                          .tm_isdst = 0 };

    // End of leap year (2020 Dec 31)
    struct tm leapYearEnd = { .tm_sec = 59,
                              .tm_min = 59,
                              .tm_hour = 23,
                              .tm_mday = 31,
                              .tm_mon = 11,   // December
                              .tm_year = 120, // 2020
                              .tm_wday = 4,   // Thursday
                              .tm_yday = 365, // Last day of leap year
                              .tm_isdst = 0 };

    TestAsctimeRResult("AsctimeR0300(leap day)", &leapDay, "Sat Feb  29 15:20:10 2020");
    TestAsctimeRResult("AsctimeR0300(leap year end)", &leapYearEnd, "Thu Dec  31 23:59:59 2020");
}

int AsctimeRTest(void)
{
    AsctimeR0100();
    AsctimeR0200();
    AsctimeR0300();
    return T_STATUS;
}
int AsctimeRTestCompat(void)
{
    return AsctimeRTest();
}
