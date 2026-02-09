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

#include "napi/native_api.h"
#include "utils/CommonUtilsTest.h"
#include "utils/PixelmapHelperTest.h"
#include <hilog/log.h>


#include <multimedia/image_framework/image_receiver_mdk.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <multimedia/image_framework/image/image_common.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <native_color_space_manager/native_color_space_manager.h>
#include "OHPixelMapSupplementTest.h"

#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageEffectNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8
#define CASE_INDEX_9 9
#define CASE_INDEX_10 10
#define CASE_INDEX_11 11
#define IMAGE_EFFECT_2 2
#define IMAGE_EFFECT_100 100
#define IMAGE_EFFECT_100F 100.f
#define IMAGE_EFFECT_50F 50.f
#define IMAGE_EFFECT_100D 100.0
#define IMAGE_EFFECT_1000 1000
#define IMAGE_EFFECT_1024 1024
#define IMAGE_EFFECT_1048576 1048576
#define IMAGE_EFFECT_1073741824 1073741824
#define IMAGE_EFFECT_1080 1080
#define IMAGE_EFFECT_1920 1920
#define IMAGE_EFFECT_4090 4090
#define IMAGE_EFFECT_5120 5120
#define IMAGE_EFFECT_CODE_401 401
#define IMAGE_EFFECT_1722514390000 1722514390000

#define OPTION_WIDTH 4
#define OPTION_HEIGHT 6
#define OPTION_PIXEL_FORMAT 9
#define OPTION_ALPHA_TYPE 0
#define OPTION_TRANSLATE_X_50 50
#define OPTION_TRANSLATE_Y_50 50
#define OPTION_TRANSLATE_X (-50)
#define OPTION_TRANSLATE_Y (-50)
#define OPTION_ANGLE_90 90
#define OPTION_ANGLE_180 180

#define IMAGE_OUT_BUFFER_SIZE (50 * 50 * 4)
#define IMAGE_DATA_LENGTH_SMALL (80 * 80 * 4)
#define IMAGE_DATA_LENGTH_BIG (100 * 100 * 4)
#define IMAGE_DATA_LENGTH (100 * 100)

