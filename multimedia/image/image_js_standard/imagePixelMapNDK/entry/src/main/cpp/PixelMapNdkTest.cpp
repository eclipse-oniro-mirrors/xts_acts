/**
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
#include "PixelMapNdkTest.h"
#include <string>

#undef LOG_DOMAIN
#define LOG_DOMAIN 0x3200

#undef LOG_TAG
#define LOG_TAG "PixelMapNDKTest"

#define DECLARE_NAPI_FUNCTION(name, func)                                                                              \
    {                                                                                                                  \
        (name), nullptr, (func), nullptr, nullptr, nullptr, napi_default, nullptr                                      \
    }

#define NUM_0 0
#define NUM_1 1
#define NUM_2 2
#define NUM_3 3
#define MAX_PATH_SIZE 1024

static const char *INFO_WIDTH        = "width";
static const char *INFO_HEIGHT       = "height";
static const char *INFO_PIXEL_FORMAT = "pixelFormat";
namespace PixelMapNdk {
    static void LogError(const char* message, Image_ErrorCode errorCode)
    {
        OH_LOG_ERROR(LOG_APP, "%{public}s, errCode: %{public}d.", message, errorCode);
    }

    static napi_value ReturnError(napi_env env, Image_ErrorCode errorCode, const char *message)
    {
        OH_LOG_ERROR(LOG_APP, "%{public}s, errCode: %{public}d.", message, errorCode);
        napi_value resultNapi = nullptr;
        napi_create_int32(env, errorCode, &resultNapi);
        return resultNapi;
    }

    static napi_status getUint32Property(napi_env env, napi_value obj, const char* prop_name, uint32_t* value)
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

    Image_ErrorCode ParseDesiredRegion(napi_env env, napi_value regionValue, Image_Region& desiredRegion)
    {
        if (getUint32Property(env, regionValue, "x", &desiredRegion.x) != napi_ok ||
            getUint32Property(env, regionValue, "y", &desiredRegion.y) != napi_ok ||
            getUint32Property(env, regionValue, "width", &desiredRegion.width) != napi_ok ||
            getUint32Property(env, regionValue, "height", &desiredRegion.height) != napi_ok) {
            LogError("Failed to parse desiredRegion fields", IMAGE_BAD_PARAMETER);
            return IMAGE_BAD_PARAMETER;
        }
        return IMAGE_SUCCESS;
    }

    static Image_ErrorCode SetDesiredSize(napi_env env, napi_value optionsObj, OH_DecodingOptions *options)
    {
        Image_Size desiredSize;
        if (getUint32Property(env, optionsObj, "width", &desiredSize.width) == napi_ok &&
            getUint32Property(env, optionsObj, "height", &desiredSize.height) == napi_ok) {
            OH_LOG_INFO(LOG_APP, "Parsed desiredSize: width=%{public}d, height=%{public}d", desiredSize.width,
                desiredSize.height);
            if (OH_DecodingOptions_SetDesiredSize(options, &desiredSize) != IMAGE_SUCCESS) {
                LogError("Failed to set desiredSize", IMAGE_BAD_PARAMETER);
                return IMAGE_BAD_PARAMETER;
            }
        } else {
            OH_LOG_INFO(LOG_APP, "desiredSize not provided or invalid, skipping.");
        }
        return IMAGE_SUCCESS;
    }

    static Image_ErrorCode SetPixelFormat(napi_env env, napi_value optionsObj, OH_DecodingOptions *options)
    {
        int32_t pixelFormat;
        if (getUint32Property(env, optionsObj, "pixelFormat", reinterpret_cast<uint32_t*>(&pixelFormat)) == napi_ok) {
            OH_LOG_INFO(LOG_APP, "Parsed pixelFormat: %{public}d", pixelFormat);
            if (OH_DecodingOptions_SetPixelFormat(options, pixelFormat) != IMAGE_SUCCESS) {
                LogError("Failed to set pixelFormat", IMAGE_BAD_PARAMETER);
                return IMAGE_BAD_PARAMETER;
            }
        } else {
            OH_LOG_INFO(LOG_APP, "pixelFormat not provided or invalid, skipping.");
        }
        return IMAGE_SUCCESS;
    }

    static Image_ErrorCode SetDesiredRegion(napi_env env, napi_value optionsObj, OH_DecodingOptions *options)
    {
        napi_value regionValue;
        napi_get_named_property(env, optionsObj, "desiredRegion", &regionValue);
        napi_status status = napi_get_named_property(env, optionsObj, "desiredRegion", &regionValue);
        if (status != napi_ok) {
            OH_LOG_INFO(LOG_APP, "desiredRegion property not found, skipping.");
            return IMAGE_SUCCESS;
        }
        napi_valuetype valueType;
        status = napi_typeof(env, regionValue, &valueType);
        if (status == napi_ok && valueType == napi_object) {
            Image_Region desiredRegion;
            if (ParseDesiredRegion(env, regionValue, desiredRegion) == IMAGE_SUCCESS) {
                OH_LOG_INFO(LOG_APP, "Parsed desiredRegion: x=%{public}d, y=%{public}d, width=%{public}d, "
                    "height=%{public}d", desiredRegion.x, desiredRegion.y, desiredRegion.width, desiredRegion.height);
                OH_DecodingOptions_SetDesiredRegion(options, &desiredRegion);
            } else {
                LogError("Failed to parse desiredRegion", IMAGE_BAD_PARAMETER);
                return IMAGE_BAD_PARAMETER;
            }
        } else {
            OH_LOG_INFO(LOG_APP, "desiredRegion not provided or invalid, skipping.");
        }
        return IMAGE_SUCCESS;
    }

    static Image_ErrorCode SetCropAndScaleStrategy(napi_env env, napi_value optionsObj, OH_DecodingOptions *options)
    {
        int32_t cropAndScaleStrategy;
        if (getUint32Property(env, optionsObj, "cropAndScaleStrategy",
            reinterpret_cast<uint32_t*>(&cropAndScaleStrategy)) == napi_ok) {
            OH_LOG_INFO(LOG_APP, "Parsed cropAndScaleStrategy: %{public}d", cropAndScaleStrategy);
            OH_DecodingOptions_SetCropAndScaleStrategy(options, cropAndScaleStrategy);
        } else {
            OH_LOG_INFO(LOG_APP, "cropAndScaleStrategy not provided or invalid, skipping.");
        }
        return IMAGE_SUCCESS;
    }

    static Image_ErrorCode SetDynamicRange(napi_env env, napi_value optionsObj, OH_DecodingOptions *options)
    {
        int32_t dynamicRange;
        if (getUint32Property(env, optionsObj, "dynamicRange", reinterpret_cast<uint32_t*>(&dynamicRange)) == napi_ok) {
            OH_LOG_INFO(LOG_APP, "Parsed dynamicRange: %{public}d", dynamicRange);
            if (OH_DecodingOptions_SetDesiredDynamicRange(options, dynamicRange) != IMAGE_SUCCESS) {
                LogError("Failed to set dynamicRange", IMAGE_BAD_PARAMETER);
                return IMAGE_BAD_PARAMETER;
            }
        } else {
            OH_LOG_INFO(LOG_APP, "dynamicRange not provided or invalid, skipping.");
        }
        return IMAGE_SUCCESS;
    }

    static bool CreateAndSetDecodingOptions(napi_env env, napi_value optionsObj, OH_DecodingOptions *&options)
    {
        if (OH_DecodingOptions_Create(&options) != IMAGE_SUCCESS) {
            return false;
        }
        if (SetDesiredSize(env, optionsObj, options) != IMAGE_SUCCESS ||
            SetPixelFormat(env, optionsObj, options) != IMAGE_SUCCESS ||
            SetDesiredRegion(env, optionsObj, options) != IMAGE_SUCCESS ||
            SetCropAndScaleStrategy(env, optionsObj, options) != IMAGE_SUCCESS ||
            SetDynamicRange(env, optionsObj, options) != IMAGE_SUCCESS) {
            OH_DecodingOptions_Release(options);
            return false;
        }
        return true;
    }

    static bool GetPixelMapImageInfo(napi_env env, OH_PixelmapNative *pixelMap, napi_value &result)
    {
        OH_Pixelmap_ImageInfo *imageInfo = nullptr;
        if (OH_PixelmapImageInfo_Create(&imageInfo) != IMAGE_SUCCESS) {
            return false;
        }

        if (OH_PixelmapNative_GetImageInfo(pixelMap, imageInfo) != IMAGE_SUCCESS) {
            OH_PixelmapImageInfo_Release(imageInfo);
            return false;
        }

        uint32_t width = NUM_0;
        uint32_t height = NUM_0;
        int32_t pixelFormat = NUM_0;
        OH_PixelmapImageInfo_GetWidth(imageInfo, &width);
        OH_PixelmapImageInfo_GetHeight(imageInfo, &height);
        OH_PixelmapImageInfo_GetPixelFormat(imageInfo, &pixelFormat);

        napi_create_object(env, &result);
        SetUint32NamedProperty(env, result, INFO_WIDTH, width);
        SetUint32NamedProperty(env, result, INFO_HEIGHT, height);
        SetUint32NamedProperty(env, result, INFO_PIXEL_FORMAT, pixelFormat);

        OH_PixelmapImageInfo_Release(imageInfo);
        return true;
    }

    static bool GetImageSourceInfoMimeType(napi_env env, OH_ImageSourceNative *imageSource, napi_value &result)
    {
        OH_ImageSource_Info *imageSourceInfo = nullptr;
        if (OH_ImageSourceInfo_Create(&imageSourceInfo) != IMAGE_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "GetImageSourceInfoMimeType: Failed to create ImageSourceInfo");
            return false;
        }

        int32_t index = NUM_0;
        if (OH_ImageSourceNative_GetImageInfo(imageSource, index, imageSourceInfo) != IMAGE_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "GetImageSourceInfoMimeType: Failed to get ImageInfo");
            OH_ImageSourceInfo_Release(imageSourceInfo);
            return false;
        }

        Image_MimeType mimeType;
        if (OH_ImageSourceInfo_GetMimeType(imageSourceInfo, &mimeType) != IMAGE_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "GetImageSourceInfoMimeType: Failed to get MimeType");
            OH_ImageSourceInfo_Release(imageSourceInfo);
            return false;
        }

        // 检查 mimeType 数据有效性
        if (mimeType.data == nullptr || mimeType.size == 0) {
            OH_LOG_ERROR(LOG_APP, "GetImageSourceInfoMimeType: Invalid mimeType data");
            OH_ImageSourceInfo_Release(imageSourceInfo);
            return false;
        }

        napi_value resultStr = nullptr;
        std::string mimeTypeStr(mimeType.data, mimeType.size);
        napi_create_string_utf8(env, mimeTypeStr.c_str(), NAPI_AUTO_LENGTH, &resultStr);
        napi_set_named_property(env, result, "mimeType", resultStr);
        OH_LOG_INFO(LOG_APP, "GetImageSourceInfoMimeType: mimeType: %{public}s", mimeTypeStr.c_str());

        OH_ImageSourceInfo_Release(imageSourceInfo);
        return true;
    }

    static napi_value CreatePixelMapAndGetInfo(napi_env env, napi_callback_info info)
    {
        OH_LOG_INFO(LOG_APP, "CreatePixelMapAndGetInfo start!");
        size_t argc = NUM_2;
        napi_value args[NUM_2] = {nullptr};
        napi_value result = nullptr;

        if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_1) {
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Invalid arguments count or null arguments.");
        }

        char filePath[MAX_PATH_SIZE];
        size_t filePathSize = 0;
        if (napi_get_value_string_utf8(env, args[NUM_0], filePath, MAX_PATH_SIZE, &filePathSize) != napi_ok ||
            filePathSize == 0) {
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Failed to get file path from arguments!");
        }

        OH_DecodingOptions *options = nullptr;
        if (!CreateAndSetDecodingOptions(env, args[NUM_1], options)) {
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Failed to create or set decoding options.");
        }

        OH_ImageSourceNative *imageSource = nullptr;
        Image_ErrorCode errorCode = OH_ImageSourceNative_CreateFromUri(filePath, filePathSize, &imageSource);
        if (errorCode != IMAGE_SUCCESS) {
            OH_DecodingOptions_Release(options);
            return ReturnError(env, errorCode, "OH_ImageSourceNative_CreateFromUri failed!");
        }

        OH_PixelmapNative *pixelMap = nullptr;
        errorCode = OH_ImageSourceNative_CreatePixelmap(imageSource, options, &pixelMap);
        if (errorCode != IMAGE_SUCCESS) {
            OH_ImageSourceNative_Release(imageSource);
            OH_DecodingOptions_Release(options);
            return ReturnError(env, errorCode, "OH_ImageSourceNative_CreatePixelmap failed!");
        }

        napi_value imageInfoResult = nullptr;
        if (!GetPixelMapImageInfo(env, pixelMap, imageInfoResult)) {
            OH_PixelmapNative_Release(pixelMap);
            OH_ImageSourceNative_Release(imageSource);
            OH_DecodingOptions_Release(options);
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Failed to get PixelMap ImageInfo.");
        }

        if (!GetImageSourceInfoMimeType(env, imageSource, imageInfoResult)) {
            OH_PixelmapNative_Release(pixelMap);
            OH_ImageSourceNative_Release(imageSource);
            OH_DecodingOptions_Release(options);
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Failed to get ImageSource MimeType.");
        }

        OH_PixelmapNative_Release(pixelMap);
        OH_ImageSourceNative_Release(imageSource);
        OH_DecodingOptions_Release(options);

        OH_LOG_INFO(LOG_APP, "CreatePixelMapAndGetInfo success!");
        return imageInfoResult;
    }

    static napi_value CreatePixelMapUsingAllocatorAndGetInfo(napi_env env, napi_callback_info info)
    {
        OH_LOG_INFO(LOG_APP, "CreatePixelMapUsingAllocatorAndGetInfo start!");
        size_t argc = NUM_3;
        napi_value args[NUM_3] = {nullptr};
        napi_value result = nullptr;

        if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_2) {
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Invalid arguments count or null arguments.");
        }

        char filePath[MAX_PATH_SIZE];
        size_t filePathSize = 0;
        if (napi_get_value_string_utf8(env, args[NUM_0], filePath, MAX_PATH_SIZE, &filePathSize) != napi_ok ||
            filePathSize == 0) {
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Failed to get file path from arguments!");
        }

        uint32_t tempAllocatorType;
        if (napi_get_value_uint32(env, args[NUM_1], &tempAllocatorType) != napi_ok) {
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Failed to get allocator type from arguments!");
        }
        OH_LOG_INFO(LOG_APP, "Get allocator type success, value is: %{public}u.", tempAllocatorType);
        IMAGE_ALLOCATOR_TYPE allocatorType = static_cast<IMAGE_ALLOCATOR_TYPE>(tempAllocatorType);

        OH_DecodingOptions *options = nullptr;
        if (!CreateAndSetDecodingOptions(env, args[NUM_2], options)) {
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Failed to create or set decoding options.");
        }

        OH_ImageSourceNative *imageSource = nullptr;
        Image_ErrorCode errorCode = OH_ImageSourceNative_CreateFromUri(filePath, filePathSize, &imageSource);
        if (errorCode != IMAGE_SUCCESS) {
            OH_DecodingOptions_Release(options);
            return ReturnError(env, errorCode, "OH_ImageSourceNative_CreateFromUri failed!");
        }

        OH_PixelmapNative *pixelMap = nullptr;
        errorCode = OH_ImageSourceNative_CreatePixelmapUsingAllocator(imageSource, options, allocatorType, &pixelMap);
        if (errorCode != IMAGE_SUCCESS) {
            OH_ImageSourceNative_Release(imageSource);
            OH_DecodingOptions_Release(options);
            return ReturnError(env, errorCode, "OH_ImageSourceNative_CreatePixelmapUsingAllocator failed!");
        }

        napi_value imageInfoResult = nullptr;
        if (!GetPixelMapImageInfo(env, pixelMap, imageInfoResult)) {
            OH_PixelmapNative_Release(pixelMap);
            OH_ImageSourceNative_Release(imageSource);
            OH_DecodingOptions_Release(options);
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Failed to get PixelMap ImageInfo.");
        }

        if (!GetImageSourceInfoMimeType(env, imageSource, imageInfoResult)) {
            OH_PixelmapNative_Release(pixelMap);
            OH_ImageSourceNative_Release(imageSource);
            OH_DecodingOptions_Release(options);
            return ReturnError(env, IMAGE_BAD_PARAMETER, "Failed to get ImageSource MimeType.");
        }

        OH_PixelmapNative_Release(pixelMap);
        OH_ImageSourceNative_Release(imageSource);
        OH_DecodingOptions_Release(options);

        OH_LOG_INFO(LOG_APP, "CreatePixelMapUsingAllocatorAndGetInfo success!");
        return imageInfoResult;
    }
}

EXTERN_C_START
napi_value InitPixelMapNdk(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("CreatePixelMapAndGetInfo", PixelMapNdk::CreatePixelMapAndGetInfo),
        DECLARE_NAPI_FUNCTION("CreatePixelMapForDMAAndGetInfo", PixelMapNdk::CreatePixelMapUsingAllocatorAndGetInfo),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END