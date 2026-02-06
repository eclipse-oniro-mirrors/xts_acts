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
#ifdef CONFIG_PWM_SUPPORT
#include "iot_pwm.h"
#endif

const unsigned int COMPILABILITY_TEST_PWM_PORT = 0xFFFFFFFF;

LITE_TEST_SUIT(wifiiot, wifiiotlite, IotPwmTestSuite);

#ifdef CONFIG_PWM_SUPPORT
/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL IotPwmTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL IotPwmTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   testIotPwm001
 * @tc.number SUB_UTILS_WIFIIOT_API_4000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotPwmTestSuite, testIotPwm001, Function | MediumTest | Level1)
{
    unsigned int ret;
    ret = IoTPwmInit(COMPILABILITY_TEST_PWM_PORT);
};

/**
 * @tc.name   testIotPwm002
 * @tc.number SUB_UTILS_WIFIIOT_API_4100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotPwmTestSuite, testIotPwm002, Function | MediumTest | Level1)
{
    unsigned int ret;
    unsigned short duty = 20;
    unsigned short freq = 2;

    ret = IoTPwmStart(COMPILABILITY_TEST_PWM_PORT, duty, freq);
};

/**
 * @tc.name   testIotPwm003
 * @tc.number SUB_UTILS_WIFIIOT_API_4200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotPwmTestSuite, testIotPwm003, Function | MediumTest | Level1)
{
    unsigned int ret;
    ret = IoTPwmStop(COMPILABILITY_TEST_PWM_PORT);
};

/**
 * @tc.name   testIotPwm004
 * @tc.number SUB_UTILS_WIFIIOT_API_4300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotPwmTestSuite, testIotPwm004, Function | MediumTest | Level1)
{
    unsigned int ret;
    ret = IoTPwmDeinit(COMPILABILITY_TEST_PWM_PORT);
};
#endif

RUN_TEST_SUITE(IotPwmTestSuite);