napi_value CreatePixelMapTest(napi_env env, napi_callback_info info)
{
    napi_value udfVar = nullptr;
    napi_value pixelMap = nullptr;

    struct OhosPixelMapCreateOps createOps;
    createOps.width = OPTION_WIDTH;
    createOps.height = OPTION_HEIGHT;
    createOps.pixelFormat = OPTION_PIXEL_FORMAT;
    createOps.alphaType = OPTION_ALPHA_TYPE;
    size_t bufferSize = createOps.width * createOps.height * 4;
    void *buff = malloc(bufferSize);
    if (buff == nullptr) {
        return udfVar;
    }

    char *cc = reinterpret_cast<char *>(buff);
    for (int i = 0; i < bufferSize; ++i) {
        *(cc++) = static_cast<char>(i);
    }
    int32_t res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
    free(buff);
    if (res != IMAGE_RESULT_SUCCESS || pixelMap == nullptr) {
        return udfVar;
    }
    return pixelMap;
}
napi_value OHPixelMapTranslateSupplementTest(napi_env env, napi_callback_info info)
{
    LOGI("OHPixelMapTranslateSupplementTest start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OHPixelMapTranslateSupplementTest error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);

    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    NativePixelMap *native = OH_PixelMap_InitNativePixelMap(env, CreatePixelMapTest(env, info));
    if (native == nullptr) {
        LOGI("OHPixelMapTranslateSupplementTest error2");
        return result;
    }
    int32_t imageResult;
    float x = OPTION_TRANSLATE_X_50;
    float y = OPTION_TRANSLATE_Y_50;
    switch (index) {
    case CASE_INDEX_1:
        imageResult = OH_PixelMap_Translate(native, x, y);
        break;
    case CASE_INDEX_2:
        imageResult = OH_PixelMap_Translate(nullptr, x, y);
        break;
    case CASE_INDEX_3:
        x = OPTION_TRANSLATE_X;
        y = OPTION_TRANSLATE_Y;
        imageResult = OH_PixelMap_Translate(native, x, y);
        break;
    default:
        break;
    }
    LOGI("OHPixelMapTranslateSupplementTest 值：%{public}d  %{public}d ", x, y, imageResult);
    napi_value ret;
    napi_create_int32(env, imageResult, &ret);
    return ret;
}
napi_value OHPixelMapRotateSupplementTest(napi_env env, napi_callback_info info)
{
    LOGI("OHPixelMapRotateSupplementTest start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OHPixelMapRotateSupplementTest error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);

    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    NativePixelMap *native = OH_PixelMap_InitNativePixelMap(env, CreatePixelMapTest(env, info));
    if (native == nullptr) {
        LOGI("OHPixelMapRotateSupplementTest error2");
        return result;
    }
    int32_t imageResult;
    float angle = OPTION_ANGLE_90;
    switch (index) {
    case CASE_INDEX_1:
        imageResult = OH_PixelMap_Rotate(native, angle);
        break;
    case CASE_INDEX_2:
        imageResult = OH_PixelMap_Rotate(nullptr, angle);
        break;
    case CASE_INDEX_3:
        angle = OPTION_ANGLE_180;
        imageResult = OH_PixelMap_Rotate(native, angle);
        break;
    default:
        break;
    }
    LOGI("OHPixelMapRotateSupplementTest 值：%{public}d  %{public}d ", angle, imageResult);
    napi_value ret;
    napi_create_int32(env, imageResult, &ret);
    return ret;
}
napi_value OHEffectFilterCreateSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *filter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        filter = OH_EffectFilter_Create(nullptr);
        break;
    default:
        break;
    }
    int code = IMAGE_EFFECT_CODE_401;
    if (filter != nullptr) {
        OH_EffectFilter_Release(filter);
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value OHEffectFilterInfoCreateSupplementTest(napi_env env, napi_callback_info info)
{
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    OH_EffectFilterInfo_Release(filterInfo);
    napi_value ret;
    int status = -1;
    if (filterInfo != nullptr) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}
napi_value OHEffectBufferInfoCreateSupplementTest(napi_env env, napi_callback_info info)
{
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_value ret;
    int status = -1;
    if (bufferInfo != nullptr) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}
napi_value OHEffectBufferInfoSetAddrSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    void *addr = malloc(IMAGE_EFFECT_1000);
    switch (index) {
    case CASE_INDEX_1:
        break;
    case CASE_INDEX_2:
        bufferInfo = nullptr;
        break;
    case CASE_INDEX_3:
        addr = nullptr;
        break;
    case CASE_INDEX_4:
        addr = nullptr;
        bufferInfo = nullptr;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetAddr(bufferInfo, addr);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value OHEffectBufferInfoGetAddrSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    napi_value ret;
    napi_create_int32(env, code, &ret);
    
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    void *setAddr = malloc(IMAGE_EFFECT_1000);
    void *retAddr = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectBufferInfo_SetAddr(bufferInfo, setAddr);
        code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
        if (retAddr != setAddr) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
        break;
    case CASE_INDEX_3:
        code = OH_EffectBufferInfo_GetAddr(nullptr, &retAddr);
        break;
    default:
        break;
    }
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value CreateImageReceiverSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    struct OhosImageReceiverInfo receiverInfo;
    int32_t returnValue;
    napi_value receiver = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_Image_Receiver_CreateImageReceiver(env, receiverInfo, &receiver);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHPixelmapNativeSetColorSpaceNativeSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_PixelmapNative *pixelmap = nullptr;

    Image_ErrorCode returnValue;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    returnValue = OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, 100);
    OH_PixelmapInitializationOptions_SetHeight(options, 100);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    returnValue = OH_PixelmapInitializationOptions_SetSrcPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    uint8_t *dummyData = new (std::nothrow) uint8_t[100 * 100 * 4]();
    returnValue = OH_PixelmapNative_CreatePixelmap(dummyData, 100 * 100 * 4, options, &pixelmap);
    OH_NativeColorSpaceManager *srcColorspace = OH_NativeColorSpaceManager_CreateFromName(BT709);
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_PixelmapNative_SetColorSpaceNative(pixelmap, srcColorspace);
        break;
    default:
        break;
    }

    OH_PixelmapNative_Release(pixelmap);

    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHPixelmapNativeGetColorSpaceNativeSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    napi_value ret;
    OH_PixelmapNative *pixelmap = nullptr;
    OH_NativeColorSpaceManager *getColorSpaceNative = nullptr;
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        pixelmap = nullptr;
        returnValue = OH_PixelmapNative_GetColorSpaceNative(pixelmap, &getColorSpaceNative);
        break;
    default:
        break;
    }
    OH_PixelmapNative_Release(pixelmap);
   
    napi_create_int32(env, returnValue, &ret);
    return ret;
}
napi_value OHPixelmapNativeUnaccessPixelsSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    OH_PixelmapNative *pixelmap = nullptr;
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        pixelmap = nullptr;
        returnValue = OH_PixelmapNative_UnaccessPixels(pixelmap);
        break;
    default:
        break;
    }
    OH_PixelmapNative_Release(pixelmap);
   
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHPixelmapNativeAccessPixelsSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    OH_PixelmapNative *pixelmap = nullptr;
    void *addr = nullptr;
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        pixelmap = nullptr;
        returnValue = OH_PixelmapNative_AccessPixels(pixelmap, &addr);
        break;
    default:
        break;
    }
    
    OH_PixelmapNative_Release(pixelmap);
   
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHPixelmapNativeCreateAlphaPixelmapSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
        napi_value ret;
        napi_create_int32(env, IMAGE_BAD_PARAMETER, &ret);
        return ret;
    }
    int32_t index;
    status = napi_get_value_int32(env, args[0], &index);
    if (status != napi_ok) {
        napi_value ret;
        napi_create_int32(env, IMAGE_BAD_PARAMETER, &ret);
        return ret;
    }
    OH_PixelmapNative *srcPixelmap = nullptr;
    OH_PixelmapNative *dstPixelmap = nullptr;

    auto CreateValidPixelmap = [](OH_PixelmapNative **pixelmap) -> Image_ErrorCode {
        OH_Pixelmap_InitializationOptions *options = nullptr;
        Image_ErrorCode err = OH_PixelmapInitializationOptions_Create(&options);
        if (err != IMAGE_SUCCESS) {
            return err;
        }
        OH_PixelmapInitializationOptions_SetWidth(options, 100);
        OH_PixelmapInitializationOptions_SetHeight(options, 100);
        OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
        OH_PixelmapInitializationOptions_SetSrcPixelFormat(options, PIXEL_FORMAT_BGRA_8888);

        uint8_t *dummyData = new (std::nothrow) uint8_t[IMAGE_DATA_LENGTH_BIG]();
        if (dummyData == nullptr) {
            OH_PixelmapInitializationOptions_Release(options);
            return IMAGE_ALLOC_FAILED;
        }

        err = OH_PixelmapNative_CreatePixelmap(dummyData, IMAGE_DATA_LENGTH_BIG, options, pixelmap);
        delete[] dummyData;
        OH_PixelmapInitializationOptions_Release(options);
        return err;
    };
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        srcPixelmap = nullptr;
        code = OH_PixelmapNative_CreateAlphaPixelmap(srcPixelmap, &dstPixelmap);
        break;
    case CASE_INDEX_2: {
        code = CreateValidPixelmap(&srcPixelmap);
        if (code != IMAGE_SUCCESS) {
        }
        code = OH_PixelmapNative_CreateAlphaPixelmap(srcPixelmap, &dstPixelmap);
        break;
    }
    default:
        break;
    }

    OH_PixelmapNative_Release(srcPixelmap);

    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    return result;
}
napi_value OHPixelmapNativeGetUniqueIdSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status napiStatus = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t testIndex = 0;
    napiStatus = napi_get_value_int32(env, args[0], &testIndex);

    OH_PixelmapNative *pixelmap = nullptr;
    uint32_t uniqueId = 0;
    uint32_t *pUniqueId = &uniqueId;
    Image_ErrorCode returnValue;

    const int height = 100;
    const int width = 100;
    switch (testIndex) {
    case CASE_INDEX_1:
        pixelmap = nullptr;
        returnValue = OH_PixelmapNative_GetUniqueId(pixelmap, &uniqueId);
        break;
    case CASE_INDEX_2: {
        OH_Pixelmap_InitializationOptions *options = nullptr;
        returnValue = OH_PixelmapInitializationOptions_Create(&options);
        if (returnValue != IMAGE_SUCCESS) {
            break;
        }
        OH_PixelmapInitializationOptions_SetWidth(options, width);
        OH_PixelmapInitializationOptions_SetHeight(options, height);
        OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
        OH_PixelmapInitializationOptions_SetSrcPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
        uint8_t *dummyData = new (std::nothrow) uint8_t[IMAGE_DATA_LENGTH_BIG]();
        if (dummyData == nullptr) {
            returnValue = IMAGE_ALLOC_FAILED;
            OH_PixelmapInitializationOptions_Release(options);
            break;
        }
        returnValue = OH_PixelmapNative_CreatePixelmap(dummyData, IMAGE_DATA_LENGTH_BIG, options, &pixelmap);
        LOGI("OH_PixelmapNative_CreatePixelmap %{public}d");
        returnValue = OH_PixelmapNative_GetUniqueId(pixelmap, pUniqueId);
        LOGI("OH_PixelmapNative_GetUniqueId %{public}d");
        delete[] dummyData;
        OH_PixelmapInitializationOptions_Release(options);
    } break;
    default:
        break;
    }

    OH_PixelmapNative_Release(pixelmap);

    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHPixelmapNativeIsReleasedSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status napiStatus = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t testIndex = 0;
    napiStatus = napi_get_value_int32(env, args[0], &testIndex);

    OH_PixelmapNative *pixelmap = nullptr;
    bool released = false;
    bool *pReleased = &released;
    Image_ErrorCode returnValue;

    const int height = 100;
    const int width = 100;
    switch (testIndex) {
    case CASE_INDEX_1:
        pixelmap = nullptr;
        returnValue = OH_PixelmapNative_IsReleased(pixelmap, pReleased);
        break;
    case CASE_INDEX_2: {
        OH_Pixelmap_InitializationOptions *options = nullptr;
        returnValue = OH_PixelmapInitializationOptions_Create(&options);
        if (returnValue != IMAGE_SUCCESS) {
            break;
        }
        OH_PixelmapInitializationOptions_SetWidth(options, width);
        OH_PixelmapInitializationOptions_SetHeight(options, height);
        OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
        OH_PixelmapInitializationOptions_SetSrcPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
        uint8_t *dummyData = new (std::nothrow) uint8_t[IMAGE_DATA_LENGTH_SMALL]();
        if (dummyData == nullptr) {
            returnValue = IMAGE_ALLOC_FAILED;
            OH_PixelmapInitializationOptions_Release(options);
            break;
        }
        returnValue = OH_PixelmapNative_CreatePixelmap(dummyData, IMAGE_DATA_LENGTH_SMALL, options, &pixelmap);
        LOGI("OH_PixelmapNative_CreatePixelmap %{public}d");
        returnValue = OH_PixelmapNative_IsReleased(pixelmap, pReleased);
        LOGI("OH_PixelmapNative_IsReleased %{public}d");
        delete[] dummyData;
        OH_PixelmapInitializationOptions_Release(options);
    } break;
    default:
        break;
    }

    OH_PixelmapNative_Release(pixelmap);

    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHPixelmapNativeReadPixelsFromAreaSuppTest(napi_env env, napi_callback_info info) 
{
    uint8_t *buffer;
    size_t bufferSize = 0;
    buffer[10000];
    bufferSize = 1920 * 1080 * 4;
    buffer = (uint8_t *)malloc(bufferSize);
    Image_Region region = {x : 0, y : 0, width : 40, height : 40};
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status napiStatus = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t testIndex = 0;
    napiStatus = napi_get_value_int32(env, args[0], &testIndex);

    OH_PixelmapNative *pixelmap = nullptr;
    uint8_t *outBuffer = nullptr;
    int outBufferSize = 0;
    Image_ErrorCode returnValue;
    Image_PositionArea area = {};
    switch (testIndex) {
    case CASE_INDEX_1: {
        OH_Pixelmap_InitializationOptions *options = nullptr;
        returnValue = OH_PixelmapInitializationOptions_Create(&options);
        if (returnValue != IMAGE_SUCCESS)
            break;
        OH_PixelmapInitializationOptions_SetWidth(options, 100);
        OH_PixelmapInitializationOptions_SetHeight(options, 100);
        OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
        returnValue = OH_PixelmapInitializationOptions_SetSrcPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
        uint8_t *dummyData = new (std::nothrow) uint8_t[100 * 100 * 4]();
        returnValue = OH_PixelmapNative_CreatePixelmap(dummyData, 100 * 100 * 4, options, &pixelmap);
        area = {
            pixels : buffer,
            pixelsSize : bufferSize,
            offset : 0,
            stride : 160,
            region : region,
        };
        returnValue = OH_PixelmapNative_ReadPixelsFromArea(pixelmap, &area);
        delete[] dummyData;
        OH_PixelmapInitializationOptions_Release(options);
    } break;
    case CASE_INDEX_2: {
        pixelmap = nullptr;
        area = {
            pixels : buffer,
            pixelsSize : bufferSize,
            offset : 0,
            stride : 160,
            region : region,
        };
        outBufferSize = IMAGE_OUT_BUFFER_SIZE;
        outBuffer = new (std::nothrow) uint8_t[outBufferSize];
        if (outBuffer != nullptr) {
            returnValue = OH_PixelmapNative_ReadPixelsFromArea(pixelmap, &area);
            delete[] outBuffer;
        }
    } break;
    default:
        break;
    }
    OH_PixelmapNative_Release(pixelmap);

    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHPixelmapNativeWritePixelsToAreaSuppTest(napi_env env, napi_callback_info info)
{
    uint8_t *buffer;
    size_t bufferSize = 0;
    buffer[10000];
    bufferSize = 1920 * 1080 * 4;
    buffer = (uint8_t *)malloc(bufferSize);
    Image_Region region = {x : 0, y : 0, width : 40, height : 40};
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status napiStatus = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t testIndex = 0;
    napiStatus = napi_get_value_int32(env, args[0], &testIndex);

    OH_PixelmapNative *pixelmap = nullptr;
    uint8_t *inBuffer = nullptr;
    int inBufferSize = 0;
    Image_ErrorCode returnValue;
    Image_PositionArea area = {};
    switch (testIndex) {
    case CASE_INDEX_1: {
        OH_Pixelmap_InitializationOptions *options = nullptr;
        returnValue = OH_PixelmapInitializationOptions_Create(&options);
        if (returnValue != IMAGE_SUCCESS)
            break;
        OH_PixelmapInitializationOptions_SetWidth(options, 100);
        OH_PixelmapInitializationOptions_SetHeight(options, 100);
        OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
        returnValue = OH_PixelmapInitializationOptions_SetSrcPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
        uint8_t *dummyData = new (std::nothrow) uint8_t[100 * 100 * 4]();
        returnValue = OH_PixelmapNative_CreatePixelmap(dummyData, 100 * 100 * 4, options, &pixelmap);
        area = {
            pixels : buffer,
            pixelsSize : bufferSize,
            offset : 0,
            stride : 160,
            region : region,
        };
        returnValue = OH_PixelmapNative_WritePixelsToArea(pixelmap, &area);
        delete[] dummyData;
        OH_PixelmapInitializationOptions_Release(options);
    } break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}