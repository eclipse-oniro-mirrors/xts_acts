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
#include "iot_flash.h"

#define TEST_FLASH_SIZE 8
#define TEST_FLASH_SIZE_4K 4096
#define TEST_FLASH_OFFSET 0xFFFFFFFF

unsigned int (*g_ioTFlashWrite)(unsigned int flashOffset,
                                unsigned int size,
                                const unsigned char *ramData,
                                unsigned char doErase);
unsigned int (*g_ioTFlashRead)(unsigned int flashOffset, unsigned int size, unsigned char *ramData);
unsigned int (*g_ioTFlashErase)(unsigned int flashOffset, unsigned int size);
unsigned int (*g_ioTFlashInit)(void);
unsigned int (*g_ioTFlashDeinit)(void);

LITE_TEST_SUIT(wifiiot, wifiiotlite, IotFlashTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL IotFlashTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL IotFlashTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   testIotFlash001
 * @tc.number SUB_UTILS_WIFIIOT_API_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite, testIotFlash001, Function | MediumTest | Level1)
{
    g_ioTFlashInit = IoTFlashInit;
};

/**
 * @tc.name   testIotFlash002
 * @tc.number SUB_UTILS_WIFIIOT_API_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite, testIotFlash002, Function | MediumTest | Level1)
{
    g_ioTFlashWrite = IoTFlashWrite;

};

/**
 * @tc.name   testIotFlash003
 * @tc.number SUB_UTILS_WIFIIOT_API_0300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite, testIotFlash003, Function | MediumTest | Level1)
{
    g_ioTFlashRead = IoTFlashRead;
};

/**
 * @tc.name   testIotFlash004
 * @tc.number SUB_UTILS_WIFIIOT_API_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite, testIotFlash004, Function | MediumTest | Level1)
{
    g_ioTFlashErase = IoTFlashErase;
};

/**
 * @tc.name   testIotFlash005
 * @tc.number SUB_UTILS_WIFIIOT_API_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(IotFlashTestSuite, testIotFlash005, Function | MediumTest | Level1)
{
    g_ioTFlashDeinit = IoTFlashDeinit;
};

RUN_TEST_SUITE(IotFlashTestSuite);
