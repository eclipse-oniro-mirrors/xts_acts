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
#include "pixelMapNdkForDMA.h"
#include "PixelMapNdkTest.h"
#include "common/log_common.h"
#include <node_api.h>
#include <bits/alltypes.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sstream>
#include <fstream>

#define NUM_0 0
#define NUM_1 1
#define NUM_2 2
#define NUM_3 3
#define NUM_4 4
#define NUM_5 5
#define MAX_PATH_SIZE 1024
static ImageSourceNative *g_thisImageSource = new ImageSourceNative();
const char *TAG = "[PIXELMAPNATIVE_CPP]";
static const char *AUX_INFO_WIDTH = "width";
static const char *AUX_INFO_HEIGHT = "height";
static const char *AUX_INFO_ROW_STRIDE = "stride";
static const char *AUX_INFO_PIXEL_FORMAT = "pixelFormat";

napi_value getJsResult(napi_env env, int result)
{
    napi_value resultNapi = nullptr;
    napi_create_int32(env, result, &resultNapi);
    return resultNapi;
}

napi_status getUint32Property(napi_env env, napi_value obj, const char* prop_name, uint32_t* value)
{
    napi_value prop_value;
    napi_status status = napi_get_named_property(env, obj, prop_name, &prop_value);
    if (status != napi_ok) {
        return status;
    }
    return napi_get_value_uint32(env, prop_value, value);
}

static void SetUint32NamedProperty(napi_env env, napi_value object, const char* key, uint32_t value)
{
    napi_value temp = nullptr;
    napi_create_uint32(env, value, &temp);
    napi_set_named_property(env, object, key, temp);
    return;
}

Image_ErrorCode ReleaseDecodingOptions(OH_DecodingOptions *&options)
{
    if (options != nullptr) {
        OH_DecodingOptions_Release(options);
        options = nullptr;
    }
    return IMAGE_SUCCESS;
}

Image_ErrorCode ReleaseImageSource(OH_ImageSourceNative *&source)
{
    if (source != nullptr) {
        g_thisImageSource->errorCode = OH_ImageSourceNative_Release(source);
        source = nullptr;
        return g_thisImageSource->errorCode;
    }
    H_LOGI("%{public}s ReleaseImageSource source is null !", TAG);
    return IMAGE_SUCCESS;
}

Image_ErrorCode ReleasePixelMap(OH_PixelmapNative *&pixelmap)
{
    if (pixelmap != nullptr) {
        g_thisImageSource->errorCode = OH_PixelmapNative_Release(pixelmap);
        pixelmap = nullptr;
        return g_thisImageSource->errorCode;
    }
    H_LOGI("%{public}s ReleasePixelMap source is null !", TAG);
    return IMAGE_SUCCESS;
}

Image_ErrorCode SetDecodingOptionsFromJsArgs(napi_env env, napi_value* args)
{
    Image_Size desiredSize;
    int32_t format;
    int32_t desiredDynamicRange;

    if (getUint32Property(env, args[NUM_2], "width", &desiredSize.width) != napi_ok) {
        H_LOGE("%{public}s Failed to get width!", TAG);
        return IMAGE_BAD_PARAMETER;
    }

    if (getUint32Property(env, args[NUM_2], "height", &desiredSize.height) != napi_ok) {
        H_LOGE("%{public}s Failed to get height!", TAG);
        return IMAGE_BAD_PARAMETER;
    }

    napi_status status = napi_get_value_int32(env, args[NUM_3], &format);
    if (status != napi_ok) {
        H_LOGE("%{public}s Failed to get format!", TAG);
        return IMAGE_BAD_PARAMETER;
    }

    g_thisImageSource->errorCode = OH_DecodingOptions_SetDesiredSize(g_thisImageSource->options, &desiredSize);
    if (g_thisImageSource->errorCode != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_DecodingOptions_SetDesiredSize failed, errCode: %{public}d.", TAG,
            g_thisImageSource->errorCode);
        return g_thisImageSource->errorCode;
    }

    g_thisImageSource->errorCode = OH_DecodingOptions_SetPixelFormat(g_thisImageSource->options, format);
    if (g_thisImageSource->errorCode != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_DecodingOptions_SetPixelFormat failed, errCode: %{public}d.", TAG,
            g_thisImageSource->errorCode);
        return g_thisImageSource->errorCode;
    }

    if (args[NUM_4] != nullptr) {
        napi_status status = napi_get_value_int32(env, args[NUM_4], &desiredDynamicRange);
        if (status != napi_ok) {
            H_LOGE("%{public}s Failed to get desiredDynamicRange!", TAG);
        } else {
            g_thisImageSource->errorCode = OH_DecodingOptions_SetDesiredDynamicRange(g_thisImageSource->options,
                desiredDynamicRange);
            if (g_thisImageSource->errorCode != IMAGE_SUCCESS) {
                H_LOGE("%{public}s OH_DecodingOptions_SetDesiredDynamicRange failed, errCode: %{public}d.",
                    TAG, g_thisImageSource->errorCode);
                return g_thisImageSource->errorCode;
            }
        }
    }

    H_LOGI("%{public}s OH_DecodingOptions set value is: size width: \
        %{public}d, height: %{public}d, format: %{public}d, desiredDynamicRange: %{public}d !",
        TAG, desiredSize.width, desiredSize.height, format, desiredDynamicRange);
    return IMAGE_SUCCESS;
}

