/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "image_pixel_map_imgndk_test.h"
#include "pixel_map_native_test.h"
#include "node_api.h"
#include "hilog/log.h"

namespace {
    constexpr uint32_t NUM_0 = 0;
    constexpr uint32_t NUM_1 = 1;
    constexpr uint32_t NUM_2 = 2;
    constexpr uint32_t NUM_3 = 3;
    constexpr uint32_t NUM_4 = 4;
    constexpr uint32_t NUM_5 = 5;
}

#define IMAGE_LOG_TAG "IMAGE_TAGLOG"
#define IMAGE_LOG_DOMAIN 0x3200

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)

#define STATIC_FUNCTION(n, f) { (n), nullptr, (f), nullptr, nullptr, nullptr, napi_static, nullptr }

napi_value ImagePixelMapNDKTest::Init(napi_env env, napi_value exports)
{
    napi_property_descriptor props[] = {
        STATIC_FUNCTION("createPixelMap", CreatePixelMap),
        STATIC_FUNCTION("createAlphaPixelMap", CreateAlphaPixelMap),
        STATIC_FUNCTION("initNativePixelMap", InitNativePixelMap),
        STATIC_FUNCTION("getBytesNumberPerRow", GetBytesNumberPerRow),
        STATIC_FUNCTION("getIsEditable", GetIsEditable),
        STATIC_FUNCTION("isSupportAlpha", IsSupportAlpha),
        STATIC_FUNCTION("setAlphaAble", SetAlphaAble),
        STATIC_FUNCTION("getDensity", GetDensity),
        STATIC_FUNCTION("setDensity", SetDensity),
        STATIC_FUNCTION("setOpacity", SetOpacity),
        STATIC_FUNCTION("scale", Scale),
        STATIC_FUNCTION("translate", Translate),
        STATIC_FUNCTION("rotate", Rotate),
        STATIC_FUNCTION("flip", Flip),
        STATIC_FUNCTION("crop", Crop),
        STATIC_FUNCTION("getImageInfo", GetImageInfo),
        STATIC_FUNCTION("accessPixels", AccessPixels),
        STATIC_FUNCTION("unAccessPixels", UnAccessPixels),
        {
            "JsNativeToNapi", nullptr, OHOS::Media::ImagePixelMapNativeTest::JsNativeToNapi,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "JsNapiToNative_ReturnProperty", nullptr,
            OHOS::Media::ImagePixelMapNativeTest::JsNapiToNative_ReturnProperty,
            nullptr, nullptr, nullptr, napi_static, nullptr
        }
    };
    napi_define_properties(env, exports, sizeof(props) / sizeof(props[0]), props);
    return exports;
}

static bool parseWidth(napi_env env, napi_value root, struct OhosPixelMapCreateOps* opts)
{
    napi_value napiWidth = nullptr;
    if (napi_get_named_property(env, root, "width", &napiWidth) != napi_ok || napiWidth == nullptr) {
        return false;
    }
    return (napi_get_value_uint32(env, napiWidth, &(opts->width)) == napi_ok);
}

static bool parseHeight(napi_env env, napi_value root, struct OhosPixelMapCreateOps* opts)
{
    napi_value napiHeight = nullptr;
    if (napi_get_named_property(env, root, "height", &napiHeight) != napi_ok || napiHeight == nullptr) {
        return false;
    }
    return (napi_get_value_uint32(env, napiHeight, &(opts->height)) == napi_ok);
}

static bool parsePixelFormat(napi_env env, napi_value root, struct OhosPixelMapCreateOps* opts)
{
    napi_value napiPixelFormat = nullptr;
    if (napi_get_named_property(env, root, "pixelFormat", &napiPixelFormat) != napi_ok
        || napiPixelFormat == nullptr) {
        return false;
    }
    return (napi_get_value_int32(env, napiPixelFormat, &(opts->pixelFormat)) == napi_ok);
}

static bool parseEditable(napi_env env, napi_value root, struct OhosPixelMapCreateOps* opts)
{
    napi_value napiEditable = nullptr;
    if (napi_get_named_property(env, root, "editable", &napiEditable) != napi_ok
        || napiEditable == nullptr) {
        return false;
    }
    return (napi_get_value_uint32(env, napiEditable, &(opts->editable)) == napi_ok);
}

static bool parseAlphaType(napi_env env, napi_value root, struct OhosPixelMapCreateOps* opts)
{
    napi_value napiAlphaType = nullptr;
    if (napi_get_named_property(env, root, "alphaType", &napiAlphaType) != napi_ok
        || napiAlphaType == nullptr) {
        return false;
    }
    return (napi_get_value_uint32(env, napiAlphaType, &(opts->alphaType)) == napi_ok);
}

static bool parseScaleMode(napi_env env, napi_value root, struct OhosPixelMapCreateOps* opts)
{
    napi_value napiScaleMode = nullptr;
    if (napi_get_named_property(env, root, "scaleMode", &napiScaleMode) != napi_ok
        || napiScaleMode == nullptr) {
        return false;
    }
    return (napi_get_value_uint32(env, napiScaleMode, &(opts->scaleMode)) == napi_ok);
}

