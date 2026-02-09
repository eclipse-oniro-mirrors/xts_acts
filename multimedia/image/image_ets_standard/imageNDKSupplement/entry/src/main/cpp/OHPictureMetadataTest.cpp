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

#include "OHPictureMetadataTest.h"
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <hilog/log.h>
#include "napi/native_api.h"
#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "PictureMetadataNDK"

#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define NUM_0 1
#define NUM_1 2
#define NUM_2 3

#define MAX_STRING_SIZE 128
#define MAX_PATH_SIZE 1024
#define MAX_EXIF_KEY_SIZE 190
#define MAX_BUFFER_SIZE 512
#define RGBA_1010102 10
#define YCBCR_P010 10
#define YCRCB_P010 10

napi_value PictureMetadataGetProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};

    char key[MAX_STRING_SIZE] = {0};
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], key, MAX_STRING_SIZE, &keySize);
    OH_PictureMetadata *metadata = metadata;
    Image_String imageKey = {key, keySize};
    Image_String imageValue = {nullptr, 0};
    napi_create_string_utf8(env, (const char *)imageValue.data, imageValue.size, &result);
    Image_ErrorCode errorCode = OH_PictureMetadata_GetProperty(metadata, &imageKey, &imageValue);
    int32_t index;
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_PictureMetadata_GetProperty(metadata, 0, 0);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value PictureMetadataSetProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    napi_get_undefined(env, &result);
    char key[MAX_STRING_SIZE] = {0};
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], key, MAX_STRING_SIZE, &keySize);
    char value[MAX_STRING_SIZE] = {0};
    size_t valueSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_1], value, MAX_STRING_SIZE, &valueSize);
    OH_PictureMetadata* metadata = metadata;
    Image_String imageKey = {key, keySize};
    Image_String imageValue = {value, valueSize};
    Image_ErrorCode errorCode = OH_PictureMetadata_GetProperty(metadata, &imageKey, &imageValue);
    int32_t index;
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_2:
        code = OH_PictureMetadata_SetProperty(metadata, 0, 0);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value ClonedMetadataGetProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    napi_get_undefined(env, &result);
    char key[MAX_STRING_SIZE] = {0};
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], key, MAX_STRING_SIZE, &keySize);
    OH_PictureMetadata *oldMetadata = oldMetadata;
    OH_PictureMetadata **newMetadata = newMetadata;
    Image_String imageKey = {key, keySize};
    Image_String imageValue = {nullptr, 0};
    napi_create_string_utf8(env, (const char *)imageValue.data, imageValue.size, &result);
    
    int32_t index;
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_3:
      code = OH_PictureMetadata_Clone(oldMetadata, newMetadata);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}