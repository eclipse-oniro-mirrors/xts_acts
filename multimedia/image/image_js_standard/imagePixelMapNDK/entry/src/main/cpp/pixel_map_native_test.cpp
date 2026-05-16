/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <memory>
#include <string>
#include <map>
#include <uv.h>
#include "node_api.h"
#include "hilog/log.h"
#include "./pixel_map_native_test.h"

namespace OHOS {
namespace Media {

using namespace std;

#define IMAGE_LOG_TAG "IMAGE_TAGLOG"
#define IMAGE_LOG_DOMAIN 0x3200

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)


static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;

static uint32_t getNativeImageSource(napi_env env, napi_callback_info info,
    napi_value* argValue, size_t &argCount)
{
    napi_value thisVar = nullptr;
    if (argValue == nullptr || argCount == 0) {
        return -1;
    }
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        return -1;
    }
    return 0;
}

napi_value ImagePixelMapNativeTest::JsNativeToNapi(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    size_t argCount = 2;
    napi_value argValue[2] = {0};
    uint32_t num = getNativeImageSource(env, info, argValue, argCount);
    if (num != 0) {
        LOG("getNativeImageSource failed");
        napi_create_int32(env, num, &result);
        return result;
    }
    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    int32_t pixelformat = 0;
    napi_get_value_int32(env, argValue[NUM_1], &pixelformat);
    OH_PixelmapNative *pixelmap = nullptr;
    ImagePixelMapNative ismt;
    int32_t error = ismt.GetPixelmap(fd, pixelformat, &pixelmap);
    if (error != IMAGE_SUCCESS) {
        LOG("GetPixelmap failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    error = ismt.ConvertPixelmapToNapi(env, pixelmap, &result);
    if (error != IMAGE_SUCCESS) {
        LOG("OH_PixelmapNative_ConvertPixelmapToNapi failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    return result;
}

napi_value ImagePixelMapNativeTest::JsNapiToNative_ReturnProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value argValue[NUM_1] = {0};
    size_t argCount = 1;
    uint32_t num = getNativeImageSource(env, info, argValue, argCount);
    if (num != 0) {
        LOG("getNativeImageSource failed");
        return result;
    }
    OH_PixelmapNative *pixelmap = nullptr;
    ImagePixelMapNative ismt;
    int32_t error = ismt.ConvertPixelmapFromNapi(env, argValue[0], &pixelmap);
    if (error != 0) {
        LOG("ConvertPixelmapFromNapi failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    napi_value outobject = nullptr;
    napi_create_object(env, &outobject);
    napi_value objectwidth = nullptr;
    error = ismt.GetPixelmapPixelWidth(env, pixelmap, &objectwidth);
    if (error != 0) {
        LOG("GetPixelmapPixelWidth failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    napi_set_named_property(env, outobject, "width", objectwidth);
    napi_value objectHeight = nullptr;
    error = ismt.GetPixelmapPixelHeight(env, pixelmap, &objectHeight);
    if (error != 0) {
        LOG("GetPixelmapPixelHeight failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    napi_set_named_property(env, outobject, "height", objectHeight);
    napi_value objectPixelformat = nullptr;
    error = ismt.GetPixelmapPixelFormat(env, pixelmap, &objectPixelformat);
    if (error != 0) {
        LOG("GetPixelmapPixelFormat failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    napi_set_named_property(env, outobject, "pixelFormat", objectPixelformat);
    ismt.ReleasePixelmapNative(pixelmap);
    return outobject;
}
} // namespace Media
} // namespace OHOS