static bool parseCreateOptions(napi_env env, napi_value root, struct OhosPixelMapCreateOps* opts)
{
    if (!parseWidth(env, root, opts)) {
        return false;
    }
    if (!parseHeight(env, root, opts)) {
        return false;
    }
    if (!parsePixelFormat(env, root, opts)) {
        return false;
    }
    if (!parseEditable(env, root, opts)) {
        return false;
    }
    if (!parseAlphaType(env, root, opts)) {
        return false;
    }
    if (!parseScaleMode(env, root, opts)) {
        return false;
    }
    return true;
}

napi_value ImagePixelMapNDKTest::CreatePixelMap(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    void* buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;

    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_2 || argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok ||
        buffer == nullptr || bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }

    int32_t res = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    LOG("OH_PixelMap_CreatePixelMap, result is %{public}d", res);
    if (res != IMAGE_RESULT_SUCCESS || pixelmap == nullptr) {
        return udfVar;
    }
    return pixelmap;
}

napi_value ImagePixelMapNDKTest::CreateAlphaPixelMap(napi_env env, napi_callback_info info)
{
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_value alphaPixelmap = nullptr;

    napi_get_undefined(env, &udfVar);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_1 || argValue[NUM_0] == nullptr) {
        return udfVar;
    }
    int32_t res = OH_PixelMap_CreateAlphaPixelMap(env, argValue[NUM_0], &alphaPixelmap);
    if (res != IMAGE_RESULT_SUCCESS || alphaPixelmap == nullptr) {
        return udfVar;
    }
    return alphaPixelmap;
}
static NativePixelMap* getNativePixelMap(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_1 || argValue[NUM_0] == nullptr) {
        return nullptr;
    }
    return OH_PixelMap_InitNativePixelMap(env, argValue[NUM_0]);
}

