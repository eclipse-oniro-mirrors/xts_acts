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

#include <cstdint>
#include <globalnapitest/GlobalNapiTest.h>

namespace GlobalNapiTest {
static NativeResourceManager* g_mNativeResMgr;
napi_value GetResourceManager3(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    g_mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}

napi_value GetSuccess0100(napi_env env, napi_callback_info info)
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

napi_value GetInvalidInputParameter0100(napi_env env, napi_callback_info info)
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

napi_value GetIdNotFound0100(napi_env env, napi_callback_info info)
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

napi_value GetNotFoundById0100(napi_env env, napi_callback_info info)
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

napi_value GetNameNotFound0100(napi_env env, napi_callback_info info)
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

napi_value GetRefTooMuch0100(napi_env env, napi_callback_info info)
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

napi_value GetResPathInvalid0100(napi_env env, napi_callback_info info)
{
    const char *path = "";
    int32_t res = OH_ResourceManager_AddResource(g_mNativeResMgr, path);
    napi_value value = nullptr;
    napi_create_int32(env, res == ERROR_CODE_OVERLAY_RES_PATH_INVALID ? NO_OVERLAY_PATH : -1, &value);
    return value;
}

napi_value GetDirectionVertical0100(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    int32_t res = config.direction;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetDirectionVertical0100", "GetDirectionVertical0100: %{public}d", res);
    OH_ResourceManager_ReleaseConfiguration(&config);
    napi_value value = nullptr;
    napi_create_int32(env, res, &value);
    return value;
}

napi_value GetColorModeLight0100(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    int32_t res = config.colorMode;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "Light", "Light: %{public}d", res);
    OH_ResourceManager_ReleaseConfiguration(&config);
    napi_value value = nullptr;
    napi_create_int32(env, res == COLOR_MODE_LIGHT ? 0 : 1, &value);
    return value;
}

napi_value GetDeviceType0100(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    int32_t res = config.deviceType;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "GetDeviceType0100", "GetDeviceType0100: %{public}d", res);
    OH_ResourceManager_ReleaseConfiguration(&config);
    napi_value value = nullptr;
    int ret = -1;
    if (res == DEVICE_TYPE_PHONE) {
        ret = 0;
    } else if (res == DEVICE_TYPE_TABLET) {
        ret = 0;
    } else if (res == DEVICE_TYPE_CAR) {
        ret = 0;
    } else if (res == DEVICE_TYPE_PC) {
        ret = 0;
    } else if (res == DEVICE_TYPE_TV) {
        ret = 0;
    } else if (res == DEVICE_TYPE_WEARABLE) {
        ret = 0;
    } else if (res == DEVICE_TYPE_2IN1) {
        ret = 0;
    }
    napi_create_int32(env, ret, &value);
    return value;
}

napi_value GetScreenDensity0100(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    int32_t res = config.screenDensity;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "ScreenDensity", "ScreenDensity: %{public}d", res);
    OH_ResourceManager_ReleaseConfiguration(&config);
    napi_value value = nullptr;
    int ret = -1;
    if (res == SCREEN_SDPI) {
        ret = 0;
    } else if (res == SCREEN_MDPI) {
        ret = 0;
    } else if (res == SCREEN_LDPI) {
        ret = 0;
    } else if (res == SCREEN_XLDPI) {
        ret = 0;
    } else if (res == SCREEN_XXLDPI) {
        ret = 0;
    } else if (res == SCREEN_XXXLDPI) {
        ret = 0;
    }
    napi_create_int32(env, ret, &value);
    return value;
}

napi_value GetConfigurations0100(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    int32_t res = config.direction;
    napi_value value = nullptr;
    napi_create_int32(env, res, &value);
    return value;
}

napi_value GetConfigurations0200(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    int32_t res = config.deviceType;
    napi_value value = nullptr;
    napi_create_int32(env, res, &value);
    return value;
}

napi_value GetConfigurations0300(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    int32_t res = config.screenDensity;
    int ret = -1;
    if (res == SCREEN_SDPI) {
        ret = 0;
    } else if (res == SCREEN_MDPI) {
        ret = 0;
    } else if (res == SCREEN_LDPI) {
        ret = 0;
    } else if (res == SCREEN_XLDPI) {
        ret = 0;
    } else if (res == SCREEN_XXLDPI) {
        ret = 0;
    } else if (res == SCREEN_XXXLDPI) {
        ret = 0;
    }
    napi_value value = nullptr;
    napi_create_int32(env, ret, &value);
    return value;
}

