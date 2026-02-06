/*
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
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

#include <securec.h>
#include "hctest.h"

#include "dbm_errno.h"
#include "dbm_kv_store.h"
#include "dbm_config.h"

#define MAX_KEY_LEN_TEST      32
#define MAX_VALUE_LEN_TEST    512
#define MAX_KEY_NUM_TEST      45
#define INVALID_KEY_NUM       55

#define STORE_FULL_PATH ""
static KVStoreHandle g_KVStoreHandle = NULL;

LITE_TEST_SUIT(utils, kvStore, DBMKvStoreFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL DBMKvStoreFuncTestSuiteSetUp(void)
{
    printf("+-begin----------------------------------------+\n");
    int status = DBM_GetKVStore(STORE_FULL_PATH, &g_KVStoreHandle);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    status = DBM_CloseKVStore(g_KVStoreHandle);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    status = DBM_DeleteKVStore(STORE_FULL_PATH);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    int tickCount1 = osKernelGetTickCount();
    status = DBM_GetKVStore(STORE_FULL_PATH, &g_KVStoreHandle);
    int tickCount2 = osKernelGetTickCount();
    printf("GetKVStore: begin[%d] finish[%d] use[%d]\n", tickCount1, tickCount2, tickCount2 - tickCount1);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL DBMKvStoreFuncTestSuiteTearDown(void)
{
    printf("+-finish--------------------------------------+\n");

    int tickCount1 = osKernelGetTickCount();
    int status = DBM_CloseKVStore(g_KVStoreHandle);
    int tickCount2 = osKernelGetTickCount();
    printf("CloseKVStore: begin[%d] finish[%d] use[%d]\n", tickCount1, tickCount2, tickCount2 - tickCount1);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    tickCount1 = osKernelGetTickCount();
    status = DBM_DeleteKVStore(STORE_FULL_PATH);
    tickCount2 = osKernelGetTickCount();
    printf("DeleteKVStore: begin[%d] finish[%d] use[%d]\n", tickCount1, tickCount2, tickCount2 - tickCount1);

    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
    return TRUE;
}

/* Create files in batches. */
static BOOL PutKVs(int num, const char* key, const char* content)
{
    int size;
    int status;
    char keytemp[MAX_KEY_LEN_TEST] = {0};
    struct {
        int num;
        char content[200];
    } value, value1;

    if (num <= 0) {
        return FALSE;
    }
    for (int i = 1; i <= num; i++) {
        size = sprintf_s(keytemp, MAX_KEY_LEN_TEST, "%s_%d", key, i);
        if (size < 0) {
            return FALSE;
        }

        memset_s(&value, sizeof(value), 0, sizeof(value));
        value.num = i;

        int ret = strcpy_s(value.content, sizeof(value.content), content);
        TEST_ASSERT_EQUAL_INT(0, ret);

        status = DBM_Put(g_KVStoreHandle, keytemp, (void*)&value, sizeof(value));
        if (i <= MAX_KEY_NUM_TEST) {
            TEST_ASSERT_EQUAL_INT(DBM_OK, status);
        } else {
            TEST_ASSERT_EQUAL_INT(DBM_OVER_MAX_LIMITS, status);
        }

        memset_s(&value1, sizeof(value1), 0, sizeof(value1));
        unsigned int realValLen = 0;
        status = DBM_Get(g_KVStoreHandle, keytemp, &value1, sizeof(value1), &realValLen);
        if (i <= MAX_KEY_NUM_TEST) {
            TEST_ASSERT_EQUAL_INT(DBM_OK, status);
            TEST_ASSERT_EQUAL_INT(sizeof(value1), realValLen);
            TEST_ASSERT_EQUAL_INT(value1.num, value.num);
            TEST_ASSERT_EQUAL_STRING(value1.content, value.content);
            TEST_ASSERT_EQUAL_MEMORY(&value1, &value, sizeof(value));
        } else {
            TEST_ASSERT_EQUAL_INT(DBM_NOT_FOUND, status);
        }

        memset_s(keytemp, MAX_KEY_LEN_TEST, 0, MAX_KEY_LEN_TEST);
        IoTWatchDogKick();
    }
    IoTWatchDogKick();
    return TRUE;
}

