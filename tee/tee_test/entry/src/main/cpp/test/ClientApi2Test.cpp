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

static TEEC_Context g_client1_context = {0};
static TEEC_Session g_client1_session = {0};
static TEEC_SharedMemory g_client1_SharedMem = {0};

static napi_value InitContext(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_InitializeContext(nullptr, &g_client1_context);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value FinalizeContext(napi_env env, napi_callback_info info)
{
    TEEC_FinalizeContext(&g_client1_context);
    return nullptr;
}

static napi_value CloseSession(napi_env env, napi_callback_info info)
{
    TEEC_CloseSession(&g_client1_session);
    return nullptr;
}

static napi_value ReleaseSharedMemory(napi_env env, napi_callback_info info)
{
    TEEC_ReleaseSharedMemory(&g_client1_SharedMem);
    return nullptr;
}

static napi_value Opensession_WithoutContext(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_Session session;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);

    ret = TEEC_OpenSession(NULL, &session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Opensession_WithoutSession(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    ret = TEEC_OpenSession(&g_client1_context, NULL, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);

    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Opensession_WithoutDestination(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_Session session;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    ret = TEEC_OpenSession(&g_client1_context, &session, NULL, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);

    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Opensession_WithoutConnectionMethod(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_Session session;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, -1, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);

    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Opensession_WithNotSupportConnectionMethod(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_Session session;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    uint32_t origin;
    char testData[TEST_STR_LEN] = "Hello";
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);

    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, TEEC_LOGIN_PUBLIC, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);

    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, TEEC_LOGIN_USER, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_set_element(env, array, 2, result);
    napi_set_element(env, array, 3, result2);

    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, TEEC_LOGIN_GROUP, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_set_element(env, array, 4, result);
    napi_set_element(env, array, 5, result2);

    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, TEEC_LOGIN_GROUP, reinterpret_cast<void *>(testData),
                           &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_set_element(env, array, 6, result);
    napi_set_element(env, array, 7, result2);

    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, TEEC_LOGIN_APPLICATION, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_set_element(env, array, 8, result);
    napi_set_element(env, array, 9, result2);

    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, TEEC_LOGIN_USER_APPLICATION, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_set_element(env, array, 10, result);
    napi_set_element(env, array, 11, result2);

    ret =
        TEEC_OpenSession(&g_client1_context, &session, &uuid, TEEC_LOGIN_GROUP_APPLICATION, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_set_element(env, array, 12, result);
    napi_set_element(env, array, 13, result2);

    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, TEEC_LOGIN_GROUP_APPLICATION,
                           reinterpret_cast<void *>(testData), &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_set_element(env, array, 14, result);
    napi_set_element(env, array, 15, result2);

    return array;
}

static napi_value Opensession_ContextIsNotInit(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_Session session = {0};
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    TEEC_Context context = {0};
    ret = TEEC_InitializeContext(nullptr, &context);
    napi_create_uint32(env, ret, &result3);
    TEEC_FinalizeContext(&context);

    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, -1, NULL, &operation, &origin);
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

static napi_value Opensession_ParamValueIsInvalid(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_Session session = {0};
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    uint32_t origin;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_PARTIAL_INOUT, TEEC_VALUE_INPUT, TEEC_NONE, TEEC_NONE);
    operation.params[0].value.a = 0;
    operation.params[0].value.b = 0;
    operation.params[1].value.a = 0xFFFFFFFF;
    operation.params[1].value.b = 1;
    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);

    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Opensession_WithoutOperation(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_UUID uuid2 = CLIENTAPI_UUID_2;
    g_client1_context.ta_path = (uint8_t *)TA_PATH;
    ret = TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, NULL, &origin);
    if (ret != TEEC_SUCCESS) {
        g_client1_context.ta_path = (uint8_t *)TA_PATH2;
        ret =
            TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid2, TEEC_LOGIN_IDENTIFY, NULL, NULL, &origin);
    }

    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Opensession_WithoutOrigin(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_UUID uuid2 = CLIENTAPI_UUID_2;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    g_client1_context.ta_path = (uint8_t *)TA_PATH;
    ret = TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, NULL);
    if (ret != TEEC_SUCCESS) {
        g_client1_context.ta_path = (uint8_t *)TA_PATH2;
        ret = TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid2, TEEC_LOGIN_IDENTIFY, NULL, &operation,
                               NULL);
    }
    napi_create_uint32(env, ret, &result);

    return result;
}

