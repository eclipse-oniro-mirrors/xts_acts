/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <dlfcn.h>
#include <fcntl.h>
#include <iostream>
#include <linux/kd.h>

#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include "multimedia/image_framework/image_pixel_map_mdk.h"
#include "napi/native_api.h"

#include <string>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "MY_TAG"

namespace {
    const uint32_t NUM_0 = 0;
    const uint32_t NUM_1 = 1;
    const uint32_t NUM_2 = 2;
    const uint32_t NUM_3 = 3;
    const uint32_t NUM_4 = 4;
    const uint32_t NUM_5 = 5;
    const uint32_t NUM_6 = 6;
    const uint32_t MAX_BUFFER_SIZE = 512;
    const uint32_t MAX_COLOR_SIZE = 96;
    const uint32_t MAX_QUALITY_SIZE = 98;
    constexpr int8_t ARGB_8888_BYTES = 4;
}

const char *LOG_APP = "ImageNDK";
const char* VPE_SO_NAME = "/sys_prod/lib64/VideoProcessingEngine/libaihdr_engine.so";

static void OHLog(const char *module, const char *format, ...)
{

    char buffer[MAX_BUFFER_SIZE];
    va_list args;
    va_start(args, format);
    vsnprintf(buffer, sizeof(buffer), format, args);
    va_end(args);

    printf("[%s] %s\n", module, buffer);
}

