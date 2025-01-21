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
#include "pixel_map_module_test.h"
#include <securec.h>
#ifndef _WIN32
#include "securec.h"
#else
#include "memory.h"
#endif

#undef LOG_TAG
#define LOG_TAG "ImagePixelMapNative"

#define SHOW_LOG
#ifdef SHOW_LOG
constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, 0xD002B05, "ImagePixelMapNative"};

#define MY_HILOG(op, fmt, args...) \
    do {                                  \
        op(LABEL, "{%{public}s:%{public}d} " fmt, __FUNCTION__, __LINE__, ##args);  \
    } while (0)
#define DEBUG_LOG(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Info, fmt, ##__VA_ARGS__)

#define IMG_TST_LOGF(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Fatal, fmt, ##__VA_ARGS__)
#define IMG_TST_LOGE(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Error, fmt, ##__VA_ARGS__)
#define IMG_TST_LOGW(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Warn, fmt, ##__VA_ARGS__)
#define IMG_TST_LOGI(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Info, fmt, ##__VA_ARGS__)
#define IMG_TST_LOGD(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Debug, fmt, ##__VA_ARGS__)
#else
#define IMG_TST_LOGF(...)
#define IMG_TST_LOGE(...)
#define IMG_TST_LOGW(...)
#define IMG_TST_LOGI(...)
#define IMG_TST_LOGD(...)
#endif

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
        IMG_TST_LOGE("OH_ImageSourceNative_CreateFromFd failed: err = %{public}d.", ret);
        return ret;
    }
    OH_DecodingOptions* options = nullptr;
    ret = OH_DecodingOptions_Create(&options);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(res);
        IMG_TST_LOGE("OH_DecodingOptions_Create failed: err = %{public}d.", ret);
        return ret;
    }
    ret = OH_DecodingOptions_SetPixelFormat(options, pixelformat);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(res);
        OH_DecodingOptions_Release(options);
        IMG_TST_LOGE("OH_DecodingOptions_SetPixelFormat failed: err = %{public}d.", ret);
        return ret;
    }
    ret = OH_ImageSourceNative_CreatePixelmap(res, options, pixelmap);
    if (ret != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(res);
        OH_DecodingOptions_Release(options);
        IMG_TST_LOGE("OH_ImageSourceNative_CreatePixelmap failed: err = %{public}d.", ret);
        return ret;
    }
    OH_ImageSourceNative_Release(res);
    OH_DecodingOptions_Release(options);
    IMG_TST_LOGI("OH_ImageSourceNative_CreatePixelmap success.");
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
    IMG_TST_LOGI("ConvertPixelmapToNapi success.");
    return ret;
}

int32_t ImagePixelMapNative::ConvertPixelmapFromNapi(napi_env env, napi_value source, OH_PixelmapNative **pixelmap)
{
    int32_t PixelFormat = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, source, pixelmap);
    if (pixelmap == nullptr || PixelFormat != 0) {
        return -1;
    }
    IMG_TST_LOGI("ConvertPixelmapFromNapi success.");
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
    IMG_TST_LOGI("GetPixelmapPixelWidth success.");
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
    IMG_TST_LOGI("GetPixelmapPixelHeight success.");
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
    IMG_TST_LOGI("GetPixelmapPixelFormat success.");
    return ret;
}

void ImagePixelMapNative::ReleasePixelmapNative(OH_PixelmapNative *pixelmap)
{
    OH_PixelmapNative_Release(pixelmap);
}
