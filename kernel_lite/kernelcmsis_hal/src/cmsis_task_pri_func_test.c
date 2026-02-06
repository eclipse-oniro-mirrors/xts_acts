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

osThreadId_t g_priTaskID01;
osPriority_t g_setPriority;

LITE_TEST_SUIT(Cmsis, Cmsistask, CmsisTaskPriFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL CmsisTaskPriFuncTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL CmsisTaskPriFuncTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

static void CmsisThreadGetPriorityFunc001(void const *argument)
{
    (void)argument;
    osThreadAttr_t attr;
    g_priTaskID01 = osThreadGetId();
    attr.priority = osThreadGetPriority(g_priTaskID01);
    TEST_ASSERT_EQUAL_INT(g_setPriority, attr.priority);
    osThreadExit();
}

static void CmsisThreadSetPriorityFunc001(void const *argument)
{
    (void)argument;
    osThreadAttr_t attr;
    UINT32 uwRet;
    g_priTaskID01 = osThreadGetId();
    uwRet = osThreadSetPriority(g_priTaskID01, g_setPriority);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
    attr.priority = osThreadGetPriority(g_priTaskID01);
    TEST_ASSERT_EQUAL_INT(g_setPriority, attr.priority);
    osThreadExit();
}

static void CmsisThreadSetPriorityFunc002(void const *argument)
{
    (void)argument;
    UINT32 uwRet;
    g_priTaskID01 = osThreadGetId();
    uwRet = osThreadSetPriority(g_priTaskID01, g_setPriority);
    TEST_ASSERT_EQUAL_INT(osErrorParameter, uwRet);
    osThreadExit();
}

/**
 * @tc.name   testOsThreadGetPriority001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5120
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadGetPriority001, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_setPriority = osPriorityLow1;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_setPriority;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetPriority002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5160
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadGetPriority002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osThreadGetPriority(NULL);
    TEST_ASSERT_EQUAL_INT(osPriorityError, uwRet);
};

/**
 * @tc.name   testOsThreadGetPriority003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadGetPriority003, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    g_priTaskID01 =  osThreadGetId();
    uwRet = osThreadGetPriority(g_priTaskID01);
    TEST_ASSERT_EQUAL_INT(osPriorityNormal, uwRet);
};

/**
 * @tc.name   testOsThreadGetPriority004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5240
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadGetPriority004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_setPriority = osPriorityLow7;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_setPriority;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetPriority005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5280
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadGetPriority005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_setPriority = osPriorityBelowNormal;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_setPriority;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetPriority006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5320
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadGetPriority006, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_setPriority = osPriorityBelowNormal7;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_setPriority;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetPriority007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5360
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadGetPriority007, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_setPriority = osPriorityNormal;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_setPriority;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetPriority008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadGetPriority008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_setPriority = osPriorityNormal7;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_setPriority;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetPriorityFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetPriority009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5440
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadGetPriority009, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_setPriority = osPriorityAboveNormal;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_setPriority;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetPriorityFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetPriority010
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5480
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadGetPriority010, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_setPriority = osPriorityAboveNormal6;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_setPriority;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetPriorityFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5520
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority001, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osThreadSetPriority(NULL, osPriorityNormal);
    TEST_ASSERT_EQUAL_INT(osErrorParameter, uwRet);
};

/**
 * @tc.name   testOsThreadSetPriority002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5560
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    g_priTaskID01 =  osThreadGetId();
    uwRet = osThreadSetPriority(g_priTaskID01, osPriorityNone);
    TEST_ASSERT_EQUAL_INT(osErrorParameter, uwRet);
};

/**
 * @tc.name   testOsThreadSetPriority003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority003, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityNone;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5640
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityIdle;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5680
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityLow;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5720
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority006, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityLow1;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5760
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority007, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityLow7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityBelowNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5840
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority009, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityBelowNormal7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority010
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5880
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority010, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority011
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5920
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority011, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityNormal7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority012
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5960
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority012, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityAboveNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority013
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority013, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityAboveNormal6;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority014
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority014, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityAboveNormal7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority015
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority015, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityHigh;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority016
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6120
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority016, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityHigh7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority017
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6160
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority017, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityRealtime;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority018
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority018, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityRealtime7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority019
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6240
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority019, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityISR;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority020
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6280
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority020, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityError;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority021
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6320
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority021, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_setPriority = osPriorityReserved;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority022
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6360
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority022, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityNone;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority023
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority023, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityIdle;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority024
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6440
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority024, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityLow;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority025
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6480
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority025, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityLow1;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority026
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6520
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority026, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityLow7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority027
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6560
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority027, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityBelowNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority028
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority028, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityBelowNormal7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority029
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6640
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority029, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority030
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6680
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority030, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityNormal7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority031
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6720
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority031, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityAboveNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority032
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6760
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority032, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityAboveNormal6;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority033
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority033, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityAboveNormal7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority034
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6840
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority034, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityHigh;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority035
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6880
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority035, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityHigh7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority036
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6920
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority036, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityRealtime;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority037
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_6960
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority037, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityRealtime7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority038
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority038, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityISR;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority039
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority039, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityError;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority040
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority040, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    g_setPriority = osPriorityReserved;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority041
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7120
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority041, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityNone;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority042
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7160
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority042, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityIdle;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority043
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority043, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityLow;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority044
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7240
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority044, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityLow1;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority045
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7280
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority045, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityLow7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority046
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7320
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority046, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityBelowNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority047
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7360
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority047, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityBelowNormal7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority048
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority048, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority049
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7440
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority049, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityNormal7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority050
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7480
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority050, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityAboveNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority051
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7520
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority051, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityAboveNormal6;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority052
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7560
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority052, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityAboveNormal7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority053
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority053, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityHigh;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority054
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7640
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority054, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityHigh7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority055
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7680
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority055, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityRealtime;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority056
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7720
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority056, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityRealtime7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority057
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7760
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority057, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityISR;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority058
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority058, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityError;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadSetPriority059
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7840
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsThreadSetPriority059, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_setPriority = osPriorityReserved;
    id = osThreadNew((osThreadFunc_t)CmsisThreadSetPriorityFunc002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsDelay001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7880
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsDelay001, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsDelay002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7920
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsDelay002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osDelay(0);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsDelayUntil001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_7960
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsDelayUntil001, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    UINT32 uwTickCnt;
    UINT32 uwUntilTickCnt;
    uwTickCnt = osKernelGetTickCount();
    uwUntilTickCnt = uwTickCnt + DELAY_TICKS_10;
    uwRet = osDelayUntil(uwUntilTickCnt);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsDelayUntil002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_8000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsDelayUntil002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osDelayUntil(DELAY_TICKS_1);
    TEST_ASSERT_EQUAL_INT(osError, uwRet);
};

/**
 * @tc.name   testOsDelayUntil003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_8040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskPriFuncTestSuite, testOsDelayUntil003, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    UINT32 uwTickCnt;
    UINT32 uwUntilTickCnt;
    uwTickCnt = osKernelGetTickCount();
    uwUntilTickCnt = uwTickCnt - DELAY_TICKS_10;
    uwRet = osDelayUntil(uwUntilTickCnt);
    TEST_ASSERT_EQUAL_INT(osError, uwRet);
};

RUN_TEST_SUITE(CmsisTaskPriFuncTestSuite);
