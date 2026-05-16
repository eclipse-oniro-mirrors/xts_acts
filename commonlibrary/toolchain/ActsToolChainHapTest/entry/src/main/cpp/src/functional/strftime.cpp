/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include <climits>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include "test.h"

namespace {
constexpr int K_TIME_T64_BIT_THRESHOLD = 64;
} // namespace

static char g_buffer[100];

static void CheckStrftime(const char* format, const struct tm* tm, const char* expected)
{
    size_t resultLength = strftime(g_buffer, sizeof(g_buffer), format, tm);
    if (resultLength != 0 && strcmp(g_buffer, expected) != 0) {
        t_error("\"%s\": expected \"%s\", got \"%s\"\n", format, expected, g_buffer);
    } else if (resultLength == 0 && strlen(expected) != 0) {
        t_error("\"%s\": expected \"%s\", got nothing\n", format, expected);
    }
}

static struct tm g_tm1 = { .tm_sec = 45,
                           .tm_min = 23,
                           .tm_hour = 13,
                           .tm_mday = 3,
                           .tm_mon = 0,
                           .tm_year = 2016 - 1900,
                           .tm_wday = 0,
                           .tm_yday = 2,
                           .tm_isdst = 0 };

static struct tm g_tm2 = { .tm_sec = 53,
                           .tm_min = 17,
                           .tm_hour = 5,
                           .tm_mday = 5,
                           .tm_mon = 0,
                           .tm_year = 10009 - 1900,
                           .tm_wday = 1,
                           .tm_yday = 4,
                           .tm_isdst = 0 };

static struct tm g_tm3 = { .tm_sec = 0,
                           .tm_min = 0,
                           .tm_hour = 12,
                           .tm_mday = 23,
                           .tm_mon = 1,
                           .tm_year = 0 - 1900,
                           .tm_wday = 3,
                           .tm_yday = 53,
                           .tm_isdst = 0 };

static struct tm g_tm4 = { .tm_sec = 0,
                           .tm_min = 0,
                           .tm_hour = 0,
                           .tm_mday = 1,
                           .tm_mon = 0,
                           .tm_year = -123 - 1900,
                           .tm_wday = 1,
                           .tm_yday = 0,
                           .tm_isdst = 0 };

static struct tm g_tm5 = { .tm_sec = 0,
                           .tm_min = 0,
                           .tm_hour = 0,
                           .tm_mday = 1,
                           .tm_mon = 0,
                           .tm_year = INT_MAX,
                           .tm_wday = 3,
                           .tm_yday = 0,
                           .tm_isdst = 0 };

static void StrftimeTestCenturyAndDateCases()
{
    CheckStrftime("%c", &g_tm1, "Sun Jan  3 13:23:45 2016");
    CheckStrftime("%c", &g_tm2, "Mon Jan  5 05:17:53 +10009");
    CheckStrftime("%c", &g_tm3, "Wed Feb 23 12:00:00 0000");

    // The POSIX.1-2008 standard does not specify the padding character for
    // "%C". The C standard requires that the number is padded by '0'.
    // See also http://austingroupbugs.net/view.php?id=1184
    CheckStrftime("%C", &g_tm1, "20");
    CheckStrftime("%03C", &g_tm1, "020");
    CheckStrftime("%+3C", &g_tm1, "+20");
    CheckStrftime("%C", &g_tm2, "100");
    CheckStrftime("%C", &g_tm3, "00");
    CheckStrftime("%01C", &g_tm3, "0");

    CheckStrftime("%F", &g_tm1, "2016-01-03");
    CheckStrftime("%012F", &g_tm1, "002016-01-03");
    CheckStrftime("%+10F", &g_tm1, "2016-01-03");
    CheckStrftime("%+11F", &g_tm1, "+2016-01-03");
    CheckStrftime("%F", &g_tm2, "+10009-01-05");
    CheckStrftime("%011F", &g_tm2, "10009-01-05");
    CheckStrftime("%F", &g_tm3, "0000-02-23");
    CheckStrftime("%01F", &g_tm3, "0-02-23");
    CheckStrftime("%06F", &g_tm3, "0-02-23");
    CheckStrftime("%010F", &g_tm3, "0000-02-23");
    CheckStrftime("%F", &g_tm4, "-123-01-01");
    CheckStrftime("%011F", &g_tm4, "-0123-01-01");
}

