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
#include "iot_gpio.h"

#define TEST_GPIO_SIZE 8
const unsigned int COMPILABILITY_TEST_GPIO = 0xFFFFFFFF;

LITE_TEST_SUIT(wifiiot, wifiiotlite, IotGpioTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL IotGpioTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL IotGpioTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   testIoTGpio001
 * @tc.number SUB_UTILS_WIFIIOT_API_1800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio001, Function | MediumTest | Level1)
{
    IoTGpioInit(COMPILABILITY_TEST_GPIO);
};

/**
 * @tc.name   testIoTGpio002
 * @tc.number SUB_UTILS_WIFIIOT_API_1900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio002, Function | MediumTest | Level1)
{
    IoTGpioSetDir(COMPILABILITY_TEST_GPIO, IOT_GPIO_DIR_OUT);

};

/**
 * @tc.name   testIoTGpio003
 * @tc.number SUB_UTILS_WIFIIOT_API_2000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio003, Function | MediumTest | Level1)
{
    IotGpioDir dir = {0};
    IoTGpioGetDir(COMPILABILITY_TEST_GPIO, &dir);
};

/**
 * @tc.name   testIoTGpio004
 * @tc.number SUB_UTILS_WIFIIOT_API_2100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio004, Function | MediumTest | Level1)
{
    IoTGpioSetOutputVal(COMPILABILITY_TEST_GPIO, IOT_GPIO_VALUE1);
};

/**
 * @tc.name   testIoTGpio005
 * @tc.number SUB_UTILS_WIFIIOT_API_2200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio005, Function | MediumTest | Level1)
{
    IotGpioValue val = {0};
    IoTGpioGetOutputVal(COMPILABILITY_TEST_GPIO, &val);
};

/**
 * @tc.name   testIoTGpio006
 * @tc.number SUB_UTILS_WIFIIOT_API_2300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio006, Function | MediumTest | Level1)
{
    IotGpioValue val = {0};
    IoTGpioGetInputVal(COMPILABILITY_TEST_GPIO, &val);
};

void IOT_GPIO_CALLBACK_Func(char *arg)
{
    if (arg == NULL) {
        printf("arg is null\n");
    } else {
        arg = "iot_gpio";
        printf("arg exist\n");
    }
    printf("GpioIsrFunc callback successfully\n");
}

/**
 * @tc.name   testIoTGpio007
 * @tc.number SUB_UTILS_WIFIIOT_API_2400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio007, Function | MediumTest | Level1)
{
    IoTGpioRegisterIsrFunc(COMPILABILITY_TEST_GPIO,
                           IOT_INT_TYPE_LEVEL,
                           IOT_GPIO_EDGE_FALL_LEVEL_LOW,
                           IOT_GPIO_CALLBACK_Func,
                           (char *)(unsigned int)COMPILABILITY_TEST_GPIO);
};

/**
 * @tc.name   testIoTGpio008
 * @tc.number SUB_UTILS_WIFIIOT_API_2500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio008, Function | MediumTest | Level1)
{
    IoTGpioUnregisterIsrFunc(COMPILABILITY_TEST_GPIO);
};

/**
 * @tc.name   testIoTGpio09
 * @tc.number SUB_UTILS_WIFIIOT_API_2600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio09, Function | MediumTest | Level1)
{
    IoTGpioSetIsrMask(COMPILABILITY_TEST_GPIO, 0);
};

/**
 * @tc.name   testIoTGpio010
 * @tc.number SUB_UTILS_WIFIIOT_API_2700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio010, Function | MediumTest | Level1)
{
    IoTGpioSetIsrMode(COMPILABILITY_TEST_GPIO, IOT_INT_TYPE_LEVEL, IOT_GPIO_EDGE_FALL_LEVEL_LOW);
};

/**
 * @tc.name   testIoTGpio011
 * @tc.number SUB_UTILS_WIFIIOT_API_2800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotGpioTestSuite, testIoTGpio011, Function | MediumTest | Level1)
{
    IoTGpioDeinit(COMPILABILITY_TEST_GPIO);
};

RUN_TEST_SUITE(IotGpioTestSuite);
