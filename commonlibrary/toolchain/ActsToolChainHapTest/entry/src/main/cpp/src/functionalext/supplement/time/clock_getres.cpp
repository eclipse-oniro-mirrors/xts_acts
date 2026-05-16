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

#include <ctime>
#include "functionalext.h"
#include "time64_functions.h"

/**
 * @tc.name      : clock_getres_0100
 * @tc.desc      : Verify that the resolution in the specified poem can be found (the parameter is CLOCK_REALTIME)
 * @tc.level     : Level 0
 */
void ClockGetres0100(void)
{
    struct timespec ts;
    int result = clock_getres(CLOCK_REALTIME, &ts);
    EXPECT_EQ("clock_getres_0100", result, 0);
}

/**
 * @tc.name      : clock_getres_0200
 * @tc.desc      : Verify that the resolution in the specified poem can be found (the parameter is CLOCK_TAI)
 * @tc.level     : Level 0
 */
void ClockGetres0200(void)
{
    struct timespec ts;
    int result = clock_getres(CLOCK_TAI, &ts);
    EXPECT_EQ("clock_getres_0200", result, 0);
}

/**
 * @tc.name      : clock_getres_0300
 * @tc.desc      : Verify that the resolution in the specified poem can be found (the parameter is CLOCK_MONOTONIC)
 * @tc.level     : Level 0
 */
void ClockGetres0300(void)
{
    struct timespec ts;
    int result = clock_getres(CLOCK_MONOTONIC, &ts);
    EXPECT_EQ("clock_getres_0300", result, 0);
}

/**
 * @tc.name      : clock_getres_0400
 * @tc.desc      : Verify that the resolution in the specified poem can be found (the parameter is CLOCK_BOOTTIME)
 * @tc.level     : Level 0
 */
void ClockGetres0400(void)
{
    struct timespec ts;
    int result = clock_getres(CLOCK_BOOTTIME, &ts);
    EXPECT_EQ("clock_getres_0400", result, 0);
}

/**
 * @tc.name      : clock_getres_0500
 * @tc.desc      : Verify that the resolution in the specified poem cannot be found (parameter is 100)
 * @tc.level     : Level 2
 */
void ClockGetres0500(void)
{
    struct timespec ts;
    int result = clock_getres(100, &ts);
    EXPECT_EQ("clock_getres_0500", result, -1);
}

/**
 * @tc.name      : clock_getres_time64_0100
 * @tc.desc      : Verify that the resolution in the specified poem can be found (the parameter is CLOCK_REALTIME)
 * @tc.level     : Level 0
 */
void ClockGetresTime640100(void)
{
    struct timespec ts;
    int result = ClockGetresTime64(CLOCK_REALTIME, &ts);
    EXPECT_EQ("clock_getres_time64_0100", result, 0);
}

int ClockGetresTest(void)
{
    ClockGetres0100();
    ClockGetres0200();
    ClockGetres0300();
    ClockGetres0400();
    ClockGetres0500();
    ClockGetresTime640100();
    return T_STATUS;
}