napi_value ImagePixelMapNDKTest::InitNativePixelMap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    NativePixelMap* native = getNativePixelMap(env, info);
    if (native == nullptr) {
        return result;
    }

    napi_create_int32(env, IMAGE_RESULT_SUCCESS, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::GetBytesNumberPerRow(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    NativePixelMap* native = getNativePixelMap(env, info);
    if (native == nullptr) {
        return result;
    }

    int32_t rowBytes = NUM_0;
    int32_t res = OH_PixelMap_GetBytesNumberPerRow(native, &rowBytes);
    if (res != IMAGE_RESULT_SUCCESS || rowBytes == NUM_0) {
        return result;
    }

    napi_create_int32(env, rowBytes, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::GetIsEditable(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    NativePixelMap* native = getNativePixelMap(env, info);
    if (native == nullptr) {
        return result;
    }

    int32_t editable = NUM_0;
    int32_t res = OH_PixelMap_GetIsEditable(native, &editable);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }

    napi_create_int32(env, editable, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::IsSupportAlpha(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    NativePixelMap* native = getNativePixelMap(env, info);
    if (native == nullptr) {
        return result;
    }

    int32_t supportAlpha = NUM_0;
    int32_t res = OH_PixelMap_IsSupportAlpha(native, &supportAlpha);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }

    napi_create_int32(env, supportAlpha, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::SetAlphaAble(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_2 || argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return result;
    }
    NativePixelMap* native = OH_PixelMap_InitNativePixelMap(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }

    int32_t alphaAble = NUM_0;
    if (napi_get_value_int32(env, argValue[NUM_1], &alphaAble) != napi_ok) {
        return result;
    }

    int32_t res = OH_PixelMap_SetAlphaAble(native, alphaAble);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::GetDensity(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    NativePixelMap* native = getNativePixelMap(env, info);
    if (native == nullptr) {
        return result;
    }

    int32_t density = NUM_0;
    int32_t res = OH_PixelMap_GetDensity(native, &density);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }

    napi_create_int32(env, density, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::SetDensity(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_2 || argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return result;
    }

    NativePixelMap* native = OH_PixelMap_InitNativePixelMap(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }

    int32_t density = NUM_0;
    if (napi_get_value_int32(env, argValue[NUM_1], &density) != napi_ok) {
        return result;
    }

    int32_t res = OH_PixelMap_SetDensity(native, density);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::SetOpacity(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_2 || argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return result;
    }

    NativePixelMap* native = OH_PixelMap_InitNativePixelMap(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }

    double opacity = NUM_0;
    if (napi_get_value_double(env, argValue[NUM_1], &opacity) != napi_ok) {
        return result;
    }

    int32_t res = OH_PixelMap_SetOpacity(native, static_cast<float>(opacity));
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::Scale(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_3 || argValue[NUM_0] == nullptr ||
        argValue[NUM_1] == nullptr || argValue[NUM_2] == nullptr) {
        return result;
    }
    NativePixelMap* native = OH_PixelMap_InitNativePixelMap(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }
    double x = NUM_0;
    double y = NUM_0;
    if (napi_get_value_double(env, argValue[NUM_1], &x) != napi_ok ||
        napi_get_value_double(env, argValue[NUM_2], &y) != napi_ok) {
        return result;
    }

    int32_t res = OH_PixelMap_Scale(native, static_cast<float>(x), static_cast<float>(y));
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::Translate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_3 || argValue[NUM_0] == nullptr ||
        argValue[NUM_1] == nullptr || argValue[NUM_2] == nullptr) {
        return result;
    }

    NativePixelMap* native = OH_PixelMap_InitNativePixelMap(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }

    double x = NUM_0;
    double y = NUM_0;
    if (napi_get_value_double(env, argValue[NUM_1], &x) != napi_ok ||
        napi_get_value_double(env, argValue[NUM_2], &y) != napi_ok) {
        return result;
    }

    int32_t res = OH_PixelMap_Translate(native, static_cast<float>(x), static_cast<float>(y));
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::Rotate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_2 || argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return result;
    }

    NativePixelMap* native = OH_PixelMap_InitNativePixelMap(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }

    double angle = NUM_0;
    if (napi_get_value_double(env, argValue[NUM_1], &angle) != napi_ok) {
        return result;
    }

    int32_t res = OH_PixelMap_Rotate(native, static_cast<float>(angle));
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::Flip(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_3 || argValue[NUM_0] == nullptr ||
        argValue[NUM_1] == nullptr || argValue[NUM_2] == nullptr) {
        return result;
    }

    NativePixelMap* native = OH_PixelMap_InitNativePixelMap(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }

    int32_t x = NUM_0;
    int32_t y = NUM_0;
    if (napi_get_value_int32(env, argValue[NUM_1], &x) != napi_ok ||
        napi_get_value_int32(env, argValue[NUM_2], &y) != napi_ok) {
        return result;
    }

    int32_t res = OH_PixelMap_Flip(native, x, y);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::Crop(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_5] = {0};
    size_t argCount = NUM_5;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_5 || argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr ||
        argValue[NUM_2] == nullptr || argValue[NUM_3] == nullptr || argValue[NUM_4] == nullptr) {
        return result;
    }

    NativePixelMap* native = OH_PixelMap_InitNativePixelMap(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }

    int32_t x = NUM_0;
    int32_t y = NUM_0;
    int32_t width = NUM_0;
    int32_t height = NUM_0;
    if (napi_get_value_int32(env, argValue[NUM_1], &x) != napi_ok ||
        napi_get_value_int32(env, argValue[NUM_2], &y) != napi_ok ||
        napi_get_value_int32(env, argValue[NUM_3], &width) != napi_ok ||
        napi_get_value_int32(env, argValue[NUM_4], &height) != napi_ok) {
        return result;
    }

    int32_t res = OH_PixelMap_Crop(native, x, y, width, height);
    napi_create_int32(env, res, &result);
    return result;
}

static void setInt32NamedProperty(napi_env env, napi_value object, const char* utf8name, uint32_t value)
{
    napi_value tmp;
    napi_create_int32(env, value, &tmp);
    napi_set_named_property(env, object, utf8name, tmp);
}

static void setUint32NamedProperty(napi_env env, napi_value object, const char* utf8name, uint32_t value)
{
    napi_value tmp;
    napi_create_uint32(env, value, &tmp);
    napi_set_named_property(env, object, utf8name, tmp);
}

napi_value ImagePixelMapNDKTest::GetImageInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    NativePixelMap* native = getNativePixelMap(env, info);
    if (native == nullptr) {
        return result;
    }

    OhosPixelMapInfos pixelmapInfo;
    int32_t res = OH_PixelMap_GetImageInfo(native, &pixelmapInfo);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }
    napi_create_object(env, &result);
    setUint32NamedProperty(env, result, "width", pixelmapInfo.width);
    setUint32NamedProperty(env, result, "height", pixelmapInfo.height);
    setUint32NamedProperty(env, result, "rowSize", pixelmapInfo.rowSize);
    setInt32NamedProperty(env, result, "pixelFormat", pixelmapInfo.pixelFormat);
    return result;
}

napi_value ImagePixelMapNDKTest::AccessPixels(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    NativePixelMap* native = getNativePixelMap(env, info);
    if (native == nullptr) {
        return result;
    }

    void* pixelAddr = nullptr;
    int32_t res = OH_PixelMap_AccessPixels(native, &pixelAddr);
    if (res != IMAGE_RESULT_SUCCESS || pixelAddr == nullptr) {
        return result;
    }
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ImagePixelMapNDKTest::UnAccessPixels(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    NativePixelMap* native = getNativePixelMap(env, info);
    if (native == nullptr) {
        return result;
    }

    int32_t res = OH_PixelMap_UnAccessPixels(native);
    napi_create_int32(env, res, &result);
    return result;
}

EXTERN_C_START
static napi_value ModuleRegister(napi_env env, napi_value exports)
{
    ImagePixelMapNDKTest::Init(env, exports);
    return exports;
}

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = ModuleRegister,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

__attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
EXTERN_C_END
