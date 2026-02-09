/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <hilog/log.h>
#include "./pixel_map_module_test.h"
#ifndef _WIN32
#else
#include "memory.h"
#endif

#define IMAGE_LOG_TAG "IMAGE_TAGLOG"
#define IMAGE_LOG_DOMAIN 0x3200

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)


ImagePixelMapNative::ImagePixelMapNative()
{
}

ImagePixelMapNative::~ImagePixelMapNative()
{
}

int32_t ImagePixelMapNative::GetPixelmap(int32_t fd, int32_t pixelformat, OH_PixelmapNative **pixelmap)
{
    OH_ImageSourceNative* res = nullptr;
    int32_t ret = OH_ImageSourceNative_CreateFromFd(fd, &res);
    if (ret != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_CreateFromFd failed: err = %{public}d.", ret);
        return ret;
    }
    OH_DecodingOptions* options = nullptr;
    ret = OH_DecodingOptions_Create(&options);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(res);
        LOG("OH_DecodingOptions_Create failed: err = %{public}d.", ret);
        return ret;
    }
    ret = OH_DecodingOptions_SetPixelFormat(options, pixelformat);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(res);
        OH_DecodingOptions_Release(options);
        LOG("OH_DecodingOptions_SetPixelFormat failed: err = %{public}d.", ret);
        return ret;
    }
    ret = OH_ImageSourceNative_CreatePixelmap(res, options, pixelmap);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(res);
        OH_DecodingOptions_Release(options);
        LOG("OH_ImageSourceNative_CreatePixelmap failed: err = %{public}d.", ret);
        return ret;
    }
    OH_ImageSourceNative_Release(res);
    OH_DecodingOptions_Release(options);
    return ret;
}

int32_t ImagePixelMapNative::ConvertPixelmapToNapi(napi_env env, OH_PixelmapNative *pixelmap, napi_value *res)
{
    int32_t ret = OH_PixelmapNative_ConvertPixelmapNativeToNapi(env, pixelmap, res);
    if (ret != 0 || *res == nullptr) {
        OH_PixelmapNative_Release(pixelmap);
        return IMAGE_BAD_PARAMETER;
    }
    OH_PixelmapNative_Release(pixelmap);
    return ret;
}

int32_t ImagePixelMapNative::ConvertPixelmapFromNapi(napi_env env, napi_value source, OH_PixelmapNative **pixelmap)
{
    int32_t PixelFormat = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, source, pixelmap);
    if (pixelmap == nullptr || PixelFormat != 0) {
        return -1;
    }
    return PixelFormat;
}

int32_t ImagePixelMapNative::GetPixelmapPixelWidth(napi_env env, OH_PixelmapNative *pixelmap, napi_value *Width)
{
    OH_Pixelmap_ImageInfo* info = nullptr;
    int ret = OH_PixelmapImageInfo_Create(&info);
    if (ret != 0) {
        OH_PixelmapImageInfo_Release(info);
        return ret;
    }
    ret = OH_PixelmapNative_GetImageInfo(pixelmap, info);
    if (ret != 0 || info == nullptr) {
        OH_PixelmapNative_Release(pixelmap);
        OH_PixelmapImageInfo_Release(info);
        return ret;
    }
    uint32_t PixelWidth = 0;
    ret = OH_PixelmapImageInfo_GetWidth(info, &PixelWidth);
    if (ret != IMAGE_SUCCESS) {
        OH_PixelmapNative_Release(pixelmap);
        OH_PixelmapImageInfo_Release(info);
        return ret;
    }
    OH_PixelmapImageInfo_Release(info);
    napi_create_uint32(env, PixelWidth, Width);
    return ret;
}

int32_t ImagePixelMapNative::GetPixelmapPixelHeight(napi_env env, OH_PixelmapNative *pixelmap, napi_value *Height)
{
    OH_Pixelmap_ImageInfo* info = nullptr;
    int32_t ret = OH_PixelmapImageInfo_Create(&info);
    if (ret != 0) {
        OH_PixelmapImageInfo_Release(info);
        return ret;
    }
    ret = OH_PixelmapNative_GetImageInfo(pixelmap, info);
    if (ret != 0 || info == nullptr) {
        OH_PixelmapNative_Release(pixelmap);
        OH_PixelmapImageInfo_Release(info);
        return ret;
    }
    uint32_t PixelHeight = 0;
    ret = OH_PixelmapImageInfo_GetHeight(info, &PixelHeight);
    if (ret != IMAGE_SUCCESS) {
        OH_PixelmapNative_Release(pixelmap);
        OH_PixelmapImageInfo_Release(info);
        return ret;
    }
    OH_PixelmapImageInfo_Release(info);
    napi_create_uint32(env, PixelHeight, Height);
    return ret;
}

int32_t ImagePixelMapNative::GetPixelmapPixelFormat(napi_env env, OH_PixelmapNative *pixelmap, napi_value *pixelFormat)
{
    OH_Pixelmap_ImageInfo* info = nullptr;
    int32_t ret = OH_PixelmapImageInfo_Create(&info);
    if (ret != 0) {
        OH_PixelmapImageInfo_Release(info);
        return ret;
    }
    ret = OH_PixelmapNative_GetImageInfo(pixelmap, info);
    if (ret != 0 || info == nullptr) {
        OH_PixelmapNative_Release(pixelmap);
        OH_PixelmapImageInfo_Release(info);
        return ret;
    }
    int32_t format = 0;
    ret = OH_PixelmapImageInfo_GetPixelFormat(info, &format);
    if (ret != IMAGE_SUCCESS) {
        OH_PixelmapNative_Release(pixelmap);
        OH_PixelmapImageInfo_Release(info);
        return ret;
    }
    OH_PixelmapImageInfo_Release(info);
    napi_create_int32(env, format, pixelFormat);
    return ret;
}

void ImagePixelMapNative::ReleasePixelmapNative(OH_PixelmapNative *pixelmap)
{
    OH_PixelmapNative_Release(pixelmap);
}
