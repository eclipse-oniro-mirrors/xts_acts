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

#include "image_receiver_mdk_test.h"
#include "node_api.h"
#include <string>
#include "hilog/log.h"

namespace {
    constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, 0xD002B05, "ImageReceiverNDKTest"};
}

namespace {
    constexpr uint32_t NUM_0 = 0;
    constexpr uint32_t NUM_1 = 1;
    constexpr uint32_t NUM_2 = 2;
    constexpr uint32_t NUM_3 = 3;
    constexpr uint32_t NUM_4 = 4;
    constexpr size_t ID_SIZE = 64;
}

namespace OHOS {
namespace Media {
#define STATIC_FUNCTION(n, f) { (n), nullptr, (f), nullptr, nullptr, nullptr, napi_static, nullptr }
uint32_t ImageReceiverNDKTest::sOnEvnentCount = 0;
napi_value ImageReceiverNDKTest::Init(napi_env env, napi_value exports)
{
    napi_property_descriptor props[] = {
        STATIC_FUNCTION("createImageReceiver", JsCreateImageReceiver),
        STATIC_FUNCTION("getReceivingSurfaceId", JsGetReceivingSurfaceId),
        STATIC_FUNCTION("readLatestImage", JsReadLatestImage),
        STATIC_FUNCTION("readNextImage", JsReadNextImage),
        STATIC_FUNCTION("on", JsOn),
        STATIC_FUNCTION("getSize", JsGetSize),
        STATIC_FUNCTION("getCapacity", JsGetCapacity),
        STATIC_FUNCTION("getFormat", JsGetFormat),
        STATIC_FUNCTION("getOnEventCount", JsGetOnEventCount),
        STATIC_FUNCTION("imageClipRect", JsImageClipRect),
        STATIC_FUNCTION("imageSize", JsImageSize),
        STATIC_FUNCTION("imageFormat", JsImageFormat),
        STATIC_FUNCTION("imageGetComponent", JsImageGetComponent),
        STATIC_FUNCTION("receiverRelease", JsReceiverRelease),
        STATIC_FUNCTION("imageRelease", JsImageRelease),
    };
    napi_define_properties(env, exports, sizeof(props) / sizeof(props[0]), props);
    return exports;
}
static bool CheckArgs(size_t count, const napi_value* argValues, size_t exceptCount)
{
    if (count != exceptCount) {
        return false;
    }
    for (size_t i = NUM_0; i < count; i++) {
        if (argValues[i] == nullptr) {
            return false;
        }
    }
    return true;
}

napi_value ImageReceiverNDKTest::JsCreateImageReceiver(napi_env env, napi_callback_info info)
{
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;
    struct OhosImageReceiverInfo receiverInfo;
    napi_value receiver = nullptr;
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !CheckArgs(argCount, argValue, NUM_4) ||
        napi_get_value_int32(env, argValue[NUM_0], &(receiverInfo.width)) != napi_ok ||
        napi_get_value_int32(env, argValue[NUM_1], &(receiverInfo.height)) != napi_ok ||
        napi_get_value_int32(env, argValue[NUM_2], &(receiverInfo.format)) != napi_ok ||
        napi_get_value_int32(env, argValue[NUM_3], &(receiverInfo.capicity)) != napi_ok) {
        return udfVar;
    }
    int32_t res = OH_Image_Receiver_CreateImageReceiver(env, receiverInfo, &receiver);
    if (res != IMAGE_RESULT_SUCCESS || receiver == nullptr) {
        return udfVar;
    }
    return receiver;
}

static ImageReceiverNative* getNativeReceiver(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_1 || argValue[NUM_0] == nullptr) {
        return nullptr;
    }
    return OH_Image_Receiver_InitImageReceiverNative(env, argValue[NUM_0]);
}

napi_value ImageReceiverNDKTest::JsGetReceivingSurfaceId(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageReceiverNative* native = getNativeReceiver(env, info);
    if (native == nullptr) {
        return result;
    }
    char buf[ID_SIZE] = {0};
    int32_t res = OH_Image_Receiver_GetReceivingSurfaceId(native, buf, ID_SIZE);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }
    HiviewDFX::HiLog::Debug(LABEL, "JsGetReceivingSurfaceId IN [%{public}x]", buf[0]);
    HiviewDFX::HiLog::Debug(LABEL, "JsGetReceivingSurfaceId IN [%{public}c]", *buf);
    HiviewDFX::HiLog::Debug(LABEL, "JsGetReceivingSurfaceId IN [%{public}s]", buf);
    napi_create_string_utf8(env, buf, NAPI_AUTO_LENGTH, &result);
    return result;
}

napi_value ImageReceiverNDKTest::JsReadLatestImage(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageReceiverNative* native = getNativeReceiver(env, info);
    if (native == nullptr) {
        return result;
    }

    int32_t res = OH_Image_Receiver_ReadLatestImage(native, &result);
    if (res != IMAGE_RESULT_SUCCESS) {
        napi_get_undefined(env, &result);
        return result;
    }
    return result;
}

napi_value ImageReceiverNDKTest::JsReadNextImage(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageReceiverNative* native = getNativeReceiver(env, info);
    if (native == nullptr) {
        return result;
    }

    int32_t res = OH_Image_Receiver_ReadNextImage(native, &result);
    if (res != IMAGE_RESULT_SUCCESS) {
        napi_get_undefined(env, &result);
        return result;
    }
    return result;
}
void ImageReceiverNDKTest::OnEvent()
{
    HiviewDFX::HiLog::Debug(LABEL, "ImageReceiverNDKTest::OnEvent IN [%{public}p]", &sOnEvnentCount);
    sOnEvnentCount++;
}

