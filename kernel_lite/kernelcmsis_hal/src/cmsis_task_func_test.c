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

UINT32 g_threadCount;
UINT16 g_cmsisTestTaskCount;
UINT16 g_getStackSizeExit;
UINT16 g_threadCreateExit;
UINT16 g_getNameExit;
UINT16 g_getStackSpaceExit;
osThreadId_t g_puwTaskID01;
osThreadId_t g_puwTaskID02;
osPriority_t g_threadPriority;

LITE_TEST_SUIT(Cmsis, Cmsistask, CmsisTaskFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL CmsisTaskFuncTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL CmsisTaskFuncTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

static void CmsisThreadCreatFunc(void const *argument)
{
    (void)argument;
    printf(">> in CmsisThreadCreatFunc\n");
    g_threadCreateExit = TESTCOUNT_NUM_1;
    osThreadExit();
}

static void CmsisThreadCreat002Func001(void const *argument)
{
    (void)argument;
    g_cmsisTestTaskCount++;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_3, g_cmsisTestTaskCount);
    osThreadExit();
}

static void CmsisThreadCreat002Func002(void const *argument)
{
    (void)argument;
    g_cmsisTestTaskCount++;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    osThreadExit();
}

static void CmsisThreadCreat003Func001(void const *argument)
{
    (void)argument;
    TEST_ASSERT_EQUAL_INT(0, g_cmsisTestTaskCount);
    g_cmsisTestTaskCount++;
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_3, g_cmsisTestTaskCount);
    g_cmsisTestTaskCount++;
    osThreadExit();
}

static void CmsisThreadCreat003Func002(void const *argument)
{
    (void)argument;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    g_cmsisTestTaskCount++;
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_4, g_cmsisTestTaskCount);
    g_cmsisTestTaskCount++;
    osThreadExit();
}

static void CmsisThreadCreat004Func002(void const *argument)
{
    (void)argument;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
    g_cmsisTestTaskCount++;
    osThreadExit();
}

static void CmsisThreadCreat004Func001(void const *argument)
{
    (void)argument;
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    TEST_ASSERT_EQUAL_INT(0, g_cmsisTestTaskCount);
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreat004Func002, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    g_cmsisTestTaskCount++;
    osThreadExit();
}

static void KeepRunByTick(UINT32 tick)
{
    UINT32 tickA = osKernelGetTickCount();
    UINT32 ran = 0;
    UINT32 loop = 0;
    UINT32 tickB = 0;
    while (ran < tick) {
        loop++;
        tickB = osKernelGetTickCount();
        if (tickB >= tickA) {
            ran = tickB - tickA;
        } else {
            ran = tickB + (MAX_UINT32 - tickA);
        }
        if (loop % ALIVE_INFO_DIS == 0) {
            printf("ran:%u, tickB:%u, tickA:%u, loop:%u\t\n",
                ran, tickB, tickA, loop);
        }
    }
    printf("return ran:%u, tickB:%u, tickA:%u\t\n",
        ran, tickB, tickA);
    return;
}

static void WaitThreadExit(osThreadId_t id, UINT16 const *exitFlag)
{
    UINT32 uwRet = osThreadSetPriority(id, osPriorityAboveNormal6);
    printf("WaitThreadExit id = %d, uwRet = %d\n", id, uwRet);
    UINT32 loop = 0;
    while (*exitFlag != TESTCOUNT_NUM_1) {
        osDelay(DELAY_TICKS_10);
        if (loop % ALIVE_INFO_DIS == 0) {
            printf("WaitThreadExit id = %d, loop = %d\n", id, loop++);
        }
    }
    printf("WaitThreadExit exit\n");
}

static void CmsisThreadCreat005Func001(void const *argument)
{
    (void)argument;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
    while (g_cmsisTestTaskCount < TESTCOUNT_NUM_2) {
        KeepRunByTick(DELAY_TICKS_10);
    }
    g_cmsisTestTaskCount++;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_3, g_cmsisTestTaskCount);
    osThreadExit();
}

static void CmsisThreadGetIDFunc001(void const *argument)
{
    (void)argument;
    g_puwTaskID01 = osThreadGetId();
    TEST_ASSERT_NOT_NULL(g_puwTaskID01);
    osThreadExit();
}

static void CmsisThreadGetNameFunc001(void const *argument)
{
    (void)argument;
    osThreadAttr_t attr;
    printf(">> in CmsisThreadGetNameFunc001\n");
    g_puwTaskID01 = osThreadGetId();
    attr.name = osThreadGetName(g_puwTaskID01);
    TEST_ASSERT_EQUAL_STRING("testThreadGetName", attr.name);
    g_getNameExit = TESTCOUNT_NUM_1;
    osThreadExit();
}

