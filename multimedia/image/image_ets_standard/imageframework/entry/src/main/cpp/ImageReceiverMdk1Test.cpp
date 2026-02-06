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

#include "ImageReceiverMdk1Test.h"
#include "node_api.h"
#include <string>
#include "hilog/log.h"
#include "multimedia/image_framework/image/image_receiver_native.h"
#include <map>

#define IMAGE_LOG_TAG "IMAGE_RECEIVER_TAGLOG"
#define IMAGE_LOG_DOMAIN 0x3200
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)

constexpr uint32_t NUM_0 = 0;
constexpr uint32_t NUM_1 = 1;
constexpr uint32_t NUM_2 = 2;
constexpr uint32_t NUM_3 = 3;
constexpr uint32_t NUM_4 = 4;
constexpr uint32_t NUM_100 = 100;
constexpr uint32_t NUM_200 = 200;

constexpr size_t ID_SIZE = 64;
static constexpr int32_t NUM_1000 = 1000;
static constexpr int32_t NUM_2000 = 2000;
static constexpr int32_t NUM_3000 = 3000;

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

uint32_t g_sOnEvnentCount = 0;

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
template <int NUM>
bool GetArgs(napi_env env, napi_callback_info info, napi_value (&argv)[NUM], int32_t (&params)[NUM])
{
    size_t argc = NUM;
    if (napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr) != napi_ok ||
        !CheckArgs(argc, argv, NUM)) {
        return false;
    }

    for (size_t i = NUM_0; i < argc; i++) {
        if (napi_get_value_int32(env, argv[i], &params[i]) != napi_ok) {
            return false;
        }
    }

    return true;
}

napi_value JsCreateImageReceiverMdk(napi_env env, napi_callback_info info)
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


void OnEventCallback()
{
    LOG("OnEventCallback IN [%{public}p]", &g_sOnEvnentCount);
    g_sOnEvnentCount++;
}

napi_value JsReadLatestImage(napi_env env, napi_callback_info info)
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

