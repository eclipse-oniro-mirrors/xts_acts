/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include <globalnapitest/GlobalNapiTest.h>

namespace GlobalNapiTest {
static NativeResourceManager* g_mNativeResMgr;

napi_value GetResourceManager2(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    g_mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}
napi_value GetIntPluralString0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    uint32_t resId = 0;
    uint32_t num = 2;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetIntPluralString(g_mNativeResMgr, resId, num, &result);
    free(result);
    napi_value value = nullptr;
    napi_create_int32(env, res, &value);
    return value;
}

napi_value GetIntPluralString0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    uint32_t resId = 0;
    uint32_t num = 2;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetIntPluralString(nullptr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetIntPluralString0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    uint32_t resId = 0;
    uint32_t num = 2;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetIntPluralString(g_mNativeResMgr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetIntPluralString0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    uint32_t resId = 0;
    uint32_t num = 2;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetIntPluralString(g_mNativeResMgr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetIntPluralString0500(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    uint32_t resId = 0;
    uint32_t num = 2;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetIntPluralString(g_mNativeResMgr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetDoublePluralString0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    uint32_t resId = 0;
    float num = 2.1;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetDoublePluralString(g_mNativeResMgr, resId, num, &result);
    free(result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetDoublePluralString0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    uint32_t resId = 0;
    float num = 2.1;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetDoublePluralString(nullptr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetDoublePluralString0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    uint32_t resId = 0;
    float num = 2.1;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetDoublePluralString(g_mNativeResMgr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetDoublePluralString0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    uint32_t resId = 0;
    float num = 2.1;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetDoublePluralString(g_mNativeResMgr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetDoublePluralString0500(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    uint32_t resId = 0;
    float num = 2.1;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetDoublePluralString(g_mNativeResMgr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetIntPluralStringByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    size_t strSize;
    char strBuf[256];
    uint32_t num = 1;
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetIntPluralStringByName(g_mNativeResMgr, strBuf, num, &result, num);
    free(result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetIntPluralStringByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    size_t strSize;
    char strBuf[256];
    uint32_t num = 1;
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetIntPluralStringByName(nullptr, strBuf, num, &result, num);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetIntPluralStringByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    size_t strSize;
    char strBuf[256];
    uint32_t num = 1;
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetIntPluralStringByName(g_mNativeResMgr, strBuf, num, &result, num);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetIntPluralStringByName0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    size_t strSize;
    char strBuf[256];
    uint32_t num = 1;
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetIntPluralStringByName(g_mNativeResMgr, strBuf, num, &result, num);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetDoublePluralStringByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    size_t strSize;
    char strBuf[271];
    float num = 2.1;
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetDoublePluralStringByName(g_mNativeResMgr, strBuf, num, &result, num);
    free(result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetDoublePluralStringByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    size_t strSize;
    char strBuf[271];
    float num = 2.1;
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetDoublePluralStringByName(nullptr, strBuf, num, &result, num);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetDoublePluralStringByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    size_t strSize;
    char strBuf[271];
    float num = 2.1;
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetDoublePluralStringByName(g_mNativeResMgr, strBuf, num, &result, num);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetDoublePluralStringByName0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char* result;
    size_t strSize;
    char strBuf[271];
    float num = 2.1;
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetDoublePluralStringByName(g_mNativeResMgr, strBuf, num, &result, num);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetColor0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetColor(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetColor0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetColor(nullptr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetColor0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetColor(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetColor0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetColor(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetColor0500(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetColor(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetColorByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t result;
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetColorByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetColorByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t result;
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetColorByName(nullptr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetColorByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t result;
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetColorByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetColorByName0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t result;
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetColorByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetInt0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    int result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetInt(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetInt0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    int result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetInt(nullptr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetInt0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    int result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetInt(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetInt0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    int result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetInt(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetInt0500(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    int result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetInt(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetIntByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    int result;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetIntByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetIntByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    int result;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetIntByName(nullptr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetIntByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    int result;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetIntByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetIntByName0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    int result;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetIntByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetFloat0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    float result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetFloat(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetFloat0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    float result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetFloat(nullptr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetFloat0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    float result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetFloat(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetFloat0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    float result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetFloat(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetFloat0500(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    float result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetFloat(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetFloatByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    float result;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetFloatByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetFloatByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    float result;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetFloatByName(nullptr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetFloatByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    float result;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetFloatByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetFloatByName0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    float result;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetFloatByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetBool0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    bool result = false;
    napi_get_value_uint32(env, argv[0], &id);
    int32_t res = OH_ResourceManager_GetBool(g_mNativeResMgr, id, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetBool0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    bool result = false;
    napi_get_value_uint32(env, argv[0], &id);
    int32_t res = OH_ResourceManager_GetBool(nullptr, id, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetBool0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    bool result = false;
    napi_get_value_uint32(env, argv[0], &id);
    int32_t res = OH_ResourceManager_GetBool(g_mNativeResMgr, id, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetBool0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    bool result = false;
    napi_get_value_uint32(env, argv[0], &id);
    int32_t res = OH_ResourceManager_GetBool(g_mNativeResMgr, id, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetBool0500(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    bool result = false;
    napi_get_value_uint32(env, argv[0], &id);
    int32_t res = OH_ResourceManager_GetBool(g_mNativeResMgr, id, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetBoolByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    bool result = false;
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetBoolByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetBoolByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    bool result = false;
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetBoolByName(nullptr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetBoolByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    bool result = false;
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetBoolByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetBoolByName0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    bool result = false;
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    int32_t res = OH_ResourceManager_GetBoolByName(g_mNativeResMgr, strBuf, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value AddResource0200(napi_env env, napi_callback_info info)
{
    const char *path = "/src/ohosTest/resources/base/media/icon.png";
    int32_t res = OH_ResourceManager_AddResource(nullptr, path);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value AddResource0300(napi_env env, napi_callback_info info)
{
    const char *path = "";
    int32_t res = OH_ResourceManager_AddResource(g_mNativeResMgr, path);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_OVERLAY_RES_PATH_INVALID ? NO_OVERLAY_PATH : -1, &value);
    return value;
}

napi_value RemoveResource0200(napi_env env, napi_callback_info info)
{
    const char *path = "/src/ohosTest/resources/base/media/icon.png";
    int32_t res = OH_ResourceManager_RemoveResource(nullptr, path);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value RemoveResource0300(napi_env env, napi_callback_info info)
{
    const char *path = "";
    int32_t res = OH_ResourceManager_RemoveResource(g_mNativeResMgr, path);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_OVERLAY_RES_PATH_INVALID ? NO_OVERLAY_PATH : -1, &value);
    return value;
}

}