static void StrftimeTestWeekAndTimeCases()
{
    CheckStrftime("%g", &g_tm1, "15");
    CheckStrftime("%g", &g_tm2, "09");

    CheckStrftime("%G", &g_tm1, "2015");
    CheckStrftime("%+5G", &g_tm1, "+2015");
    CheckStrftime("%04G", &g_tm2, "10009");

    CheckStrftime("%r", &g_tm1, "01:23:45 PM");
    CheckStrftime("%r", &g_tm2, "05:17:53 AM");
    CheckStrftime("%r", &g_tm3, "12:00:00 PM");
    CheckStrftime("%r", &g_tm4, "12:00:00 AM");

    // The "%s" specifier was accepted by the Austin Group for the next POSIX.1
    // revision. See http://austingroupbugs.net/view.php?id=169
    CheckStrftime("%s", &g_tm1, "1451827425");
    if (sizeof(time_t) * CHAR_BIT >= K_TIME_T64_BIT_THRESHOLD) {
        CheckStrftime("%s", &g_tm2, "253686748673");
    }

    CheckStrftime("%T", &g_tm1, "13:23:45");
    CheckStrftime("%T", &g_tm2, "05:17:53");
    CheckStrftime("%T", &g_tm3, "12:00:00");
    CheckStrftime("%T", &g_tm4, "00:00:00");

    CheckStrftime("%U", &g_tm1, "01");
    CheckStrftime("%U", &g_tm2, "01");
    CheckStrftime("%U", &g_tm3, "08");

    CheckStrftime("%V", &g_tm1, "53");
    CheckStrftime("%V", &g_tm2, "02");
    CheckStrftime("%V", &g_tm3, "08");

    CheckStrftime("%W", &g_tm1, "00");
    CheckStrftime("%W", &g_tm2, "01");
    CheckStrftime("%W", &g_tm3, "08");

    CheckStrftime("%x", &g_tm1, "01/03/16");
    CheckStrftime("%X", &g_tm1, "13:23:45");
    CheckStrftime("%y", &g_tm1, "16");
}

static void StrftimeTestYearAndBoundaryCases()
{
    CheckStrftime("%Y", &g_tm1, "2016");
    CheckStrftime("%05Y", &g_tm1, "02016");
    CheckStrftime("%+4Y", &g_tm1, "2016");
    CheckStrftime("%+5Y", &g_tm1, "+2016");
    CheckStrftime("%Y", &g_tm2, "+10009");
    CheckStrftime("%05Y", &g_tm2, "10009");
    CheckStrftime("%Y", &g_tm3, "0000");
    CheckStrftime("%02Y", &g_tm3, "00");
    CheckStrftime("%+5Y", &g_tm3, "+0000");
    CheckStrftime("%Y", &g_tm4, "-123");
    CheckStrftime("%+4Y", &g_tm4, "-123");
    CheckStrftime("%+5Y", &g_tm4, "-0123");

    if (INT_MAX == 0x7FFFFFFF) {
        // The standard does not specify any range for tm_year, so INT_MAX
        // should be valid.
        CheckStrftime("%y", &g_tm5, "47");
        CheckStrftime("%Y", &g_tm5, "+2147485547");
        CheckStrftime("%011Y", &g_tm5, "02147485547");
        if (sizeof(time_t) * CHAR_BIT >= K_TIME_T64_BIT_THRESHOLD) {
            CheckStrftime("%s", &g_tm5, "67768036160140800");
        }
    }
}

static int StrftimeTestImpl()
{
    setenv("TZ", "UTC0", 1);

    StrftimeTestCenturyAndDateCases();
    StrftimeTestWeekAndTimeCases();

    // There is no standard that explicitly specifies the exact format of "%Y".
    // The C standard says that "%F" is equivalent to "%Y-%m-%d". The
    // POSIX.1-2008 standard says that "%F" is equivalent to "%+4Y-%m-%d".
    // This implies that to conform to both standards "%Y" needs to be
    // equivalent to "%+4Y".
    // See also http://austingroupbugs.net/view.php?id=739
    StrftimeTestYearAndBoundaryCases();

    return T_STATUS;
}

int StrftimeTest(void)
{
    return StrftimeTestImpl();
}
