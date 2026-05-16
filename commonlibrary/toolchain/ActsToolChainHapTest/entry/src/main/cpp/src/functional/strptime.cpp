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

#include <cstddef>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include "test.h"

namespace {
constexpr long K_SECONDS_PER_HOUR = 3600L;
constexpr long K_SECONDS_PER_MINUTE = 60L;
constexpr int K_TZ_HOUR_PLUS2 = 2;
constexpr int K_TZ_MINUTE0 = 0;
constexpr int K_TZ_HOUR_MINUS5 = -5;
constexpr int K_TZ_MINUTE_MINUS30 = -30;
constexpr int K_TZ_HOUR_MINUS6 = -6;
} // namespace

/**
 * CheckStrptime - parse time and check if it matches expected value
 *
 * This function compares time and date fields of tm structure only.
 * It's because tm_wday and tm_yday may - but don'T have to - be set
 * while parsing a date.
 */
static void CheckStrptime(const char* s, const char* format, const struct tm* expected)
{
    struct tm tm = {};
    const char* ret;

    ret = strptime(s, format, &tm);
    if (!ret || *ret != '\0') {
        t_error("\"%s\": failed to parse \"%s\"\n", format, s);
    } else if (tm.tm_sec != expected->tm_sec || tm.tm_min != expected->tm_min || tm.tm_hour != expected->tm_hour ||
               tm.tm_mday != expected->tm_mday || tm.tm_mon != expected->tm_mon || tm.tm_year != expected->tm_year) {
        char buf1[64];
        char buf2[64];

        strftime(buf1, sizeof(buf1), "%FT%H:%M:%S%Z", expected);
        strftime(buf2, sizeof(buf2), "%FT%H:%M:%S%Z", &tm);

        t_error("\"%s\": for \"%s\" expected %s but got %s\n", format, s, buf1, buf2);
    }
}

static void CheckStrptimeTz(const char* s, int h, int m)
{
    long int expected = h * K_SECONDS_PER_HOUR + m * K_SECONDS_PER_MINUTE;
    struct tm tm = {};
    const char* ret;

    ret = strptime(s, "%z", &tm);
    if (!ret || *ret != '\0') {
        t_error("\"%%z\": failed to parse \"%s\"\n", s);
    } else if (tm.tm_gmtoff != expected) {
        t_error("\"%%z\": for \"%s\" expected tm_gmtoff %ld but got %ld\n", s, tm.tm_gmtoff, expected);
    }
}

static struct tm g_tm1 = {
    .tm_sec = 8,
    .tm_min = 57,
    .tm_hour = 20,
    .tm_mday = 0,
    .tm_mon = 0,
    .tm_year = 0,
};

static struct tm g_tm2 = {
    .tm_sec = 0,
    .tm_min = 0,
    .tm_hour = 0,
    .tm_mday = 25,
    .tm_mon = 8 - 1,
    .tm_year = 1991 - 1900,
};

static struct tm g_tm3 = {
    .tm_sec = 0,
    .tm_min = 0,
    .tm_hour = 0,
    .tm_mday = 21,
    .tm_mon = 10 - 1,
    .tm_year = 2015 - 1900,
};

static struct tm g_tm4 = {
    .tm_sec = 0,
    .tm_min = 0,
    .tm_hour = 0,
    .tm_mday = 10,
    .tm_mon = 7 - 1,
    .tm_year = 1856 - 1900,
};

static int StrptimeTestImpl()
{
    setenv("TZ", "UTC0", 1);

    /* Time */
    CheckStrptime("20:57:08", "%H:%M:%S", &g_tm1);
    CheckStrptime("20:57:8", "%R:%S", &g_tm1);
    CheckStrptime("20:57:08", "%T", &g_tm1);

    /* Format */
    CheckStrptime("20:57:08", "%H : %M  :  %S", &g_tm1);
    CheckStrptime("20 57  08", "%H %M %S", &g_tm1);
    CheckStrptime("20%57%08", "%H %% %M%%%S", &g_tm1);
    CheckStrptime("foo20bar57qux08      ", "foo %Hbar %M qux%S ", &g_tm1);

    /* Date */
    CheckStrptime("1991-08-25", "%Y-%m-%d", &g_tm2);
    CheckStrptime("25.08.91", "%d.%m.%y", &g_tm2);
    CheckStrptime("08/25/91", "%D", &g_tm2);
    CheckStrptime("21.10.15", "%d.%m.%y", &g_tm3);
    CheckStrptime("10.7.56 in 18th", "%d.%m.%y in %C th", &g_tm4);

    /* Glibc */
    CheckStrptime("1856-07-10", "%F", &g_tm4);
    CheckStrptime("683078400", "%s", &g_tm2);
    CheckStrptimeTz("+0200", K_TZ_HOUR_PLUS2, K_TZ_MINUTE0);
    CheckStrptimeTz("-0530", K_TZ_HOUR_MINUS5, K_TZ_MINUTE_MINUS30);
    CheckStrptimeTz("-06", K_TZ_HOUR_MINUS6, K_TZ_MINUTE0);

    return T_STATUS;
}

int StrptimeTest(void)
{
    return StrptimeTestImpl();
}
