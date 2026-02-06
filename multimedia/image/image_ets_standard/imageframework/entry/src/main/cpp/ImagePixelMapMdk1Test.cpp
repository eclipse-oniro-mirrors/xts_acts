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

#include "ImagePixelMapMdk1Test.h"
#include "node_api.h"
#include <string>
#include "hilog/log.h"

#define IMAGE_LOG_TAG "IMAGE_PIXELMAPMDK_TAGLOG"
#define IMAGE_LOG_DOMAIN 0x3200
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)

namespace {
    constexpr uint32_t NUM_0 = 0;
    constexpr uint32_t NUM_1 = 1;
    constexpr uint32_t NUM_2 = 2;
    constexpr uint32_t NUM_3 = 3;
    constexpr uint32_t NUM_4 = 4;
    constexpr size_t ID_SIZE = 64;
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


napi_value CreatePixelMapThirdpartSkiaError(napi_env env, napi_callback_info info)
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
    
    bufferSize = -1;
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);

    int32_t resultValue = errorCode == IMAGE_RESULT_THIRDPART_SKIA_ERROR ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value CreatePixelMapSuccess(napi_env env, napi_callback_info info)
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
    
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapCreatePixelMapResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapGetBytesNumberPerRowResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    int32_t editable = 0;
    errorCode = OH_PixelMap_GetBytesNumberPerRow(Native, &editable);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapGetIsEditableResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    int32_t editable = 0;
    errorCode = OH_PixelMap_GetIsEditable(Native, &editable);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapIsSupportAlphaResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    int32_t editable = 0;
    errorCode = OH_PixelMap_IsSupportAlpha(Native, &editable);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapSetAlphaAbleResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    int32_t editable = 0;
    errorCode = OH_PixelMap_SetAlphaAble(Native, editable);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapGetDensityResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    int32_t editable = 0;
    errorCode = OH_PixelMap_GetDensity(Native, &editable);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapSetOpacityResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    int32_t editable = 0;
    errorCode = OH_PixelMap_SetOpacity(Native, NUM_1);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapScaleResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    errorCode = OH_PixelMap_Scale(Native, NUM_1, NUM_2);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapScaleWithAntiAliasingResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    errorCode = OH_PixelMap_ScaleWithAntiAliasing(Native, NUM_1, NUM_2, OH_PixelMap_AntiAliasing_HIGH);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapTranslateResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    errorCode = OH_PixelMap_Translate(Native, NUM_1, NUM_2);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapRotateResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    errorCode = OH_PixelMap_Rotate(Native, NUM_1);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapFlipResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    errorCode = OH_PixelMap_Flip(Native, NUM_1, NUM_2);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapCropResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    errorCode = OH_PixelMap_Crop(Native, NUM_1, NUM_2, NUM_3, NUM_4);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapGetImageInfoResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    OhosPixelMapInfos *info2 = new OhosPixelMapInfos;
    errorCode = OH_PixelMap_GetImageInfo(Native, info2);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapAccessPixelsResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    double p = 0.0;
    void *pixels = &p;
    errorCode = OH_PixelMap_AccessPixels(Native, &pixels);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value PixelMapUnAccessPixelsResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    errorCode = OH_PixelMap_UnAccessPixels(Native);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value PixelMapSetDensityResultSuccess(napi_env env, napi_callback_info info)
{
    LOG("before ImagePixelMapNDKTest::CreatePixelMap");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    void *buffer = nullptr;
    size_t bufferSize = NUM_0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    LOG("napi_value pixelmap = nullptr;");
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < NUM_2 ||
        argValue[NUM_0] == nullptr || argValue[NUM_1] == nullptr) {
        return udfVar;
    }
    if (napi_get_arraybuffer_info(env, argValue[NUM_0], &buffer, &bufferSize) != napi_ok || buffer == nullptr ||
        bufferSize == NUM_0) {
        return udfVar;
    }
    if (!parseCreateOptions(env, argValue[NUM_1], &createOps)) {
        return udfVar;
    }
    int32_t errorCode = OH_PixelMap_CreatePixelMap(env, createOps, buffer, bufferSize, &pixelmap);
    napi_value alphaPixelmap = nullptr;
    errorCode = OH_PixelMap_CreateAlphaPixelMap(env, pixelmap, &alphaPixelmap);
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    errorCode = OH_PixelMap_SetDensity(Native, NUM_1);
    int32_t resultValue = errorCode == IMAGE_RESULT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}