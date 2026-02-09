/**
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
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
 *
 */
#include "ohos_types.h"
#include <securec.h>
#include "hctest.h"
#include "los_config.h"
#include "cmsis_os2.h"
#include "kernel_test.h"

osSemaphoreId_t  g_cmsisSemSema;
#define SEMAPHHORE_COUNT_HEX_MAX    0xFE
#define SEMAPHHORE_COUNT_INT0    0
#define SEMAPHHORE_COUNT_INT1    1
#define SEMAPHHORE_COUNT_INT10    10


LITE_TEST_SUIT(Cmsis, CmsisSem, CmsisSemFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL CmsisSemFuncTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL CmsisSemFuncTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   testOsSemaphoreNew001
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreNew001, Function | MediumTest | Level1)
{
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT1, SEMAPHHORE_COUNT_INT0, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    (void)osSemaphoreDelete(g_cmsisSemSema);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsSemaphoreNew002
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreNew002, Function | MediumTest | Level1)
{
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT10, SEMAPHHORE_COUNT_INT1, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    (void)osSemaphoreDelete(g_cmsisSemSema);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsSemaphoreNew003
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_0300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreNew003, Function | MediumTest | Level1)
{
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT0, SEMAPHHORE_COUNT_INT10, NULL);
    TEST_ASSERT_NULL(g_cmsisSemSema);
};

/**
 * @tc.name   testOsSemaphoreNew004
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreNew004, Function | MediumTest | Level1)
{
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT0, SEMAPHHORE_COUNT_INT0, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    osSemaphoreDelete(g_cmsisSemSema);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsSemaphoreNew005
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreNew005, Function | MediumTest | Level1)
{
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT1, SEMAPHHORE_COUNT_INT1, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    osSemaphoreDelete(g_cmsisSemSema);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsSemaphoreNew006
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreNew006, Function | MediumTest | Level1)
{
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT10, SEMAPHHORE_COUNT_INT10, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    osSemaphoreDelete(g_cmsisSemSema);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsSemaphoreNew007
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreNew007, Function | MediumTest | Level1)
{
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_HEX_MAX, SEMAPHHORE_COUNT_INT0, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    osSemaphoreDelete(g_cmsisSemSema);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsSemaphoreNew008
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_0800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreNew008, Function | MediumTest | Level1)
{
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT0, SEMAPHHORE_COUNT_HEX_MAX, NULL);
    TEST_ASSERT_NULL(g_cmsisSemSema);
};

/**
 * @tc.name   testOsSemaphoreDelete001
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_0900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreDelete001, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT10, SEMAPHHORE_COUNT_INT0, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);

    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsSemaphoreDelete002
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_1000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreDelete002, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT10, SEMAPHHORE_COUNT_INT0, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);

    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);

    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osErrorParameter, uwRet);
};

/**
 * @tc.name   testOsSemaphoreDelete003
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_1100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreDelete003, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    uwRet = osSemaphoreDelete(NULL);
    TEST_ASSERT_EQUAL_INT(osErrorParameter, uwRet);

};

/**
 * @tc.name   testOsSemaphoreAcquire001
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_1200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreAcquire001, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT1, SEMAPHHORE_COUNT_INT1, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    uwRet = osSemaphoreAcquire(g_cmsisSemSema, 0);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);

    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsSemaphoreAcquire002
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_1300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreAcquire002, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT1, SEMAPHHORE_COUNT_INT0, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    uwRet = osSemaphoreAcquire(g_cmsisSemSema, 0);
    TEST_ASSERT_EQUAL_INT(osErrorResource, uwRet);

    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsSemaphoreAcquire003
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_1400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreAcquire003, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT0, SEMAPHHORE_COUNT_INT1, NULL);
    TEST_ASSERT_NULL(g_cmsisSemSema);
};

/**
 * @tc.name   testOsSemaphoreAcquire004
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_1500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreAcquire004, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    uwRet = osSemaphoreAcquire(NULL, 0);
    TEST_ASSERT_EQUAL_INT(osErrorParameter, uwRet);

};

/**
 * @tc.name   testOsSemaphoreRelease001
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_1600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreRelease001, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT1, SEMAPHHORE_COUNT_INT0, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);

    uwRet = osSemaphoreAcquire(g_cmsisSemSema, 0);
    TEST_ASSERT_EQUAL_INT(osErrorResource, uwRet);

    uwRet = osSemaphoreRelease(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);

    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsSemaphoreRelease002
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_1700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreRelease002, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT1, SEMAPHHORE_COUNT_INT0, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);

    uwRet = osSemaphoreRelease(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
    uwRet = osSemaphoreRelease(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osErrorResource, uwRet);

    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsSemaphoreRelease003
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_1800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreRelease003, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT1, SEMAPHHORE_COUNT_INT1, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);

    uwRet = osSemaphoreRelease(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osErrorResource, uwRet);

    uwRet = osSemaphoreAcquire(g_cmsisSemSema, 0);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);

    uwRet = osSemaphoreRelease(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
    uwRet = osSemaphoreRelease(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osErrorResource, uwRet);

    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsSemaphoreRelease004
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_1900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreRelease004, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    uwRet = osSemaphoreRelease(NULL);
    TEST_ASSERT_EQUAL_INT(osErrorParameter, uwRet);

};

/**
 * @tc.name   testOsSemaphoreGetCount001
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_2000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreGetCount001, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT1, SEMAPHHORE_COUNT_INT1, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    uwRet = osSemaphoreGetCount(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(1, uwRet);
    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);

    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_HEX_MAX, SEMAPHHORE_COUNT_HEX_MAX, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    uwRet = osSemaphoreGetCount(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(SEMAPHHORE_COUNT_HEX_MAX, uwRet);
    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsSemaphoreGetCount002
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_2100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreGetCount002, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT1, SEMAPHHORE_COUNT_INT0, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    uwRet = osSemaphoreGetCount(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(0, uwRet);
    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);

    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_INT0, SEMAPHHORE_COUNT_INT1, NULL);
    TEST_ASSERT_NULL(g_cmsisSemSema);
};

/**
 * @tc.name   testOsSemaphoreGetCount003
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_2200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreGetCount003, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    g_cmsisSemSema = osSemaphoreNew(SEMAPHHORE_COUNT_HEX_MAX, SEMAPHHORE_COUNT_HEX_MAX, NULL);
    TEST_ASSERT_NOT_NULL(g_cmsisSemSema);
    uwRet = osSemaphoreAcquire(g_cmsisSemSema, osWaitForever);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);

    uwRet = osSemaphoreGetCount(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(SEMAPHHORE_COUNT_HEX_MAX - 1, uwRet);
    uwRet = osSemaphoreDelete(g_cmsisSemSema);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsSemaphoreGetCount004
 * @tc.number SUB_KERNEL_CMSIS_SEM_OPERATION_2300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisSemFuncTestSuite, testOsSemaphoreGetCount004, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    uwRet = osSemaphoreGetCount(NULL);
    TEST_ASSERT_EQUAL_INT(0, uwRet);

};

RUN_TEST_SUITE(CmsisSemFuncTestSuite);
