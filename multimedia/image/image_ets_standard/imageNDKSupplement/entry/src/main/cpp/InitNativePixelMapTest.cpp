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
#include "InitNativePixelMapTest.h"
#include <cstddef>
#include <cstdint>
#include <hilog/log.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#define IMAGE_LOG_TAG "IMAGE_PIXELMAPMDK_TAGLOG"
#define IMAGE_LOG_DOMAIN 0x3200
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define TAG "CppImageNdk.InitNativePixelMapTest"
namespace {
constexpr uint32_t NUM_0 = 0;
constexpr uint32_t NUM_1 = 1;
constexpr uint32_t NUM_2 = 2;
constexpr uint32_t NUM_3 = 3;
constexpr uint32_t NUM_4 = 4;
constexpr size_t ID_SIZE = 64;
}
napi_value PixelMapGetIsEditableResult(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    NativePixelMap *Native = nullptr;
    switch (index) {
    case CASE_INDEX_1: {
        Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    }
    case CASE_INDEX_2: {
        Native = OH_PixelMap_InitNativePixelMap(nullptr, pixelmap);
    }
    case CASE_INDEX_3: {
        Native = OH_PixelMap_InitNativePixelMap(env, nullptr);
    } break;
    default:

        break;
    }
    int code = 401;
    if (Native != nullptr) {
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}