/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <iostream>
#include <fstream>
#include <string>
#include <multimedia/video_processing_engine/image_processing.h>
#include <native_color_space_manager/native_color_space_manager.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include "nocopyable.h"
#include "include/ApiTest.h"

using namespace std;
using namespace OHOS;

constexpr int32_t IMAGE_WIDTH = 720;
constexpr int32_t IMAGE_HEIGHT = 960;

const ImageProcessing_ColorSpaceInfo CSC_SRC_INFO = {HDR_METADATA_TYPE_NONE,
                                                     SRGB,
                                                     PIXEL_FORMAT_RGBA_8888};
const ImageProcessing_ColorSpaceInfo CSC_DST_INFO = {HDR_METADATA_TYPE_NONE,
                                                     DISPLAY_P3,
                                                     PIXEL_FORMAT_RGBA_8888};

const ImageProcessing_ColorSpaceInfo COMPOSE_SRC_INFO = {HDR_METADATA_TYPE_BASE,
                                                         SRGB,
                                                         PIXEL_FORMAT_RGBA_8888};

const ImageProcessing_ColorSpaceInfo COMPOSE_SRC_GAIN_INFO = {HDR_METADATA_TYPE_GAINMAP,
                                                              SRGB,
                                                              PIXEL_FORMAT_RGBA_8888};
const ImageProcessing_ColorSpaceInfo COMPOSE_DST_INFO = {HDR_METADATA_TYPE_ALTERNATE,
                                                         BT2020_HLG,
                                                         PIXEL_FORMAT_RGBA_1010102};

