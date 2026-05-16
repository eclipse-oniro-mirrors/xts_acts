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

#include <algorithm>
#include <cstdlib>
#include <ctime>
#include "asctime_data.h"
#include "functionalext.h"

static time_t g_time = 1659177614;
static int16_t g_bufferSize = 256;

#define CTIME64_R ctime_r

/**
 * @tc.name      : CtimeR0100
 * @tc.desc      : according to different time zones, covert date and time to string
 * @tc.level     : Level 0
 */
void CtimeR0100(void)
{
    for (int32_t i = 0; i < (int32_t)(sizeof(TEST_ASCTIME_DATA) / sizeof(TEST_ASCTIME_DATA[0])); i++) {
        const char* handlerChar = TestHandlePath(TEST_ASCTIME_DATA[i].tz);
        if (!handlerChar) {
            t_error("CtimeR0100 failed: handlerChar is nullptr\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        char s[g_bufferSize];
        char* returnStr = ctime_r(&g_time, s);
        if (returnStr == nullptr) {
            EXPECT_FALSE("CtimeR0100", returnStr == nullptr);
            return;
        }
        returnStr[strlen(returnStr) - 1] = 0x00;
        EXPECT_STREQ("CtimeR0100", returnStr, TEST_ASCTIME_DATA[i].result);
        EXPECT_STREQ("CtimeR0100", returnStr, s);
    }
}

/**
 * @tc.name      : CtimeR0200
 * @tc.desc      : test ctime_r with boundary time values (minimum/maximum valid time_t values)
 * @tc.level     : Level 1
 */
void CtimeR0200(void)
{
    // Core fix: Force switch to UTC timezone to eliminate all timezone offsets
    const char* originalTz = getenv("TZ"); // Preserve the original timezone setting
    setenv("TZ", "UTC", 1);                // Force set timezone to UTC (no offset)
    tzset();                               // Apply timezone configuration immediately

    // test minimum valid time_t value (epoch start: Jan 1 1970 00:00:00 UTC)
    time_t minTime = 0;
    char buffer[g_bufferSize];

    char* result = ctime_r(&minTime, buffer);
    if (result == nullptr) {
        EXPECT_FALSE("CtimeR0200", result == nullptr);
        return;
    }
    result[strlen(result) - 1] = 0x00; // Remove the trailing newline character
    EXPECT_TRUE("CtimeR0200(min)",
                strcmp(result, "Thu Jan  1 00:00:00 1970") == 0 || strcmp(result, "Thu Jan 1 00:00:00 1970") == 0);
    EXPECT_STREQ("CtimeR0200(min_buffer)", result, buffer);

    // test future time value (near 32-bit time_t limit: 2038-01-19 03:14:07 UTC)
    time_t futureTime = 2147483647;
    result = ctime_r(&futureTime, buffer);
    if (result == nullptr) {
        EXPECT_FALSE("CtimeR0200", result == nullptr);
        return;
    }
    result[strlen(result) - 1] = 0x00; // Remove the trailing newline character
    EXPECT_TRUE("CtimeR0200(future)",
                strcmp(result, "Tue Jan  19 03:14:07 2038") == 0 || strcmp(result, "Tue Jan 19 03:14:07 2038") == 0);
    EXPECT_STREQ("CtimeR0200(future_buffer)", result, buffer);

    // Critical: Restore original timezone to avoid impacting other test cases
    if (originalTz != nullptr) {
        setenv("TZ", originalTz, 1);
    } else {
        unsetenv("TZ"); // Clear TZ variable if no original timezone existed
    }
    tzset(); // Re-apply original timezone configuration
}

/**
 * @tc.name      : Ctime64R0100
 * @tc.desc      : according to different time zones, covert date and time to string
 * @tc.level     : Level 0
 */
void Ctime64R0100(void)
{
    for (int32_t i = 0; i < (int32_t)(sizeof(TEST_ASCTIME_DATA) / sizeof(TEST_ASCTIME_DATA[0])); i++) {
        const char* handlerChar = TestHandlePath(TEST_ASCTIME_DATA[i].tz);
        if (!handlerChar) {
            t_error("Ctime64R0100 failed: handlerChar is nullptr\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        char s[g_bufferSize];
        char* returnStr = CTIME64_R(&g_time, s);
        if (returnStr == nullptr) {
            EXPECT_FALSE("Ctime64R0100", returnStr == nullptr);
            return;
        }
        returnStr[strlen(returnStr) - 1] = 0x00;
        EXPECT_STREQ("Ctime64R0100", returnStr, TEST_ASCTIME_DATA[i].result);
        EXPECT_STREQ("Ctime64R0100", returnStr, s);
    }
}

/**
 * @tc.name      : Ctime64R0200
 * @tc.desc      : test CTIME64_R with 64-bit boundary time values (beyond 2038 limit)
 * @tc.level     : Level 1
 */
void Ctime64R0200(void)
{
    const char* originalTz = getenv("TZ"); // Preserve the original timezone setting
    setenv("TZ", "UTC", 1);                // Force set timezone to UTC (no offset)
    tzset();                               // Apply timezone configuration immediately

    // test 64-bit time value (Jan 1 2100 00:00:00 UTC - beyond 32-bit time_t limit)
    int64_t future64TimeVal = 4102444800LL; // 2100-01-01 00:00:00 UTC
    time_t future64Time = static_cast<time_t>(future64TimeVal);
    char buffer[g_bufferSize];
    std::fill_n(buffer, static_cast<size_t>(g_bufferSize), '\0');

    char* result = CTIME64_R(&future64Time, buffer);
    if (result == nullptr) {
        EXPECT_FALSE("Ctime64R0100", result == nullptr);
        return;
    }
    result[strlen(result) - 1] = 0x00;
    EXPECT_TRUE("Ctime64R0200(64bit_future)",
                strcmp(result, "Fri Jan  1 00:00:00 2100") == 0 || strcmp(result, "Fri Jan 1 00:00:00 2100") == 0);
    EXPECT_STREQ("Ctime64R0200(64bit_buffer)", result, buffer);

    // test negative 64-bit time value (Dec 31 1969 23:59:59 UTC - before epoch)
    time_t negative64Time = -1;
    std::fill_n(buffer, static_cast<size_t>(g_bufferSize), '\0');
    result = CTIME64_R(&negative64Time, buffer);
    if (result == nullptr) {
        EXPECT_FALSE("Ctime64R0200", result == nullptr);
        return;
    }
    result[strlen(result) - 1] = 0x00;
    EXPECT_TRUE("Ctime64R0200(negative)",
                strcmp(result, "Wed Dec 31 23:59:59 1969") == 0 || strcmp(result, "Wed Dec  31 23:59:59 1969") == 0);

    // Critical: Restore original timezone to avoid impacting other test cases
    if (originalTz != nullptr) {
        setenv("TZ", originalTz, 1);
    } else {
        unsetenv("TZ"); // Clear TZ variable if no original timezone existed
    }
    tzset(); // Re-apply original timezone configuration
}

int CtimeRTest(void)
{
    CtimeR0100();
    CtimeR0200();
    Ctime64R0100();
    Ctime64R0200();
    return T_STATUS;
}