/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "MediaAssetManagerCancelRequestTest.h"
#include <hilog/log.h>
#include <multimedia/media_library/media_asset_base_capi.h>
#include <multimedia/media_library/media_asset_manager_capi.h>
#include <string>
constexpr int TEST_ARG_SUM = 4;
constexpr int TEST_ONE_ARG_SUM = 1;
constexpr int TEST_THREE_ARG_SUM = 3;
const size_t NUM0 = 0;
const size_t NUM1 = 1;
const size_t NUM2 = 2;
const size_t NUM3 = 3;
const size_t NUM4 = 4;
const uint32_t PARAM0 = 0;
const uint32_t PARAM1 = 1;
const uint32_t PARAM2 = 2;
const uint32_t PARAM3 = 3;
#define LOG_DOMAIN 0x0000
#define LOG_TAG "MediaAssetManagerCpp"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define NO_PRECONFIG_MODE 1
#define TYPE_PRECONFIG_MODE 2
#define TYPE_RATIO_PRECONFIG_MODE 3
const char ERROR_REQUEST_ID[UUID_STR_MAX_LENGTH] = "00000000-0000-0000-0000-000000000000";
static  bool GetUtf8String(napi_env env, napi_value root, std::string &res)
{
    size_t bufferSize = NUM0;
    napi_get_value_string_utf8(env, root, nullptr, NUM0, &bufferSize);

    size_t resultSize = NUM0;
    bufferSize = bufferSize + NUM1;

    std::vector<char> buffer(bufferSize);
    napi_get_value_string_utf8(env, root, &(buffer[NUM0]), bufferSize, &resultSize);
    res.assign(buffer.begin(), buffer.end());
    return true;
}
static  napi_status GetDeliveryMode(napi_env env, const napi_value arg, const std::string &propName,
                            MediaLibrary_DeliveryMode &deliveryMode)
{
    bool present = false;
    napi_value property = nullptr;
    int mode = -1;
    napi_has_named_property(env, arg, propName.c_str(), &present);
    napi_get_named_property(env, arg, propName.c_str(), &property);
    napi_get_value_int32(env, property, &mode);
    if (mode < 0 || mode > 2) {
        LOGI("Invalid delivery mode");
        return napi_invalid_arg;
    } else {
        deliveryMode = static_cast<MediaLibrary_DeliveryMode>(mode);
    }
    return napi_ok;
}
static  napi_status ParseArgGetRequestOption(napi_env env, napi_value arg, MediaLibrary_DeliveryMode &deliveryMode)
{
    if (GetDeliveryMode(env, arg, "deliveryMode", deliveryMode) != napi_ok) {
        LOGI("GetDeliveryMode failed");
        return napi_invalid_arg;
    }
    return napi_ok;
}
static void OnDataPrepared(int32_t result, MediaLibrary_RequestId requestIdStruct)
{
    LOGI("OnDataPrepared");
    //printf("OnDataPrepared requestId: %{public}s result: %{public}d", requestIdStruct.requestId, result);
}
napi_value MediaAssetManagerCancelRequestTest(napi_env env, napi_callback_info info) 
{
    LOGI("OH_MediaAssetManager_CancelRequest start");
    napi_value result;
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[5] = {0};
    size_t argCount = 5;
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        return udfVar;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    std::string srcUri;
    GetUtf8String(env, argValue[1], srcUri);
    LOGI("srcUri:%{public}s", srcUri.c_str());
    MediaLibrary_RequestOptions options;
    if (ParseArgGetRequestOption(env, argValue[2], options.deliveryMode) != napi_ok) {
        LOGI("ParseArgGetRequestOption failed");
        return result;
    }
    std::string destUri;
    GetUtf8String(env, argValue[3], destUri);
     LOGI("destUri: %{public}s", destUri.c_str());
    LOGI("222 ");
    OH_MediaAssetManager *manager = OH_MediaAssetManager_Create();
    LOGI("333 %{public}p",manager);
    OH_MediaLibrary_OnDataPrepared callback = OnDataPrepared;
    LOGI("44412DDEFFSW");
    MediaLibrary_RequestId requestId = OH_MediaAssetManager_RequestVideoForPath(manager, srcUri.c_str(), options, destUri.c_str(), callback);
    LOGI("requestId is %{public}s",requestId.requestId);
    bool ret;
    switch (index)
    {
    case CASE_INDEX_1:
        ret = OH_MediaAssetManager_CancelRequest(manager, requestId);
        LOGI("OH_MediaAssetManager_CancelRequest1 %{public}d",ret);
        break;
    case CASE_INDEX_2:
        ret = OH_MediaAssetManager_CancelRequest(nullptr, requestId);
        LOGI("OH_MediaAssetManager_CancelRequest2 %{public}d",ret);
        break;
    default:
        break;
    }
    OH_MediaAssetManager_Release(manager);
    napi_get_boolean(env, ret, &result);
    return result;
}