void CreateEmptyPixelmap(OH_PixelmapNative **pixelMap, int32_t width, int32_t height, int format)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&options);
    (void)OH_PixelmapInitializationOptions_SetWidth(options, width);
    (void)OH_PixelmapInitializationOptions_SetHeight(options, height);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(options, format);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(options, pixelMap);
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0010
 * @tc.number VPE_IMAGE_API_TEST_0010
 * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0010()
{
    OH_ImageProcessing *instance = nullptr;
    OH_PixelmapNative *srcImg = nullptr;
    OH_PixelmapNative *dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
    OH_PixelmapNative_Destroy(&srcImg);
    OH_PixelmapNative_Destroy(&dstImg);
    if (ret != IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        return ret;
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0020
 * @tc.number VPE_IMAGE_API_TEST_0020
 * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0020()
{
    if (OH_ImageProcessing_IsColorSpaceConversionSupported(&CSC_SRC_INFO, &CSC_DST_INFO)) {
        OH_ImageProcessing *instance = nullptr;
        OH_PixelmapNative *srcImg = nullptr;
        OH_PixelmapNative *dstImg = nullptr;
        ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance,
            IMAGE_PROCESSING_TYPE_COLOR_SPACE_CONVERSION);
        if (ret != IMAGE_PROCESSING_SUCCESS) {
            return ret;
        }
        ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
        OH_ImageProcessing_Destroy(instance);
        if (ret != IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
            return ret;
        }
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0030
 * @tc.number VPE_IMAGE_API_TEST_0030
 * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0030()
{
    if (OH_ImageProcessing_IsColorSpaceConversionSupported(&CSC_SRC_INFO, &CSC_DST_INFO)) {
        OH_ImageProcessing *instance = nullptr;
        OH_PixelmapNative *srcImg = nullptr;
        OH_PixelmapNative *dstImg = nullptr;
        CreateEmptyPixelmap(&srcImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
        CreateEmptyPixelmap(&dstImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
        ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance,
            IMAGE_PROCESSING_TYPE_COLOR_SPACE_CONVERSION);
        if (ret != IMAGE_PROCESSING_SUCCESS) {
            return ret;
        }
        ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
        OH_ImageProcessing_Destroy(instance);
        OH_PixelmapNative_Destroy(&srcImg);
        OH_PixelmapNative_Destroy(&dstImg);
        if (ret != IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING) {
            return ret;
        }
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0040
 * @tc.number VPE_IMAGE_API_TEST_0040
 * @tc.desc   OH_ImageProcessing_ConvertColorSpace IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0040()
{
    if (OH_ImageProcessing_IsColorSpaceConversionSupported(&CSC_SRC_INFO, &CSC_DST_INFO)) {
        OH_ImageProcessing *instance = nullptr;
        OH_PixelmapNative *srcImg = nullptr;
        OH_PixelmapNative *dstImg = nullptr;
        CreateEmptyPixelmap(&srcImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
        OH_NativeColorSpaceManager *srcColorspace = OH_NativeColorSpaceManager_CreateFromName(BT709);
        OH_PixelmapNative_SetColorSpaceNative(srcImg, srcColorspace);
        CreateEmptyPixelmap(&dstImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
        OH_NativeColorSpaceManager *dstColorspace = OH_NativeColorSpaceManager_CreateFromName(BT601_EBU);
        OH_PixelmapNative_SetColorSpaceNative(dstImg, dstColorspace);
        ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance,
            IMAGE_PROCESSING_TYPE_COLOR_SPACE_CONVERSION);
        if (ret != IMAGE_PROCESSING_SUCCESS) {
            return ret;
        }
        ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
        OH_NativeColorSpaceManager_Destroy(srcColorspace);
        OH_NativeColorSpaceManager_Destroy(dstColorspace);
        OH_ImageProcessing_Destroy(instance);
        OH_PixelmapNative_Destroy(&srcImg);
        OH_PixelmapNative_Destroy(&dstImg);
        if (ret != IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING) {
            return ret;
        }
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0050
 * @tc.number VPE_IMAGE_API_TEST_0050
 * @tc.desc   OH_ImageProcessing_DeinitializeEnvironment IMAGE_PROCESSING_ERROR_OPERATION_NOT_PERMITTED
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0050()
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_DeinitializeEnvironment();
    if (ret != IMAGE_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) {
        return ret;
    }
    return IMAGE_PROCESSING_SUCCESS;
}
/**
 * @tc.name   VPE_IMAGE_API_TEST_0060
 * @tc.number VPE_IMAGE_API_TEST_0060
 * @tc.desc   OH_ImageProcessing_Compose IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0060()
{
    if (OH_ImageProcessing_IsCompositionSupported(&COMPOSE_SRC_INFO, &COMPOSE_SRC_GAIN_INFO, &COMPOSE_DST_INFO)) {
        OH_ImageProcessing *instance = nullptr;
        OH_PixelmapNative *srcImg = nullptr;
        OH_PixelmapNative *srcGainmap = nullptr;
        OH_PixelmapNative *dstImg = nullptr;
        CreateEmptyPixelmap(&srcImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
        OH_NativeColorSpaceManager *srcColorspace = OH_NativeColorSpaceManager_CreateFromName(BT709);
        OH_PixelmapNative_SetColorSpaceNative(srcImg, srcColorspace);
        CreateEmptyPixelmap(&srcGainmap, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
        OH_PixelmapNative_SetColorSpaceNative(srcGainmap, srcColorspace);
        CreateEmptyPixelmap(&dstImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
        OH_NativeColorSpaceManager *dstColorspace = OH_NativeColorSpaceManager_CreateFromName(BT709);
        OH_PixelmapNative_SetColorSpaceNative(dstImg, dstColorspace);
        ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance,
            IMAGE_PROCESSING_TYPE_COMPOSITION);
        if (ret != IMAGE_PROCESSING_SUCCESS) {
            return ret;
        }
        ret = OH_ImageProcessing_Compose(instance, srcImg, srcGainmap, dstImg);
        OH_NativeColorSpaceManager_Destroy(srcColorspace);
        OH_NativeColorSpaceManager_Destroy(dstColorspace);
        OH_ImageProcessing_Destroy(instance);
        OH_PixelmapNative_Destroy(&srcImg);
        OH_PixelmapNative_Destroy(&srcGainmap);
        OH_PixelmapNative_Destroy(&dstImg);
        if (ret != IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING) {
            return ret;
        }
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0070
 * @tc.number VPE_IMAGE_API_TEST_0070
 * @tc.desc   OH_ImageProcessing_Decompose IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0070()
{
    if (OH_ImageProcessing_IsCompositionSupported(&COMPOSE_SRC_INFO, &COMPOSE_SRC_GAIN_INFO, &COMPOSE_DST_INFO)) {
        OH_ImageProcessing *instance = nullptr;
        OH_PixelmapNative *srcImg = nullptr;
        OH_PixelmapNative *srcGainmap = nullptr;
        OH_PixelmapNative *dstImg = nullptr;
        CreateEmptyPixelmap(&srcImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
        OH_NativeColorSpaceManager *srcColorspace = OH_NativeColorSpaceManager_CreateFromName(BT709);
        OH_PixelmapNative_SetColorSpaceNative(srcImg, srcColorspace);
        CreateEmptyPixelmap(&srcGainmap, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
        OH_PixelmapNative_SetColorSpaceNative(srcGainmap, srcColorspace);
        CreateEmptyPixelmap(&dstImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
        OH_NativeColorSpaceManager *dstColorspace = OH_NativeColorSpaceManager_CreateFromName(BT709);
        OH_PixelmapNative_SetColorSpaceNative(dstImg, dstColorspace);
        ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DECOMPOSITION);
        if (ret != IMAGE_PROCESSING_SUCCESS) {
            return ret;
        }
        ret = OH_ImageProcessing_Decompose(instance, srcImg, srcGainmap, dstImg);
        OH_NativeColorSpaceManager_Destroy(srcColorspace);
        OH_NativeColorSpaceManager_Destroy(dstColorspace);
        OH_ImageProcessing_Destroy(instance);
        OH_PixelmapNative_Destroy(&srcImg);
        OH_PixelmapNative_Destroy(&srcGainmap);
        OH_PixelmapNative_Destroy(&dstImg);
        if (ret != IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING) {
            return ret;
        }
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0080
 * @tc.number VPE_IMAGE_API_TEST_0080
 * @tc.desc   OH_ImageProcessing_GenerateMetadata IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0080()
{
    if (OH_ImageProcessing_IsMetadataGenerationSupported(&COMPOSE_DST_INFO)) {
        OH_ImageProcessing *instance = nullptr;
        OH_PixelmapNative *srcImg = nullptr;
        CreateEmptyPixelmap(&srcImg, IMAGE_WIDTH, IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
        OH_NativeColorSpaceManager *srcColorspace = OH_NativeColorSpaceManager_CreateFromName(BT709);
        OH_PixelmapNative_SetColorSpaceNative(srcImg, srcColorspace);
        ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance,
            IMAGE_PROCESSING_TYPE_METADATA_GENERATION);
        if (ret != IMAGE_PROCESSING_SUCCESS) {
            return ret;
        }
        ret = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
        OH_NativeColorSpaceManager_Destroy(srcColorspace);
        OH_ImageProcessing_Destroy(instance);
        OH_PixelmapNative_Destroy(&srcImg);
        if (ret != IMAGE_PROCESSING_ERROR_UNSUPPORTED_PROCESSING) {
            return ret;
        }
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0090
 * @tc.number VPE_IMAGE_API_TEST_0090
 * @tc.desc   OH_ImageProcessing_Compose IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0090()
{
    if (OH_ImageProcessing_IsCompositionSupported(&COMPOSE_SRC_INFO, &COMPOSE_SRC_GAIN_INFO, &COMPOSE_DST_INFO)) {
        OH_ImageProcessing *instance = nullptr;
        OH_PixelmapNative *srcImg = nullptr;
        OH_PixelmapNative *srcGainmap = nullptr;
        OH_PixelmapNative *dstImg = nullptr;
        ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_COMPOSITION);
        if (ret != IMAGE_PROCESSING_SUCCESS) {
            return ret;
        }
        ret = OH_ImageProcessing_Compose(instance, srcImg, srcGainmap, dstImg);
        OH_ImageProcessing_Destroy(instance);
        if (ret != IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
            return ret;
        }
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0100
 * @tc.number VPE_IMAGE_API_TEST_0100
 * @tc.desc   OH_ImageProcessing_Decompose IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0100()
{
    if (OH_ImageProcessing_IsDecompositionSupported(&COMPOSE_DST_INFO, &COMPOSE_SRC_INFO, &COMPOSE_SRC_GAIN_INFO)) {
        OH_ImageProcessing *instance = nullptr;
        OH_PixelmapNative *srcImg = nullptr;
        OH_PixelmapNative *srcGainmap = nullptr;
        OH_PixelmapNative *dstImg = nullptr;
        ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DECOMPOSITION);
        if (ret != IMAGE_PROCESSING_SUCCESS) {
            return ret;
        }
        ret = OH_ImageProcessing_Decompose(instance, srcImg, srcGainmap, dstImg);
        OH_ImageProcessing_Destroy(instance);
        if (ret != IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
            return ret;
        }
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0110
 * @tc.number VPE_IMAGE_API_TEST_0110
 * @tc.desc   OH_ImageProcessing_GenerateMetadata IMAGE_PROCESSING_ERROR_INVALID_PARAMETER
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0110()
{
    if (OH_ImageProcessing_IsMetadataGenerationSupported(&COMPOSE_DST_INFO)) {
        OH_ImageProcessing *instance = nullptr;
        OH_PixelmapNative *srcImg = nullptr;
        ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance,
            IMAGE_PROCESSING_TYPE_METADATA_GENERATION);
        if (ret != IMAGE_PROCESSING_SUCCESS) {
            return ret;
        }
        ret = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
        OH_ImageProcessing_Destroy(instance);
        if (ret != IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
            return ret;
        }
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0120
 * @tc.number VPE_IMAGE_API_TEST_0120
 * @tc.desc   OH_ImageProcessing_Compose IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0120()
{
    OH_ImageProcessing *instance = nullptr;
    OH_PixelmapNative *srcImg = nullptr;
    OH_PixelmapNative *srcGainmap = nullptr;
    OH_PixelmapNative *dstImg = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Compose(instance, srcImg, srcGainmap, dstImg);
    if (ret != IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        return ret;
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0130
 * @tc.number VPE_IMAGE_API_TEST_0130
 * @tc.desc   OH_ImageProcessing_Decompose IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0130()
{
    OH_ImageProcessing *instance = nullptr;
    OH_PixelmapNative *srcImg = nullptr;
    OH_PixelmapNative *srcGainmap = nullptr;
    OH_PixelmapNative *dstImg = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Decompose(instance, srcImg, srcGainmap, dstImg);
    if (ret != IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        return ret;
    }
    return IMAGE_PROCESSING_SUCCESS;
}

/**
 * @tc.name   VPE_IMAGE_API_TEST_0140
 * @tc.number VPE_IMAGE_API_TEST_0140
 * @tc.desc   OH_ImageProcessing_GenerateMetadata IMAGE_PROCESSING_ERROR_INVALID_INSTANCE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VpeImageApiTest0140()
{
    OH_ImageProcessing *instance = nullptr;
    OH_PixelmapNative *srcImg = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
    if (ret != IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        return ret;
    }
    return IMAGE_PROCESSING_SUCCESS;
}