#define OH_LOG_ERROR(module, format, ...)                                                                              \
    do {                                                                                                               \
        OHLog(module, format, ##__VA_ARGS__);                                                                          \
    } while (false)


#define OH_LOG_INFO(module, format, ...)                                                                               \
    do {                                                                                                               \
        OHLog(module, format, ##__VA_ARGS__);                                                                          \
    } while (false)

static napi_value getJsResult(napi_env env, int result)
{
    napi_value resultNapi = nullptr;
    napi_create_int32(env, result, &resultNapi);
    return resultNapi;
}

static napi_value TestInitializationOptionsSetRowStrideNormal(napi_env env, napi_callback_info info)
{
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1 ||
        argValue[NUM_0] == nullptr) {
        OH_LOG_ERROR(LOG_APP, "napi_get_cb_info failed, argCount: %{public}zu.", argCount);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }
    int32_t rowStride = 0;
    napi_get_value_int32(env, argValue[0], &rowStride);
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&opts);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapInitializationOptions_Create failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    errCode = OH_PixelmapInitializationOptions_SetRowStride(opts, rowStride);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    int32_t getStride = 0;
    errCode = OH_PixelmapInitializationOptions_GetRowStride(opts, &getStride);
    if (errCode != IMAGE_SUCCESS) {
        return getJsResult(env, errCode);
    }
    if (getStride != rowStride) {
        return getJsResult(env, IMAGE_UNKNOWN_ERROR);
    }
    errCode = OH_PixelmapInitializationOptions_Release(opts);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapInitializationOptions_Release failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestInitializationOptionsSetRowStrideNormal success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestCreatePixelMapWithStrideAbnormal(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest Test OH_Pixelmap_CreatePixelMapWithStride will call.");
    void* buffer = nullptr;
    size_t bufferSize = 0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    size_t rowStride = -1; // set a error row stride
    std::cout << "cout: ImagePixelmapNativeCTest Test will call OH_Pixelmap_CreatePixelMapWithStride." << std::endl;
    int32_t res = OH_PixelMap_CreatePixelMapWithStride(env, createOps, buffer, bufferSize, rowStride, &pixelmap);
    std::cout << "cout: ImagePixelmapNativeCTest Test OH_Pixelmap_CreatePixelMapWithStride." << std::endl;
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest Test OH_Pixelmap_CreatePixelMapWithStride, res: %{public}zu.", res);
    if (res != IMAGE_RESULT_GET_DATA_ABNORMAL) {
        return getJsResult(env, res);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestCreatePixelMapWithStrideAbnormal success.");
    return getJsResult(env, 0);
}

static napi_value TestNativeScaleWithAntiAliasingAbnormal(napi_env env, napi_callback_info info)
{
    float x = 1.5;
    float y = 1.5;
    OH_PixelmapNative *pixelmapNative = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_ScaleWithAntiAliasing(pixelmapNative, x, y,
        OH_PixelmapNative_AntiAliasing_HIGH);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ScaleWithAntiAliasing failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeScaleWithAntiAliasingNormal success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestScaleWithAntiAliasingAbnormal(napi_env env, napi_callback_info info)
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
    NativePixelMap* native = nullptr;
    double x = 0;
    double y = 0;
    if (napi_get_value_double(env, argValue[NUM_0], &x) != napi_ok ||
        napi_get_value_double(env, argValue[NUM_1], &y) != napi_ok) {
        return result;
    }

    int32_t errCode = OH_PixelMap_ScaleWithAntiAliasing(
        native, static_cast<float>(x), static_cast<float>(y), OH_PixelMap_AntiAliasing_HIGH);
    if (errCode != IMAGE_RESULT_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_Pixelmap_ScaleWithAntiAliasing failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    return getJsResult(env, IMAGE_RESULT_SUCCESS);
}

static napi_value TestNativeGetNativeBufferAbnormal(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmapNative = nullptr;
    OH_NativeBuffer **nativeBUffer = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_GetNativeBuffer(pixelmapNative, nativeBUffer);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_GetNativeBuffer failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeGetNativeBufferAbnormal success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestNativeSetMetaDataNull(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmapNative = nullptr;
    OH_Pixelmap_HdrMetadataValue *value = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelmapNative, HDR_METADATA_TYPE, value);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_SetMetadata failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeSetMetaDataNull success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestNativeGetMetaDataNull(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmapNative = nullptr;
    OH_Pixelmap_HdrMetadataValue **value = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_GetMetadata(pixelmapNative, HDR_METADATA_TYPE, value);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_GetMetadata failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeGetMetaDataNull success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestNativeSetMemoryName(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    char name[] = "testName";
    size_t len = strlen(name);
    Image_ErrorCode errCode = OH_PixelmapNative_SetMemoryName(pixelmap, name, &len);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_SetMemoryName failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeSetMemoryName success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestNativeGetArgbPixels(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    size_t dataSize = ARGB_8888_BYTES;
    uint8_t result[ARGB_8888_BYTES];
    Image_ErrorCode errCode = OH_PixelmapNative_GetArgbPixels(pixelMap, result, &dataSize);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_GetArgbPixels failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeGetArgbPixels success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestNativeGetColorSpaceNative(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    OH_NativeColorSpaceManager *getColorSpaceNative = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_GetColorSpaceNative(pixelmap, &getColorSpaceNative);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_GetColorSpaceNative failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeGetColorSpaceNative success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestNativeSetColorSpaceNative(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    OH_NativeColorSpaceManager *setColorSpaceNative = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_SetColorSpaceNative(pixelmap, setColorSpaceNative);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_SetColorSpaceNative failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeSetColorSpaceNative success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestNativeSetGetSrcPixelFormat(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    int32_t srcpixelFormat = 0;
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(ops, 1);
    OH_PixelmapInitializationOptions_GetSrcPixelFormat(ops, &srcpixelFormat);
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Release(ops);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_SetGetSrcPixelFormat failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeSetGetSrcPixelFormat success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestNativeCreateEmptyPixelmap(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative **pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_CreateEmptyPixelmap(options, pixelmap);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_CreateEmptyPixelmap failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeCreateEmptyPixelmap success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static napi_value TestNativeConvertAlphaFormat(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative* srcpixelmap = nullptr;
    OH_PixelmapNative* dstpixelmap = nullptr;
    const bool isPremul = false;
    Image_ErrorCode errCode = OH_PixelmapNative_ConvertAlphaFormat(srcpixelmap, dstpixelmap, isPremul);
    if (errCode != IMAGE_BAD_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "OH_PixelmapNative_ConvertAlphaFormat failed, errCode: %{public}d.", errCode);
        return getJsResult(env, errCode);
    }
    OH_LOG_INFO(LOG_APP, "ImagePixelmapNativeCTest TestNativeConvertAlphaFormat success.");
    return getJsResult(env, IMAGE_SUCCESS);
}

static void setInt32NamedProperty(napi_env env, napi_value object, const char *utf8name, uint32_t value)
{
    napi_value tmp;
    napi_create_int32(env, value, &tmp);
    napi_set_named_property(env, object, utf8name, tmp);
}

static bool CheckVpe()
{
    void* handle = dlopen(VPE_SO_NAME, RTLD_LAZY);
    if (handle == nullptr) {
        OH_LOG_INFO(LOG_APP, "CheckVpe failed");
        return false;
    }
    dlclose(handle);
    handle = nullptr;
    return true;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testCreatePixelMapWithStrideAbnormal", nullptr, TestCreatePixelMapWithStrideAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testInitializationOptionsSetRowStrideNormal", nullptr, TestInitializationOptionsSetRowStrideNormal, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"testNativeScaleWithAntiAliasingAbnormal", nullptr, TestNativeScaleWithAntiAliasingAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testScaleWithAntiAliasingAbnormal", nullptr, TestScaleWithAntiAliasingAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testNativeGetNativeBufferAbnormal", nullptr, TestNativeGetNativeBufferAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testNativeSetMetaDataNull", nullptr, TestNativeSetMetaDataNull, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testNativeSetMemoryName", nullptr, TestNativeSetMemoryName, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testNativeGetArgbPixels", nullptr, TestNativeGetArgbPixels, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testNativeGetColorSpaceNative", nullptr, TestNativeGetColorSpaceNative, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testNativeSetColorSpaceNative", nullptr, TestNativeSetColorSpaceNative, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testNativeGetMetaDataNull", nullptr, TestNativeGetMetaDataNull, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testNativeSetGetSrcPixelFormat", nullptr, TestNativeSetGetSrcPixelFormat, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"testNativeCreateEmptyPixelmap", nullptr, TestNativeCreateEmptyPixelmap, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"testNativeConvertAlphaFormat", nullptr, TestNativeConvertAlphaFormat, nullptr, nullptr,
         nullptr, napi_default, nullptr},
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

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }