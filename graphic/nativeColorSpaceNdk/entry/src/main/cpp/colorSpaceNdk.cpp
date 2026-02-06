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

#include <js_native_api.h>
#include "napi/native_api.h"
#include "native_color_space_manager/native_color_space_manager.h"
#include "hilog/log.h"

#define SUCCESS 0
#define FAIL (-1)
#define RED_X 1.1f
#define RED_Y 1.2f
#define GREEN_X 1.3f
#define GREEN_Y 1.4f
#define BLUE_X 1.5f
#define BLUE_Y 1.6f
#define WHITE_X 1.7f
#define WHITE_Y 1.8f
 
static napi_value OHCreateColorSpaceFromName(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::SRGB;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    if (nativeColorSpace != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    return result;
}

static napi_value OHCreateFromPrimariesAndGamma(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpacePrimaries primaries = {RED_X, RED_Y, GREEN_X, GREEN_Y, BLUE_X, BLUE_Y, WHITE_X, WHITE_Y};
    float gamma = 1.f;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromPrimariesAndGamma(primaries, gamma);
    if (nativeColorSpace != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    return result;
}

static napi_value OHDestroy(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::SRGB;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    if (nativeColorSpace != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    return result;
}

static napi_value OHGetColorSpaceName(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName =
        static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    if (colorSpaceName == ColorSpaceName::NONE) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHGetColorSpaceName001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::SRGB;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    if (nativeColorSpace != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    if (colorSpaceName == ColorSpaceName::SRGB) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    return result;
}

static napi_value OHGetWhitePoint(napi_env env, napi_callback_info info)
{
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    napi_value result = nullptr;
    WhitePointArray array = OH_NativeColorSpaceManager_GetWhitePoint(nativeColorSpace);
    if (array.arr[0] == 0.f || array.arr[1] == 0.f) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHGetWhitePoint001(napi_env env, napi_callback_info info)
{
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    napi_value result = nullptr;
    ColorSpacePrimaries primaries = {RED_X, RED_Y, GREEN_X, GREEN_Y, BLUE_X, BLUE_Y, WHITE_X, WHITE_Y};
    float gamma = 1.f;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromPrimariesAndGamma(primaries, gamma);
    if (nativeColorSpace != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    WhitePointArray array = OH_NativeColorSpaceManager_GetWhitePoint(nativeColorSpace);
    if (array.arr[0] == WHITE_X || array.arr[1] == WHITE_Y) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    return result;
}

static napi_value OHGetGamma(napi_env env, napi_callback_info info)
{
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    napi_value result = nullptr;
    float gamma = OH_NativeColorSpaceManager_GetGamma(nativeColorSpace);
    if (gamma == 0.f) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHGetGamma001(napi_env env, napi_callback_info info)
{
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    napi_value result = nullptr;
    ColorSpacePrimaries primaries = {RED_X, RED_Y, GREEN_X, GREEN_Y, BLUE_X, BLUE_Y, WHITE_X, WHITE_Y};
    float gamma = 1.f;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromPrimariesAndGamma(primaries, gamma);
    if (nativeColorSpace != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    if (OH_NativeColorSpaceManager_GetGamma(nativeColorSpace) == 1.f) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHCreateColorSpaceFromName", nullptr, OHCreateColorSpaceFromName, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCreateFromPrimariesAndGamma", nullptr, OHCreateFromPrimariesAndGamma, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHDestroy", nullptr, OHDestroy, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHGetColorSpaceName", nullptr, OHGetColorSpaceName, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHGetColorSpaceName001", nullptr, OHGetColorSpaceName001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHGetWhitePoint", nullptr, OHGetWhitePoint, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHGetWhitePoint001", nullptr, OHGetWhitePoint001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHGetGamma", nullptr, OHGetGamma, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHGetGamma001", nullptr, OHGetGamma001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
    .nm_modname = "nativeColorSpaceNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }