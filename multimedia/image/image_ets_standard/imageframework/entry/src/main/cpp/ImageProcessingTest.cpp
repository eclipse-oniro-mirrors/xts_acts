/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "ImageProcessingTest.h"
#include <multimedia/video_processing_engine/image_processing.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/video_processing_engine/image_processing_types.h>
#include <multimedia/video_processing_engine/image_processing.h>
#define NO_TYPE 99999999999

void addImageProcessingTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"test_COLOR_SPACE_CONVERSION", nullptr, Test_IMAGE_PROCESSING_TYPE_COLOR_SPACE_CONVERSION,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"test_DETAIL_ENHANCER", nullptr, Test_IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"test_COMPOSITION", nullptr, Test_IMAGE_PROCESSING_TYPE_COMPOSITION,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"test_DECOMPOSITION", nullptr, Test_IMAGE_PROCESSING_TYPE_DECOMPOSITION,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"test_METADATA_GENERATION", nullptr, Test_IMAGE_PROCESSING_TYPE_METADATA_GENERATION,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value Test_IMAGE_PROCESSING_TYPE_COLOR_SPACE_CONVERSION(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ImageProcessing *imageProcessor = nullptr;
    ImageProcessing_ErrorCode res = OH_ImageProcessing_Create(&imageProcessor, NO_TYPE);
    napi_create_int32(env, res == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value Test_IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ImageProcessing *imageProcessor = nullptr;
    ImageProcessing_ErrorCode res = OH_ImageProcessing_Create(&imageProcessor, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    napi_create_int32(env, res == IMAGE_PROCESSING_SUCCESS, &result);
    return result;
}

napi_value Test_IMAGE_PROCESSING_TYPE_COMPOSITION(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ImageProcessing *imageProcessor = nullptr;
    ImageProcessing_ErrorCode res = OH_ImageProcessing_Create(&imageProcessor, NO_TYPE);
    napi_create_int32(env, res == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value Test_IMAGE_PROCESSING_TYPE_DECOMPOSITION(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ImageProcessing *imageProcessor = nullptr;
    ImageProcessing_ErrorCode res = OH_ImageProcessing_Create(&imageProcessor, NO_TYPE);
    napi_create_int32(env, res == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value Test_IMAGE_PROCESSING_TYPE_METADATA_GENERATION(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ImageProcessing *imageProcessor = nullptr;
    ImageProcessing_ErrorCode res = OH_ImageProcessing_Create(&imageProcessor, NO_TYPE);
    napi_create_int32(env, res == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER, &result);
    return result;
}