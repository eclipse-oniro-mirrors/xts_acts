/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

#ifndef _CUT_AUTHENTICATE_

#include <hctest.h>

#include "hks_api.h"
#include "hks_param.h"
#include "hks_test_api_performance.h"
#include "hks_test_common.h"
#include "hks_test_log.h"
#include "hks_type.h"
#include "hks_hash_test.h"

#include "cmsis_os2.h"
#include "ohos_types.h"

#include <unistd.h>
#define DEFAULT_SRC_DATA_SIZE 200
#define DIGEST_SHA1_HASH_SIZE 20
#define DIGEST_SHA224_HASH_SIZE 28
#define DIGEST_SHA256_HASH_SIZE 32
#define DIGEST_SHA384_HASH_SIZE 48
#define DIGEST_SHA512_HASH_SIZE 64
#define TEST_TASK_STACK_SIZE      0x2000
#define WAIT_TO_TEST_DONE         4

static osPriority_t g_setPriority;

/*
 * @tc.register: register a test suit named "CalcMultiTest"
 * @param: test subsystem name
 * @param: c_example module name
 * @param: CalcMultiTest test suit name
 */
LITE_TEST_SUIT(security, securityData, HksHashTest);

static void ExecHksInitialize(void const *argument)
{
    LiteTestPrint("HksInitialize Begin!\n");
    TEST_ASSERT_TRUE(HksInitialize() == 0);
    LiteTestPrint("HksInitialize End!\n");
    osThreadExit();
}

/**
 * @tc.setup: define a setup for test suit, format:"CalcMultiTest + SetUp"
 * @return: true——setup success
 */
static BOOL HksHashTestSetUp()
{
    LiteTestPrint("setup\n");
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
    id = osThreadNew((osThreadFunc_t)ExecHksInitialize, NULL, &attr);
    sleep(WAIT_TO_TEST_DONE);
    LiteTestPrint("HksMacTestSetUp End2!\n");
    return TRUE;
}

/**
 * @tc.teardown: define a setup for test suit, format:"CalcMultiTest + TearDown"
 * @return: true——teardown success
 */
static BOOL HksHashTestTearDown()
{
    LiteTestPrint("tearDown\n");
    return TRUE;
}

static const struct HksTestHashParams g_testHashParams[] = {
    /* normal case */
    { 0, HKS_SUCCESS,
        { true, true, HKS_DIGEST_SHA256 },
        { true, DEFAULT_SRC_DATA_SIZE, true, DEFAULT_SRC_DATA_SIZE },
        { true, DIGEST_SHA256_HASH_SIZE, true, DIGEST_SHA256_HASH_SIZE }
    },
    { 1, HKS_SUCCESS,
        { true, true, HKS_DIGEST_SHA384 },
        { true, DEFAULT_SRC_DATA_SIZE, true, DEFAULT_SRC_DATA_SIZE },
        { true, DIGEST_SHA384_HASH_SIZE, true, DIGEST_SHA384_HASH_SIZE }
    },
    { 2, HKS_SUCCESS,
        { true, true, HKS_DIGEST_SHA512 },
        { true, DEFAULT_SRC_DATA_SIZE, true, DEFAULT_SRC_DATA_SIZE },
        { true, DIGEST_SHA512_HASH_SIZE, true, DIGEST_SHA512_HASH_SIZE }
    },
};

static void ExecHksHashTestCommon(int index)
{
    struct HksParamSet *paramSet = NULL;
    struct HksBlob *srcData = NULL;
    struct HksBlob *hash = NULL;

    int32_t ret = TestConstructHashParamSet(&paramSet,
        g_testHashParams[index].paramSetParams.paramSetExist,
        g_testHashParams[index].paramSetParams.setDigest, g_testHashParams[index].paramSetParams.digest);
    TEST_ASSERT_TRUE(ret == 0);

    ret = TestConstuctBlob(&srcData,
        g_testHashParams[index].srcDataParams.blobExist,
        g_testHashParams[index].srcDataParams.blobSize,
        g_testHashParams[index].srcDataParams.blobDataExist,
        g_testHashParams[index].srcDataParams.blobDataSize);
    TEST_ASSERT_TRUE(ret == 0);

    ret = TestConstructBlobOut(&hash,
        g_testHashParams[index].hashParams.blobExist,
        g_testHashParams[index].hashParams.blobSize,
        g_testHashParams[index].hashParams.blobDataExist,
        g_testHashParams[index].hashParams.blobDataSize);
    TEST_ASSERT_TRUE(ret == 0);

    ret = HksHashRun(paramSet, srcData, hash, 1);
    if (ret != g_testHashParams[index].expectResult) {
        HKS_TEST_LOG_I("HksHashRun failed, ret[%u] = %d", g_testHashParams[index].testId, ret);
    }
    TEST_ASSERT_TRUE(ret == g_testHashParams[index].expectResult);

    HksFreeParamSet(&paramSet);
    TestFreeBlob(&srcData);
    TestFreeBlob(&hash);
    HKS_TEST_LOG_I("[%u]TestHash, Testcase_Hash_[%03u] pass!", 1, g_testHashParams[index].testId);
    TEST_ASSERT_TRUE(ret == 0);
}

static void ExecHksHashTest001(void const *argument)
{
    LiteTestPrint("HksMacTest001 Begin!\n");
    ExecHksHashTestCommon(0);
    LiteTestPrint("HksMacTest001 End!\n");
    osThreadExit();
}

static void ExecHksHashTest002(void const *argument)
{
    LiteTestPrint("HksMacTest002 Begin!\n");
    ExecHksHashTestCommon(1);
    LiteTestPrint("HksMacTest002 End!\n");
    osThreadExit();
}

static void ExecHksHashTest003(void const *argument)
{
    LiteTestPrint("HksMacTest003 Begin!\n");
    ExecHksHashTestCommon(2);
    LiteTestPrint("HksMacTest003 End!\n");
    osThreadExit();
}

/**
 * @tc.name: HksHashTest.HksHashTest001
 * @tc.desc: The static function will return true;
 * @tc.type: FUNC
 */
LITE_TEST_CASE(HksHashTest, HksHashTest001, Level1)
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
    id = osThreadNew((osThreadFunc_t)ExecHksHashTest001, NULL, &attr);
    sleep(WAIT_TO_TEST_DONE);
    LiteTestPrint("HksMacTest001 End2!\n");
}
/**
 * @tc.name: HksHashTest.HksHashTest002
 * @tc.desc: The static function will return true;
 * @tc.type: FUNC
 */
LITE_TEST_CASE(HksHashTest, HksHashTest002, Level1)
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
    id = osThreadNew((osThreadFunc_t)ExecHksHashTest002, NULL, &attr);
    sleep(WAIT_TO_TEST_DONE);
    LiteTestPrint("HksMacTest001 End2!\n");
}
/**
 * @tc.name: HksHashTest.HksHashTest003
 * @tc.desc: The static function will return true;
 * @tc.type: FUNC
 */
LITE_TEST_CASE(HksHashTest, HksHashTest003, Level1)
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
    id = osThreadNew((osThreadFunc_t)ExecHksHashTest003, NULL, &attr);
    sleep(WAIT_TO_TEST_DONE);
    LiteTestPrint("HksMacTest001 End2!\n");
}
RUN_TEST_SUITE(HksHashTest);

#endif /* _CUT_AUTHENTICATE_ */

