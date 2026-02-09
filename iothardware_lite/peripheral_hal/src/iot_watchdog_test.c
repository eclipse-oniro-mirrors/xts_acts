/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include "hctest.h"
#include "iot_errno.h"
#include "iot_watchdog.h"

void (*g_watchDogfunc)(void);

LITE_TEST_SUIT(wifiiot, wifiiotlite, IotWatchDogTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL IotWatchDogTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL IotWatchDogTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   testIotWatchDog001
 * @tc.number SUB_UTILS_WIFIIOT_API_6000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotWatchDogTestSuite, testIotWatchDog001, Function | MediumTest | Level1)
{
    g_watchDogfunc = IoTWatchDogEnable;
};

/**
 * @tc.name   testIotWatchDog002
 * @tc.number SUB_UTILS_WIFIIOT_API_6100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotWatchDogTestSuite, testIotWatchDog002, Function | MediumTest | Level1)
{
    g_watchDogfunc = IoTWatchDogKick;
};

/**
 * @tc.name   testIotWatchDog003
 * @tc.number SUB_UTILS_WIFIIOT_API_6200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotWatchDogTestSuite, testIotWatchDog003, Function | MediumTest | Level1)
{
    g_watchDogfunc = IoTWatchDogDisable;
};

RUN_TEST_SUITE(IotWatchDogTestSuite);