static napi_value GetPixelmapInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    Image_ErrorCode ret = OH_PixelmapNative_GetImageInfo(g_thisImageSource->pixelmap, imageInfo);

    uint32_t width = NUM_0;
    OH_PixelmapImageInfo_GetWidth(imageInfo, &width);
    uint32_t height = NUM_0;
    OH_PixelmapImageInfo_GetHeight(imageInfo, &height);
    int32_t pixelFormat = NUM_0;
    OH_PixelmapImageInfo_GetPixelFormat(imageInfo, &pixelFormat);
    uint32_t stride = NUM_0;
    OH_PixelmapImageInfo_GetRowStride(imageInfo, &stride);

    napi_create_object(env, &result);
    SetUint32NamedProperty(env, result, AUX_INFO_WIDTH, width);
    SetUint32NamedProperty(env, result, AUX_INFO_HEIGHT, height);
    SetUint32NamedProperty(env, result, AUX_INFO_PIXEL_FORMAT, pixelFormat);
    SetUint32NamedProperty(env, result, AUX_INFO_ROW_STRIDE, stride);
    H_LOGI("%{public}s GetPixelmapInfo is: width %{public}d height %{public}d pixelFormat %{public}d stride %{public}d",
        TAG, width, height, pixelFormat, stride);
    if (imageInfo != nullptr) {
        OH_PixelmapImageInfo_Release(imageInfo);
        imageInfo = nullptr;
    }
    return result;
}

static napi_value CreatePixelMapUsingAllocator(napi_env env, napi_callback_info info)
{
    H_LOGI("%{public}s CreatePixelMapUsingAllocator start !", TAG);
    size_t argc = NUM_5;
    napi_value args[NUM_5] = {nullptr};
    napi_value result = nullptr;
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_4 || args[NUM_0] == nullptr
        || args[NUM_1] == nullptr || args[NUM_2] == nullptr || args[NUM_3] == nullptr) {
        H_LOGE("%{public}s OH_ImageSourceNative_CreatePixelmapUsingAllocator napi_get_cb_info failed !", TAG);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    char filePath[MAX_PATH_SIZE];
    size_t filePathSize;
    uint32_t alloType;
    napi_get_value_string_utf8(env, args[NUM_0], filePath, MAX_PATH_SIZE, &filePathSize);
    napi_get_value_uint32(env, args[NUM_1], &alloType);
    ReleaseImageSource(g_thisImageSource->source);
    ReleasePixelMap(g_thisImageSource->pixelmap);

    IMAGE_ALLOCATOR_TYPE allocatorType = static_cast<IMAGE_ALLOCATOR_TYPE>(alloType);
    g_thisImageSource->errorCode = OH_ImageSourceNative_CreateFromUri(filePath, filePathSize,
        &g_thisImageSource->source);
    if (g_thisImageSource->errorCode != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_ImageSourceNative_CreateFromUri failed, errCode: %{public}d.", TAG,
            g_thisImageSource->errorCode);
        return getJsResult(env, g_thisImageSource->errorCode);
    } else {
        H_LOGI("%{public}s OH_ImageSourceNative_CreateFromUri success !", TAG);
    }
    OH_DecodingOptions_Create(&g_thisImageSource->options);
    g_thisImageSource->errorCode = SetDecodingOptionsFromJsArgs(env, args);
    if (g_thisImageSource->errorCode != IMAGE_SUCCESS) {
        H_LOGE("%{public}s SetDecodingOptionsFromJsArgs failed, errCode: %{public}d.", TAG,
            g_thisImageSource->errorCode);
        return getJsResult(env, g_thisImageSource->errorCode);
    } else {
        H_LOGE("%{public}s SetDecodingOptionsFromJsArgs success.", TAG);
    }
    
    g_thisImageSource->errorCode =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(g_thisImageSource->source, g_thisImageSource->options,
            allocatorType, &g_thisImageSource->pixelmap);
    ReleaseDecodingOptions(g_thisImageSource->options);
    if (g_thisImageSource->errorCode != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_ImageSourceNative_CreatePixelmapUsingAllocator failed, errCode: %{public}d.",
            TAG, g_thisImageSource->errorCode);
        return getJsResult(env, g_thisImageSource->errorCode);
    } else {
        napi_status status =
            napi_create_external(env, reinterpret_cast<void *>(g_thisImageSource->pixelmap), nullptr, nullptr, &result);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to create external object");
            return nullptr;
        }
        H_LOGI("%{public}s OH_ImageSourceNative_CreatePixelmapUsingAllocator success !", TAG);
    }
    return result;
}

