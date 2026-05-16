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

#define CTIME64 ctime

/**
 * @tc.name      : Ctime0100
 * @tc.desc      : according to different time zones,covert date and time to string
 * @tc.level     : Level 0
 */
void Ctime0100(void)
{
    for (int32_t i = 0; i < (int32_t)(sizeof(TEST_ASCTIME_DATA) / sizeof(TEST_ASCTIME_DATA[0])); i++) {
        const char* handlerChar = TestHandlePath(TEST_ASCTIME_DATA[i].tz);
        if (!handlerChar) {
            t_error("Ctime640100 failed: handlerChar is nullptr\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        char* returnStr = ctime(&g_time);
        if (returnStr == nullptr) {
            EXPECT_FALSE("Ctime0100", returnStr == nullptr);
            return;
        }
        returnStr[strlen(returnStr) - 1] = 0x00;
        EXPECT_STREQ("Ctime0100", returnStr, TEST_ASCTIME_DATA[i].result);
    }
}

/**
 * @tc.name      : Ctime640100
 * @tc.desc      : according to different time zones,covert date and time to string
 * @tc.level     : Level 0
 */
void Ctime640100(void)
{
    for (int32_t i = 0; i < (int32_t)(sizeof(TEST_ASCTIME_DATA) / sizeof(TEST_ASCTIME_DATA[0])); i++) {
        const char* handlerChar = TestHandlePath(TEST_ASCTIME_DATA[i].tz);
        if (!handlerChar) {
            t_error("Ctime0100 failed: handlerChar is nullptr\n");
            continue;
        }

        setenv("TZ", handlerChar, 1);
        tzset();
        char* returnStr = CTIME64(&g_time);
        if (returnStr == nullptr) {
            EXPECT_FALSE("Ctime640100", returnStr == nullptr);
            return;
        }
        returnStr[strlen(returnStr) - 1] = 0x00;
        EXPECT_STREQ("Ctime640100", returnStr, TEST_ASCTIME_DATA[i].result);
    }
}

int CtimeTest(void)
{
    Ctime0100();
    Ctime640100();
    return T_STATUS;
}