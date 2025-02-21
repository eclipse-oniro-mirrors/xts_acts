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
#include <linux/kd.h>
#include <string>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <cstring>

#include <hilog/log.h>
#include "napi/native_api.h"
#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "PictureNDK"

#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

#define NUM_0 0
#define NUM_1 1
#define NUM_2 2
#define NUM_3 3
#define NUM_4 4
#define MAX_STRING_SIZE 128
#define MAX_PATH_SIZE 1024

#define IMG_NAPI_RELEASE_PTR(ptr, func)                                                                               \
    do {                                                                                                              \
        if ((ptr) != nullptr) {                                                                                       \
            func;                                                                                                     \
            (ptr) = nullptr;                                                                                          \
        }                                                                                                             \
    } while (0)

#define IMG_NAPI_CHECK_NULL_PTR(ptr, result)                                                                          \
    do {                                                                                                              \
        if ((ptr) == nullptr) {                                                                                       \
            LOGE("%{public}s:%{public}d: Null ptr!", __FUNCTION__, __LINE__);                                         \
            return (result);                                                                                          \
        }                                                                                                             \
    } while (0)

#define IMG_NAPI_NOT_NULL_PTR_RETURN(ptr, result)                                                                     \
do {                                                                                                                  \
    if ((ptr) != nullptr) {                                                                                           \
        return (result);                                                                                              \
    }                                                                                                                 \
} while (0)

static const uint32_t DEFAULT_QUALITY = 100;
static const Image_AuxiliaryPictureType DEFAULT_AUXILIARY_TYPE = static_cast<Image_AuxiliaryPictureType>(1);
static const Image_MetadataType DEFAULT_METADATA_TYPE = Image_MetadataType::EXIF_METADATA;
static const char *AUX_INFO_TYPE = "auxiliaryPictureType";
static const char *AUX_INFO_WIDTH = "width";
static const char *AUX_INFO_HEIGHT = "height";
static const char *AUX_INFO_ROW_STRIDE = "rowStride";
static const char *AUX_INFO_PIXEL_FORMAT = "pixelFormat";

struct PictureTestContext {
    OH_PictureNative *picture = nullptr;
    OH_ImagePackerNative *imagePacker = nullptr;
    OH_PackingOptions *packingOptions = nullptr;
    OH_ImageSourceNative *imageSource = nullptr;
    OH_DecodingOptionsForPicture *decodingOptions = nullptr;
    OH_AuxiliaryPictureNative *auxPicture = nullptr;
    OH_AuxiliaryPictureInfo *auxInfo = nullptr;
    OH_PixelmapNative *gainmapPixelmap = nullptr;
    OH_PictureMetadata *metadata = nullptr;
    OH_PictureMetadata *newMetadata = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapNative *mainPixelmap = nullptr;
    Image_AuxiliaryPictureType auxType = DEFAULT_AUXILIARY_TYPE;
    Image_MetadataType metadataType = DEFAULT_METADATA_TYPE;
    std::string imageSourcePath = "";
    OH_PixelmapNative *gainPixelMap = nullptr;
    size_t pathSize = 0;
    bool isImageSourceUpdated = false;
    bool isPixelmapUpdated = false;
    PIXEL_FORMAT pixelFormat = PIXEL_FORMAT::PIXEL_FORMAT_UNKNOWN;
    OH_PictureNative *singlePicture = nullptr;
};

struct LocalAuxInfo {
    Image_AuxiliaryPictureType auxType = DEFAULT_AUXILIARY_TYPE;
    Image_Size size = {0, 0};
    uint32_t rowStride = 0;
    PIXEL_FORMAT pixelFormat = PIXEL_FORMAT::PIXEL_FORMAT_UNKNOWN;
};

static PictureTestContext g_ctx;

static void NativeAuxInfoToLocalAuxInfo(OH_AuxiliaryPictureInfo *nativeInfo, LocalAuxInfo &localInfo)
{
    OH_AuxiliaryPictureInfo_GetType(nativeInfo, &localInfo.auxType);
    OH_AuxiliaryPictureInfo_GetSize(nativeInfo, &localInfo.size);
    OH_AuxiliaryPictureInfo_GetRowStride(nativeInfo, &localInfo.rowStride);
    OH_AuxiliaryPictureInfo_GetPixelFormat(nativeInfo, &localInfo.pixelFormat);
    return;
}

static void LocalAuxInfoToNativeAuxInfo(LocalAuxInfo &localInfo, OH_AuxiliaryPictureInfo *nativeInfo)
{
    OH_AuxiliaryPictureInfo_SetType(nativeInfo, localInfo.auxType);
    OH_AuxiliaryPictureInfo_SetSize(nativeInfo, &localInfo.size);
    OH_AuxiliaryPictureInfo_SetRowStride(nativeInfo, localInfo.rowStride);
    OH_AuxiliaryPictureInfo_SetPixelFormat(nativeInfo, localInfo.pixelFormat);
    return;
}

static void SetUint32NamedProperty(napi_env env, napi_value object, const char* key, uint32_t value)
{
    napi_value temp = nullptr;
    napi_create_uint32(env, value, &temp);
    napi_set_named_property(env, object, key, temp);
    return;
}

static uint32_t GetUint32NamedProperty(napi_env env, napi_value object, const char* key)
{
    napi_value temp = nullptr;
    uint32_t ulResult = 0;
    napi_get_named_property(env, object, key, &temp);
    napi_get_value_uint32(env, temp, &ulResult);
    return ulResult;
}

static napi_value ReleaseTestContext(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_undefined(env, &result);

    IMG_NAPI_RELEASE_PTR(g_ctx.picture, OH_PictureNative_Release(g_ctx.picture));
    IMG_NAPI_RELEASE_PTR(g_ctx.imagePacker, OH_ImagePackerNative_Release(g_ctx.imagePacker));
    IMG_NAPI_RELEASE_PTR(g_ctx.packingOptions, OH_PackingOptions_Release(g_ctx.packingOptions));
    IMG_NAPI_RELEASE_PTR(g_ctx.imageSource, OH_ImageSourceNative_Release(g_ctx.imageSource));
    IMG_NAPI_RELEASE_PTR(g_ctx.decodingOptions, OH_DecodingOptionsForPicture_Release(g_ctx.decodingOptions));
    IMG_NAPI_RELEASE_PTR(g_ctx.auxPicture, OH_AuxiliaryPictureNative_Release(g_ctx.auxPicture));
    IMG_NAPI_RELEASE_PTR(g_ctx.auxInfo, OH_AuxiliaryPictureInfo_Release(g_ctx.auxInfo));
    IMG_NAPI_RELEASE_PTR(g_ctx.metadata, OH_PictureMetadata_Release(g_ctx.metadata));
    IMG_NAPI_RELEASE_PTR(g_ctx.newMetadata, OH_PictureMetadata_Release(g_ctx.newMetadata));
    IMG_NAPI_RELEASE_PTR(g_ctx.pixelMap, OH_PixelmapNative_Release(g_ctx.pixelMap));
    g_ctx.imageSourcePath = "";

    return result;
}

static napi_value CreateTestImagePacker(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_undefined(env, &result);

    IMG_NAPI_NOT_NULL_PTR_RETURN(g_ctx.imagePacker, result);
    if (OH_ImagePackerNative_Create(&g_ctx.imagePacker) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "CreateTestImagePacker create image packer failed");
        return result;
    }

    return result;
}

