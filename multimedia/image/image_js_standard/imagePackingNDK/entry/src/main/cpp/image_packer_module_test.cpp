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
#include "image_packer_module_test.h"
#include "multimedia/image_framework/image/image_packer_native.h"

#define CAMERA_LOG_TAG "CAMERA_TAGLOG"
#define CAMERA_LOG_DOMAIN 0x3200
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)

ImagePackerModuleTest::ImagePackerModuleTest()
{
}

ImagePackerModuleTest::~ImagePackerModuleTest()
{
}

Image_ErrorCode ImagePackerModuleTest::PackToDataMultiFrames(OH_PackingOptionsForSequence *options,
    OH_PixelmapNative **pixelmaps, size_t mapSize, uint8_t* outData, size_t* outDataSize)
{
    LOG("PackToDataMultiFrames enter.");

    OH_ImagePackerNative *imagePacker = nullptr;
    Image_ErrorCode ret = OH_ImagePackerNative_Create(&imagePacker);
    if (ret != IMAGE_SUCCESS) {
        OH_ImagePackerNative_Release(imagePacker);
        LOG("Create Image Packer failed: err = %{public}d.", ret);
        return ret;
    }

    ret = OH_ImagePackerNative_PackToDataFromPixelmapSequence(imagePacker, options, pixelmaps,
        mapSize, outData, outDataSize);
    if (ret != IMAGE_SUCCESS) {
        OH_ImagePackerNative_Release(imagePacker);
        LOG("PackToDataMultiFrames failed: err = %{public}d.", ret);
        return ret;
    }
    OH_ImagePackerNative_Release(imagePacker);
    LOG("PackToDataMultiFrames end.");
    return IMAGE_SUCCESS;
}

Image_ErrorCode ImagePackerModuleTest::PackToDataMultiFramesError(
    packMultiFramesOptions *opts, uint8_t* outData, size_t* outDataSize)
{
    LOG("PackToDataMultiFramesError enter.");

    OH_ImagePackerNative *imagePacker = nullptr;
    Image_ErrorCode ret = IMAGE_SUCCESS;
    if (opts->mode != BAD_PARAMETER_IMAGEPACKER) {
        ret = OH_ImagePackerNative_Create(&imagePacker);
        if (ret != IMAGE_SUCCESS) {
            OH_ImagePackerNative_Release(imagePacker);
            LOG("Create Image Packer failed: err = %{public}d.", ret);
            return ret;
        }
    }
    if (opts->mode == BAD_PARAMETER_PACKINGOPTIONS) {
        opts->options = nullptr;
    }
    if (opts->mode == BAD_PARAMETER_PIXELMAPS) {
        opts->pixelmaps = nullptr;
    }
    if (opts->mode == BAD_PARAMETER_OUTDATA) {
        ret = OH_ImagePackerNative_PackToDataFromPixelmapSequence(imagePacker, opts->options, opts->pixelmaps,
        opts->mapSize, nullptr, outDataSize);
    } else {
        ret = OH_ImagePackerNative_PackToDataFromPixelmapSequence(imagePacker, opts->options, opts->pixelmaps,
            opts->mapSize, outData, outDataSize);
    }
    if (ret != IMAGE_SUCCESS) {
        OH_ImagePackerNative_Release(imagePacker);
        LOG("PackToDataMultiFramesError failed: err = %{public}d.", ret);
        return ret;
    }
    OH_ImagePackerNative_Release(imagePacker);
    LOG("PackToDataMultiFramesError end.");
    return IMAGE_SUCCESS;
}

Image_ErrorCode ImagePackerModuleTest::PackToFileMultiFrames(OH_PackingOptionsForSequence  *options,
    OH_PixelmapNative **pixelmaps, size_t mapSize, int32_t fd)
{
    LOG("PackToFileMultiFrames enter.");

    OH_ImagePackerNative *imagePacker = nullptr;
    Image_ErrorCode ret = OH_ImagePackerNative_Create(&imagePacker);
    if (ret != IMAGE_SUCCESS) {
        OH_ImagePackerNative_Release(imagePacker);
        LOG("Create Image Packer failed: err = %{public}d.", ret);
        return ret;
    }

    ret = OH_ImagePackerNative_PackToFileFromPixelmapSequence(imagePacker, options, pixelmaps, mapSize, fd);
    if (ret != IMAGE_SUCCESS) {
        OH_ImagePackerNative_Release(imagePacker);
        LOG("PackToFileMultiFrames failed: err = %{public}d.", ret);
        return ret;
    }
    OH_ImagePackerNative_Release(imagePacker);
    LOG("PackToFileMultiFrames end.");
    return IMAGE_SUCCESS;
}

Image_ErrorCode ImagePackerModuleTest::PackToFileMultiFramesError(packMultiFramesOptions *opts, int32_t fd)
{
    LOG("PackToFileMultiFramesError enter.");

    OH_ImagePackerNative *imagePacker = nullptr;
    Image_ErrorCode ret = IMAGE_SUCCESS;
    if (opts->mode != BAD_PARAMETER_IMAGEPACKER) {
        ret = OH_ImagePackerNative_Create(&imagePacker);
        if (ret != IMAGE_SUCCESS) {
            OH_ImagePackerNative_Release(imagePacker);
            LOG("Create Image Packer failed: err = %{public}d.", ret);
            return ret;
        }
    }
    if (opts->mode == BAD_PARAMETER_PACKINGOPTIONS) {
        opts->options = nullptr;
    }
    if (opts->mode == BAD_PARAMETER_PIXELMAPS) {
        opts->pixelmaps = nullptr;
    }
    ret = OH_ImagePackerNative_PackToFileFromPixelmapSequence(
        imagePacker, opts->options, opts->pixelmaps, opts->mapSize, fd);
    if (ret != IMAGE_SUCCESS) {
        OH_ImagePackerNative_Release(imagePacker);
        LOG("PackToFileMultiFramesError failed: err = %{public}d.", ret);
        return ret;
    }
    OH_ImagePackerNative_Release(imagePacker);
    LOG("PackToFileMultiFramesError end.");
    return IMAGE_SUCCESS;
}