napi_value GetConfigurations0400(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    int32_t res = config.colorMode;
    napi_value value = nullptr;
    napi_create_int32(env, res == COLOR_MODE_LIGHT ? 0 : 1, &value);
    return value;
}

napi_value GetConfigurations0500(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    config.mcc = -1;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    uint32_t res = config.mcc;
    int ret = -1;
    if (res != -1) {
        ret = 0;
    }
    napi_value value = nullptr;
    napi_create_int32(env, ret, &value);
    return value;
}

napi_value GetConfigurations0600(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    config.mnc = -1;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    uint32_t res = config.mnc;
    int ret = -1;
    if (res != -1) {
        ret = 0;
    }
    napi_value value = nullptr;
    napi_create_int32(env, ret, &value);
    return value;
}

napi_value GetConfigurations0700(napi_env env, napi_callback_info info)
{
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(g_mNativeResMgr, &config);
    for (uint32_t i = 0; i < count; i++) {
        config.reserved[i] = i;
    }
    napi_value value = nullptr;
    napi_create_int32(env, config.reserved[count2] == count2 ? 0 : 1, &value);
    return value;
}

napi_value GetDirectionHorizontal0100(napi_env env, napi_callback_info info)
{
    napi_value value = nullptr;
    napi_create_int32(env, static_cast<int>(DIRECTION_HORIZONTAL), &value);
    return value;
}

napi_value GetColorModeDark0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    
    ResourceManager_Configuration config;
    OH_ResourceManager_GetResourceConfiguration(mNativeResMgr, &config);
    int32_t res = config.colorMode;
    OH_ResourceManager_ReleaseConfiguration(&config);
    napi_value value = nullptr;
    napi_create_int32(env, res == COLOR_MODE_DARK ? 0 : 1, &value);
    return value;
}

napi_value AddResource0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    char *resultValue;
    OH_ResourceManager_GetStringByName(g_mNativeResMgr, "test1", &resultValue);
    int res = 0;
    if (strcmp(resultValue, "entry_test") != 0) {
        res = -1;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "AddResource0100", "AddResource0100: %{public}s", strBuf);
    OH_ResourceManager_AddResource(g_mNativeResMgr, strBuf);
    OH_ResourceManager_GetStringByName(g_mNativeResMgr, "test1", &resultValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "AddResource0100", "AddResource0100: %{public}s", resultValue);
    if (strcmp(resultValue, "entry") != 0) {
        res = -1;
    }
    OH_ResourceManager_RemoveResource(g_mNativeResMgr, strBuf);
    napi_value value = nullptr;
    napi_create_int32(env, res, &value);
    return value;
}

napi_value RemoveResource0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[0], strBuf, sizeof(strBuf), &strSize);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "RemoveResource0100", "RemoveResource0100: %{public}s", strBuf);
    char *resultValue;
    OH_ResourceManager_GetStringByName(g_mNativeResMgr, "test1", &resultValue);
    int res = 0;
    if (strcmp(resultValue, "entry_test") != 0) {
        res = -1;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "RemoveResource0100", "RemoveResource0100: %{public}s", resultValue);
    OH_ResourceManager_AddResource(g_mNativeResMgr, strBuf);
    OH_ResourceManager_GetStringByName(g_mNativeResMgr, "test1", &resultValue);
    if (strcmp(resultValue, "entry") != 0) {
        res = -1;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "RemoveResource0100", "RemoveResource0100: %{public}s", resultValue);
    OH_ResourceManager_RemoveResource(g_mNativeResMgr, strBuf);
    OH_ResourceManager_GetStringByName(g_mNativeResMgr, "test1", &resultValue);
    if (strcmp(resultValue, "entry_test") != 0) {
        res = -1;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF, "RemoveResource0100", "RemoveResource0100: %{public}s", resultValue);
    napi_value value = nullptr;
    napi_create_int32(env, res, &value);
    return value;
}
}