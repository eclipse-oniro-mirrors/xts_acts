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
#include "pixel_map_native_test.h"

namespace OHOS {
namespace Media {

using namespace std;

constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, 0xD002B05, "ImagePixelMapNativeTest"};

static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {
            "JsNativeToNapi", nullptr, ImagePixelMapNativeTest::JsNativeToNapi,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "JsNapiToNative_ReturnProperty", nullptr, ImagePixelMapNativeTest::JsNapiToNative_ReturnProperty,
            nullptr, nullptr, nullptr, napi_static, nullptr
        }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

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
        HiviewDFX::HiLog::Error(LABEL, "getNativeImageSource failed");
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
        HiviewDFX::HiLog::Error(LABEL, "GetPixelmap failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    error = ismt.ConvertPixelmapToNapi(env, pixelmap, &result);
    if (error != IMAGE_SUCCESS) {
        HiviewDFX::HiLog::Error(LABEL, "OH_PixelmapNative_ConvertPixelmapToNapi failed");
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
        HiviewDFX::HiLog::Error(LABEL, "getNativeImageSource failed");
        return result;
    }
    OH_PixelmapNative *pixelmap = nullptr;
    ImagePixelMapNative ismt;
    int32_t error = ismt.ConvertPixelmapFromNapi(env, argValue[0], &pixelmap);
    if (error != 0) {
        HiviewDFX::HiLog::Error(LABEL, "ConvertPixelmapFromNapi failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    napi_value outobject = nullptr;
    napi_create_object(env, &outobject);
    napi_value objectwidth = nullptr;
    error = ismt.GetPixelmapPixelWidth(env, pixelmap, &objectwidth);
    if (error != 0) {
        HiviewDFX::HiLog::Error(LABEL, "GetPixelmapPixelWidth failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    napi_set_named_property(env, outobject, "width", objectwidth);
    napi_value objectHeight = nullptr;
    error = ismt.GetPixelmapPixelHeight(env, pixelmap, &objectHeight);
    if (error != 0) {
        HiviewDFX::HiLog::Error(LABEL, "GetPixelmapPixelHeight failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    napi_set_named_property(env, outobject, "height", objectHeight);
    napi_value objectPixelformat = nullptr;
    error = ismt.GetPixelmapPixelFormat(env, pixelmap, &objectPixelformat);
    if (error != 0) {
        HiviewDFX::HiLog::Error(LABEL, "GetPixelmapPixelFormat failed");
        napi_create_int32(env, error, &result);
        return result;
    }
    napi_set_named_property(env, outobject, "pixelFormat", objectPixelformat);
    ismt.ReleasePixelmapNative(pixelmap);
    return outobject;
}
} // namespace Media
} // namespace OHOS