static napi_value CreateTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_undefined(env, &result);

    IMG_NAPI_NOT_NULL_PTR_RETURN(g_ctx.packingOptions, result);
    if (OH_PackingOptions_Create(&g_ctx.packingOptions) != IMAGE_SUCCESS ||
        OH_PackingOptions_SetQuality(g_ctx.packingOptions, DEFAULT_QUALITY) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "CreateTestPackingOptions create packing options failed");
        return result;
    }

    return result;
}

static napi_value SetMimeTypeToTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("SetMimeTypeToTestPackingOptions get format failed");
        return result;
    }

    char format[MAX_STRING_SIZE] = {0};
    size_t formatSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], format, MAX_STRING_SIZE, &formatSize);
    Image_MimeType mimeType = {.data = format, .size = formatSize};

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.packingOptions, result);
    if (OH_PackingOptions_SetMimeType(g_ctx.packingOptions, &mimeType) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PackingOptions_SetMimeType failed");
        return result;
    }

    return result;
}

static napi_value SetDynamicRangeToTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("SetDynamicRangeToTestPackingOptions get dynamicRange failed");
        return result;
    }

    int32_t desiredDynamicRange = 0;
    napi_get_value_int32(env, argValue[NUM_0], &desiredDynamicRange);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.packingOptions, result);
    if (OH_PackingOptions_SetDesiredDynamicRange(g_ctx.packingOptions, desiredDynamicRange) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PackingOptions_SetDesiredDynamicRange failed");
        return result;
    }

    return result;
}

static napi_value CreateTestImageSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("CreateTestImageSource get file path failed");
        return result;
    }

    const size_t maxUriLen = MAX_PATH_SIZE;
    char uri[maxUriLen] = "";
    size_t uriSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], uri, maxUriLen, &uriSize);

    if (strcmp(g_ctx.imageSourcePath.c_str(), uri) != 0) {
        IMG_NAPI_RELEASE_PTR(g_ctx.imageSource, OH_ImageSourceNative_Release(g_ctx.imageSource));
    } else {
        IMG_NAPI_NOT_NULL_PTR_RETURN(g_ctx.imageSource, result);
    }

    if (OH_ImageSourceNative_CreateFromUri(uri, uriSize, &g_ctx.imageSource) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "CreateTestImageSource create image source from url failed");
        return result;
    }
    g_ctx.imageSourcePath = uri;
    g_ctx.pathSize = uriSize;
    g_ctx.isImageSourceUpdated = true;

    return result;
}

static napi_value CreateTestPixelmapByImageSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("CreateTestPixelmapByImageSource: failed to get input arguments!");
        return result;
    }

    uint32_t temp = 0;
    napi_get_value_uint32(env, argValue[NUM_0], &temp);
    PIXEL_FORMAT pixelFormat = static_cast<PIXEL_FORMAT>(temp);

    if (g_ctx.isImageSourceUpdated || (g_ctx.pixelFormat != pixelFormat)) {
        IMG_NAPI_RELEASE_PTR(g_ctx.pixelMap, OH_PixelmapNative_Release(g_ctx.pixelMap));
    } else {
        IMG_NAPI_NOT_NULL_PTR_RETURN(g_ctx.pixelMap, result);
    }

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.imageSource, result);
    OH_DecodingOptions *ops = nullptr;
    Image_ErrorCode errCode = IMAGE_SUCCESS;
    errCode = OH_DecodingOptions_Create(&ops);
    if (errCode != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_DecodingOptions_Create failed");
        return result;
    }
    errCode = OH_DecodingOptions_SetPixelFormat(ops, pixelFormat);
    if (errCode != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_DecodingOptions_SetPixelFormat failed");
        return result;
    }
    errCode = OH_ImageSourceNative_CreatePixelmap(g_ctx.imageSource, ops, &g_ctx.pixelMap);
    if (errCode != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_ImageSourceNative_CreatePixelmap failed");
        return result;
    }
    g_ctx.isImageSourceUpdated = false;
    g_ctx.isPixelmapUpdated = true;
    g_ctx.pixelFormat = pixelFormat;

    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value MetadataCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("MetadataCreate: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_MetadataType metadataType = static_cast<Image_MetadataType>(type);

    if (g_ctx.metadataType != metadataType) {
        IMG_NAPI_RELEASE_PTR(g_ctx.metadata, OH_PictureMetadata_Release(g_ctx.metadata));
    }

    if (g_ctx.metadata == nullptr) {
        if (OH_PictureMetadata_Create(metadataType, &g_ctx.metadata) != IMAGE_SUCCESS) {
            napi_throw_error(env, nullptr, "OH_PictureMetadata_Create failed");
            return result;
        }
    }
    g_ctx.metadataType = metadataType;

    napi_create_external(env, reinterpret_cast<void *>(g_ctx.metadata), nullptr, nullptr, &result);
    return result;
}

static napi_value MetadataGetProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("MetadataGetProperty: failed to get input arguments!");
        return result;
    }

    char key[MAX_STRING_SIZE] = {0};
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], key, MAX_STRING_SIZE, &keySize);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.metadata, result);
    Image_String imageKey = {key, keySize};
    Image_String imageValue = {nullptr, 0};
    if (OH_PictureMetadata_GetProperty(g_ctx.metadata, &imageKey, &imageValue) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureMetadata_GetProperty failed");
        return result;
    }

    napi_create_string_utf8(env, (const char *)imageValue.data, imageValue.size, &result);
    return result;
}

static napi_value PictureMetadataGetProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("PictureMetadataGetProperty: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_MetadataType metadataType = static_cast<Image_MetadataType>(type);

    char key[MAX_STRING_SIZE] = {0};
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_1], key, MAX_STRING_SIZE, &keySize);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    OH_PictureMetadata *metadata = nullptr;
    if (OH_PictureNative_GetMetadata(g_ctx.picture, metadataType, &metadata) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "PictureMetadataGetProperty get metadata failed");
        return result;
    }

    Image_String imageKey = {key, keySize};
    Image_String imageValue = {nullptr, 0};
    if (OH_PictureMetadata_GetProperty(metadata, &imageKey, &imageValue) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "PictureMetadataGetProperty get property failed");
        return result;
    }

    napi_create_string_utf8(env, (const char *)imageValue.data, imageValue.size, &result);
    return result;
}

static napi_value AuxiliaryMetadataGetProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("AuxiliaryMetadataGetProperty: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_MetadataType metadataType = static_cast<Image_MetadataType>(type);

    char key[MAX_STRING_SIZE] = {0};
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_1], key, MAX_STRING_SIZE, &keySize);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    OH_PictureMetadata *metadata = nullptr;
    if (OH_AuxiliaryPictureNative_GetMetadata(g_ctx.auxPicture, metadataType, &metadata) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "AuxiliaryMetadataGetProperty get metadata failed");
        return result;
    }

    Image_String imageKey = {key, keySize};
    Image_String imageValue = {nullptr, 0};
    if (OH_PictureMetadata_GetProperty(metadata, &imageKey, &imageValue) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "AuxiliaryMetadataGetProperty get property failed");
        return result;
    }

    napi_create_string_utf8(env, (const char *)imageValue.data, imageValue.size, &result);
    return result;
}

static napi_value ClonedMetadataGetProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("ClonedMetadataGetProperty: failed to get input arguments!");
        return result;
    }

    char key[MAX_STRING_SIZE] = {0};
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], key, MAX_STRING_SIZE, &keySize);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.newMetadata, result);
    Image_String imageKey = {key, keySize};
    Image_String imageValue = {nullptr, 0};
    if (OH_PictureMetadata_GetProperty(g_ctx.newMetadata, &imageKey, &imageValue) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "Cloned OH_PictureMetadata_GetProperty failed");
        return result;
    }

    napi_create_string_utf8(env, (const char *)imageValue.data, imageValue.size, &result);
    return result;
}

static napi_value MetadataSetProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("MetadataSetProperty: failed to get input arguments!");
        return result;
    }

    char key[MAX_STRING_SIZE] = {0};
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], key, MAX_STRING_SIZE, &keySize);

    char value[MAX_STRING_SIZE] = {0};
    size_t valueSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_1], value, MAX_STRING_SIZE, &valueSize);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.metadata, result);
    Image_String imageKey = {key, keySize};
    Image_String imageValue = {value, valueSize};
    if (OH_PictureMetadata_SetProperty(g_ctx.metadata, &imageKey, &imageValue) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureMetadata_SetProperty failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value MetadataRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    if (OH_PictureMetadata_Release(g_ctx.metadata) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureMetadata_Release failed");
        return result;
    }
    g_ctx.metadata = nullptr;

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value ClonedMetadataRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    if (OH_PictureMetadata_Release(g_ctx.newMetadata) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "Cloned OH_PictureMetadata_Release failed");
        return result;
    }
    g_ctx.newMetadata = nullptr;

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value MetadataClone(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.metadata, result);
    if (OH_PictureMetadata_Clone(g_ctx.metadata, &g_ctx.newMetadata) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureMetadata_Clone failed");
        return result;
    }

    napi_create_external(env, reinterpret_cast<void *>(g_ctx.newMetadata), nullptr, nullptr, &result);
    return result;
}

static napi_value PackToDataFromPicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("PackToDataFromPicture: failed to get input arguments!");
        return result;
    }

    uint8_t *outData = nullptr;
    size_t outSize = 0;
    napi_get_buffer_info(env, argValue[NUM_0], (void **)&outData, &outSize);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.imagePacker, result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.packingOptions, result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);

    if (OH_ImagePackerNative_PackToDataFromPicture(g_ctx.imagePacker, g_ctx.packingOptions, g_ctx.picture,
        outData, &outSize) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_ImagePackerNative_PackToDataFromPicture failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value PackToFileFromPicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("PackToFileFromPicture: failed to get input arguments!");
        return result;
    }

    int32_t fd;
    napi_get_value_int32(env, argValue[NUM_0], &fd);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.imagePacker, result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.packingOptions, result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    Image_ErrorCode errCode = OH_ImagePackerNative_PackToFileFromPicture(g_ctx.imagePacker,
        g_ctx.packingOptions, g_ctx.picture, fd);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value CreatePictureByImageSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    if (g_ctx.isImageSourceUpdated) {
        IMG_NAPI_RELEASE_PTR(g_ctx.picture, OH_PictureNative_Release(g_ctx.picture));
    } else {
        IMG_NAPI_NOT_NULL_PTR_RETURN(g_ctx.picture, result);
    }

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.imageSource, result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.decodingOptions, result);
    if (OH_ImageSourceNative_CreatePicture(g_ctx.imageSource, g_ctx.decodingOptions, &g_ctx.picture) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_ImageSourceNative_CreatePicture failed");
        return result;
    }
    g_ctx.isImageSourceUpdated = false;

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value CreatePictureDecodingOptions(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_NOT_NULL_PTR_RETURN(g_ctx.decodingOptions, result);
    if (OH_DecodingOptionsForPicture_Create(&g_ctx.decodingOptions) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_DecodingOptionsForPicture_Create failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value GetDesiredAuxiliaryPictures(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.decodingOptions, result);
    Image_AuxiliaryPictureType *auxTypes = nullptr;
    size_t length = 0;
    if (OH_DecodingOptionsForPicture_GetDesiredAuxiliaryPictures(g_ctx.decodingOptions, &auxTypes, &length)
        != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_DecodingOptionsForPicture_GetDesiredAuxiliaryPictures failed");
        return result;
    }

    napi_create_array(env, &result);
    napi_value type = nullptr;
    for (size_t i = 0; i < length; i++) {
        napi_create_int32(env, auxTypes[i], &type);
        napi_set_element(env, result, i, type);
    }
    return result;
}

static napi_value SetDesiredAuxiliaryPictures(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("SetDesiredAuxiliaryPictures: failed to get input arguments!");
        return result;
    }

    int32_t length = 0;
    napi_get_value_int32(env, argValue[NUM_0], &length);
    if (length == 0) {
        LOGW("SetDesiredAuxiliaryPictures: array size is 0!");
        return result;
    }

    Image_AuxiliaryPictureType auxTypes[length];
    napi_value element = nullptr;
    int32_t type = 0;
    for (int32_t i = 0; i < length; i++) {
        napi_get_element(env, argValue[NUM_1], i, &element);
        napi_get_value_int32(env, element, &type);
        auxTypes[i] = static_cast<Image_AuxiliaryPictureType>(type);
    }

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.decodingOptions, result);
    if (OH_DecodingOptionsForPicture_SetDesiredAuxiliaryPictures(
        g_ctx.decodingOptions, auxTypes, static_cast<size_t>(length)) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_DecodingOptionsForPicture_SetDesiredAuxiliaryPictures failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value ReleasePictureDecodingOptions(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.decodingOptions, result);
    if (OH_DecodingOptionsForPicture_Release(g_ctx.decodingOptions)) {
        napi_throw_error(env, nullptr, "OH_DecodingOptionsForPicture_Release failed");
        return result;
    }
    g_ctx.decodingOptions = nullptr;

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value CreatePictureByPixelmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    if (g_ctx.isPixelmapUpdated) {
        IMG_NAPI_RELEASE_PTR(g_ctx.picture, OH_PictureNative_Release(g_ctx.picture));
    }

    if (g_ctx.picture == nullptr) {
        IMG_NAPI_CHECK_NULL_PTR(g_ctx.pixelMap, result);
        if (OH_PictureNative_CreatePicture(g_ctx.pixelMap, &g_ctx.picture) != IMAGE_SUCCESS) {
            napi_throw_error(env, nullptr, "OH_PictureNative_CreatePicture failed");
            return result;
        }
        g_ctx.isPixelmapUpdated = false;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value GetMainPixelmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    OH_PixelmapNative *mainPixelmap = nullptr;
    if (OH_PictureNative_GetMainPixelmap(g_ctx.picture, &mainPixelmap) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureNative_GetMainPixelmap failed");
        return result;
    }

    napi_create_external(env, reinterpret_cast<void *>(mainPixelmap), nullptr, nullptr, &result);
    return result;
}

static napi_value GetHdrComposedPixelmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    OH_PixelmapNative *hdrPixelmap = nullptr;
    if (OH_PictureNative_GetHdrComposedPixelmap(g_ctx.picture, &hdrPixelmap) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureNative_GetHdrComposedPixelmap failed");
        return result;
    }

    napi_create_external(env, reinterpret_cast<void *>(hdrPixelmap), nullptr, nullptr, &result);
    return result;
}

static napi_value GetGainmapPixelmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    OH_PixelmapNative *gainmapPixelmap = nullptr;
    if (OH_PictureNative_GetGainmapPixelmap(g_ctx.picture, &gainmapPixelmap) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureNative_GetGainmapPixelmap failed");
        return result;
    }

    napi_create_external(env, reinterpret_cast<void *>(gainmapPixelmap), nullptr, nullptr, &result);
    return result;
}