napi_value JsOn(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageReceiverNative* native = getNativeReceiver(env, info);
    if (native == nullptr) {
        return result;
    }

    g_sOnEvnentCount = NUM_0;
    int32_t res = OH_Image_Receiver_On(native, OnEventCallback);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value JsImageFormat(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageNative* native = getNativeImage(env, info);
    if (native == nullptr) {
        return result;
    }
    int32_t format;
    int32_t res = OH_Image_Format(native, &format);
    
    int32_t resultValue = res == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsImageFormatBadParameter(napi_env env, napi_callback_info info)
{
    struct OhosImageReceiverInfo receiverInfo;
    napi_value receiver = nullptr;
    receiverInfo.width = NUM_100;
    receiverInfo.height = NUM_200;
    receiverInfo.format = OHOS_IMAGE_FORMAT_JPEG;
    receiverInfo.capicity = NUM_1;

    OH_Image_Receiver_CreateImageReceiver(env, receiverInfo, &receiver);
    ImageNative *native = OH_Image_InitImageNative(env, receiver);
    if (native == nullptr) {
        return nullptr;
    }
    int32_t format ;
    int32_t res = OH_Image_Format(native, &format);
    OH_Image_Release(native);
    int32_t resultValue = res == IMAGE_RESULT_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsImageFormatJniEnvAbnormal(napi_env env, napi_callback_info info)
{
    int32_t format;
    int32_t res = OH_Image_Format(nullptr, &format);
    LOG("JsImageFormat format is: %{public}d", format);

    int32_t resultValue = res == IMAGE_RESULT_JNI_ENV_ABNORMAL ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsReceiverRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageReceiverNative *native = getNativeReceiver(env, info);
    if (native == nullptr) {
        return result;
    }

    int32_t res = OH_Image_Receiver_Release(native);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value JsImageFormatYcbcr422Sp(napi_env env, napi_callback_info info)
{
    struct OhosImageReceiverInfo receiverInfo;
    napi_value receiver = nullptr;
    receiverInfo.width = NUM_100;
    receiverInfo.height = NUM_200;
    receiverInfo.format = OHOS_IMAGE_FORMAT_YCBCR_422_SP;
    receiverInfo.capicity = NUM_1;
    
    int32_t res = OH_Image_Receiver_CreateImageReceiver(env, receiverInfo, &receiver);

    LOG("OH_Image_Receiver_CreateImageReceiver is: %{public}d", res);

    int32_t resultValue = res == IMAGE_RESULT_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JsImageFormatJPEG(napi_env env, napi_callback_info info)
{
    struct OhosImageReceiverInfo receiverInfo;
    napi_value receiver = nullptr;
    receiverInfo.width = NUM_100;
    receiverInfo.height = NUM_200;
    receiverInfo.format = OHOS_IMAGE_FORMAT_JPEG;
    receiverInfo.capicity = NUM_1;
    
    int32_t res = OH_Image_Receiver_CreateImageReceiver(env, receiverInfo, &receiver);
    
    int32_t resultValue = res == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsImageComponentFormatYUVY(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !CheckArgs(argCount, argValue, NUM_1)) {
        return result;
    }
    ImageNative* native = OH_Image_InitImageNative(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }

    struct OhosImageComponent component;
    int32_t res = OH_Image_GetComponent(native, OHOS_IMAGE_COMPONENT_FORMAT_YUV_Y, &component);
    
    int32_t resultValue = res == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JsImageComponentFormatYUVU(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !CheckArgs(argCount, argValue, NUM_1)) {
        return result;
    }
    ImageNative* native = OH_Image_InitImageNative(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }

    struct OhosImageComponent component;
    int32_t res = OH_Image_GetComponent(native, OHOS_IMAGE_COMPONENT_FORMAT_YUV_U, &component);
    
    int32_t resultValue = res == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JsImageComponentFormatYUVV(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !CheckArgs(argCount, argValue, NUM_1)) {
        return result;
    }
    ImageNative* native = OH_Image_InitImageNative(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }
    struct OhosImageComponent component;
    int32_t res = OH_Image_GetComponent(native, OHOS_IMAGE_COMPONENT_FORMAT_YUV_V, &component);
    
    int32_t resultValue = res == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JsImageComponentFormatJPEG(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        !CheckArgs(argCount, argValue, NUM_1)) {
        return result;
    }
    ImageNative* native = OH_Image_InitImageNative(env, argValue[NUM_0]);
    if (native == nullptr) {
        return result;
    }

    struct OhosImageComponent component;
    int32_t res = OH_Image_GetComponent(native, OHOS_IMAGE_COMPONENT_FORMAT_JPEG, &component);
    
    int32_t resultValue = res == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsImageGetComponent(napi_env env, napi_callback_info info)
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
    
    int32_t resultValue = res == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsImageGetComponentBadParameter(napi_env env, napi_callback_info info)
{
    struct OhosImageReceiverInfo receiverInfo;
    napi_value receiver = nullptr;
    receiverInfo.width = NUM_100;
    receiverInfo.height = NUM_200;
    receiverInfo.format = OHOS_IMAGE_FORMAT_JPEG;
    receiverInfo.capicity = NUM_1;

    OH_Image_Receiver_CreateImageReceiver(env, receiverInfo, &receiver);
    
    ImageNative *native = OH_Image_InitImageNative(env, receiver);

    if (native == nullptr) {
        LOG("OH_Image_GetComponent native  is: nullptr");
    }
    
    struct OhosImageComponent component;
    int32_t res = OH_Image_GetComponent(native, OHOS_IMAGE_COMPONENT_FORMAT_JPEG, &component);
    
    OH_Image_Release(native);
    
    int32_t resultValue = res == IMAGE_RESULT_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JsImageGetComponentJniEnvAbnormal(napi_env env, napi_callback_info info)
{
    struct OhosImageComponent component;
    int32_t res = OH_Image_GetComponent(nullptr, OHOS_IMAGE_COMPONENT_FORMAT_JPEG, &component);

    LOG("JsImageFormat format is: %{public}d", res);

    int32_t resultValue = res == IMAGE_RESULT_JNI_ENV_ABNORMAL ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsImageClipRect(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageNative* native = getNativeImage(env, info);
    if (native == nullptr) {
        return result;
    }
    struct OhosImageRect rect;
    int32_t res = OH_Image_ClipRect(native, &rect);

    int32_t resultValue = res == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JsImageClipBadParameter(napi_env env, napi_callback_info info)
{
    struct OhosImageRect rect;
    int32_t res = OH_Image_ClipRect(nullptr, &rect);

    int32_t resultValue = res == IMAGE_RESULT_BAD_PARAMETER ? 0 : -1;
    
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}


napi_value JsImageSize(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageNative* native = getNativeImage(env, info);
    if (native == nullptr) {
        return result;
    }
    struct OhosImageSize size;
    int32_t res = OH_Image_Size(native, &size);

    int32_t resultValue = res == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}


napi_value JsImageSizeJniEnvAbnormal(napi_env env, napi_callback_info info)
{
    struct OhosImageSize size;
    int32_t res = OH_Image_Size(nullptr, &size);

    int32_t resultValue = res == IMAGE_RESULT_JNI_ENV_ABNORMAL ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JsImageRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    ImageNative *native = getNativeImage(env, info);
    if (native == nullptr) {
        return result;
    }

    int32_t res = OH_Image_Release(native);
    int32_t resultValue = res == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}