/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/video_processing_engine/image_processing.h>
#include <multimedia/video_processing_engine/image_processing_types.h>
#include <native_buffer/buffer_common.h>
#include <native_buffer/native_buffer.h>
#include <unistd.h>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Media {
namespace VideoProcessingEngine {

namespace {
constexpr int SUCCESS_CODE = 0;
constexpr int COLOR_SPACE_INFO_FLAG = 0;
constexpr int INVALID_PROCESSING_TYPE = 11;
constexpr int QUALITY_LEVEL_TEST_VALUE = 10;
constexpr int INVALID_QUALITY_LEVEL = -1;
constexpr int INVALID_PROCESSING_TYPE_NEGATIVE = -1;
constexpr int TEST_IMAGE_WIDTH = 720;
constexpr int TEST_IMAGE_HEIGHT = 960;
constexpr int ENHANCED_IMAGE_WIDTH = 1440;
constexpr int ENHANCED_IMAGE_HEIGHT = 1920;
}

const ImageProcessing_ColorSpaceInfo param_srgb = {
    COLOR_SPACE_INFO_FLAG,
    OH_COLORSPACE_SRGB_FULL,
    NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
};

const ImageProcessing_ColorSpaceInfo param_p3 = {
    COLOR_SPACE_INFO_FLAG,
    OH_COLORSPACE_P3_FULL,
    NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
};

const ImageProcessing_ColorSpaceInfo param_bt709 = {
    COLOR_SPACE_INFO_FLAG,
    OH_COLORSPACE_BT709_FULL,
    NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
};

const ImageProcessing_ColorSpaceInfo param_not_support = {
    COLOR_SPACE_INFO_FLAG,
    OH_COLORSPACE_BT601_EBU_FULL,
    NATIVEBUFFER_PIXEL_FMT_BGRX_8888,
};

const ImageProcessing_ColorSpaceInfo param5 = {
    COLOR_SPACE_INFO_FLAG,
    OH_COLORSPACE_BT2020_PQ_LIMIT,
    NATIVEBUFFER_PIXEL_FMT_RGBA_1010102,
};

void CreateEmptyPixelmap(OH_PixelmapNative** pixelMap, int32_t width, int32_t height, int format)
{
    OH_Pixelmap_InitializationOptions* options = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&options);
    (void)OH_PixelmapInitializationOptions_SetWidth(options, width);
    (void)OH_PixelmapInitializationOptions_SetHeight(options, height);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(options, format);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(options, pixelMap);
}

bool IsSupportImageSR()
{
    if (!access("/sys_prod/lib64/VideoProcessingEngine/libdisplay_aipq_imagesr.so", 0) &&
        !access("/sys_prod/etc/VideoProcessingEngine/image_aisr_algo_config.xml", 0) &&
        !access("/sys_prod/etc/VideoProcessingEngine/Image_SR_Model_576x576_20240402.omc", 0)) {
        return true;
    }
    return false;
}