static napi_value SetAuxiliaryPicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("SetAuxiliaryPicture: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_AuxiliaryPictureType auxType = static_cast<Image_AuxiliaryPictureType>(type);

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_AuxiliaryPictureNative *auxPicture = reinterpret_cast<OH_AuxiliaryPictureNative *>(ptr);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    if (OH_PictureNative_SetAuxiliaryPicture(g_ctx.picture, auxType, auxPicture) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureNative_SetAuxiliaryPicture failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value GetAuxiliaryPicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("GetAuxiliaryPicture: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_AuxiliaryPictureType auxType = static_cast<Image_AuxiliaryPictureType>(type);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    if (OH_PictureNative_GetAuxiliaryPicture(g_ctx.picture, auxType, &g_ctx.auxPicture) != IMAGE_SUCCESS) {
        return result;
    }

    napi_create_external(env, reinterpret_cast<void *>(g_ctx.auxPicture), nullptr, nullptr, &result);
    return result;
}

static napi_value PictureGetMetadata(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("PictureGetMetadata: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_MetadataType metadataType = static_cast<Image_MetadataType>(type);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    OH_PictureMetadata *metadata = nullptr;
    if (OH_PictureNative_GetMetadata(g_ctx.picture, metadataType, &metadata) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureNative_GetMetadata failed");
        return result;
    }

    napi_create_external(env, reinterpret_cast<void *>(metadata), nullptr, nullptr, &result);
    return result;
}

static napi_value PictureSetMetadata(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("PictureSetMetadata: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_MetadataType metadataType = static_cast<Image_MetadataType>(type);
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PictureMetadata *metadata = reinterpret_cast<OH_PictureMetadata *>(ptr);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    if (OH_PictureNative_SetMetadata(g_ctx.picture, metadataType, metadata) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureNative_SetMetadata failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value ReleasePicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    if (OH_PictureNative_Release(g_ctx.picture) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureNative_Release failed");
        return result;
    }
    g_ctx.picture = nullptr;

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value CreateAuxiliaryPicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOGE("CreateAuxiliaryPicture: failed to get input arguments!");
        return result;
    }

    uint8_t *data = nullptr;
    size_t length = 0;
    napi_get_buffer_info(env, argValue[NUM_0], (void **)&data, &length);

    Image_Size imageSize = {0, 0};
    imageSize.width = GetUint32NamedProperty(env, argValue[NUM_1], AUX_INFO_WIDTH);
    imageSize.height = GetUint32NamedProperty(env, argValue[NUM_1], AUX_INFO_HEIGHT);

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_2], &type);
    Image_AuxiliaryPictureType auxType = static_cast<Image_AuxiliaryPictureType>(type);

    if (g_ctx.auxType != auxType) {
        IMG_NAPI_RELEASE_PTR(g_ctx.auxPicture, OH_AuxiliaryPictureNative_Release(g_ctx.auxPicture));
    }

    if (g_ctx.auxPicture == nullptr) {
        if (OH_AuxiliaryPictureNative_Create(data, length, &imageSize, auxType, &g_ctx.auxPicture) != IMAGE_SUCCESS) {
            napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_Create failed");
            return result;
        }
    }
    g_ctx.auxType = auxType;

    napi_create_external(env, reinterpret_cast<void *>(g_ctx.auxPicture), nullptr, nullptr, &result);
    return result;
}

static napi_value AuxiliaryPictureWritePixels(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureWritePixels: failed to get input arguments!");
        return result;
    }

    uint8_t *data = nullptr;
    size_t length = 0;
    napi_get_buffer_info(env, argValue[NUM_0], (void **)&data, &length);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    if (OH_AuxiliaryPictureNative_WritePixels(g_ctx.auxPicture, data, length) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_WritePixels failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value AuxiliaryPictureReadPixels(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureReadPixels: failed to get input arguments!");
        return result;
    }

    uint8_t *data = nullptr;
    size_t length = 0;
    napi_get_buffer_info(env, argValue[NUM_0], (void **)&data, &length);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    if (OH_AuxiliaryPictureNative_ReadPixels(g_ctx.auxPicture, data, &length) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_ReadPixels failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value AuxiliaryPictureGetType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    Image_AuxiliaryPictureType type = DEFAULT_AUXILIARY_TYPE;
    if (OH_AuxiliaryPictureNative_GetType(g_ctx.auxPicture, &type) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_GetType failed");
        return result;
    }

    napi_create_int32(env, type, &result);
    return result;
}

static napi_value AuxiliaryPictureGetInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    IMG_NAPI_RELEASE_PTR(g_ctx.auxInfo, OH_AuxiliaryPictureInfo_Release(g_ctx.auxInfo));
    if (OH_AuxiliaryPictureNative_GetInfo(g_ctx.auxPicture, &g_ctx.auxInfo) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_GetInfo failed");
        return result;
    }

    LocalAuxInfo localAuxInfo;
    NativeAuxInfoToLocalAuxInfo(g_ctx.auxInfo, localAuxInfo);

    napi_create_object(env, &result);
    SetUint32NamedProperty(env, result, AUX_INFO_TYPE, localAuxInfo.auxType);
    SetUint32NamedProperty(env, result, AUX_INFO_WIDTH, localAuxInfo.size.width);
    SetUint32NamedProperty(env, result, AUX_INFO_HEIGHT, localAuxInfo.size.height);
    SetUint32NamedProperty(env, result, AUX_INFO_ROW_STRIDE, localAuxInfo.rowStride);
    SetUint32NamedProperty(env, result, AUX_INFO_PIXEL_FORMAT, localAuxInfo.pixelFormat);
    return result;
}

static napi_value AuxiliaryPictureSetInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureSetInfo: failed to get input arguments!");
        return result;
    }

    LocalAuxInfo localAuxInfo;
    localAuxInfo.auxType =
        static_cast<Image_AuxiliaryPictureType>(GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_TYPE));
    localAuxInfo.size.width = GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_WIDTH);
    localAuxInfo.size.height = GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_HEIGHT);
    localAuxInfo.rowStride = GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_ROW_STRIDE);
    localAuxInfo.pixelFormat =
        static_cast<PIXEL_FORMAT>(GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_PIXEL_FORMAT));

    OH_AuxiliaryPictureInfo *nativeAuxInfo = nullptr;
    if (OH_AuxiliaryPictureInfo_Create(&nativeAuxInfo) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_Create for AuxiliaryPictureSetInfo failed");
        return result;
    }

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    LocalAuxInfoToNativeAuxInfo(localAuxInfo, nativeAuxInfo);
    if (OH_AuxiliaryPictureNative_SetInfo(g_ctx.auxPicture, nativeAuxInfo) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_SetInfo failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value AuxiliaryPictureGetMetadata(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureGetMetadata: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_MetadataType metadataType = static_cast<Image_MetadataType>(type);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    OH_PictureMetadata *metadata = nullptr;
    if (OH_AuxiliaryPictureNative_GetMetadata(g_ctx.auxPicture, metadataType, &metadata) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_GetMetadata failed");
        return result;
    }

    napi_create_external(env, reinterpret_cast<void *>(metadata), nullptr, nullptr, &result);
    return result;
}

static napi_value AuxiliaryPictureSetMetadata(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("AuxiliaryPictureSetMetadata: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_MetadataType metadataType = static_cast<Image_MetadataType>(type);

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PictureMetadata *metadata = reinterpret_cast<OH_PictureMetadata *>(ptr);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    if (OH_AuxiliaryPictureNative_SetMetadata(g_ctx.auxPicture, metadataType, metadata) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_SetMetadata failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value ReleaseAuxiliaryPicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    if (OH_AuxiliaryPictureNative_Release(g_ctx.auxPicture) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_Release failed");
        return result;
    }
    g_ctx.auxPicture = nullptr;

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value CreateAuxiliaryPictureInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    if (g_ctx.auxInfo == nullptr) {
        if (OH_AuxiliaryPictureInfo_Create(&g_ctx.auxInfo) != IMAGE_SUCCESS) {
            napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_Create failed");
            return result;
        }
    }

    napi_create_external(env, reinterpret_cast<void *>(g_ctx.auxInfo), nullptr, nullptr, &result);
    return result;
}

static napi_value AuxiliaryPictureInfoGetType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxInfo, result);
    Image_AuxiliaryPictureType type = DEFAULT_AUXILIARY_TYPE;
    if (OH_AuxiliaryPictureInfo_GetType(g_ctx.auxInfo, &type) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_GetType failed");
        return result;
    }

    napi_create_int32(env, type, &result);
    return result;
}

static napi_value AuxiliaryPictureInfoSetType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureInfoSetType: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_AuxiliaryPictureType auxType = static_cast<Image_AuxiliaryPictureType>(type);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxInfo, result);
    if (OH_AuxiliaryPictureInfo_SetType(g_ctx.auxInfo, auxType) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_SetType failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value AuxiliaryPictureInfoGetSize(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxInfo, result);
    Image_Size size = {0, 0};
    if (OH_AuxiliaryPictureInfo_GetSize(g_ctx.auxInfo, &size) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_GetSize failed");
        return result;
    }

    napi_create_object(env, &result);
    SetUint32NamedProperty(env, result, AUX_INFO_WIDTH, size.width);
    SetUint32NamedProperty(env, result, AUX_INFO_HEIGHT, size.height);
    return result;
}

