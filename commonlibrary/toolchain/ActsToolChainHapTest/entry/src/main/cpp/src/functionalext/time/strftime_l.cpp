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

#include <clocale>
#include <cstdlib>
#include <ctime>
#include "asctime_data.h"
#include "functionalext.h"

static time_t g_time = 1659177614;
static int16_t g_bufferSize = 80;

/**
 * @tc.name      : strftime_l_0100
 * @tc.desc      : according to different time zones, format date
 * @tc.level     : Level 0
 */
void StrftimeL0100(void)
{
    for (int32_t i = 0; i < static_cast<int32_t>(sizeof(test_asctime_data) / sizeof(test_asctime_data[0])); i++) {
        const char* handlerChar = TEST_HANDLE_PATH(test_asctime_data[i].tz);
        if (!handlerChar) {
            t_error("StrftimeL0100 failed: handlerChar is NULL\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        struct tm* timeptr = localtime(&g_time);
        if (!timeptr) {
            EXPECT_PTRNE("StrftimeL0100", timeptr, nullptr);
            return;
        }
        char buffer[g_bufferSize];
        locale_t mLocale = newlocale(LC_ALL_MASK, "en_US", nullptr);
        strftime_l(buffer, sizeof(buffer) - 1, "%c", timeptr, mLocale);
        EXPECT_STREQ("StrftimeL0100", buffer, test_asctime_data[i].result);
    }
}

static int StrftimeLTestImpl(void)
{
    StrftimeL0100();
    return T_STATUS;
}

int StrftimeLTest(void)
{
    return StrftimeLTestImpl();
}
