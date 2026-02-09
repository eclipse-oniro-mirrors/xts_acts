/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "common_test.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include "tee/tee_client_api.h"
#include "tee_client_constants.h"
#include "test_comm_cmdid.h"

static TEEC_Context g_client2_context = {0};
static TEEC_Session g_client2_session = {0};
static TEEC_SharedMemory g_client2_SharedMem = {0};

char g_testData0[TEST_STR_LEN] = "Hello";
char g_testData1[TEST_STR_LEN] = "abcdefgh";
char g_testData2[TEST_STR_LEN] = "qwertyuiop";
char g_testData3[TEST_STR_LEN] = "this is test string";

static napi_value InitContext(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_InitializeContext(nullptr, &g_client2_context);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value OpenSession(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t origin;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_UUID uuid2 = CLIENTAPI_UUID_2;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    g_client2_context.ta_path = (uint8_t *)TA_PATH;
    TEEC_Result ret = TEEC_OpenSession(&g_client2_context, &g_client2_session,
        &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    if (ret != TEEC_SUCCESS) {
        g_client2_context.ta_path = (uint8_t *)TA_PATH2;
        ret = TEEC_OpenSession(&g_client2_context, &g_client2_session, &uuid2, 
            TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    }

    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value AllocateSharedMemory(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_client2_SharedMem.size = TEST_STR_LEN;
    g_client2_SharedMem.flags = TEEC_MEM_INOUT;
    TEEC_Result ret = TEEC_AllocateSharedMemory(&g_client2_context, &g_client2_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value FinalizeContext(napi_env env, napi_callback_info info)
{
    TEEC_FinalizeContext(&g_client2_context);
    return nullptr;
}

static napi_value CloseSession(napi_env env, napi_callback_info info)
{
    TEEC_CloseSession(&g_client2_session);
    return nullptr;
}

static napi_value ReleaseSharedMemory(napi_env env, napi_callback_info info)
{
    TEEC_ReleaseSharedMemory(&g_client2_SharedMem);
    return nullptr;
}

static napi_value InvokeCommand_WithoutOperation(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;

    ret = TEEC_InvokeCommand(&g_client2_session, 0, NULL, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value InvokeCommand_WithoutSession(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_VALUE_INOUT, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    operation.params[0].value.a = 0xaaa;
    operation.params[0].value.b = 0xbbb;

    ret = TEEC_InvokeCommand(NULL, 0, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value InvokeCommand_WithOperationIsValue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_value result4 = nullptr;
    napi_value result5 = nullptr;
    napi_value result6 = nullptr;
    napi_value result7 = nullptr;
    napi_value result8 = nullptr;
    napi_value result9 = nullptr;
    napi_value result10 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_VALUE_INPUT, TEEC_VALUE_OUTPUT, TEEC_VALUE_INOUT, TEEC_VALUE_INOUT);
    operation.params[0].value.a = 0x111;
    operation.params[0].value.b = 0x222;
    operation.params[1].value.a = 0x333;
    operation.params[1].value.b = 0x444;
    operation.params[2].value.a = 0x555;
    operation.params[2].value.b = 0x666;
    operation.params[3].value.a = 0x777;
    operation.params[3].value.b = 0x888;

    ret = TEEC_InvokeCommand(&g_client2_session, TEE_TEST_VALUE, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_create_uint32(env, operation.params[0].value.a, &result3);
    napi_create_uint32(env, operation.params[0].value.b, &result4);
    napi_create_uint32(env, operation.params[1].value.a, &result5);
    napi_create_uint32(env, operation.params[1].value.b, &result6);
    napi_create_uint32(env, operation.params[2].value.a, &result7);
    napi_create_uint32(env, operation.params[2].value.b, &result8);
    napi_create_uint32(env, operation.params[3].value.a, &result9);
    napi_create_uint32(env, operation.params[3].value.b, &result10);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    napi_set_element(env, array, 2, result3);
    napi_set_element(env, array, 3, result4);
    napi_set_element(env, array, 4, result5);
    napi_set_element(env, array, 5, result6);
    napi_set_element(env, array, 6, result7);
    napi_set_element(env, array, 7, result8);
    napi_set_element(env, array, 8, result9);
    napi_set_element(env, array, 9, result10);
    return array;
}

static napi_value InvokeCommand_WithOperationIsTempMem(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_value result4 = nullptr;
    napi_value result5 = nullptr;
    napi_value result6 = nullptr;
    napi_value result7 = nullptr;
    napi_value result8 = nullptr;
    napi_value result9 = nullptr;
    napi_value result10 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_TEMP_INPUT, TEEC_MEMREF_TEMP_OUTPUT, TEEC_MEMREF_TEMP_INOUT,
                                            TEEC_MEMREF_TEMP_INOUT);
    operation.params[0].tmpref.buffer = g_testData0;
    operation.params[0].tmpref.size = TEST_STR_LEN;
    operation.params[1].tmpref.buffer = g_testData1;
    operation.params[1].tmpref.size = TEST_STR_LEN;
    operation.params[2].tmpref.buffer = g_testData2;
    operation.params[2].tmpref.size = TEST_STR_LEN;
    operation.params[3].tmpref.buffer = g_testData3;
    operation.params[3].tmpref.size = TEST_STR_LEN;

    ret = TEEC_InvokeCommand(&g_client2_session, TEE_TEST_BUFFER, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_create_uint32(env, operation.params[0].tmpref.size, &result3);
    napi_create_uint32(env, operation.params[1].tmpref.size - 1, &result4);
    napi_create_uint32(env, operation.params[2].tmpref.size - 1, &result5);
    napi_create_uint32(env, operation.params[3].tmpref.size - 1, &result6);
    napi_create_string_utf8(env, reinterpret_cast<char *>(operation.params[0].tmpref.buffer), strlen(g_testData0),
                            &result7);
    napi_create_string_utf8(env, reinterpret_cast<char *>(operation.params[1].tmpref.buffer),
                            operation.params[1].tmpref.size - 1, &result8);
    napi_create_string_utf8(env, reinterpret_cast<char *>(operation.params[2].tmpref.buffer),
                            operation.params[2].tmpref.size - 1, &result9);
    napi_create_string_utf8(env, reinterpret_cast<char *>(operation.params[3].tmpref.buffer),
                            operation.params[3].tmpref.size - 1, &result10);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    napi_set_element(env, array, 2, result3);
    napi_set_element(env, array, 3, result4);
    napi_set_element(env, array, 4, result5);
    napi_set_element(env, array, 5, result6);
    napi_set_element(env, array, 6, result7);
    napi_set_element(env, array, 7, result8);
    napi_set_element(env, array, 8, result9);
    napi_set_element(env, array, 9, result10);
    return array;
}

static void MemSharedFreeShmem(TEEC_SharedMemory *shmems, uint32_t count)
{
    if (count == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "tee_test", "input for free count is wrong!\n");
        return;
    }

    for (uint32_t idx = 0; idx < count; idx++) {
        TEEC_ReleaseSharedMemory(shmems + idx);
    }
}

static TEEC_Result MemSharedAllocShmem(TEEC_Context *context, TEEC_SharedMemory *shmems,
    uint32_t count, uint32_t size, uint32_t flag)
{
    TEEC_Result result;
    if (count == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "tee_test", "input for free count is wrong!\n");
        return TEEC_ERROR_GENERIC;
    }

    for (uint32_t id = 0; id < count; id++) {
        shmems[id].flags = flag;
        shmems[id].size = size;
        result = TEEC_AllocateSharedMemory(context, shmems + id);
        if (result != TEEC_SUCCESS) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "tee_test", "%dth TEEC_AllocateSharedMemory size 0x%x fail,ret=0x%x\n",
                         id + 1, size, result);
            MemSharedFreeShmem(shmems, id);
            return TEEC_FAIL;
        }
        (void)memset(shmems[id].buffer, 0x0, shmems[id].size);
    }

    return TEEC_SUCCESS;
}

static napi_value InvokeCommand_WithOperationIsPartialMem(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_value result4 = nullptr;
    napi_value result5 = nullptr;
    napi_value result6 = nullptr;
    napi_value result7 = nullptr;
    napi_value result8 = nullptr;
    napi_value result9 = nullptr;
    napi_value result10 = nullptr;
    napi_value result11 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_SharedMemory sharedMem[4] = {{0}};
    // test malloc mem
    ret = MemSharedAllocShmem(&g_client2_context, sharedMem, 4, TEST_STR_LEN, TEEC_MEM_INOUT);
    napi_create_uint32(env, ret, &result11);
    memcpy(sharedMem[0].buffer, g_testData0, TEST_STR_LEN);
    memcpy(sharedMem[1].buffer, g_testData1, TEST_STR_LEN);
    memcpy(sharedMem[2].buffer, g_testData2, TEST_STR_LEN);
    memcpy(sharedMem[3].buffer, g_testData3, TEST_STR_LEN);

    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_PARTIAL_INPUT, TEEC_MEMREF_PARTIAL_OUTPUT,
                                            TEEC_MEMREF_PARTIAL_INOUT, TEEC_MEMREF_PARTIAL_INOUT);
    operation.params[0].memref.parent = &sharedMem[0];
    operation.params[0].memref.offset = 0;
    operation.params[0].memref.size = sharedMem[0].size;
    operation.params[1].memref.parent = &sharedMem[1];
    operation.params[1].memref.offset = 0;
    operation.params[1].memref.size = sharedMem[1].size;
    operation.params[2].memref.parent = &sharedMem[2];
    operation.params[2].memref.offset = 0;
    operation.params[2].memref.size = sharedMem[2].size;
    operation.params[3].memref.parent = &sharedMem[3];
    operation.params[3].memref.offset = 0;
    operation.params[3].memref.size = sharedMem[3].size;

    ret = TEEC_InvokeCommand(&g_client2_session, TEE_TEST_BUFFER, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_create_uint32(env, operation.params[0].memref.size, &result3);
    napi_create_uint32(env, operation.params[1].memref.size - 1, &result4);
    napi_create_uint32(env, operation.params[2].memref.size - 1, &result5);
    napi_create_uint32(env, operation.params[3].memref.size - 1, &result6);
    napi_create_string_utf8(env, reinterpret_cast<char *>(sharedMem[0].buffer), strlen(g_testData0), &result7);
    napi_create_string_utf8(env, reinterpret_cast<char *>(sharedMem[1].buffer), operation.params[1].memref.size - 1,
                            &result8);
    napi_create_string_utf8(env, reinterpret_cast<char *>(sharedMem[2].buffer), operation.params[2].memref.size - 1,
                            &result9);
    napi_create_string_utf8(env, reinterpret_cast<char *>(sharedMem[3].buffer), operation.params[3].memref.size - 1,
                            &result10);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    napi_set_element(env, array, 2, result3);
    napi_set_element(env, array, 3, result4);
    napi_set_element(env, array, 4, result5);
    napi_set_element(env, array, 5, result6);
    napi_set_element(env, array, 6, result7);
    napi_set_element(env, array, 7, result8);
    napi_set_element(env, array, 8, result9);
    napi_set_element(env, array, 9, result10);
    napi_set_element(env, array, 10, result11);
    return array;
}

static napi_value InvokeCommand_WithOperationIsTempMemIsNULL(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_MEMREF_TEMP_INOUT, TEEC_NONE, TEEC_NONE);
    operation.params[1].tmpref.buffer = NULL;
    operation.params[1].tmpref.size = TEST_STR_LEN;

    ret = TEEC_InvokeCommand(&g_client2_session, TEE_TEST_BUFFER, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value InvokeCommand_WithOperationNotStart(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_Operation operation = {0};

    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_MEMREF_TEMP_INOUT, TEEC_NONE, TEEC_NONE);
    operation.params[1].tmpref.buffer = g_testData0;
    operation.params[1].tmpref.size = TEST_STR_LEN;

    ret = TEEC_InvokeCommand(&g_client2_session, TEE_TEST_BUFFER, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value InvokeCommand_WithOperationTypePartialUseTemp(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_PARTIAL_INOUT, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    operation.params[0].tmpref.buffer = g_testData0;
    operation.params[0].tmpref.size = TEST_STR_LEN;

    ret = TEEC_InvokeCommand(&g_client2_session, TEE_TEST_BUFFER, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value InvokeCommand_WithOperationTypePartialSizeIsExceed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_PARTIAL_INOUT, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    operation.params[0].memref.parent = &g_client2_SharedMem;
    operation.params[0].memref.offset = 1;
    operation.params[0].memref.size = g_client2_SharedMem.size;

    ret = TEEC_InvokeCommand(&g_client2_session, TEE_TEST_BUFFER, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value InvokeCommand_WithOperationTypePartialSizeIsZero(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_PARTIAL_INOUT, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    operation.params[0].memref.parent = &g_client2_SharedMem;
    operation.params[0].memref.offset = 0;
    operation.params[0].memref.size = 0;

    ret = TEEC_InvokeCommand(&g_client2_session, TEE_TEST_BUFFER, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}
#define SIZE_1024K  (1024 * 1024)
static napi_value InvokeCommand_WithMemrefTempInoutExceed1024k(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    char *testData0 = reinterpret_cast<char *>(malloc(SIZE_1024K + 1));
    if (testData0 != NULL)
        napi_create_uint32(env, TEEC_SUCCESS, &result);
    else
        napi_create_uint32(env, TEEC_ERROR_GENERIC, &result);

    (void)memset(testData0, 0x0, SIZE_1024K + 1);

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_MEMREF_TEMP_INOUT, TEEC_NONE, TEEC_NONE);
    operation.params[1].tmpref.buffer = testData0;
    operation.params[1].tmpref.size = SIZE_1024K + 1;

    ret = TEEC_InvokeCommand(&g_client2_session, TEE_TEST_BUFFER, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    napi_set_element(env, array, 2, result3);
    return array;
}

static napi_value InvokeCommand_WithMemrefWholeExceed2048k(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_SharedMemory sharedMem = {0};
    sharedMem.size = 0x200000 + 1; // 2M + 1
    sharedMem.flags = TEEC_MEM_INOUT;
    ret = TEEC_AllocateSharedMemory(&g_client2_context, &sharedMem);
    napi_create_uint32(env, ret, &result);

    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_MEMREF_WHOLE, TEEC_NONE, TEEC_NONE);
    operation.params[1].memref.parent = &sharedMem;
    operation.params[1].memref.offset = 0;
    operation.params[1].memref.size = sharedMem.size;

    ret = TEEC_InvokeCommand(&g_client2_session, TEE_TEST_BUFFER, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    napi_set_element(env, array, 2, result3);
    return array;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"InitContext", nullptr, InitContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FinalizeContext", nullptr, FinalizeContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CloseSession", nullptr, CloseSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OpenSession", nullptr, OpenSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AllocateSharedMemory", nullptr, AllocateSharedMemory, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ReleaseSharedMemory", nullptr, ReleaseSharedMemory, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InvokeCommand_WithoutOperation", nullptr, InvokeCommand_WithoutOperation, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"InvokeCommand_WithoutSession", nullptr, InvokeCommand_WithoutSession, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"InvokeCommand_WithOperationIsValue", nullptr, InvokeCommand_WithOperationIsValue, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"InvokeCommand_WithOperationIsTempMem", nullptr, InvokeCommand_WithOperationIsTempMem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"InvokeCommand_WithOperationIsPartialMem", nullptr, InvokeCommand_WithOperationIsPartialMem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"InvokeCommand_WithOperationIsTempMemIsNULL", nullptr, InvokeCommand_WithOperationIsTempMemIsNULL, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"InvokeCommand_WithOperationNotStart", nullptr, InvokeCommand_WithOperationNotStart, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"InvokeCommand_WithOperationTypePartialUseTemp", nullptr, InvokeCommand_WithOperationTypePartialUseTemp,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InvokeCommand_WithOperationTypePartialSizeIsExceed", nullptr,
         InvokeCommand_WithOperationTypePartialSizeIsExceed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InvokeCommand_WithOperationTypePartialSizeIsZero", nullptr, InvokeCommand_WithOperationTypePartialSizeIsZero,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InvokeCommand_WithMemrefTempInoutExceed1024k", nullptr, InvokeCommand_WithMemrefTempInoutExceed1024k, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"InvokeCommand_WithMemrefWholeExceed2048k", nullptr, InvokeCommand_WithMemrefWholeExceed2048k, nullptr,
         nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 模块对外接口注册函数
    .nm_register_func = Init,
    // 自定义模块
    .nm_modname = "client_api_test3",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