static napi_value AuxiliaryPictureInfoSetSize(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureInfoSetSetSize: failed to get input arguments!");
        return result;
    }

    Image_Size size = {0, 0};
    size.width = GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_WIDTH);
    size.height = GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_HEIGHT);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxInfo, result);
    if (OH_AuxiliaryPictureInfo_SetSize(g_ctx.auxInfo, &size) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_SetSize failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value AuxiliaryPictureInfoGetRowStride(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxInfo, result);
    uint32_t rowStride = 0;
    if (OH_AuxiliaryPictureInfo_GetRowStride(g_ctx.auxInfo, &rowStride) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_GetRowStride failed");
        return result;
    }

    napi_create_uint32(env, rowStride, &result);
    return result;
}

static napi_value AuxiliaryPictureInfoSetRowStride(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureInfoSetRowStride: failed to get input arguments!");
        return result;
    }

    uint32_t rowStride = 0;
    napi_get_value_uint32(env, argValue[NUM_0], &rowStride);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxInfo, result);
    if (OH_AuxiliaryPictureInfo_SetRowStride(g_ctx.auxInfo, rowStride) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_SetRowStride failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value AuxiliaryPictureInfoGetPixelFormat(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxInfo, result);
    PIXEL_FORMAT pixelFormat = PIXEL_FORMAT::PIXEL_FORMAT_UNKNOWN;
    if (OH_AuxiliaryPictureInfo_GetPixelFormat(g_ctx.auxInfo, &pixelFormat) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_GetPixelFormat failed");
        return result;
    }

    napi_create_int32(env, pixelFormat, &result);
    return result;
}

static napi_value AuxiliaryPictureInfoSetPixelFormat(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureInfoSetPixelFormat: failed to get input arguments!");
        return result;
    }

    uint32_t temp = 0;
    napi_get_value_uint32(env, argValue[NUM_0], &temp);
    PIXEL_FORMAT pixelFormat = static_cast<PIXEL_FORMAT>(temp);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxInfo, result);
    if (OH_AuxiliaryPictureInfo_SetPixelFormat(g_ctx.auxInfo, pixelFormat) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_SetPixelFormat failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value ReleaseAuxiliaryPictureInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxInfo, result);
    if (OH_AuxiliaryPictureInfo_Release(g_ctx.auxInfo) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_Release failed");
        return result;
    }
    g_ctx.auxInfo = nullptr;

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value AuxiliaryPictureInfoSetTypeErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureInfoSetTypeErrorCode: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_AuxiliaryPictureType auxType = static_cast<Image_AuxiliaryPictureType>(type);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxInfo, result);
    if (OH_AuxiliaryPictureInfo_SetType(g_ctx.auxInfo, auxType) != IMAGE_BAD_PARAMETER) {
        return result;
    }

    napi_create_int32(env, IMAGE_BAD_PARAMETER, &result);
    return result;
}

static napi_value MetadataGetPropertyErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Image_ErrorCode errCode = IMAGE_SUCCESS;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("MetadataGetProperty: failed to get input arguments!");
        return result;
    }

    char key[MAX_STRING_SIZE] = {0};
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], key, MAX_STRING_SIZE, &keySize);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.metadata, result);
    Image_String imageKey = {key, keySize};
    Image_String imageValue = {nullptr, 0};
    errCode = OH_PictureMetadata_GetProperty(g_ctx.metadata, &imageKey, &imageValue);
    if (errCode != IMAGE_SUCCESS) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value GetSingleMainPixelmapInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.singlePicture, result);

    OH_PictureNative_GetMainPixelmap(g_ctx.singlePicture, &g_ctx.mainPixelmap);
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    Image_ErrorCode ret = OH_PixelmapNative_GetImageInfo(g_ctx.mainPixelmap, imageInfo);

    int32_t *alphaType = nullptr;
    OH_PixelmapImageInfo_GetAlphaType(imageInfo, alphaType);
    uint32_t *width = nullptr;
    OH_PixelmapImageInfo_GetWidth(imageInfo, width);
    uint32_t *height = nullptr;
    OH_PixelmapImageInfo_GetHeight(imageInfo, height);
    int32_t *pixelFormat = nullptr;
    OH_PixelmapImageInfo_GetPixelFormat(imageInfo, pixelFormat);

    napi_create_object(env, &result);
    SetUint32NamedProperty(env, result, AUX_INFO_TYPE, *alphaType);
    SetUint32NamedProperty(env, result, AUX_INFO_WIDTH, *width);
    SetUint32NamedProperty(env, result, AUX_INFO_HEIGHT, *height);
    SetUint32NamedProperty(env, result, AUX_INFO_PIXEL_FORMAT, *pixelFormat);
    return result;
}

static napi_value CreateSinglePictureByImageSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    if (g_ctx.isImageSourceUpdated) {
        IMG_NAPI_RELEASE_PTR(g_ctx.singlePicture, OH_PictureNative_Release(g_ctx.singlePicture));
    } else {
        IMG_NAPI_NOT_NULL_PTR_RETURN(g_ctx.singlePicture, result);
    }

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.imageSource, result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.decodingOptions, result);
    if (OH_ImageSourceNative_CreatePicture(g_ctx.imageSource, g_ctx.decodingOptions, &g_ctx.singlePicture)
        != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_ImageSourceNative_CreatePicture failed");
        return result;
    }
    g_ctx.isImageSourceUpdated = false;

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value GetHdrPixelmapInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.singlePicture, result);
    OH_PixelmapNative *hdrPixelmap = nullptr;
    OH_PictureNative_GetHdrComposedPixelmap(g_ctx.singlePicture, &hdrPixelmap);
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    Image_ErrorCode ret = OH_PixelmapNative_GetImageInfo(hdrPixelmap, imageInfo);

    uint32_t *width = nullptr;
    OH_PixelmapImageInfo_GetWidth(imageInfo, width);
    uint32_t *height = nullptr;
    OH_PixelmapImageInfo_GetHeight(imageInfo, height);
    int32_t *pixelFormat = nullptr;
    OH_PixelmapImageInfo_GetPixelFormat(imageInfo, pixelFormat);

    napi_create_object(env, &result);
    SetUint32NamedProperty(env, result, AUX_INFO_WIDTH, *width);
    SetUint32NamedProperty(env, result, AUX_INFO_HEIGHT, *height);
    SetUint32NamedProperty(env, result, AUX_INFO_PIXEL_FORMAT, *pixelFormat);
    return result;
}

static napi_value AuxiliarySinglePictureSetInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("AuxiliarySinglePictureSetInfo: failed to get input arguments!");
        return result;
    }

    LocalAuxInfo localAuxInfo;
    localAuxInfo.auxType =
        static_cast<Image_AuxiliaryPictureType>(GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_TYPE));
    localAuxInfo.size.width = GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_WIDTH);
    localAuxInfo.size.height = GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_HEIGHT);
    localAuxInfo.rowStride = GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_ROW_STRIDE);
    localAuxInfo.pixelFormat =
        static_cast<PIXEL_FORMAT>(GetUint32NamedProperty(env, argValue[NUM_0], AUX_INFO_PIXEL_FORMAT));

    OH_AuxiliaryPictureInfo *nativeAuxInfo = nullptr;
    if (OH_AuxiliaryPictureInfo_Create(&nativeAuxInfo) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureInfo_Create for AuxiliarySinglePictureSetInfo failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_AuxiliaryPictureNative *auxPicture = reinterpret_cast<OH_AuxiliaryPictureNative *>(ptr);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    LocalAuxInfoToNativeAuxInfo(localAuxInfo, nativeAuxInfo);
    if (OH_AuxiliaryPictureNative_SetInfo(auxPicture, nativeAuxInfo) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "AuxiliarySinglePictureSetInfo failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value SetAuxiliarySinglePicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("SetAuxiliarySinglePicture: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_AuxiliaryPictureType auxType = static_cast<Image_AuxiliaryPictureType>(type);

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_AuxiliaryPictureNative *auxPicture = reinterpret_cast<OH_AuxiliaryPictureNative *>(ptr);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.singlePicture, result);
    if (OH_PictureNative_SetAuxiliaryPicture(g_ctx.singlePicture, auxType, auxPicture) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureNative_SetAuxiliaryPicture failed");
        return result;
    }

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value PixelMapGetInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    IMG_NAPI_RELEASE_PTR(g_ctx.auxInfo, OH_AuxiliaryPictureInfo_Release(g_ctx.auxInfo));
    if (OH_AuxiliaryPictureNative_GetInfo(g_ctx.auxPicture, &g_ctx.auxInfo) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_GetInfo failed");
        return result;
    }

    LocalAuxInfo localAuxInfo;
    NativeAuxInfoToLocalAuxInfo(g_ctx.auxInfo, localAuxInfo);

    napi_create_object(env, &result);
    SetUint32NamedProperty(env, result, AUX_INFO_TYPE, localAuxInfo.auxType);
    SetUint32NamedProperty(env, result, AUX_INFO_WIDTH, localAuxInfo.size.width);
    SetUint32NamedProperty(env, result, AUX_INFO_HEIGHT, localAuxInfo.size.height);
    SetUint32NamedProperty(env, result, AUX_INFO_ROW_STRIDE, localAuxInfo.rowStride);
    SetUint32NamedProperty(env, result, AUX_INFO_PIXEL_FORMAT, localAuxInfo.pixelFormat);
    return result;
}

static napi_value GetGainmapPixelmapInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);

    Image_ErrorCode errorCode = OH_PictureNative_GetGainmapPixelmap(g_ctx.picture, &g_ctx.gainmapPixelmap);
    if (errorCode != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PictureNative_GetGainmapPixelmap failed");
        return result;
    }
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    errorCode = OH_PixelmapImageInfo_Create(&imageInfo);
    if (errorCode != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PixelmapImageInfo_Create failed");
        return result;
    }
    errorCode = OH_PixelmapNative_GetImageInfo(g_ctx.gainmapPixelmap, imageInfo);
    if (errorCode != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PixelmapNative_GetImageInfo failed");
        return result;
    }

    uint32_t width;
    OH_PixelmapImageInfo_GetWidth(imageInfo, &width);
    uint32_t height;
    OH_PixelmapImageInfo_GetHeight(imageInfo, &height);
    int32_t pixelFormat;
    OH_PixelmapImageInfo_GetPixelFormat(imageInfo, &pixelFormat);

    napi_create_object(env, &result);
    SetUint32NamedProperty(env, result, AUX_INFO_WIDTH, width);
    SetUint32NamedProperty(env, result, AUX_INFO_HEIGHT, height);
    SetUint32NamedProperty(env, result, AUX_INFO_PIXEL_FORMAT, pixelFormat);
    return result;
}

static napi_value GetMainPixelmapInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);

    OH_PictureNative_GetMainPixelmap(g_ctx.picture, &g_ctx.mainPixelmap);
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    Image_ErrorCode ret = OH_PixelmapNative_GetImageInfo(g_ctx.mainPixelmap, imageInfo);

    uint32_t width;
    OH_PixelmapImageInfo_GetWidth(imageInfo, &width);
    uint32_t height;
    OH_PixelmapImageInfo_GetHeight(imageInfo, &height);
    int32_t pixelFormat;
    OH_PixelmapImageInfo_GetPixelFormat(imageInfo, &pixelFormat);

    napi_create_object(env, &result);
    SetUint32NamedProperty(env, result, AUX_INFO_WIDTH, width);
    SetUint32NamedProperty(env, result, AUX_INFO_HEIGHT, height);
    SetUint32NamedProperty(env, result, AUX_INFO_PIXEL_FORMAT, pixelFormat);
    return result;
}

static napi_value CreateAuxiliaryPictureErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;

    Image_ErrorCode errCode = IMAGE_SUCCESS;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOGE("CreateAuxiliaryPictureErrorCode: failed to get input arguments!");
        return result;
    }

    uint8_t *data = nullptr;
    size_t length = 0;
    napi_get_buffer_info(env, argValue[NUM_0], (void **)&data, &length);

    Image_Size imageSize = {0, 0};
    imageSize.width = GetUint32NamedProperty(env, argValue[NUM_1], AUX_INFO_WIDTH);
    imageSize.height = GetUint32NamedProperty(env, argValue[NUM_1], AUX_INFO_HEIGHT);

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_2], &type);
    Image_AuxiliaryPictureType auxType = static_cast<Image_AuxiliaryPictureType>(type);

    if (g_ctx.auxType != auxType) {
        IMG_NAPI_RELEASE_PTR(g_ctx.auxPicture, OH_AuxiliaryPictureNative_Release(g_ctx.auxPicture));
    }
    if (g_ctx.auxPicture == nullptr) {
        errCode = OH_AuxiliaryPictureNative_Create(data, length, &imageSize, auxType, &g_ctx.auxPicture);
        if (errCode != IMAGE_SUCCESS) {
            napi_create_int32(env, errCode, &result);
            return result;
        }
    }
    g_ctx.auxType = auxType;

    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

static napi_value AuxiliaryPictureGetMetadataErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureGetMetadataErrorCode: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_MetadataType metadataType = static_cast<Image_MetadataType>(type);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    OH_PictureMetadata *metadata = nullptr;
    Image_ErrorCode err = OH_AuxiliaryPictureNative_GetMetadata(g_ctx.auxPicture, metadataType, &metadata);
    napi_create_int32(env, err, &result);
    return result;
}

static napi_value PackToDataFromPictureErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("PackToDataFromPicture: failed to get input arguments!");
        return result;
    }

    uint8_t *outData = nullptr;
    size_t outSize = 0;
    napi_get_buffer_info(env, argValue[NUM_0], (void **)&outData, &outSize);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.imagePacker, result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.packingOptions, result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    Image_ErrorCode errorcode = OH_ImagePackerNative_PackToDataFromPicture(g_ctx.imagePacker, g_ctx.packingOptions,
        g_ctx.picture, outData, &outSize);
    napi_create_int32(env, errorcode, &result);
    return result;
}

static napi_value AuxiliaryPictureReadPixelsErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureReadPixels: failed to get input arguments!");
        return result;
    }

    uint8_t *data = nullptr;
    size_t length = 0;
    napi_get_buffer_info(env, argValue[NUM_0], (void **)&data, &length);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    Image_ErrorCode errorcode = OH_AuxiliaryPictureNative_ReadPixels(g_ctx.auxPicture, data, &length);
    napi_create_int32(env, errorcode, &result);
    return result;
}

static napi_value SetAuxiliaryPictureErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("SetAuxiliaryPictureErrorCode: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_AuxiliaryPictureType auxType = static_cast<Image_AuxiliaryPictureType>(type);

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_AuxiliaryPictureNative *auxPicture = reinterpret_cast<OH_AuxiliaryPictureNative *>(ptr);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    if (OH_PictureNative_SetAuxiliaryPicture(g_ctx.picture, auxType, auxPicture) != IMAGE_BAD_PARAMETER) {
        napi_throw_error(env, nullptr, "OH_PictureNative_SetAuxiliaryPicture failed");
        return result;
    }

    napi_create_int32(env, IMAGE_BAD_PARAMETER, &result);
    return result;
}

static napi_value MetadataSetPropertyErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("MetadataSetPropertyErrorCode: failed to get input arguments!");
        return result;
    }

    char key[MAX_STRING_SIZE] = {0};
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], key, MAX_STRING_SIZE, &keySize);

    char value[MAX_STRING_SIZE] = {0};
    size_t valueSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_1], value, MAX_STRING_SIZE, &valueSize);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.metadata, result);
    Image_String imageKey = {key, keySize};
    Image_String imageValue = {value, valueSize};

    Image_ErrorCode errCode = IMAGE_SUCCESS;
    errCode = OH_PictureMetadata_SetProperty(g_ctx.metadata, &imageKey, &imageValue);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value PictureSetMetadataErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("PictureSetMetadataErrorCode: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_MetadataType metadataType = static_cast<Image_MetadataType>(type);
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PictureMetadata *metadata = reinterpret_cast<OH_PictureMetadata *>(ptr);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    Image_ErrorCode errCode = IMAGE_SUCCESS;
    errCode = OH_PictureNative_SetMetadata(g_ctx.picture, metadataType, metadata);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value PictureGetMetadataErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("PictureGetMetadataErrorCode: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_MetadataType metadataType = static_cast<Image_MetadataType>(type);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    OH_PictureMetadata *metadata = nullptr;
    Image_ErrorCode errCode = IMAGE_SUCCESS;
    errCode = OH_PictureNative_GetMetadata(g_ctx.picture, metadataType, &metadata);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value GetAuxiliaryPictureErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("GetAuxiliaryPicture: failed to get input arguments!");
        return result;
    }

    int32_t type = 0;
    napi_get_value_int32(env, argValue[NUM_0], &type);
    Image_AuxiliaryPictureType auxType = static_cast<Image_AuxiliaryPictureType>(type);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.picture, result);
    OH_AuxiliaryPictureNative *auxPicture = nullptr;
    Image_ErrorCode errCode = IMAGE_SUCCESS;
    errCode = OH_PictureNative_GetAuxiliaryPicture(g_ctx.picture, auxType, &auxPicture);

    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value AuxiliaryPictureWritePixelsErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("AuxiliaryPictureWritePixels: failed to get input arguments!");
        return result;
    }

    uint8_t *data = nullptr;
    size_t length = 0;
    napi_get_buffer_info(env, argValue[NUM_0], (void **)&data, &length);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);
    if (OH_AuxiliaryPictureNative_WritePixels(g_ctx.auxPicture, data, length) != IMAGE_BAD_PARAMETER) {
        napi_throw_error(env, nullptr, "OH_AuxiliaryPictureNative_WritePixels failed");
        return result;
    }

    napi_create_int32(env, IMAGE_BAD_PARAMETER, &result);
    return result;
}

static napi_value GetPixelmapBuffer(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    IMG_NAPI_CHECK_NULL_PTR(g_ctx.pixelMap, result);
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("GetAuxiliaryPicture: failed to get input arguments!");
        return result;
    }

    uint8_t* data;
    size_t bufferSize;
    napi_get_arraybuffer_info(env, argValue[NUM_0], (void **)&data, &bufferSize);
    Image_ErrorCode errorCode = OH_PixelmapNative_ReadPixels(g_ctx.pixelMap, data, &bufferSize);
    if (errorCode != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PixelmapNative_ReadPixels failed");
        return result;
    }

    napi_create_arraybuffer(env, bufferSize, (void **)&data, &result);
    return result;
}

static napi_value AuxiliaryPictureSetInfoToCtx(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.auxPicture, result);

    Image_ErrorCode errCode = OH_AuxiliaryPictureNative_SetInfo(g_ctx.auxPicture, g_ctx.auxInfo);

    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value SetNeedsPackPropertiesToTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOGE("SetNeedsPackPropertiesToTestPackingOptions get needsPackProperties failed");
        return result;
    }

    bool needsPackProperties = true;
    napi_get_value_bool(env, argValue[NUM_0], &needsPackProperties);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.packingOptions, result);
    if (OH_PackingOptions_SetNeedsPackProperties(g_ctx.packingOptions, needsPackProperties) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PackingOptions_SetDesiredDynamicRange failed");
        return result;
    }

    return result;
}

static napi_value GetImageSourceInfoSize(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    IMG_NAPI_CHECK_NULL_PTR(g_ctx.imageSource, result);
    OH_ImageSource_Info *imageInfo = nullptr;
    if (OH_ImageSourceInfo_Create(&imageInfo) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PixelmapImageInfo_Create failed");
        return result;
    }
    int32_t index = 0;
    if (OH_ImageSourceNative_GetImageInfo(g_ctx.imageSource, index, imageInfo) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PixelmapNative_GetImageInfo failed");
        return result;
    }
    uint32_t width = 0;
    if (OH_ImageSourceInfo_GetWidth(imageInfo, &width) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PixelmapImageInfo_GetWidth failed");
        return result;
    }
    uint32_t height = 0;
    if (OH_ImageSourceInfo_GetHeight(imageInfo, &height) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PixelmapImageInfo_GetHeight failed");
        return result;
    }
    OH_ImageSourceInfo_Release(imageInfo);
    napi_create_object(env, &result);
    SetUint32NamedProperty(env, result, AUX_INFO_WIDTH, width);
    SetUint32NamedProperty(env, result, AUX_INFO_HEIGHT, height);
    return result;
}