static napi_value Opensession_WithOperationIsNone(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_UUID uuid2 = CLIENTAPI_UUID_2;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    g_client1_context.ta_path = (uint8_t *)TA_PATH;
    ret =
        TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    if (ret != TEEC_SUCCESS) {
        g_client1_context.ta_path = (uint8_t *)TA_PATH2;
        ret = TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid2, TEEC_LOGIN_IDENTIFY, NULL, &operation,
                               &origin);
    }
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Opensession_WithOperationIsValue(napi_env env, napi_callback_info info)
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
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_UUID uuid2 = CLIENTAPI_UUID_2;
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
    g_client1_context.ta_path = (uint8_t *)TA_PATH;

    ret =
        TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    if (ret != TEEC_SUCCESS) {
        g_client1_context.ta_path = (uint8_t *)TA_PATH2;
        ret = TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid2, TEEC_LOGIN_IDENTIFY, NULL, &operation,
                               &origin);
    }
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

static napi_value Opensession_WithOperationIsTempMem(napi_env env, napi_callback_info info)
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

    char testData0[TEST_STR_LEN] = "Hello";
    char testData1[TEST_STR_LEN] = "abcdefgh";
    char testData2[TEST_STR_LEN] = "qwertyuiop";
    char testData3[TEST_STR_LEN] = "this is test string";
    uint32_t len0 = strlen(testData0);
    uint32_t len1 = strlen(testData1);
    uint32_t len2 = strlen(testData2);
    uint32_t len3 = strlen(testData3);
    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_UUID uuid2 = CLIENTAPI_UUID_2;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_TEMP_INPUT, TEEC_MEMREF_TEMP_OUTPUT, TEEC_MEMREF_TEMP_INOUT,
                                            TEEC_MEMREF_TEMP_INOUT);
    operation.params[0].tmpref.buffer = testData0;
    operation.params[0].tmpref.size = len0;
    operation.params[1].tmpref.buffer = testData1;
    operation.params[1].tmpref.size = len1;
    operation.params[2].tmpref.buffer = testData2;
    operation.params[2].tmpref.size = len2;
    operation.params[3].tmpref.buffer = testData3;
    operation.params[3].tmpref.size = len3;
    g_client1_context.ta_path = (uint8_t *)TA_PATH;
    ret =
        TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    if (ret != TEEC_SUCCESS) {
        g_client1_context.ta_path = (uint8_t *)TA_PATH2;
        ret = TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid2, TEEC_LOGIN_IDENTIFY, NULL, &operation,
                               &origin);
    }
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    napi_create_uint32(env, operation.params[0].tmpref.size, &result3);
    napi_create_uint32(env, operation.params[1].tmpref.size, &result4);
    napi_create_uint32(env, operation.params[2].tmpref.size, &result5);
    napi_create_uint32(env, operation.params[3].tmpref.size, &result6);
    for (uint32_t i = 0; i < len1; i++) {
        if (reinterpret_cast<char *>(operation.params[1].tmpref.buffer)[i] != 0) {
            napi_create_uint32(env, TEEC_ERROR_GENERIC, &result7);
        }
    }
    napi_create_uint32(env, TEEC_SUCCESS, &result7);
    napi_create_string_utf8(env, reinterpret_cast<char *>(operation.params[0].tmpref.buffer), len0, &result8);
    napi_create_string_utf8(env, reinterpret_cast<char *>(operation.params[2].tmpref.buffer), len2, &result9);
    napi_create_string_utf8(env, reinterpret_cast<char *>(operation.params[3].tmpref.buffer), len3, &result10);

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