static napi_value CreatePixelMapUsingAllocatorError(napi_env env, napi_callback_info info)
{
    H_LOGI("%{public}s CreatePixelMapUsingAllocatorError start !", TAG);
    size_t argc = NUM_4;
    napi_value args[NUM_4] = {nullptr};
    napi_value result = nullptr;
    
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_2 ||
        args[NUM_0] == nullptr) {
        H_LOGE("%{public}s CreatePixelMapUsingAllocatorError napi_get_cb_info failed !", TAG);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    char filePath[MAX_PATH_SIZE];
    size_t filePathSize;
    uint32_t alloType;
    napi_get_value_string_utf8(env, args[NUM_0], filePath, MAX_PATH_SIZE, &filePathSize);
    napi_get_value_uint32(env, args[NUM_1], &alloType);
    ReleaseImageSource(g_thisImageSource->source);

    IMAGE_ALLOCATOR_TYPE allocatorType = static_cast<IMAGE_ALLOCATOR_TYPE>(alloType);
    g_thisImageSource->errorCode = OH_ImageSourceNative_CreateFromUri(filePath, filePathSize,
        &g_thisImageSource->source);
    if (g_thisImageSource->errorCode != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_ImageSourceNative_CreateFromUri failed, errCode: %{public}d.", TAG,
            g_thisImageSource->errorCode);
        return getJsResult(env, g_thisImageSource->errorCode);
    } else {
        H_LOGI("%{public}s OH_ImageSourceNative_CreateFromUri success !", TAG);
    }

    g_thisImageSource->errorCode =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(g_thisImageSource->source, nullptr, allocatorType,
            &g_thisImageSource->pixelmap);
    if (g_thisImageSource->errorCode != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_ImageSourceNative_CreatePixelmapUsingAllocator failed, errCode: %{public}d.",
            TAG, g_thisImageSource->errorCode);
        return getJsResult(env, g_thisImageSource->errorCode);
    } else {
        napi_status status =
            napi_create_external(env, reinterpret_cast<void *>(g_thisImageSource->pixelmap), nullptr, nullptr, &result);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to create external object");
            return nullptr;
        }
        H_LOGI("%{public}s OH_ImageSourceNative_CreatePixelmapUsingAllocator success !", TAG);
    }
    return result;
}

void ReleaseGlobalImageSource()
{
    if (g_thisImageSource != nullptr) {
        delete g_thisImageSource;
        g_thisImageSource = nullptr;
        H_LOGI("%{public}s Global ImageSource released successfully.", TAG);
    }
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetPixelmapInfo", nullptr, GetPixelmapInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreatePixelMapUsingAllocator", nullptr, CreatePixelMapUsingAllocator,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreatePixelMapUsingAllocatorError", nullptr, CreatePixelMapUsingAllocatorError,
            nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    InitPixelMapNdk(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "PixelMapNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterPixelMapNdkModule(void) { napi_module_register(&demoModule); }
extern "C" __attribute__((destructor)) void UnregisterPixelMapNdkModule(void)
{
    H_LOGI("%{public}s UnregisterPixelMapNdkModule called.", TAG);
    ReleaseGlobalImageSource();
}