napi_value ImageReceiverNDKTest::JsOn(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageReceiverNative* native = getNativeReceiver(env, info);
    if (native == nullptr) {
        return result;
    }

    sOnEvnentCount = NUM_0;
    int32_t res = OH_Image_Receiver_On(native, OnEvent);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ImageReceiverNDKTest::JsReceiverRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageReceiverNative *native = getNativeReceiver(env, info);
    if (native == nullptr)
    {
        return result;
    }

    int32_t res = OH_Image_Receiver_Release(native);
    napi_create_int32(env, res, &result);
    return result;
}

static void setInt32NamedProperty(napi_env env, napi_value object, const char* utf8name, int32_t value)
{
    napi_value tmp;
    napi_create_int32(env, value, &tmp);
    napi_set_named_property(env, object, utf8name, tmp);
}

static void setByteArrayNamedProperty(napi_env env, napi_value object,
    const char* utf8name, uint8_t* buffer, size_t size)
{
    napi_value tmp;
    napi_create_external_arraybuffer(env, buffer, size,
        [](napi_env env, void* data, void* hint) { }, nullptr, &tmp);
    napi_set_named_property(env, object, utf8name, tmp);
}

napi_value ImageReceiverNDKTest::JsGetSize(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageReceiverNative* native = getNativeReceiver(env, info);
    if (native == nullptr) {
        return result;
    }
    struct OhosImageSize size;
    int32_t res = OH_Image_Receiver_GetSize(native, &size);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }

    napi_create_object(env, &result);
    setInt32NamedProperty(env, result, "width", size.width);
    setInt32NamedProperty(env, result, "height", size.height);
    return result;
}

napi_value ImageReceiverNDKTest::JsGetCapacity(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageReceiverNative* native = getNativeReceiver(env, info);
    if (native == nullptr) {
        return result;
    }
    int32_t capacity;
    int32_t res = OH_Image_Receiver_GetCapacity(native, &capacity);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }
    napi_create_int32(env, capacity, &result);
    return result;
}

napi_value ImageReceiverNDKTest::JsGetFormat(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageReceiverNative* native = getNativeReceiver(env, info);
    if (native == nullptr) {
        return result;
    }
    int32_t format;
    int32_t res = OH_Image_Receiver_GetFormat(native, &format);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }
    napi_create_int32(env, format, &result);
    return result;
}

napi_value ImageReceiverNDKTest::JsGetOnEventCount(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_uint32(env, sOnEvnentCount, &result);
    return result;
}

static ImageNative* getNativeImage(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_1 || argValue[NUM_0] == nullptr) {
        return nullptr;
    }
    return OH_Image_InitImageNative(env, argValue[NUM_0]);
}

napi_value ImageReceiverNDKTest::JsImageRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageNative *native = getNativeImage(env, info);
    if (native == nullptr)
    {
        return result;
    }

    int32_t res = OH_Image_Release(native);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ImageReceiverNDKTest::JsImageClipRect(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageNative* native = getNativeImage(env, info);
    if (native == nullptr) {
        return result;
    }
    struct OhosImageRect rect;
    int32_t res = OH_Image_ClipRect(native, &rect);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }

    napi_create_object(env, &result);
    setInt32NamedProperty(env, result, "x", rect.x);
    setInt32NamedProperty(env, result, "y", rect.y);
    setInt32NamedProperty(env, result, "width", rect.width);
    setInt32NamedProperty(env, result, "height", rect.height);
    return result;
}

napi_value ImageReceiverNDKTest::JsImageSize(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageNative* native = getNativeImage(env, info);
    if (native == nullptr) {
        return result;
    }
    struct OhosImageSize size;
    int32_t res = OH_Image_Size(native, &size);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }
    napi_create_object(env, &result);
    setInt32NamedProperty(env, result, "width", size.width);
    setInt32NamedProperty(env, result, "height", size.height);
    return result;
}

napi_value ImageReceiverNDKTest::JsImageFormat(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageNative* native = getNativeImage(env, info);
    if (native == nullptr) {
        return result;
    }
    int32_t format;
    int32_t res = OH_Image_Format(native, &format);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }
    napi_create_uint32(env, format, &result);
    return result;
}

napi_value ImageReceiverNDKTest::JsImageGetComponent(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !CheckArgs(argCount, argValue, NUM_2)) {
        return result;
    }
    ImageNative* native = OH_Image_InitImageNative(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }
    int32_t componentType;
    napi_get_value_int32(env, argValue[NUM_1], &componentType);

    struct OhosImageComponent component;
    int32_t res = OH_Image_GetComponent(native, componentType, &component);
    if (res != IMAGE_RESULT_SUCCESS) {
        return result;
    }

    napi_create_object(env, &result);
    HiviewDFX::HiLog::Debug(LABEL, "ImageReceiverNDKTest::JsImageGetComponent IN [%{public}p]", component.byteBuffer);
    setByteArrayNamedProperty(env, result, "byteBuffer", component.byteBuffer, component.size);
    setInt32NamedProperty(env, result, "componentType", component.componentType);
    setInt32NamedProperty(env, result, "rowStride", component.rowStride);
    setInt32NamedProperty(env, result, "pixelStride", component.pixelStride);
    return result;
}

EXTERN_C_START
napi_value ModuleRegister(napi_env env, napi_value exports)
{
    ImageReceiverNDKTest::Init(env, exports);
    return exports;
}

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = ModuleRegister,
    .nm_modname = "ImageReceiverNDKTest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

__attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
EXTERN_C_END
}
}