static napi_value Opensession_WithNotExistUUID(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_Session session;
    uint32_t origin;
    TEEC_UUID uuid = UUID_TA_NOT_EXIST;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    g_client1_context.ta_path = NULL;

    ret = TEEC_OpenSession(&g_client1_context, &session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Opensession_ReturnErrorFromTA(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_UUID uuid2 = CLIENTAPI_UUID_2;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_VALUE_INPUT, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    operation.params[0].value.b = 0xFFFFFFFE; // this number intend for trigger ta return error when opensession
    g_client1_context.ta_path = (uint8_t *)TA_PATH;
    ret =
        TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    if ((ret != TEEC_SUCCESS) && (origin == TEEC_ORIGIN_TEE)) {
        g_client1_context.ta_path = (uint8_t *)TA_PATH2;
        ret = TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid2, TEEC_LOGIN_IDENTIFY, NULL, &operation,
                               &origin);
    }
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Opensession_WithParamTypesIsInvalid(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(0x1F, TEEC_NONE, TEEC_NONE, TEEC_NONE); // 0X1F is invalid
    g_client1_context.ta_path = nullptr;

    ret =
        TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    napi_create_uint32(env, ret, &result);
    napi_create_uint32(env, origin, &result2);
    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value RequestCancellationTest(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_UUID uuid2 = CLIENTAPI_UUID_2;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    g_client1_context.ta_path = (uint8_t *)TA_PATH;
    ret =
        TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    if (ret != TEEC_SUCCESS) {
        g_client1_context.ta_path = (uint8_t *)TA_PATH2;
        ret = TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid2, TEEC_LOGIN_IDENTIFY, NULL, &operation,
                               &origin);
    }
    ret = TEEC_InvokeCommand(&g_client1_session, 0, &operation, NULL);
    TEEC_RequestCancellation(&operation);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value Closesession_WithCreatedSession(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_UUID uuid2 = CLIENTAPI_UUID_2;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    g_client1_context.ta_path = (uint8_t *)TA_PATH;

    ret =
        TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    if (ret != TEEC_SUCCESS) {
        g_client1_context.ta_path = (uint8_t *)TA_PATH2;
        ret = TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid2, TEEC_LOGIN_IDENTIFY, NULL, &operation,
                               &origin);
    }

    TEEC_CloseSession(&g_client1_session);
    napi_create_uint32(env, g_client1_session.session_id, &result);
    if (g_client1_session.context != nullptr)
        napi_create_uint32(env, TEEC_ERROR_GENERIC, &result2);
    else
        napi_create_uint32(env, TEEC_SUCCESS, &result2);

    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Closesession_WithoutSession(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t origin;
    TEEC_UUID uuid = CLIENTAPI_UUID_1;
    TEEC_UUID uuid2 = CLIENTAPI_UUID_2;
    TEEC_Operation operation = {0};
    operation.started = 1;
    operation.paramTypes = TEEC_PARAM_TYPES(TEEC_NONE, TEEC_NONE, TEEC_NONE, TEEC_NONE);
    g_client1_context.ta_path = (uint8_t *)TA_PATH;

    ret =
        TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid, TEEC_LOGIN_IDENTIFY, NULL, &operation, &origin);
    if (ret != TEEC_SUCCESS) {
        g_client1_context.ta_path = (uint8_t *)TA_PATH2;
        ret = TEEC_OpenSession(&g_client1_context, &g_client1_session, &uuid2, TEEC_LOGIN_IDENTIFY, NULL, &operation,
                               &origin);
    }

    TEEC_CloseSession(NULL);
    if (g_client1_session.session_id != 0)
        napi_create_int32(env, TEEC_SUCCESS, &result);
    else
        napi_create_int32(env, TEEC_ERROR_GENERIC, &result);
    if (g_client1_session.ops_cnt != 0)
        napi_create_int32(env, TEEC_SUCCESS, &result2);
    else
        napi_create_int32(env, TEEC_ERROR_GENERIC, &result2);
    if (g_client1_session.context == nullptr)
        napi_create_uint32(env, TEEC_ERROR_GENERIC, &result3);
    else
        napi_create_uint32(env, TEEC_SUCCESS, &result3);
    napi_create_uint32(env, TEEC_SUCCESS, &result3);

    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    napi_set_element(env, array, 2, result3);
    return array;
}

static napi_value Closesession_WithNotOpenedSession(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    TEEC_CloseSession(&g_client1_session);
    napi_create_int32(env, g_client1_session.session_id, &result);
    napi_create_int32(env, g_client1_session.ops_cnt, &result2);
    if (g_client1_session.context != nullptr)
        napi_create_uint32(env, TEEC_ERROR_GENERIC, &result3);
    else
        napi_create_uint32(env, TEEC_SUCCESS, &result3);
    //  创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    napi_set_element(env, array, 2, result3);
    return array;
}

static napi_value AllocateSharedMemory_WithAllocatedMem(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = TEEC_MEM_INOUT;
    ret = TEEC_AllocateSharedMemory(&g_client1_context, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value AllocateSharedMemory_WithoutContext(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = TEEC_MEM_INOUT;
    ret = TEEC_AllocateSharedMemory(NULL, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value AllocateSharedMemory_WithNotInitContext(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = TEEC_MEM_INOUT;
    TEEC_Context context = {0};
    ret = TEEC_InitializeContext(NULL, &context);
    TEEC_FinalizeContext(&context);
    ret = TEEC_AllocateSharedMemory(&context, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value AllocateSharedMemory_WithoutSharedMem(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    ret = TEEC_AllocateSharedMemory(&g_client1_context, NULL);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value AllocateSharedMemory_WithSharedMemHasReleased(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = TEEC_MEM_INOUT;
    ret = TEEC_AllocateSharedMemory(&g_client1_context, &g_client1_SharedMem);
    TEEC_ReleaseSharedMemory(&g_client1_SharedMem);
    ret = TEEC_AllocateSharedMemory(&g_client1_context, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value AllocateSharedMemory_WithSharedMemFlagIsZero(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = 0;
    ret = TEEC_AllocateSharedMemory(&g_client1_context, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value AllocateSharedMemory_WithSharedMemFlagIsInvalid(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = TEEC_MEM_INVALID;
    ret = TEEC_AllocateSharedMemory(&g_client1_context, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

#define MAILBOXPOOL_MAX_SIZE 0x400000
static napi_value AllocateSharedMemory_WithSizeExceed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    g_client1_SharedMem.size = MAILBOXPOOL_MAX_SIZE + 1; // 4M + 1
    g_client1_SharedMem.flags = TEEC_MEM_INOUT;

    ret = TEEC_AllocateSharedMemory(&g_client1_context, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

#define SHAREMEM_LIMIT_MAX 64
static napi_value AllocateSharedMemory_ReachSharememNumLimit(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    uint32_t i;
    TEEC_SharedMemory SharedMem[SHAREMEM_LIMIT_MAX + 1] = {{0}};
    for (i = 0; i < (SHAREMEM_LIMIT_MAX + 1); i++) {
        SharedMem[i].size = TEST_STR_LEN;
        SharedMem[i].flags = TEEC_MEM_INOUT;
    }

    //  创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_create_uint32(env, TEEC_FAIL, &result);
    napi_create_uint32(env, TEEC_SUCCESS, &result2);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    for (i = 0; i < SHAREMEM_LIMIT_MAX; i++) {
        ret = TEEC_AllocateSharedMemory(&g_client1_context, &SharedMem[i]);
        if (ret != TEEC_SUCCESS) {
            napi_create_uint32(env, ret, &result);
            napi_set_element(env, array, 0, result);
            for (i = 0; i < (SHAREMEM_LIMIT_MAX + 1); i++)
                TEEC_ReleaseSharedMemory(&SharedMem[i]);
            return array;
        } else {
            napi_create_uint32(env, ret, &result);
        }
    }

    // alloc 65 times should fail
    ret = TEEC_AllocateSharedMemory(&g_client1_context, &SharedMem[SHAREMEM_LIMIT_MAX]);
    for (i = 0; i < (SHAREMEM_LIMIT_MAX + 1); i++)
        TEEC_ReleaseSharedMemory(&SharedMem[i]);

    napi_create_uint32(env, ret, &result2);

    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value RegisterSharedMemory_WithRegisterMem(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    char testData0[TEST_STR_LEN] = {0};
    g_client1_SharedMem.buffer = testData0;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = TEEC_MEM_INOUT;
    ret = TEEC_RegisterSharedMemory(&g_client1_context, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value RegisterSharedMemory_WithoutContext(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    char testData0[TEST_STR_LEN] = {0};
    g_client1_SharedMem.buffer = testData0;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = TEEC_MEM_INOUT;
    ret = TEEC_RegisterSharedMemory(NULL, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value RegisterSharedMemory_WithoutSharedMem(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    char testData0[TEST_STR_LEN] = {0};
    g_client1_SharedMem.buffer = testData0;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = TEEC_MEM_INOUT;
    ret = TEEC_RegisterSharedMemory(&g_client1_context, NULL);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value RegisterSharedMemory_WithSharedMemFlagIsZero(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    char testData0[TEST_STR_LEN] = {0};
    g_client1_SharedMem.buffer = testData0;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = 0;
    ret = TEEC_RegisterSharedMemory(&g_client1_context, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value RegisterSharedMemory_WithSharedMemFlagIsInvalid(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    char testData0[TEST_STR_LEN] = {0};
    g_client1_SharedMem.buffer = testData0;
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = TEEC_MEM_INVALID;
    ret = TEEC_RegisterSharedMemory(&g_client1_context, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value RegisterSharedMemory_WithSharedMemBufferIsNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;
    char testData0[TEST_STR_LEN] = {0};
    g_client1_SharedMem.size = TEST_STR_LEN;
    g_client1_SharedMem.flags = TEEC_MEM_INOUT;
    ret = TEEC_RegisterSharedMemory(&g_client1_context, &g_client1_SharedMem);
    napi_create_uint32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"InitContext", nullptr, InitContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FinalizeContext", nullptr, FinalizeContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CloseSession", nullptr, CloseSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ReleaseSharedMemory", nullptr, ReleaseSharedMemory, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"Opensession_WithoutContext", nullptr, Opensession_WithoutContext, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Opensession_WithoutSession", nullptr, Opensession_WithoutSession, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Opensession_WithoutDestination", nullptr, Opensession_WithoutDestination, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Opensession_WithoutConnectionMethod", nullptr, Opensession_WithoutConnectionMethod, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Opensession_WithNotSupportConnectionMethod", nullptr, Opensession_WithNotSupportConnectionMethod, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Opensession_WithoutOperation", nullptr, Opensession_WithoutOperation, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Opensession_WithoutOrigin", nullptr, Opensession_WithoutOrigin, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Opensession_ContextIsNotInit", nullptr, Opensession_ContextIsNotInit, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Opensession_ParamValueIsInvalid", nullptr, Opensession_ParamValueIsInvalid, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Opensession_WithOperationIsNone", nullptr, Opensession_WithOperationIsNone, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Opensession_WithOperationIsValue", nullptr, Opensession_WithOperationIsValue, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Opensession_WithOperationIsTempMem", nullptr, Opensession_WithOperationIsTempMem, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Opensession_WithNotExistUUID", nullptr, Opensession_WithNotExistUUID, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Opensession_ReturnErrorFromTA", nullptr, Opensession_ReturnErrorFromTA, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Opensession_WithParamTypesIsInvalid", nullptr, Opensession_WithParamTypesIsInvalid, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RequestCancellationTest", nullptr, RequestCancellationTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closesession_WithCreatedSession", nullptr, Closesession_WithCreatedSession, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Closesession_WithoutSession", nullptr, Closesession_WithoutSession, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Closesession_WithNotOpenedSession", nullptr, Closesession_WithNotOpenedSession, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AllocateSharedMemory_WithAllocatedMem", nullptr, AllocateSharedMemory_WithAllocatedMem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AllocateSharedMemory_WithoutContext", nullptr, AllocateSharedMemory_WithoutContext, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AllocateSharedMemory_WithoutSharedMem", nullptr, AllocateSharedMemory_WithoutSharedMem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AllocateSharedMemory_WithSharedMemHasReleased", nullptr, AllocateSharedMemory_WithSharedMemHasReleased,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AllocateSharedMemory_WithSharedMemFlagIsZero", nullptr, AllocateSharedMemory_WithSharedMemFlagIsZero, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"AllocateSharedMemory_WithSharedMemFlagIsInvalid", nullptr, AllocateSharedMemory_WithSharedMemFlagIsInvalid,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AllocateSharedMemory_WithSizeExceed", nullptr, AllocateSharedMemory_WithSizeExceed, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AllocateSharedMemory_ReachSharememNumLimit", nullptr, AllocateSharedMemory_ReachSharememNumLimit, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"RegisterSharedMemory_WithRegisterMem", nullptr, RegisterSharedMemory_WithRegisterMem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"RegisterSharedMemory_WithoutContext", nullptr, RegisterSharedMemory_WithoutContext, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RegisterSharedMemory_WithoutSharedMem", nullptr, RegisterSharedMemory_WithoutSharedMem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"RegisterSharedMemory_WithSharedMemFlagIsZero", nullptr, RegisterSharedMemory_WithSharedMemFlagIsZero, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"RegisterSharedMemory_WithSharedMemFlagIsInvalid", nullptr, RegisterSharedMemory_WithSharedMemFlagIsInvalid,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegisterSharedMemory_WithSharedMemBufferIsNull", nullptr, RegisterSharedMemory_WithSharedMemBufferIsNull,
         nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "client_api_test2",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