/* Read files in batches. */
static BOOL GetKVs(int num, const char* key, const char* content)
{
    int size;
    int status;
    char keytemp[MAX_KEY_LEN_TEST] = {0};
    struct {
        int num;
        char content[200];
    } value, value1;

    if (num <= 0) {
        return FALSE;
    }
    for (int loop = num; loop > 0; loop--) {
        size = sprintf_s(keytemp, MAX_KEY_LEN_TEST, "%s_%d", key, loop);
        if (size < 0) {
            return FALSE;
        }

        memset_s(&value, sizeof(value), 0, sizeof(value));
        value.num = loop;

        int ret = strcpy_s(value.content, sizeof(value.content), content);
        TEST_ASSERT_EQUAL_INT(0, ret);

        memset_s(&value1, sizeof(value1), 0, sizeof(value1));
        unsigned int realValLen = 0;
        status = DBM_Get(g_KVStoreHandle, keytemp, &value1, sizeof(value1), &realValLen);
        if (loop <= MAX_KEY_NUM_TEST) {
            TEST_ASSERT_EQUAL_INT(DBM_OK, status);
            TEST_ASSERT_EQUAL_INT(sizeof(value1), realValLen);
            TEST_ASSERT_EQUAL_INT(value1.num, value.num);
            TEST_ASSERT_EQUAL_STRING(value1.content, value.content);
            TEST_ASSERT_EQUAL_MEMORY(&value1, &value, sizeof(value));
        } else {
            TEST_ASSERT_EQUAL_INT(DBM_NOT_FOUND, status);
        }

        memset_s(keytemp, MAX_KEY_LEN_TEST, 0, MAX_KEY_LEN_TEST);
        IoTWatchDogKick();
    }
    IoTWatchDogKick();
    return TRUE;
}

/* Delete files in batches. */
static BOOL DeleteKVs(int num, const char* key)
{
    int size;
    int status;
    char keytemp[MAX_KEY_LEN_TEST] = {0};

    if (num <= 0) {
        return FALSE;
    }
    for (int i = 1; i <= num; i++) {
        size = sprintf_s(keytemp, MAX_KEY_LEN_TEST, "%s_%d", key, i);
        if (size < 0) {
            return FALSE;
        }

        status = DBM_Delete(g_KVStoreHandle, keytemp);
        TEST_ASSERT_EQUAL_INT(DBM_OK, status); // same as > L2, if key not existed, still return OK

        memset_s(keytemp, MAX_KEY_LEN_TEST, 0, MAX_KEY_LEN_TEST);
        IoTWatchDogKick();
    }
    IoTWatchDogKick();
    return TRUE;
}

