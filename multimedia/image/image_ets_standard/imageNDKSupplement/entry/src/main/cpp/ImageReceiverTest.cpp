/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "utils/CommonUtilsTest.h"
#include "utils/PixelmapHelperTest.h"
#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image/image_receiver_native.h>
#include <multimedia/image_framework/image/picture_native.h>
#include "ImageReceiverTest.h"
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageReceiverNdk"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2

namespace {
    constexpr uint32_t NUM_0 = 0;
    constexpr uint32_t NUM_1 = 1;
    constexpr uint32_t NUM_2 = 2;
    constexpr uint32_t NUM_3 = 3;
    constexpr uint32_t NUM_4 = 4;
    constexpr uint32_t NUM_5 = 5;
}

napi_value OhInitReceiverOptions(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode;
    Image_Size imgSizeRead;
    errCode = OH_ImageReceiverOptions_GetSize(nullptr, &imgSizeRead);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

napi_value OhInitReceiverOptionsGetCapacity(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode;
    int32_t capacity = NUM_0;
    errCode = OH_ImageReceiverOptions_GetCapacity(nullptr, &capacity);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

napi_value OhImageReceiverNativeGetSize(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode;
    Image_Size size;
    errCode = OH_ImageReceiverNative_GetSize(nullptr, &size);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

napi_value ImageReceiverNativeSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    OH_ImageReceiverNative* receiver = nullptr;
    uint64_t receiverSurfaceID = 0;
    
    receiverSurfaceID = OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &receiverSurfaceID);
    napi_value ret;
    napi_create_int32(env, receiverSurfaceID, &ret);
    return ret;
}

napi_value ImageReceiverNativeGetCapacitySuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    OH_ImageReceiverNative* receiver = nullptr;
    int32_t *capacity = nullptr;
    Image_ErrorCode receiverSurfaceID;
    
    receiverSurfaceID = OH_ImageReceiverNative_GetCapacity(receiver, capacity);
    napi_value ret;
    napi_create_int32(env, receiverSurfaceID, &ret);
    return ret;
}

napi_value ComposeOptionsReleaseSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    Image_ErrorCode receiverSurfaceID;
    OH_ComposeOptions *options;
    OH_ComposeOptions_Create(&options);
    
    receiverSurfaceID = OH_ComposeOptions_Release(options);
    napi_value ret;
    napi_create_int32(env, receiverSurfaceID, &ret);
    return ret;
}

napi_value OHImageNativeGetComponentTypesSupp(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode;
    errCode = OH_ImageNative_GetComponentTypes(nullptr, nullptr, nullptr);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

napi_value OHPackingOptionsForSequenceGetFrameCountSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    OH_PackingOptionsForSequence *options = nullptr;
    Image_ErrorCode errCode;
    uint32_t value;
    errCode = OH_PackingOptionsForSequence_Create(&options);
    
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_PackingOptionsForSequence_GetFrameCount(options, &value);
        break;
    case CASE_INDEX_2:
        errCode = OH_PackingOptionsForSequence_GetFrameCount(nullptr, nullptr);
        break;
    default:
        break;
    }
    
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