static void CmsisThreadGetStateFunc001(void const *argument)
{
    (void)argument;
    osThreadState_t state;
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadBlocked, state);

    g_puwTaskID02 = osThreadGetId();
    state = osThreadGetState(g_puwTaskID02);
    TEST_ASSERT_EQUAL_INT(osThreadRunning, state);
    osThreadExit();
}

static void CmsisThreadGetStateFunc002(void const *argument)
{
    (void)argument;
    osThreadState_t state;
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadReady, state);

    g_puwTaskID02 = osThreadGetId();
    state = osThreadGetState(g_puwTaskID02);
    TEST_ASSERT_EQUAL_INT(osThreadRunning, state);
    osThreadExit();
}

static void CmsisThreadSuspendFunc001(void const *argument)
{
    (void)argument;
    osStatus_t uwRet;
    g_puwTaskID01 = osThreadGetId();
    uwRet = osThreadSuspend(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
    osThreadExit();
}

static void CmsisThreadGetStackSizeFunc001(void const *argument)
{
    (void)argument;
    osThreadAttr_t attr;
    printf(">> in CmsisThreadGetStackSizeFunc001\n");
    g_puwTaskID01 = osThreadGetId();
    attr.stack_size = osThreadGetStackSize(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(TEST_TASK_STACK_SIZE, attr.stack_size);
    g_getStackSizeExit = TESTCOUNT_NUM_1;
    osThreadExit();
}

static void CmsisThreadGetStackSpaceFunc001(void const *argument)
{
    (void)argument;
    UINT32 uwCount;
    printf(">> in CmsisThreadGetStackSpaceFunc001\n");
    g_puwTaskID01 =  osThreadGetId();
    uwCount = osThreadGetStackSpace(g_puwTaskID01);
    TEST_ASSERT_GREATER_THAN_INT32(0, uwCount);
    g_getStackSpaceExit = TESTCOUNT_NUM_1;
    osThreadExit();
}

static void CmsisThreadYieldFunc002(void const *argument)
{
    (void)argument;
    osThreadState_t state;
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadReady, state);
    g_cmsisTestTaskCount++;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    osThreadExit();
}

static void CmsisThreadYieldFunc001(void const *argument)
{
    (void)argument;
    osStatus_t uwRet;
    osThreadId_t id;
    osThreadState_t state;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_threadPriority;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
    g_puwTaskID01 =  osThreadGetId();
    id = osThreadNew((osThreadFunc_t)CmsisThreadYieldFunc002, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadRunning, state);
    uwRet = osThreadYield();
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    osThreadExit();
}

static void CmsisThreadYieldFunc003(void const *argument)
{
    (void)argument;
    osStatus_t uwRet;
    osThreadId_t id;
    osThreadState_t state;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal7;
    g_puwTaskID01 =  osThreadGetId();
    g_threadCreateExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadRunning, state);
    uwRet = osThreadYield();
    WaitThreadExit(id, &g_threadCreateExit);
    osThreadExit();
}