/**
 * @tc.name   testKvStoreSetValue001
 * @tc.number SUB_UTILS_KV_STORE_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue001, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    int tickCount1 = osKernelGetTickCount();
    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    int tickCount2 = osKernelGetTickCount();
    printf("Insert One: begin[%d] finish[%d] use[%d]\n", tickCount1, tickCount2, tickCount2 - tickCount1);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);


    tickCount1 = osKernelGetTickCount();
    status = DBM_Delete(g_KVStoreHandle, key);
    tickCount2 = osKernelGetTickCount();
    printf("Delete One: begin[%d] finish[%d] use[%d]\n", tickCount1, tickCount2, tickCount2 - tickCount1);

    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreSetValue002
 * @tc.number SUB_UTILS_KV_STORE_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue002, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version_100";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreSetValue003
 * @tc.number SUB_UTILS_KV_STORE_0300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue003, Function | MediumTest | Level1)
{
    int status;
    char key[] = "100";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreSetValue004
 * @tc.number SUB_UTILS_KV_STORE_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue004, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version.utilskvparameter";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreSetValue005
 * @tc.number SUB_UTILS_KV_STORE_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue005, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version.utilskvparameter1";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreSetValue006
 * @tc.number SUB_UTILS_KV_STORE_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue006, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version.utilskvparameterforillegal";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreSetValue007
 * @tc.number SUB_UTILS_KV_STORE_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue007, Function | MediumTest | Level1)
{
    int status;
    char key[] = "Rw.sys.version";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreSetValue008
 * @tc.number SUB_UTILS_KV_STORE_0800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue008, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version-r3";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreSetValue009
 * @tc.number SUB_UTILS_KV_STORE_0900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue009, Function | MediumTest | Level1)
{
    int status;
    char key[] = "re+r3";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreSetValue010
 * @tc.number SUB_UTILS_KV_STORE_1000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue010, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version*r3";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreSetValue011
 * @tc.number SUB_UTILS_KV_STORE_1100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue011, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version";
    struct {
        int num;
        char content[507];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreSetValue012
 * @tc.number SUB_UTILS_KV_STORE_1200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue012, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version";
    struct {
        int num;
        char content[509];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreSetValue013
 * @tc.number SUB_UTILS_KV_STORE_1300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue013, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version";
    struct {
        int num;
        char content[512];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreSetValue014
 * @tc.number SUB_UTILS_KV_STORE_1400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue014, Function | MediumTest | Level1)
{
    int status;
    char key[] = "Rw.sys.version";
    struct {
        int num;
        char content[512];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreSetValue015
 * @tc.number SUB_UTILS_KV_STORE_1500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue015, Function | MediumTest | Level1)
{
    int status;
    char key[] = "_._..__...___";
    struct {
        int num;
        char content[508];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "！@#￥%……&*（）——+~《》？，。、“‘；：、12345767890");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreSetValue016
 * @tc.number SUB_UTILS_KV_STORE_1600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue016, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version space test";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "Hello world !");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreSetValue017
 * @tc.number SUB_UTILS_KV_STORE_1700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreSetValue017, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "                                                   ");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreGetValue001
 * @tc.number SUB_UTILS_KV_STORE_1800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreGetValue001, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version";
    struct {
        int num;
        char content[200];
    } value, value1;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "It is never too old to learn");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    memset_s(&value1, sizeof(value1), 0, sizeof(value1));
    unsigned int realValLen = 0;
    status = DBM_Get(g_KVStoreHandle, key, &value1, sizeof(value1), &realValLen);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
    TEST_ASSERT_EQUAL_INT(sizeof(value1), realValLen);
    TEST_ASSERT_EQUAL_INT(value1.num, value.num);
    TEST_ASSERT_EQUAL_STRING(value1.content, value.content);
    TEST_ASSERT_EQUAL_MEMORY(&value1, &value, sizeof(value));

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreGetValue002
 * @tc.number SUB_UTILS_KV_STORE_1900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreGetValue002, Function | MediumTest | Level1)
{
    int status;
    char key[] = "100";
    struct {
        int num;
        char content[200];
    } value, value1;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "！@#￥%……&*（）——+~《》？，。、“‘；：、12345767890");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    memset_s(&value1, sizeof(value1), 0, sizeof(value1));
    unsigned int realValLen = 0;
    status = DBM_Get(g_KVStoreHandle, key, &value1, sizeof(value1), &realValLen);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
    TEST_ASSERT_EQUAL_INT(sizeof(value1), realValLen);
    TEST_ASSERT_EQUAL_INT(value1.num, value.num);
    TEST_ASSERT_EQUAL_STRING(value1.content, value.content);
    TEST_ASSERT_EQUAL_MEMORY(&value1, &value, sizeof(value));

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreGetValue003
 * @tc.number SUB_UTILS_KV_STORE_2000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreGetValue003, Function | MediumTest | Level1)
{
    int status;
    char key[] = "rw.sys.version.utils";
    struct {
        int num;
        char content[200];
    } value, value1, value2;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "It is never too old to learn");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    // Update the value of key
    memset_s(&value1, sizeof(value1), 0, sizeof(value1));
    value1.num = 1;
    strcpy_s(value1.content, sizeof(value1.content), "Two tigers Two tigers two tiger running so fast");

    int tickCount1 = osKernelGetTickCount();
    status = DBM_Put(g_KVStoreHandle, key, (void*)&value1, sizeof(value1));
    int tickCount2 = osKernelGetTickCount();
    printf("Update One: begin[%d] finish[%d] use[%d]\n", tickCount1, tickCount2, tickCount2 - tickCount1);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    memset_s(&value2, sizeof(value2), 0, sizeof(value2));
    unsigned int realValLen = 0;
    status = DBM_Get(g_KVStoreHandle, key, &value2, sizeof(value2), &realValLen);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
    TEST_ASSERT_EQUAL_INT(sizeof(value2), realValLen);
    TEST_ASSERT_EQUAL_INT(value2.num, value1.num);
    TEST_ASSERT_EQUAL_STRING(value2.content, value1.content);
    TEST_ASSERT_EQUAL_MEMORY(&value2, &value1, sizeof(value1));

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreGetValue004
 * @tc.number SUB_UTILS_KV_STORE_2100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreGetValue004, Function | MediumTest | Level1)
{
    int status;
    char key[] = "Rw.sys.version";
    struct {
        int num;
        char content[200];
    } value;
    memset_s(&value, sizeof(value), 0, sizeof(value));

    unsigned int realValLen = 0;
    status = DBM_Get(g_KVStoreHandle, key, &value, sizeof(value), &realValLen);
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreGetValue005
 * @tc.number SUB_UTILS_KV_STORE_2200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreGetValue005, Function | MediumTest | Level1)
{
    int status;
    char key[] = "_._..__...___";
    struct {
        int num;
        char content[200];
    } value, value1;
    memset_s(&value, sizeof(value), 0, sizeof(value));
    value.num = 1;
    strcpy_s(value.content, sizeof(value.content), "                                                 ");

    status = DBM_Put(g_KVStoreHandle, key, (void*)&value, sizeof(value));
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);

    memset_s(&value1, sizeof(value1), 0, sizeof(value1));
    unsigned int realValLen = 0;
    status = DBM_Get(g_KVStoreHandle, key, &value1, sizeof(value1), &realValLen);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
    TEST_ASSERT_EQUAL_INT(sizeof(value1), realValLen);
    TEST_ASSERT_EQUAL_INT(value1.num, value.num);
    TEST_ASSERT_EQUAL_STRING(value1.content, value.content);
    TEST_ASSERT_EQUAL_MEMORY(&value1, &value, sizeof(value));

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_OK, status);
};

/**
 * @tc.name   testKvStoreDeleteValue
 * @tc.number SUB_UTILS_KV_STORE_2300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreDeleteValue, Function | MediumTest | Level1)
{
    int status;
    char key[] = "Rw.sys.version";

    status = DBM_Delete(g_KVStoreHandle, key);
    TEST_ASSERT_EQUAL_INT(DBM_INVALID_ARGS, status);
};

/**
 * @tc.name   testKvStoreMaxSize001
 * @tc.number SUB_UTILS_KV_STORE_2900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreMaxSize001, Function | MediumTest | Level1)
{
    char key[] = "rw.sys.version";
    char value[] = "It is never too old to learn";
    BOOL ret = FALSE;

    ret = PutKVs(MAX_KEY_NUM_TEST-1, key, value);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }

    ret = GetKVs(MAX_KEY_NUM_TEST-1, key, value);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
    ret = DeleteKVs(MAX_KEY_NUM_TEST-1, key);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
};

/**
 * @tc.name   testKvStoreMaxSize002
 * @tc.number SUB_UTILS_KV_STORE_3000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreMaxSize002, Function | MediumTest | Level1)
{
    char key[] = "rw.sys.version";
    char value[] = "It is never too old to learn";
    BOOL ret = FALSE;

    ret = PutKVs(MAX_KEY_NUM_TEST, key, value);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
    ret = GetKVs(MAX_KEY_NUM_TEST, key, value);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
    ret = DeleteKVs(MAX_KEY_NUM_TEST, key);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
};

/**
 * @tc.name   testKvStoreMaxSize003
 * @tc.number SUB_UTILS_KV_STORE_3100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreMaxSize003, Function | MediumTest | Level1)
{
    char key[] = "rw.sys.version";
    char value[] = "It is never too old to learn";
    BOOL ret = FALSE;

    ret = PutKVs(MAX_KEY_NUM_TEST+1, key, value);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
    ret = GetKVs(MAX_KEY_NUM_TEST+1, key, value);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }

    ret = DeleteKVs(MAX_KEY_NUM_TEST+1, key);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
};

/**
 * @tc.name   testKvStoreMaxSize004
 * @tc.number SUB_UTILS_KV_STORE_3200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DBMKvStoreFuncTestSuite, testKvStoreMaxSize004, Function | MediumTest | Level1)
{
    char key[] = "rw.sys.version";
    char value[] = "It is never too old to learn";
    char value1[] = "Two tigers Two tigers two tiger running so fast \
running so fast one has no ears one has no tail How strange How strange";
    BOOL ret = FALSE;

    ret = PutKVs(INVALID_KEY_NUM, key, value);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
    // Update operation
    ret = PutKVs(INVALID_KEY_NUM, key, value1);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
    ret = GetKVs(INVALID_KEY_NUM, key, value1);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
    ret = DeleteKVs(INVALID_KEY_NUM, key);
    if (ret != TRUE)
    {
        TEST_FAIL();
    }
};

RUN_TEST_SUITE(DBMKvStoreFuncTestSuite);
