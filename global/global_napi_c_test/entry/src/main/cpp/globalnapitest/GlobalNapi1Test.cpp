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

#include <cstring>
#include <globalnapitest/GlobalNapiTest.h>

namespace GlobalNapiTest {
static NativeResourceManager* g_mNativeResMgr;
napi_value GetResourceManager(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    g_mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}

napi_value GetMediaBase640100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase640100", "GetMediaBase640100: %{public}d", id);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64(g_mNativeResMgr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetMediaBase640200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase640200", "GetMediaBase640200: %{public}d", id);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64(nullptr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetMediaBase640300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase640300", "GetMediaBase640300: %{public}d", id);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64(g_mNativeResMgr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetMediaBase640400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase640400", "GetMediaBase640400: %{public}d", id);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64(g_mNativeResMgr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetMediaBase64Data0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase64Data0100", "GetMediaBase64Data0100: %{public}d", id);

    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64Data(g_mNativeResMgr, hexValue, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetMediaBase64Data0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase64Data0200", "GetMediaBase64Data0200: %{public}d", id);

    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64Data(nullptr, hexValue, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetMediaBase64Data0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase64Data0300", "GetMediaBase64Data0300: %{public}d", id);

    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64Data(g_mNativeResMgr, hexValue, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetMediaBase64Data0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetMediaBase64Data0400", "GetMediaBase64Data0400: %{public}d", id);

    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64Data(g_mNativeResMgr, hexValue, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetMediaBase64ByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64ByName(g_mNativeResMgr, strBuf, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetMediaBase64ByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64ByName(nullptr, strBuf, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetMediaBase64ByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64ByName(g_mNativeResMgr, strBuf, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetMediaBase64DataByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64DataByName(g_mNativeResMgr, strBuf, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetMediaBase64DataByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64DataByName(nullptr, strBuf, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetMediaBase64DataByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    char *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaBase64DataByName(g_mNativeResMgr, strBuf, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetMedia0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMedia(g_mNativeResMgr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetMedia0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMedia(nullptr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetMedia0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMedia(g_mNativeResMgr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetMedia0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMedia(g_mNativeResMgr, id, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetMediaData0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaData(g_mNativeResMgr, id, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetMediaData0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaData(nullptr, id, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetMediaData0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaData(g_mNativeResMgr, id, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetMediaData0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaData(g_mNativeResMgr, id, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetMediaByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaByName(g_mNativeResMgr, strBuf, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetMediaByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaByName(nullptr, strBuf, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER: -1, &value);
    return value;
}

napi_value GetMediaByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaByName(g_mNativeResMgr, strBuf, &result, &len);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetMediaDataByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaDataByName(g_mNativeResMgr, strBuf, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetMediaDataByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaDataByName(nullptr, strBuf, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER: -1, &value);
    return value;
}

napi_value GetMediaDataByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    uint8_t *result = nullptr;
    uint64_t len = 0;
    int32_t res = OH_ResourceManager_GetMediaDataByName(g_mNativeResMgr, strBuf, &result, &len, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetDrawableDescriptor0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptor(g_mNativeResMgr, id, &drawable);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetDrawableDescriptor0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptor(nullptr, id, &drawable);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetDrawableDescriptor0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptor(g_mNativeResMgr, id, &drawable);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetDrawableDescriptor0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[0], &id);
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptor(g_mNativeResMgr, id, &drawable);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetDrawableDescriptorData0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0x000000;
    napi_get_value_uint32(env, argv[0], &id);
    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptorData(g_mNativeResMgr, hexValue, &drawable, 0, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetDrawableDescriptorData0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0x000000;
    napi_get_value_uint32(env, argv[0], &id);
    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptorData(nullptr, hexValue, &drawable, 0, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetDrawableDescriptorData0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0x000000;
    napi_get_value_uint32(env, argv[0], &id);
    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptorData(g_mNativeResMgr, hexValue, &drawable, 0, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetDrawableDescriptorData0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0x000000;
    napi_get_value_uint32(env, argv[0], &id);
    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;
    
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptorData(g_mNativeResMgr, hexValue, &drawable, 0, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetDrawableDescriptorByName0100(napi_env env, napi_callback_info info)
{
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptorByName(g_mNativeResMgr, "icon", &drawable);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetDrawableDescriptorByName0200(napi_env env, napi_callback_info info)
{
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptorByName(nullptr, "icon", &drawable);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetDrawableDescriptorByName0300(napi_env env, napi_callback_info info)
{
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptorByName(g_mNativeResMgr, "", &drawable);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetDrawableDescriptorDataByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptorDataByName(g_mNativeResMgr, strBuf, &drawable, 0, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetDrawableDescriptorDataByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptorDataByName(nullptr, strBuf, &drawable, 0, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetDrawableDescriptorDataByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    ArkUI_DrawableDescriptor *drawable = nullptr;
    int32_t res = OH_ResourceManager_GetDrawableDescriptorDataByName(g_mNativeResMgr, strBuf, &drawable, 0, 0);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetSymbol0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    uint32_t result = 0;
    napi_get_value_uint32(env, argv[0], &id);
    int32_t res = OH_ResourceManager_GetSymbol(g_mNativeResMgr, id, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetSymbol0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    uint32_t result = 0;
    napi_get_value_uint32(env, argv[0], &id);
    int32_t res = OH_ResourceManager_GetSymbol(nullptr, id, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetSymbol0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    uint32_t result = 0;
    napi_get_value_uint32(env, argv[0], &id);
    int32_t res = OH_ResourceManager_GetSymbol(g_mNativeResMgr, id, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetSymbol0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    uint32_t result = 0;
    napi_get_value_uint32(env, argv[0], &id);
    int32_t res = OH_ResourceManager_GetSymbol(g_mNativeResMgr, id, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetSymbol0500(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    uint32_t id = 0;
    uint32_t result = 0;
    napi_get_value_uint32(env, argv[0], &id);
    int32_t res = OH_ResourceManager_GetSymbol(g_mNativeResMgr, id, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res, &value);
    return value;
}

napi_value GetSymbolByName0100(napi_env env, napi_callback_info info)
{
    uint32_t result = 0;
    const char *name = "symbol_test";
    int32_t res = OH_ResourceManager_GetSymbolByName(g_mNativeResMgr, name, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetSymbolByName0200(napi_env env, napi_callback_info info)
{
    uint32_t result = 0;
    const char *name = "symbol_test";
    int32_t res = OH_ResourceManager_GetSymbolByName(nullptr, name, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetSymbolByName0300(napi_env env, napi_callback_info info)
{
    uint32_t result = 0;
    const char *name = "";
    int32_t res = OH_ResourceManager_GetSymbolByName(g_mNativeResMgr, name, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetSymbolByName0400(napi_env env, napi_callback_info info)
{
    uint32_t result = 0;
    const char *name = "symbolTestA";
    int32_t res = OH_ResourceManager_GetSymbolByName(g_mNativeResMgr, name, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetLocales0100(napi_env env, napi_callback_info info)
{
    char **resultValue;
    uint32_t resultLen;
    bool includeSystem = false;
    int32_t res = OH_ResourceManager_GetLocales(g_mNativeResMgr, &resultValue, &resultLen, includeSystem);
    OH_ResourceManager_ReleaseStringArray(&resultValue, resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetLocales0200(napi_env env, napi_callback_info info)
{
    char **resultValue;
    uint32_t resultLen;
    bool includeSystem = false;
    int32_t res = OH_ResourceManager_GetLocales(nullptr, &resultValue, &resultLen, includeSystem);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetLocalesData0100(napi_env env, napi_callback_info info)
{
    char **resultValue;
    uint32_t resultLen;
    bool includeSystem = false;
    int32_t res = OH_ResourceManager_GetLocalesData(g_mNativeResMgr, &resultValue, &resultLen, includeSystem);
    OH_ResourceManager_ReleaseStringArray(&resultValue, resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetLocalesData0200(napi_env env, napi_callback_info info)
{
    char **resultValue;
    uint32_t resultLen;
    bool includeSystem = false;
    int32_t res = OH_ResourceManager_GetLocalesData(nullptr, &resultValue, &resultLen, includeSystem);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetConfiguration0100(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    int32_t res = OH_ResourceManager_GetConfiguration(g_mNativeResMgr, &config);
    OH_ResourceManager_ReleaseConfiguration(&config);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetConfiguration0200(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    int32_t res = OH_ResourceManager_GetConfiguration(nullptr, &config);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetResourceConfiguration0100(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    int32_t res = OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    OH_ResourceManager_ReleaseConfiguration(&config);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value ReleaseConfiguration0100(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    int32_t res = OH_ResourceManager_ReleaseConfiguration(&config);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value ReleaseConfiguration0200(napi_env env, napi_callback_info info)
{
    int32_t res = OH_ResourceManager_ReleaseConfiguration(nullptr);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetString0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetString(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetString0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetString(nullptr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetString0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetString(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetString0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetString(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetString0500(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t res = OH_ResourceManager_GetString(g_mNativeResMgr, resId, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetString0600(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    int32_t state = OH_ResourceManager_GetString(g_mNativeResMgr, resId, &result, "world", 12, 12.3);
    napi_value value = nullptr;
    bool res = state == SUCCESS && strcmp("test world 12 12.3", result) == 0;
    napi_create_int32(env, res ? 0 : -1, &value);
    return value;
}

napi_value GetStringByName0100(napi_env env, napi_callback_info info)
{
    char *result;
    int32_t res = OH_ResourceManager_GetStringByName(g_mNativeResMgr, "entry_MainAbility", &result);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetStringByName0100", "GetStringByName0100: %{public}d", result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetStringByName0200(napi_env env, napi_callback_info info)
{
    char *result;
    int32_t res = OH_ResourceManager_GetStringByName(nullptr, "entry_MainAbility", &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetStringByName0300(napi_env env, napi_callback_info info)
{
    char *result;
    int32_t res = OH_ResourceManager_GetStringByName(g_mNativeResMgr, "", &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetStringByName0400(napi_env env, napi_callback_info info)
{
    char *result;
    int32_t res = OH_ResourceManager_GetStringByName(g_mNativeResMgr, "symbol_A_ref", &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetStringByName0500(napi_env env, napi_callback_info info)
{
    char *result;
    int32_t state = OH_ResourceManager_GetStringByName(g_mNativeResMgr, "test_format", &result, "world", 12, 12.3);
    napi_value value = nullptr;
    bool res = state == SUCCESS && strcmp("test world 12 12.3", result) == 0;
    napi_create_int32(env, res ? 0 : -1, &value);
    return value;
}

napi_value GetStringArray0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    char **resultValue;
    uint32_t resultLen;
    int32_t res = OH_ResourceManager_GetStringArray(g_mNativeResMgr, resId, &resultValue, &resultLen);
    OH_ResourceManager_ReleaseStringArray(&resultValue, resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetStringArray0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    char **resultValue;
    uint32_t resultLen;
    int32_t res = OH_ResourceManager_GetStringArray(nullptr, resId, &resultValue, &resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetStringArray0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    char **resultValue;
    uint32_t resultLen;
    int32_t res = OH_ResourceManager_GetStringArray(g_mNativeResMgr, resId, &resultValue, &resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetStringArray0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    char **resultValue;
    uint32_t resultLen;
    int32_t res = OH_ResourceManager_GetStringArray(g_mNativeResMgr, resId, &resultValue, &resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetStringArray0500(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    char **resultValue;
    uint32_t resultLen;
    int32_t res = OH_ResourceManager_GetStringArray(g_mNativeResMgr, resId, &resultValue, &resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res, &value);
    return value;
}

napi_value GetStringArrayByName0100(napi_env env, napi_callback_info info)
{
    char **resultValue;
    uint32_t resultLen;
    const char *name = "size";
    int32_t res = OH_ResourceManager_GetStringArrayByName(g_mNativeResMgr, name, &resultValue, &resultLen);
    OH_ResourceManager_ReleaseStringArray(&resultValue, resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetStringArrayByName0200(napi_env env, napi_callback_info info)
{
    char **resultValue;
    uint32_t resultLen;
    const char *name = "size";
    int32_t res = OH_ResourceManager_GetStringArrayByName(nullptr, name, &resultValue, &resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetStringArrayByName0300(napi_env env, napi_callback_info info)
{
    char **resultValue;
    uint32_t resultLen;
    const char *name = "";
    int32_t res = OH_ResourceManager_GetStringArrayByName(g_mNativeResMgr, name, &resultValue, &resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetStringArrayByName0400(napi_env env, napi_callback_info info)
{
    char **resultValue;
    uint32_t resultLen;
    const char *name = "array1";
    int32_t res = OH_ResourceManager_GetStringArrayByName(g_mNativeResMgr, name, &resultValue, &resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value ReleaseStringArray0100(napi_env env, napi_callback_info info)
{
    char **resultValue;
    uint32_t resultLen;
    const char *name = "size";
    OH_ResourceManager_GetStringArrayByName(g_mNativeResMgr, name, &resultValue, &resultLen);
    int32_t res = OH_ResourceManager_ReleaseStringArray(&resultValue, resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value ReleaseStringArray0200(napi_env env, napi_callback_info info)
{
    uint32_t resultLen = 0;
    int32_t res = OH_ResourceManager_ReleaseStringArray(nullptr, resultLen);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetPluralString0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    uint32_t num = 1;
    int32_t res = OH_ResourceManager_GetPluralString(g_mNativeResMgr, resId, num, &result);
    free(result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetPluralString0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    uint32_t num = 1;
    int32_t res = OH_ResourceManager_GetPluralString(nullptr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetPluralString0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    uint32_t num = 1;
    int32_t res = OH_ResourceManager_GetPluralString(g_mNativeResMgr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_ID_NOT_FOUND ? NOT_FOUND_ID : -1, &value);
    return value;
}

napi_value GetPluralString0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    uint32_t num = 1;
    int32_t res = OH_ResourceManager_GetPluralString(g_mNativeResMgr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NOT_FOUND_BY_ID ? NOT_FOUND_BY_ID : -1, &value);
    return value;
}

napi_value GetPluralString0500(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[0], &resId);
    uint32_t num = 1;
    int32_t res = OH_ResourceManager_GetPluralString(g_mNativeResMgr, resId, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

napi_value GetPluralStringByName0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char *result;
    const char *name = "eat_apple";
    uint32_t num = 1;
    int32_t res = OH_ResourceManager_GetPluralStringByName(g_mNativeResMgr, name, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == SUCCESS ? 0 : -1, &value);
    return value;
}

napi_value GetPluralStringByName0200(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char *result;
    const char *name = "eat_apple";
    uint32_t num = 1;
    int32_t res = OH_ResourceManager_GetPluralStringByName(nullptr, name, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_INVALID_INPUT_PARAMETER ? PARAMETER : -1, &value);
    return value;
}

napi_value GetPluralStringByName0300(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char *result;
    const char *name = "";
    uint32_t num = 1;
    int32_t res = OH_ResourceManager_GetPluralStringByName(g_mNativeResMgr, name, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_NAME_NOT_FOUND ? NOT_FOUND_NAME : -1, &value);
    return value;
}

napi_value GetPluralStringByName0400(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    char *result;
    const char *name = "test_cyc";
    uint32_t num = 1;
    int32_t res = OH_ResourceManager_GetPluralStringByName(g_mNativeResMgr, name, num, &result);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_RES_REF_TOO_MUCH ? TOO_MUCH : -1, &value);
    return value;
}

}