static void CmsisThreadResumeFunc002(void const *argument)
{
    (void)argument;
    osStatus_t uwRet;
    g_cmsisTestTaskCount++;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    uwRet = osThreadResume(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
    osDelay(DELAY_TICKS_5);
    osThreadExit();
}

static void CmsisThreadResumeFunc001(void const *argument)
{
    (void)argument;
    osStatus_t uwRet;
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    g_puwTaskID01 = osThreadGetId();
    id = osThreadNew((osThreadFunc_t)CmsisThreadResumeFunc002, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    uwRet = osThreadSuspend(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
    g_cmsisTestTaskCount++;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_3, g_cmsisTestTaskCount);
    osThreadExit();
}

static void CmsisThreadTerminateFunc001(void const *argument)
{
    (void)argument;
    osStatus_t uwRet;
    g_puwTaskID01 = osThreadGetId();
    uwRet = osThreadTerminate(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
    g_cmsisTestTaskCount++;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
    osThreadExit();
}

static void CmsisThreadGetCountFunc002(void const *argument)
{
    (void)argument;
    UINT32 uwRet;
    uwRet = osThreadGetCount();
    TEST_ASSERT_GREATER_THAN_INT32(1, uwRet);
    osThreadExit();
}

static void CmsisThreadGetCountFunc001(void const *argument)
{
    (void)argument;
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetCountFunc002, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osThreadExit();
}

static void CmsisThreadGetCountFunc003(void const *argument)
{
    (void)argument;
    UINT32 uwRet;
    uwRet = osThreadGetCount();
    TEST_ASSERT_EQUAL_INT(g_threadCount + 1, uwRet);
    osThreadExit();
}

static void CmsisOSKernelLockFunc002(void const *argument)
{
    (void)argument;
    g_cmsisTestTaskCount++;
    osThreadExit();
}

/**
 * @tc.name   testOsThreadNew001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew001, Function | MediumTest | Level1)
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

    osDelay(DELAY_TICKS_5);
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, NULL);
    TEST_ASSERT_NULL(id);
    id = osThreadNew(NULL, NULL, NULL);
    TEST_ASSERT_NULL(id);
    id = osThreadNew(NULL, NULL, &attr);
    TEST_ASSERT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadNew002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew002, Function | MediumTest | Level1)
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
    g_cmsisTestTaskCount = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreat002Func001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT(0, g_cmsisTestTaskCount);

    g_cmsisTestTaskCount++;
    attr.priority = osPriorityAboveNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreat002Func002, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_3, g_cmsisTestTaskCount);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0120
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew003, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    osThreadAttr_t attr1;
    g_cmsisTestTaskCount = 0;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    id = osThreadNew ((osThreadFunc_t)CmsisThreadCreat003Func001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
    g_cmsisTestTaskCount++;
    attr1.name = "test1";
    attr1.attr_bits = 0U;
    attr1.cb_mem = NULL;
    attr1.cb_size = 0U;
    attr1.stack_mem = NULL;
    attr1.stack_size = TEST_TASK_STACK_SIZE;
    attr1.priority = osPriorityAboveNormal;
    id = osThreadNew ((osThreadFunc_t)CmsisThreadCreat003Func002, NULL, &attr1);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_5, g_cmsisTestTaskCount);
};

/**
 * @tc.name   testOsThreadNew004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0160
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    g_cmsisTestTaskCount = 0;
    attr.priority = osPriorityAboveNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreat004Func001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_3, g_cmsisTestTaskCount);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadNew005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew005, Function | MediumTest | Level1)
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
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreat005Func001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_1);
    g_cmsisTestTaskCount++;
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    osDelay(DELAY_TICKS_5);
    while (g_cmsisTestTaskCount != TESTCOUNT_NUM_3) {
        KeepRunByTick(DELAY_TICKS_10);
    }
};

/**
 * @tc.name   testOsThreadNew006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0240
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew006, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNone;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0280
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew007, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityIdle;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0320
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0360
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew009, Function | MediumTest | Level1)
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
    g_threadCreateExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_threadCreateExit);
};

/**
 * @tc.name   testOsThreadNew010
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew010, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow7;
    g_threadCreateExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_threadCreateExit);
};

/**
 * @tc.name   testOsThreadNew011
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0440
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew011, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal;
    g_threadCreateExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_threadCreateExit);
};

/**
 * @tc.name   testOsThreadNew012
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0480
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew012, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal7;
    g_threadCreateExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_threadCreateExit);
};

/**
 * @tc.name   testOsThreadNew013
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0520
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew013, Function | MediumTest | Level1)
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
    g_threadCreateExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_threadCreateExit);
};

/**
 * @tc.name   testOsThreadNew014
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0560
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew014, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal7;
    g_threadCreateExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_threadCreateExit);
};

/**
 * @tc.name   testOsThreadNew015
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew015, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    g_threadCreateExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_threadCreateExit);
};

/**
 * @tc.name   testOsThreadNew016
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0640
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew016, Function | MediumTest | Level1)
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
    g_threadCreateExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_threadCreateExit);
};

/**
 * @tc.name   testOsThreadNew017
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0680
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew017, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew018
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0720
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew018, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityHigh;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew019
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0760
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew019, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityHigh7;
    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew020
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew020, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityRealtime;

    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew021
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0840
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew021, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityRealtime7;

    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew022
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0880
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew022, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityISR;

    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew023
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0920
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew023, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityError;

    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew024
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_0960
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew024, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityReserved;

    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew025
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew025, Function | MediumTest | Level1)
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

    id = osThreadNew(NULL, NULL, &attr);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadNew026
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadNew026, Function | MediumTest | Level1)
{
    osThreadId_t id;

    id = osThreadNew((osThreadFunc_t)CmsisThreadCreatFunc, NULL, NULL);
    TEST_ASSERT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetName001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetName001, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "testThreadGetName";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;

    g_cmsisTestTaskCount = 0;
    g_getNameExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetNameFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    WaitThreadExit(id, &g_getNameExit);
};

/**
 * @tc.name   testOsThreadGetState001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1120
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetState001, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    g_puwTaskID01 = osThreadGetId();
    id = osThreadNew ((osThreadFunc_t)CmsisThreadGetStateFunc002, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadSuspend001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1160
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadSuspend001, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osStatus_t uwRet;
    osThreadAttr_t attr;
    osThreadState_t state;
    g_cmsisTestTaskCount = 0;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    id = osThreadNew ((osThreadFunc_t)CmsisThreadSuspendFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadBlocked, state);
    uwRet = osThreadResume(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsThreadGetId001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetId001, Function | MediumTest | Level1)
{
    g_puwTaskID01 = osThreadGetId();
    TEST_ASSERT_NOT_NULL(g_puwTaskID01);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetId002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1240
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetId002, Function | MediumTest | Level1)
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

    id = osThreadNew((osThreadFunc_t)CmsisThreadGetIDFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT((uintptr_t)id, (uintptr_t)g_puwTaskID01);
};

/**
 * @tc.name   testOsThreadGetId003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1280
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetId003, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow7;

    id = osThreadNew((osThreadFunc_t)CmsisThreadGetIDFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT((uintptr_t)id, (uintptr_t)g_puwTaskID01);
};

/**
 * @tc.name   testOsThreadGetId004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1320
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetId004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal;

    id = osThreadNew((osThreadFunc_t)CmsisThreadGetIDFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT((uintptr_t)id, (uintptr_t)g_puwTaskID01);
};

/**
 * @tc.name   testOsThreadGetId005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1360
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetId005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal7;

    id = osThreadNew((osThreadFunc_t)CmsisThreadGetIDFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT((uintptr_t)id, (uintptr_t)g_puwTaskID01);
};

/**
 * @tc.name   testOsThreadGetId006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetId006, Function | MediumTest | Level1)
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

    id = osThreadNew((osThreadFunc_t)CmsisThreadGetIDFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT((uintptr_t)id, (uintptr_t)g_puwTaskID01);
};

/**
 * @tc.name   testOsThreadGetId007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1440
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetId007, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal7;

    id = osThreadNew((osThreadFunc_t)CmsisThreadGetIDFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT((uintptr_t)id, (uintptr_t)g_puwTaskID01);
};

/**
 * @tc.name   testOsThreadGetId008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1480
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetId008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;

    id = osThreadNew((osThreadFunc_t)CmsisThreadGetIDFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT((uintptr_t)id, (uintptr_t)g_puwTaskID01);
};

/**
 * @tc.name   testOsThreadGetId009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1520
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetId009, Function | MediumTest | Level1)
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

    id = osThreadNew((osThreadFunc_t)CmsisThreadGetIDFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT((uintptr_t)id, (uintptr_t)g_puwTaskID01);
};

/**
 * @tc.name   testOsThreadGetId010
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1560
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetId010, Function | MediumTest | Level1)
{
    g_puwTaskID01 = osThreadGetId();
    TEST_ASSERT_NOT_NULL(g_puwTaskID01);
};

/**
 * @tc.name   testOsThreadGetStackSize001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSize001, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_cmsisTestTaskCount = 0;
    g_puwTaskID01 = 0;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_getStackSizeExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSizeFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSizeExit);
};

/**
 * @tc.name   testOsThreadGetStackSpace001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1640
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSpace001, Function | MediumTest | Level1)
{
    UINT32 uwCount;
    g_cmsisTestTaskCount = 0;
    g_puwTaskID01 =  osThreadGetId();
    uwCount = osThreadGetStackSpace(g_puwTaskID01);
    TEST_ASSERT_GREATER_THAN_INT32(0, uwCount);
};

/**
 * @tc.name   testOsThreadYield001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1680
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadYield001, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_threadPriority = osPriorityLow1;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_threadPriority;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadYieldFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadYield002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1720
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadYield002, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_threadPriority = osPriorityLow7;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_threadPriority;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadYieldFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadYield003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1760
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadYield003, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_threadPriority = osPriorityBelowNormal;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_threadPriority;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadYieldFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadYield004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadYield004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_threadPriority = osPriorityBelowNormal7;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_threadPriority;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadYieldFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadYield005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1840
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadYield005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_threadPriority = osPriorityNormal;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_threadPriority;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadYieldFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadYield006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1880
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadYield006, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_threadPriority = osPriorityNormal7;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_threadPriority;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadYieldFunc001, NULL, &attr);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadYield007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1920
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadYield007, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_threadPriority = osPriorityAboveNormal;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_threadPriority;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadYieldFunc001, NULL, &attr);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadYield008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_1960
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadYield008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    g_threadPriority = osPriorityAboveNormal6;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = g_threadPriority;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadYieldFunc001, NULL, &attr);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_2, g_cmsisTestTaskCount);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadYield009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadYield009, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadYieldFunc003, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadResume001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadResume001, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadResumeFunc001, NULL, &attr);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_3, g_cmsisTestTaskCount);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadTerminate001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadTerminate001, Function | MediumTest | Level1)
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
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadTerminateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
};

/**
 * @tc.name   testOsThreadGetCount001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2120
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetCount001, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetCountFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetCount002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2160
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetCount002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osThreadGetCount();
    TEST_ASSERT_GREATER_THAN_INT32(0, uwRet);
};

/**
 * @tc.name   testOsThreadGetCount003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetCount003, Function | MediumTest | Level1)
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
    g_threadCount = osThreadGetCount();
    TEST_ASSERT_GREATER_THAN_INT32(0, g_threadCount);
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetCountFunc003, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetCount004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2240
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetCount004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow7;
    g_threadCount = osThreadGetCount();
    TEST_ASSERT_GREATER_THAN_INT32(0, g_threadCount);
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetCountFunc003, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetCount005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2280
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetCount005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal;
    g_threadCount = osThreadGetCount();
    TEST_ASSERT_GREATER_THAN_INT32(0, g_threadCount);
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetCountFunc003, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetCount006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2320
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetCount006, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal7;
    g_threadCount = osThreadGetCount();
    TEST_ASSERT_GREATER_THAN_INT32(0, g_threadCount);
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetCountFunc003, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetCount007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2360
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetCount007, Function | MediumTest | Level1)
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
    g_threadCount = osThreadGetCount();
    TEST_ASSERT_GREATER_THAN_INT32(0, g_threadCount);
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetCountFunc003, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetCount008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetCount008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal7;
    g_threadCount = osThreadGetCount();
    TEST_ASSERT_GREATER_THAN_INT32(0, g_threadCount);
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetCountFunc003, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetCount009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2440
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetCount009, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    g_threadCount = osThreadGetCount();
    TEST_ASSERT_GREATER_THAN_INT32(0, g_threadCount);
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetCountFunc003, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetCount010
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2480
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetCount010, Function | MediumTest | Level1)
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
    g_threadCount = osThreadGetCount();
    TEST_ASSERT_GREATER_THAN_INT32(0, g_threadCount);
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetCountFunc003, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
};

/**
 * @tc.name   testOsThreadGetName002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2520
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetName002, Function | MediumTest | Level1)
{
    osThreadAttr_t attr;
    attr.name = osThreadGetName(NULL);
    TEST_ASSERT_NULL(attr.name);
};

/**
 * @tc.name   testOsThreadGetName003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2560
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetName003, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "testThreadGetName";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow1;
    g_getNameExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetNameFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    WaitThreadExit(id, &g_getNameExit);
};

/**
 * @tc.name   testOsThreadGetName004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetName004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "testThreadGetName";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow7;
    g_getNameExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetNameFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    WaitThreadExit(id, &g_getNameExit);
};

/**
 * @tc.name   testOsThreadGetName005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2640
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetName005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "testThreadGetName";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal;
    g_getNameExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetNameFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    WaitThreadExit(id, &g_getNameExit);
};

/**
 * @tc.name   testOsThreadGetName006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2680
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetName006, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "testThreadGetName";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal7;
    g_getNameExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetNameFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    WaitThreadExit(id, &g_getNameExit);
};

/**
 * @tc.name   testOsThreadGetName007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2720
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetName007, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "testThreadGetName";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal7;
    g_getNameExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetNameFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getNameExit);
};

/**
 * @tc.name   testOsThreadGetName008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2760
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetName008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "testThreadGetName";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    g_getNameExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetNameFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getNameExit);
};

/**
 * @tc.name   testOsThreadGetName009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetName009, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "testThreadGetName";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    g_getNameExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetNameFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getNameExit);
};

/**
 * @tc.name   testOsThreadGetName010
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2840
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetName010, Function | MediumTest | Level1)
{
    osThreadAttr_t attr;
    g_puwTaskID01 = osThreadGetId();
    attr.name = osThreadGetName(g_puwTaskID01);
    TEST_ASSERT_NOT_NULL(attr.name);
};

/**
 * @tc.name   testOsThreadGetState002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2880
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetState002, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    uwRet = osThreadGetState(NULL);
    TEST_ASSERT_EQUAL_INT(osThreadError, uwRet);
};

/**
 * @tc.name   testOsThreadGetState003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2920
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetState003, Function | MediumTest | Level1)
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

    g_puwTaskID01 = osThreadGetId();
    id = osThreadNew ((osThreadFunc_t)CmsisThreadGetStateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetState004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_2960
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetState004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow7;

    g_puwTaskID01 = osThreadGetId();
    id = osThreadNew ((osThreadFunc_t)CmsisThreadGetStateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetState005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetState005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal;

    g_puwTaskID01 = osThreadGetId();
    id = osThreadNew ((osThreadFunc_t)CmsisThreadGetStateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetState006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetState006, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal7;

    g_puwTaskID01 = osThreadGetId();
    id = osThreadNew ((osThreadFunc_t)CmsisThreadGetStateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetState007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetState007, Function | MediumTest | Level1)
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

    g_puwTaskID01 = osThreadGetId();
    id = osThreadNew ((osThreadFunc_t)CmsisThreadGetStateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetState008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3120
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetState008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal7;

    g_puwTaskID01 = osThreadGetId();
    id = osThreadNew ((osThreadFunc_t)CmsisThreadGetStateFunc002, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetState009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3160
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetState009, Function | MediumTest | Level1)
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

    g_puwTaskID01 = osThreadGetId();
    id = osThreadNew ((osThreadFunc_t)CmsisThreadGetStateFunc002, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
};

/**
 * @tc.name   testOsThreadGetState010
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetState010, Function | MediumTest | Level1)
{
    osThreadState_t state;
    g_puwTaskID01 = osThreadGetId();
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadRunning, state);
};

/**
 * @tc.name   testOsThreadSuspend002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3240
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadSuspend002, Function | MediumTest | Level1)
{
    osStatus_t uwRet;
    uwRet = osThreadSuspend(NULL);
    TEST_ASSERT_EQUAL_INT(osErrorParameter, uwRet);
};

/**
 * @tc.name   testOsThreadSuspend003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3280
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadSuspend003, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osStatus_t uwRet;
    osThreadAttr_t attr;
    osThreadState_t state;
    g_cmsisTestTaskCount = 0;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow7;
    id = osThreadNew ((osThreadFunc_t)CmsisThreadSuspendFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadBlocked, state);
    uwRet = osThreadResume(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsThreadSuspend004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3320
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadSuspend004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osStatus_t uwRet;
    osThreadAttr_t attr;
    osThreadState_t state;
    g_cmsisTestTaskCount = 0;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal;
    id = osThreadNew ((osThreadFunc_t)CmsisThreadSuspendFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadBlocked, state);
    uwRet = osThreadResume(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsThreadSuspend005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3360
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadSuspend005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osStatus_t uwRet;
    osThreadAttr_t attr;
    osThreadState_t state;
    g_cmsisTestTaskCount = 0;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal7;
    id = osThreadNew ((osThreadFunc_t)CmsisThreadSuspendFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadBlocked, state);
    uwRet = osThreadResume(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsThreadSuspend006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadSuspend006, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osStatus_t uwRet;
    osThreadAttr_t attr;
    osThreadState_t state;
    g_cmsisTestTaskCount = 0;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal;
    id = osThreadNew ((osThreadFunc_t)CmsisThreadSuspendFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadBlocked, state);
    uwRet = osThreadResume(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsThreadSuspend007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3440
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadSuspend007, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osStatus_t uwRet;
    osThreadAttr_t attr;
    osThreadState_t state;
    g_cmsisTestTaskCount = 0;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal7;
    id = osThreadNew ((osThreadFunc_t)CmsisThreadSuspendFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadBlocked, state);
    uwRet = osThreadResume(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsThreadSuspend008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3480
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadSuspend008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osStatus_t uwRet;
    osThreadAttr_t attr;
    osThreadState_t state;
    g_cmsisTestTaskCount = 0;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    id = osThreadNew ((osThreadFunc_t)CmsisThreadSuspendFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadBlocked, state);
    uwRet = osThreadResume(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsThreadSuspend009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3520
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadSuspend009, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osStatus_t uwRet;
    osThreadAttr_t attr;
    osThreadState_t state;
    g_cmsisTestTaskCount = 0;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal6;
    id = osThreadNew ((osThreadFunc_t)CmsisThreadSuspendFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    state = osThreadGetState(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osThreadBlocked, state);
    uwRet = osThreadResume(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osOK, uwRet);
};

/**
 * @tc.name   testOsThreadGetStackSize002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3560
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSize002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osThreadGetStackSize(NULL);
    TEST_ASSERT_EQUAL_INT(0, uwRet);
};

/**
 * @tc.name   testOsThreadGetStackSize003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSize003, Function | MediumTest | Level1)
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
    g_getStackSizeExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSizeFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSizeExit);
};

/**
 * @tc.name   testOsThreadGetStackSize004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3640
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSize004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow7;
    g_getStackSizeExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSizeFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSizeExit);
};

/**
 * @tc.name   testOsThreadGetStackSize005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3680
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSize005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal;
    g_getStackSizeExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSizeFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSizeExit);
};

/**
 * @tc.name   testOsThreadGetStackSize006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3720
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSize006, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal7;
    g_getStackSizeExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSizeFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSizeExit);
};

/**
 * @tc.name   testOsThreadGetStackSize007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3760
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSize007, Function | MediumTest | Level1)
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
    g_getStackSizeExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSizeFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSizeExit);
};

/**
 * @tc.name   testOsThreadGetStackSize008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSize008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal7;
    g_getStackSizeExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSizeFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSizeExit);
};

/**
 * @tc.name   testOsThreadGetStackSize009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3840
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSize009, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    g_getStackSizeExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSizeFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSizeExit);
};

/**
 * @tc.name   testOsThreadGetStackSize010
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3880
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSize010, Function | MediumTest | Level1)
{
    osThreadAttr_t attr;
    g_puwTaskID01 = osThreadGetId();
    attr.stack_size = osThreadGetStackSize(g_puwTaskID01);
    TEST_ASSERT_GREATER_THAN_INT32(0, attr.stack_size);
};

/**
 * @tc.name   testOsThreadGetStackSpace002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3920
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSpace002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osThreadGetStackSpace(NULL);
    TEST_ASSERT_EQUAL_INT(0, uwRet);
};

/**
 * @tc.name   testOsThreadGetStackSpace003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_3960
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSpace003, Function | MediumTest | Level1)
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
    g_getStackSpaceExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSpaceFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSpaceExit);
};

/**
 * @tc.name   testOsThreadGetStackSpace004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSpace004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow7;
    g_getStackSpaceExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSpaceFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSpaceExit);
};

/**
 * @tc.name   testOsThreadGetStackSpace005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSpace005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal;
    g_getStackSpaceExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSpaceFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSpaceExit);
};

/**
 * @tc.name   testOsThreadGetStackSpace006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSpace006, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal7;
    g_getStackSpaceExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSpaceFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSpaceExit);
};

/**
 * @tc.name   testOsThreadGetStackSpace007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4120
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSpace007, Function | MediumTest | Level1)
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
    g_getStackSpaceExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSpaceFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSpaceExit);
};

/**
 * @tc.name   testOsThreadGetStackSpace008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4160
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSpace008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal7;
    g_getStackSpaceExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSpaceFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSpaceExit);
};

/**
 * @tc.name   testOsThreadGetStackSpace009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSpace009, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;

    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    g_getStackSpaceExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSpaceFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSpaceExit);
};

/**
 * @tc.name   testOsThreadGetStackSpace010
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4240
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadGetStackSpace010, Function | MediumTest | Level1)
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
    g_getStackSpaceExit = 0;
    id = osThreadNew((osThreadFunc_t)CmsisThreadGetStackSpaceFunc001, NULL, &attr);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_NOT_NULL(id);
    WaitThreadExit(id, &g_getStackSpaceExit);
};

/**
 * @tc.name   testOsThreadResume002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4280
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadResume002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osThreadResume(NULL);
    TEST_ASSERT_EQUAL_INT(osErrorParameter, uwRet);
};

/**
 * @tc.name   testOsThreadResume003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4320
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadResume003, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    g_puwTaskID01 = osThreadGetId();
    uwRet = osThreadResume(g_puwTaskID01);
    TEST_ASSERT_EQUAL_INT(osErrorResource, uwRet);
};

/**
 * @tc.name   testOsThreadTerminate002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4360
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadTerminate002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osThreadTerminate(NULL);
    TEST_ASSERT_EQUAL_INT(osErrorParameter, uwRet);
};

/**
 * @tc.name   testOsThreadTerminate003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadTerminate003, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityLow7;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadTerminateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
};

/**
 * @tc.name   testOsThreadTerminate004
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4440
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadTerminate004, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadTerminateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
};

/**
 * @tc.name   testOsThreadTerminate005
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4480
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadTerminate005, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityBelowNormal7;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadTerminateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
};

/**
 * @tc.name   testOsThreadTerminate006
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4520
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadTerminate006, Function | MediumTest | Level1)
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
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadTerminateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    osDelay(DELAY_TICKS_5);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
};

/**
 * @tc.name   testOsThreadTerminate007
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4560
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadTerminate007, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityNormal7;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadTerminateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
};

/**
 * @tc.name   testOsThreadTerminate008
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadTerminate008, Function | MediumTest | Level1)
{
    osThreadId_t id;
    osThreadAttr_t attr;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadTerminateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
};

/**
 * @tc.name   testOsThreadTerminate009
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4640
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsThreadTerminate009, Function | MediumTest | Level1)
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
    g_cmsisTestTaskCount = 0;
    g_cmsisTestTaskCount++;
    id = osThreadNew((osThreadFunc_t)CmsisThreadTerminateFunc001, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
};

/**
 * @tc.name   testOsKernelGetInfo001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4680
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelGetInfo001, Function | MediumTest | Level1)
{
    CHAR infobuf[100];
    osVersion_t osv;
    osStatus_t status;
    status = osKernelGetInfo(&osv, infobuf, sizeof(infobuf));
    TEST_ASSERT_EQUAL_INT(osOK, status);
};

/**
 * @tc.name   testOsKernelGetState001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4720
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelGetState001, Function | MediumTest | Level1)
{
    osKernelState_t uwRet;
    uwRet = osKernelGetState();
    TEST_ASSERT_EQUAL_INT(osKernelRunning, uwRet);
};

/**
 * @tc.name   testOsKernelGetState002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4760
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelGetState002, Function | MediumTest | Level1)
{
    osKernelLock ();
    osKernelState_t uwRet;
    uwRet = osKernelGetState();
    TEST_ASSERT_EQUAL_INT(osKernelLocked, uwRet);
    osKernelUnlock ();
};

/**
 * @tc.name   testOsKernelLock001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelLock001, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osKernelLock();
    TEST_ASSERT_EQUAL_INT(0, uwRet);
    uwRet = osKernelLock();
    TEST_ASSERT_EQUAL_INT(1, uwRet);
    osKernelUnlock();
};

/**
 * @tc.name   testOsKernelLock002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4840
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelLock002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    osThreadId_t id;
    osThreadAttr_t attr;
    g_cmsisTestTaskCount = 0;
    attr.name = "test";
    attr.attr_bits = 0U;
    attr.cb_mem = NULL;
    attr.cb_size = 0U;
    attr.stack_mem = NULL;
    attr.stack_size = TEST_TASK_STACK_SIZE;
    attr.priority = osPriorityAboveNormal;

    uwRet = osKernelLock();
    TEST_ASSERT_EQUAL_INT(0, uwRet);
    id = osThreadNew((osThreadFunc_t)CmsisOSKernelLockFunc002, NULL, &attr);
    TEST_ASSERT_NOT_NULL(id);
    TEST_ASSERT_EQUAL_INT(0, g_cmsisTestTaskCount);
    uwRet = osKernelUnlock();
    TEST_ASSERT_EQUAL_INT(1, uwRet);
    TEST_ASSERT_EQUAL_INT(TESTCOUNT_NUM_1, g_cmsisTestTaskCount);
};

/**
 * @tc.name   testOsKernelUnLock001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4880
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelUnLock001, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osKernelUnlock();
    TEST_ASSERT_EQUAL_INT(0, uwRet);
};

/**
 * @tc.name   testOsKernelUnLock002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4920
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelUnLock002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    (void)osKernelLock();
    uwRet = osKernelUnlock();
    TEST_ASSERT_EQUAL_INT(1, uwRet);
    uwRet = osKernelUnlock();
    TEST_ASSERT_EQUAL_INT(0, uwRet);
};

/**
 * @tc.name   testOsKernelUnLock003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_4960
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelUnLock003, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    (void)osKernelLock();
    (void)osKernelLock();
    uwRet = osKernelUnlock();
    TEST_ASSERT_EQUAL_INT(1, uwRet);
    uwRet = osKernelUnlock();
    TEST_ASSERT_EQUAL_INT(0, uwRet);
};

/**
 * @tc.name   testOsKernelRestoreLock001
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelRestoreLock001, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    (void)osKernelLock();
    uwRet = osKernelRestoreLock(0);
    TEST_ASSERT_EQUAL_INT(0, uwRet);
    uwRet = osKernelUnlock();
    TEST_ASSERT_EQUAL_INT(0, uwRet);
};

/**
 * @tc.name   testOsKernelRestoreLock002
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelRestoreLock002, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    (void)osKernelLock();
    (void)osKernelLock();
    uwRet = osKernelRestoreLock(0);
    TEST_ASSERT_EQUAL_INT(0, uwRet);
    uwRet = osKernelUnlock();
    TEST_ASSERT_EQUAL_INT(0, uwRet);
};

/**
 * @tc.name   testOsKernelRestoreLock003
 * @tc.number SUB_KERNEL_CMSIS_TASK_OPERATION_5080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(CmsisTaskFuncTestSuite, testOsKernelRestoreLock003, Function | MediumTest | Level1)
{
    UINT32 uwRet;
    uwRet = osKernelUnlock();
    TEST_ASSERT_EQUAL_INT(0, uwRet);
    uwRet = osKernelRestoreLock(1);
    TEST_ASSERT_EQUAL_INT(1, uwRet);
    uwRet = osKernelUnlock();
    TEST_ASSERT_EQUAL_INT(1, uwRet);
};

RUN_TEST_SUITE(CmsisTaskFuncTestSuite);