static napi_value CompareArrayBuffer(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOGE("CompareArrayBuffer: failed to get input arguments!");
        return result;
    }

    uint8_t* data1;
    size_t bufferSize1;
    napi_get_arraybuffer_info(env, argValue[NUM_0], (void **)&data1, &bufferSize1);
    uint8_t* data2;
    size_t bufferSize2;
    napi_get_arraybuffer_info(env, argValue[NUM_1], (void **)&data2, &bufferSize2);

    if (bufferSize1 != bufferSize2) {
        LOGE("CompareArrayBuffer: Wrong! Different array lengths!");
        napi_get_boolean(env, false, &result);
        return result;
    }
    int compareResult = memcmp(data1, data2, bufferSize1);
    if (compareResult != 0) {
        LOGE("CompareArrayBuffer: Wrong! memcmp failed");
        napi_get_boolean(env, false, &result);
        return result;
    }

    LOGE("CompareArrayBuffer: Same Array!");
    napi_get_boolean(env, true, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"releaseTestContext", nullptr, ReleaseTestContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createTestImagePacker", nullptr, CreateTestImagePacker, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createTestPackingOptions", nullptr, CreateTestPackingOptions, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"setMimeTypeToTestPackingOptions", nullptr, SetMimeTypeToTestPackingOptions, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"setDynamicRangeToTestPackingOptions", nullptr, SetDynamicRangeToTestPackingOptions, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"createTestImageSource", nullptr, CreateTestImageSource, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createTestPixelmapByImageSource", nullptr, CreateTestPixelmapByImageSource, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"MetadataCreate", nullptr, MetadataCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"MetadataGetProperty", nullptr, MetadataGetProperty, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"MetadataSetProperty", nullptr, MetadataSetProperty, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"MetadataRelease", nullptr, MetadataRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"MetadataClone", nullptr, MetadataClone, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clonedMetadataGetProperty", nullptr, ClonedMetadataGetProperty, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"clonedMetadataRelease", nullptr, ClonedMetadataRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pictureMetadataGetProperty", nullptr, PictureMetadataGetProperty, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"auxiliaryMetadataGetProperty", nullptr, AuxiliaryMetadataGetProperty, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PackToDataFromPicture", nullptr, PackToDataFromPicture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PackToFileFromPicture", nullptr, PackToFileFromPicture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreatePictureByImageSource", nullptr, CreatePictureByImageSource, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"CreatePictureDecodingOptions", nullptr, CreatePictureDecodingOptions, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"GetDesiredAuxiliaryPictures", nullptr, GetDesiredAuxiliaryPictures, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"SetDesiredAuxiliaryPictures", nullptr, SetDesiredAuxiliaryPictures, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"ReleasePictureDecodingOptions", nullptr, ReleasePictureDecodingOptions, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"CreatePictureByPixelmap", nullptr, CreatePictureByPixelmap, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"GetMainPixelmap", nullptr, GetMainPixelmap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetHdrComposedPixelmap", nullptr, GetHdrComposedPixelmap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetGainmapPixelmap", nullptr, GetGainmapPixelmap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetAuxiliaryPicture", nullptr, SetAuxiliaryPicture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAuxiliaryPicture", nullptr, GetAuxiliaryPicture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAuxiliaryPictureErrorCode", nullptr, GetAuxiliaryPictureErrorCode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PictureGetMetadata", nullptr, PictureGetMetadata, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PictureSetMetadata", nullptr, PictureSetMetadata, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ReleasePicture", nullptr, ReleasePicture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreateAuxiliaryPicture", nullptr, CreateAuxiliaryPicture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AuxiliaryPictureWritePixels", nullptr, AuxiliaryPictureWritePixels, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureWritePixelsErrorCode", nullptr, AuxiliaryPictureWritePixelsErrorCode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AuxiliaryPictureReadPixels", nullptr, AuxiliaryPictureReadPixels, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureGetType", nullptr, AuxiliaryPictureGetType, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureGetInfo", nullptr, AuxiliaryPictureGetInfo, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureSetInfo", nullptr, AuxiliaryPictureSetInfo, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureGetMetadata", nullptr, AuxiliaryPictureGetMetadata, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureSetMetadata", nullptr, AuxiliaryPictureSetMetadata, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"ReleaseAuxiliaryPicture", nullptr, ReleaseAuxiliaryPicture, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"CreateAuxiliaryPictureInfo", nullptr, CreateAuxiliaryPictureInfo, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureInfoGetType", nullptr, AuxiliaryPictureInfoGetType, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureInfoSetType", nullptr, AuxiliaryPictureInfoSetType, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureInfoGetSize", nullptr, AuxiliaryPictureInfoGetSize, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureInfoSetSize", nullptr, AuxiliaryPictureInfoSetSize, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureInfoGetRowStride", nullptr, AuxiliaryPictureInfoGetRowStride, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AuxiliaryPictureInfoSetRowStride", nullptr, AuxiliaryPictureInfoSetRowStride, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AuxiliaryPictureInfoGetPixelFormat", nullptr, AuxiliaryPictureInfoGetPixelFormat, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AuxiliaryPictureInfoSetPixelFormat", nullptr, AuxiliaryPictureInfoSetPixelFormat, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"ReleaseAuxiliaryPictureInfo", nullptr, ReleaseAuxiliaryPictureInfo, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"CreateSinglePictureByImageSource", nullptr, CreateSinglePictureByImageSource, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"GetHdrPixelmapInfo", nullptr, GetHdrPixelmapInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AuxiliarySinglePictureSetInfo", nullptr, AuxiliarySinglePictureSetInfo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"SetAuxiliarySinglePicture", nullptr, SetAuxiliarySinglePicture, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"PixelMapGetInfo", nullptr, PixelMapGetInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetSingleMainPixelmapInfo", nullptr, GetSingleMainPixelmapInfo, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"GetMainPixelmapInfo", nullptr, GetMainPixelmapInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AuxiliaryPictureInfoSetTypeErrorCode", nullptr, AuxiliaryPictureInfoSetTypeErrorCode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"GetGainmapPixelmapInfo", nullptr, GetGainmapPixelmapInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreateAuxiliaryPictureErrorCode", nullptr, CreateAuxiliaryPictureErrorCode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AuxiliaryPictureGetMetadataErrorCode", nullptr, AuxiliaryPictureGetMetadataErrorCode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"PackToDataFromPictureErrorCode", nullptr, PackToDataFromPictureErrorCode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AuxiliaryPictureReadPixelsErrorCode", nullptr, AuxiliaryPictureReadPixelsErrorCode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"SetAuxiliaryPictureErrorCode", nullptr, SetAuxiliaryPictureErrorCode, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"MetadataSetPropertyErrorCode", nullptr, MetadataSetPropertyErrorCode, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"PictureSetMetadataErrorCode", nullptr, PictureSetMetadataErrorCode, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"PictureGetMetadataErrorCode", nullptr, PictureGetMetadataErrorCode, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"MetadataGetPropertyErrorCode", nullptr, MetadataGetPropertyErrorCode, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"GetPixelmapBuffer", nullptr, GetPixelmapBuffer, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AuxiliaryPictureSetInfoToCtx", nullptr, AuxiliaryPictureSetInfoToCtx, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"setNeedsPackPropertiesToTestPackingOptions", nullptr, SetNeedsPackPropertiesToTestPackingOptions, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"GetImageSourceInfoSize", nullptr, GetImageSourceInfoSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"compareArrayBuffer", nullptr, CompareArrayBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
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