// initialize environment
/**
 * @tc.name   VpeImageNdk01
 * @tc.number VpeImageNdk01
 * @tc.desc   VpeImageNdk01
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk01()
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_InitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// initialize and de-initialize
/**
 * @tc.name   VpeImageNdk02
 * @tc.number VpeImageNdk02
 * @tc.desc   VpeImageNdk02
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk02()
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_InitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    ret = OH_ImageProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// de-initialize without initialize
/**
 * @tc.name   VpeImageNdk03
 * @tc.number VpeImageNdk03
 * @tc.desc   VpeImageNdk03
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk03()
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_DeinitializeEnvironment();
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// create instance
/**
 * @tc.name   VpeImageNdk04
 * @tc.number VpeImageNdk04
 * @tc.desc   VpeImageNdk04
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk04()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// create instance with wrong type
/**
 * @tc.name   VpeImageNdk05
 * @tc.number VpeImageNdk05
 * @tc.desc   VpeImageNdk05
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk05()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, INVALID_PROCESSING_TYPE);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// destroy instance
/**
 * @tc.name   VpeImageNdk06
 * @tc.number VpeImageNdk06
 * @tc.desc   VpeImageNdk06
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk06()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Destroy(instance);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}


// destroy null instance
/**
 * @tc.name   VpeImageNdk07
 * @tc.number VpeImageNdk07
 * @tc.desc   VpeImageNdk07
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk07()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Destroy(instance);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// set parameter normally
/**
 * @tc.name   VpeImageNdk08
 * @tc.number VpeImageNdk08
 * @tc.desc   VpeImageNdk08
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk08()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, QUALITY_LEVEL_TEST_VALUE);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// set parameter with null
/**
 * @tc.name   VpeImageNdk09
 * @tc.number VpeImageNdk09
 * @tc.desc   VpeImageNdk09
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk09()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}


// set parameter but instance is null
/**
 * @tc.name   VpeImageNdk10
 * @tc.number VpeImageNdk10
 * @tc.desc   VpeImageNdk10
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk10()
{
    OH_ImageProcessing* instance = nullptr;
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// get parameter after set parameter
/**
 * @tc.name   VpeImageNdk11
 * @tc.number VpeImageNdk11
 * @tc.desc   VpeImageNdk11
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk11()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, IMAGE_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_ImageProcessing_SetParameter(instance, parameter);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// get parameter after set parameter: level none
/**
 * @tc.name   VpeImageNdk112
 * @tc.number VpeImageNdk112
 * @tc.desc   VpeImageNdk112
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk112()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, IMAGE_DETAIL_ENHANCER_QUALITY_LEVEL_NONE);
    OH_ImageProcessing_SetParameter(instance, parameter);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// get parameter after set parameter: level low
/**
 * @tc.name   VpeImageNdk113
 * @tc.number VpeImageNdk113
 * @tc.desc   VpeImageNdk113
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk113()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, IMAGE_DETAIL_ENHANCER_QUALITY_LEVEL_LOW);
    OH_ImageProcessing_SetParameter(instance, parameter);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// get parameter after set parameter: level medium
/**
 * @tc.name   VpeImageNdk114
 * @tc.number VpeImageNdk114
 * @tc.desc   VpeImageNdk114
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk114()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, IMAGE_DETAIL_ENHANCER_QUALITY_LEVEL_MEDIUM);
    OH_ImageProcessing_SetParameter(instance, parameter);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// get parameter after set parameter: invalid param
/**
 * @tc.name   VpeImageNdk115
 * @tc.number VpeImageNdk115
 * @tc.desc   VpeImageNdk115
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk115()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    // invalid param
    OH_AVFormat_SetIntValue(parameter, IMAGE_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, INVALID_QUALITY_LEVEL);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_ERROR_INVALID_PARAMETER);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}

// get parameter but parameter is null
/**
 * @tc.name   VpeImageNdk12
 * @tc.number VpeImageNdk12
 * @tc.desc   VpeImageNdk12
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk12()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}


// get parameter but instance is null set
/**
 * @tc.name   VpeImageNdk13
 * @tc.number VpeImageNdk13
 * @tc.desc   VpeImageNdk13
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk13()
{
    OH_ImageProcessing* instance = nullptr;
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    return SUCCESS_CODE;
}

// get parameter but parameter is not null
/**
 * @tc.name   VpeImageNdk14
 * @tc.number VpeImageNdk14
 * @tc.desc   VpeImageNdk14
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk14()
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GetParameter(instance, parameter);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    return SUCCESS_CODE;
}


// colorspaceconversion support check 1
/**
 * @tc.name   VpeImageNdk15
 * @tc.number VpeImageNdk15
 * @tc.desc   VpeImageNdk15
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk15()
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_srgb, &param_p3);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// colorspaceconversion support check 2
/**
 * @tc.name   VpeImageNdk16
 * @tc.number VpeImageNdk16
 * @tc.desc   VpeImageNdk16
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk16()
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_p3, &param_bt709);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// colorspaceconversion support check 3
/**
 * @tc.name   VpeImageNdk17
 * @tc.number VpeImageNdk17
 * @tc.desc   VpeImageNdk17
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk17()
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_bt709, &param_not_support);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// colorspaceconversion support check 4
/**
 * @tc.name   VpeImageNdk18
 * @tc.number VpeImageNdk18
 * @tc.desc   VpeImageNdk18
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk18()
{
    bool ret = OH_ImageProcessing_IsColorSpaceConversionSupported(&param_p3, &param_srgb);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// conposition support check 1
/**
 * @tc.name   VpeImageNdk19
 * @tc.number VpeImageNdk19
 * @tc.desc   VpeImageNdk19
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk19()
{
    bool ret = OH_ImageProcessing_IsCompositionSupported(&param_srgb, &param_srgb, &param_p3);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// conposition support check 2
/**
 * @tc.name   VpeImageNdk20
 * @tc.number VpeImageNdk20
 * @tc.desc   VpeImageNdk20
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk20()
{
    bool ret = OH_ImageProcessing_IsCompositionSupported(&param_not_support, &param_not_support, &param_not_support);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// conposition support check 3
/**
 * @tc.name   VpeImageNdk21
 * @tc.number VpeImageNdk21
 * @tc.desc   VpeImageNdk21
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk21()
{
    bool ret = OH_ImageProcessing_IsCompositionSupported(&param_srgb, &param_srgb, &param_srgb);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// deconposition support check 1
/**
 * @tc.name   VpeImageNdk22
 * @tc.number VpeImageNdk22
 * @tc.desc   VpeImageNdk22
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk22()
{
    bool ret = OH_ImageProcessing_IsDecompositionSupported(&param_srgb, &param_p3, &param_bt709);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// deconposition support check 2
/**
 * @tc.name   VpeImageNdk23
 * @tc.number VpeImageNdk23
 * @tc.desc   VpeImageNdk23
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk23()
{
    bool ret = OH_ImageProcessing_IsDecompositionSupported(&param_not_support, &param_not_support, &param_not_support);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// deconposition support check 3
/**
 * @tc.name   VpeImageNdk24
 * @tc.number VpeImageNdk24
 * @tc.desc   VpeImageNdk24
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk24()
{
    bool ret = OH_ImageProcessing_IsDecompositionSupported(&param_srgb, &param_srgb, &param_srgb);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// metadata generation support check 1
/**
 * @tc.name   VpeImageNdk25
 * @tc.number VpeImageNdk25
 * @tc.desc   VpeImageNdk25
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk25()
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param5);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// metadata generation support check 2
/**
 * @tc.name   VpeImageNdk26
 * @tc.number VpeImageNdk26
 * @tc.desc   VpeImageNdk26
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk26()
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param_p3);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// metadata generation support check 3
/**
 * @tc.name   VpeImageNdk27
 * @tc.number VpeImageNdk27
 * @tc.desc   VpeImageNdk27
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk27()
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param_bt709);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// metadata generation support check 4
/**
 * @tc.name   VpeImageNdk28
 * @tc.number VpeImageNdk28
 * @tc.desc   VpeImageNdk28
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk28()
{
    bool ret = OH_ImageProcessing_IsMetadataGenerationSupported(&param_not_support);
    ASSERT_FALSE(ret);
    return SUCCESS_CODE;
}

// convert color space RGBA to BGRA impl
/**
 * @tc.name   VpeImageNdk29
 * @tc.number VpeImageNdk29
 * @tc.desc   VpeImageNdk29
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk29()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_ConvertColorSpace(instance2, srcImg, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// convert color space BGRA to RGBA impl
/**
 * @tc.name   VpeImageNdk30
 * @tc.number VpeImageNdk30
 * @tc.desc   VpeImageNdk30
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk30()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_ConvertColorSpace(instance2, srcImg, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// convert color space nullptr
/**
 * @tc.name   VpeImageNdk31
 * @tc.number VpeImageNdk31
 * @tc.desc   VpeImageNdk31
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk31()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// compose RGBA impl
/**
 * @tc.name   VpeImageNdk32
 * @tc.number VpeImageNdk32
 * @tc.desc   VpeImageNdk32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk32()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&gainmap, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Compose(instance2, srcImg, gainmap, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Compose(instance, srcImg, gainmap, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// compose BGRA impl
/**
 * @tc.name   VpeImageNdk33
 * @tc.number VpeImageNdk33
 * @tc.desc   VpeImageNdk33
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk33()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&gainmap, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Compose(instance2, srcImg, gainmap, dstImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Compose(instance, srcImg, gainmap, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// compose nullptr
/**
 * @tc.name   VpeImageNdk34
 * @tc.number VpeImageNdk34
 * @tc.desc   VpeImageNdk34
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk34()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Compose(instance, srcImg, gainmap, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// decompose RGBA impl
/**
 * @tc.name   VpeImageNdk35
 * @tc.number VpeImageNdk35
 * @tc.desc   VpeImageNdk35
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk35()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&gainmap, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Decompose(instance2, srcImg, dstImg, gainmap);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Decompose(instance, srcImg, dstImg, gainmap);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// decompose BGRA impl
/**
 * @tc.name   VpeImageNdk36
 * @tc.number VpeImageNdk36
 * @tc.desc   VpeImageNdk36
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk36()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&gainmap, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_Decompose(instance2, srcImg, dstImg, gainmap);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Decompose(instance, srcImg, dstImg, gainmap);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// decompose nullptr
/**
 * @tc.name   VpeImageNdk37
 * @tc.number VpeImageNdk37
 * @tc.desc   VpeImageNdk37
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk37()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Decompose(instance, srcImg, dstImg, gainmap);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// generate metadata RGBA impl
/**
 * @tc.name   VpeImageNdk38
 * @tc.number VpeImageNdk38
 * @tc.desc   VpeImageNdk38
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk38()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmap(&srcImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_GenerateMetadata(instance2, srcImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// generate metadata BGRA impl
/**
 * @tc.name   VpeImageNdk39
 * @tc.number VpeImageNdk39
 * @tc.desc   VpeImageNdk39
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk39()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing* instance2 = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmap(&srcImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance2, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_ImageProcessing_GenerateMetadata(instance2, srcImg);
    OH_ImageProcessing_Destroy(instance2);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// generate metadata nullptr
/**
 * @tc.name   VpeImageNdk40
 * @tc.number VpeImageNdk40
 * @tc.desc   VpeImageNdk40
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk40()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// detail enhance RGBA
/**
 * @tc.name   VpeImageNdk41
 * @tc.number VpeImageNdk41
 * @tc.desc   VpeImageNdk41
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk41()
{
    if (!IsSupportImageSR()) {
        return SUCCESS_CODE;
    }
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    CreateEmptyPixelmap(&dstImg, ENHANCED_IMAGE_WIDTH, ENHANCED_IMAGE_HEIGHT, PIXEL_FORMAT_RGBA_8888);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_EnhanceDetail(instance, srcImg, dstImg);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// detail enhance BGRA
/**
 * @tc.name   VpeImageNdk42
 * @tc.number VpeImageNdk42
 * @tc.desc   VpeImageNdk42
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk42()
{
    if (!IsSupportImageSR()) {
        return SUCCESS_CODE;
    }
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    CreateEmptyPixelmap(&srcImg, TEST_IMAGE_WIDTH, TEST_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    CreateEmptyPixelmap(&dstImg, ENHANCED_IMAGE_WIDTH, ENHANCED_IMAGE_HEIGHT, PIXEL_FORMAT_BGRA_8888);
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_EnhanceDetail(instance, srcImg, dstImg);
    EXPECT_EQ(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// detail enhance nullptr
/**
 * @tc.name   VpeImageNdk43
 * @tc.number VpeImageNdk43
 * @tc.desc   VpeImageNdk43
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk43()
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_EnhanceDetail(instance, srcImg, dstImg);
    EXPECT_NE(ret, IMAGE_PROCESSING_SUCCESS);
    OH_ImageProcessing_Destroy(instance);
    OH_ImageProcessing_DeinitializeEnvironment();
    return SUCCESS_CODE;
}

// DeinitializeEnvironment without initialization
/**
 * @tc.name   VpeImageNdk44
 * @tc.number VpeImageNdk44
 * @tc.desc   VpeImageNdk44
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk44()
{
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, IMAGE_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
    return SUCCESS_CODE;
}

// invalid parameter to create
/**
 * @tc.name   VpeImageNdk45
 * @tc.number VpeImageNdk45
 * @tc.desc   VpeImageNdk45
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk45()
{
    OH_ImageProcessing* instance = nullptr;
    // invalid type
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(&instance, INVALID_PROCESSING_TYPE_NEGATIVE);
    EXPECT_EQ(ret, IMAGE_PROCESSING_ERROR_INVALID_PARAMETER);
    return SUCCESS_CODE;
}

// invalid instance to create
/**
 * @tc.name   VpeImageNdk46
 * @tc.number VpeImageNdk46
 * @tc.desc   VpeImageNdk46
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk46()
{
    OH_ImageProcessing** instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Create(instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    EXPECT_EQ(ret, IMAGE_PROCESSING_ERROR_INVALID_INSTANCE);
    return SUCCESS_CODE;
}

// invalid instance to destroy
/**
 * @tc.name   VpeImageNdk47
 * @tc.number VpeImageNdk47
 * @tc.desc   VpeImageNdk47
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeImageNdk47()
{
    OH_ImageProcessing* instance = nullptr;
    ImageProcessing_ErrorCode ret = OH_ImageProcessing_Destroy(instance);
    EXPECT_EQ(ret, IMAGE_PROCESSING_ERROR_INVALID_INSTANCE);
    return SUCCESS_CODE;
}
} // namespace VideoProcessingEngine
} // namespace Media
} // namespace OHOS