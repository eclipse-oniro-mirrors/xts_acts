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
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <multimedia/image_framework/image/pixelmap_native.h>
#define HEIGHT_PERCENT_1 0.6
#define WIDTH_PERCENT_1 0.5
#define ARR_LEN 4
#define ARR_FIRST 500
#define ARR_SECOND 1500
#define ARR_THIRD 1000
#define ARR_FOURTH 3000
#define PARAM_ERROR 401
#define PARAM_NO_ERROR 0

namespace ArkUICapiTest {

static napi_value TestImageDrawable001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    
    OH_PixelmapNativeHandle pixelMap = nullptr;
    OH_PixelmapNativeHandle pixelMap1 = nullptr;
    OH_PixelmapNativeHandle pixelMap2 = nullptr;
    OH_PixelmapNativeHandle pixelMap3 = nullptr;
    ArkUI_DrawableDescriptor *descriptorAnimated = nullptr;
    ArkUI_DrawableDescriptor *descriptorAnimated1 = nullptr;
    OH_PixelmapNativeHandle array[PARAM_4];
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + PARAM_1;
    }

    uint8_t data1[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data1[i] = uint8_t(0);
        data1[i + PARAM_1] = uint8_t(i + PARAM_1);
        data1[i + PARAM_2] = uint8_t(i + PARAM_2);
        data1[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data2[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data2[i] = uint8_t(0);
        data2[i + PARAM_1] = uint8_t(i + PARAM_3);
        data2[i + PARAM_2] = uint8_t(PARAM_255);
        data2[i + PARAM_3] = uint8_t(i + PARAM_4);
    }

    uint8_t data3[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data3[i] = uint8_t(0);
        data3[i + PARAM_1] = uint8_t(PARAM_255);
        data3[i + PARAM_1] = uint8_t(i + PARAM_5);
        data3[i + PARAM_3] = uint8_t(i + PARAM_6);
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, SIZE_200);
    OH_PixelmapInitializationOptions_SetHeight(options, SIZE_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative_Rotate(pixelMap, PARAM_90_POINT_0);
    OH_PixelmapNative_Opacity(pixelMap, PARAM_0_POINT_2);
    OH_PixelmapNative_Scale(pixelMap, PARAM_0_POINT_8, PARAM_1_POINT_0);
    OH_PixelmapNative_Flip(pixelMap, true, true);
    OH_PixelmapNative_Rotate(pixelMap2, PARAM_180_POINT_0);
    OH_PixelmapNative_Rotate(pixelMap3, PARAM_270_POINT_0);
    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelMap);
    OH_PixelmapNative_CreatePixelmap(data1, dataSize, options, &pixelMap1);
    OH_PixelmapNative_CreatePixelmap(data2, dataSize, options, &pixelMap2);
    OH_PixelmapNative_CreatePixelmap(data3, dataSize, options, &pixelMap3);

    auto descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);

    array[PARAM_0] = pixelMap;
    array[PARAM_1] = pixelMap1;
    array[PARAM_2] = pixelMap2;
    array[PARAM_3] = pixelMap3;
    uint32_t arr[4];
    arr[PARAM_0] = ARR_FIRST;
    arr[PARAM_1] = ARR_SECOND;
    arr[PARAM_2] = ARR_THIRD;
    arr[PARAM_3] = ARR_FOURTH;
    uint32_t getArr[PARAM_4];
    size_t getSize = 4;
    descriptorAnimated = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, PARAM_4);
    descriptorAnimated1 = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, PARAM_4);
    auto ret_error = OH_ArkUI_DrawableDescriptor_SetAnimationFrameDurations(descriptorAnimated, nullptr, 0);
    auto ret_no_error = OH_ArkUI_DrawableDescriptor_SetAnimationFrameDurations(descriptorAnimated1, arr, ARR_LEN);
    auto ret1_error = OH_ArkUI_DrawableDescriptor_GetAnimationFrameDurations(descriptorAnimated, nullptr, nullptr);
    auto ret1_no_error = OH_ArkUI_DrawableDescriptor_GetAnimationFrameDurations(descriptorAnimated1,
                                                                                getArr, &getSize);
    ASSERT_EQ(ret_error, PARAM_ERROR);
    ASSERT_EQ(ret1_error, PARAM_ERROR);
    ASSERT_EQ(ret_no_error, PARAM_NO_ERROR);
    ASSERT_EQ(ret1_no_error, PARAM_NO_ERROR);
    NAPI_END;
}
static napi_value TestImageDrawable002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    OH_PixelmapNativeHandle pixelMap = nullptr;
    OH_PixelmapNativeHandle pixelMap1 = nullptr;
    OH_PixelmapNativeHandle pixelMap2 = nullptr;
    OH_PixelmapNativeHandle pixelMap3 = nullptr;
    ArkUI_DrawableDescriptor *descriptorAnimated = nullptr;
    ArkUI_DrawableDescriptor *descriptorAnimated1 = nullptr;
    OH_PixelmapNativeHandle array[PARAM_4];
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + PARAM_1;
    }

    uint8_t data1[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data1[i] = uint8_t(0);
        data1[i + PARAM_1] = uint8_t(i + PARAM_1);
        data1[i + PARAM_2] = uint8_t(i + PARAM_2);
        data1[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data2[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data2[i] = uint8_t(0);
        data2[i + PARAM_1] = uint8_t(i + PARAM_3);
        data2[i + PARAM_2] = uint8_t(PARAM_255);
        data2[i + PARAM_3] = uint8_t(i + PARAM_4);
    }

    uint8_t data3[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data3[i] = uint8_t(0);
        data3[i + PARAM_1] = uint8_t(PARAM_255);
        data3[i + PARAM_1] = uint8_t(i + PARAM_5);
        data3[i + PARAM_3] = uint8_t(i + PARAM_6);
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, SIZE_200);
    OH_PixelmapInitializationOptions_SetHeight(options, SIZE_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative_Rotate(pixelMap, PARAM_90_POINT_0);
    OH_PixelmapNative_Opacity(pixelMap, PARAM_0_POINT_2);
    OH_PixelmapNative_Scale(pixelMap, PARAM_0_POINT_8, PARAM_1_POINT_0);
    OH_PixelmapNative_Flip(pixelMap, true, true);
    OH_PixelmapNative_Rotate(pixelMap2, PARAM_180_POINT_0);
    OH_PixelmapNative_Rotate(pixelMap3, PARAM_270_POINT_0);
    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelMap);
    OH_PixelmapNative_CreatePixelmap(data1, dataSize, options, &pixelMap1);
    OH_PixelmapNative_CreatePixelmap(data2, dataSize, options, &pixelMap2);
    OH_PixelmapNative_CreatePixelmap(data3, dataSize, options, &pixelMap3);

    auto descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);

    array[PARAM_0] = pixelMap;
    array[PARAM_1] = pixelMap1;
    array[PARAM_2] = pixelMap2;
    array[PARAM_3] = pixelMap3;

    descriptorAnimated = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, PARAM_4);
    descriptorAnimated1 = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, PARAM_4);
    
    auto ret_error = OH_ArkUI_DrawableDescriptor_SetAnimationAutoPlay(nullptr, -1);
    auto ret1_error = OH_ArkUI_DrawableDescriptor_GetAnimationAutoPlay(descriptorAnimated, nullptr);
    uint32_t autoPlay1 = 1;
    auto ret_no_error = OH_ArkUI_DrawableDescriptor_SetAnimationAutoPlay(descriptorAnimated1, autoPlay1);
    auto ret1_no_error = OH_ArkUI_DrawableDescriptor_GetAnimationAutoPlay(descriptorAnimated1, &autoPlay1);
    ASSERT_EQ(ret_error, PARAM_ERROR);
    ASSERT_EQ(ret1_error, PARAM_ERROR);
    ASSERT_EQ(ret_no_error, PARAM_NO_ERROR);
    ASSERT_EQ(ret1_no_error, PARAM_NO_ERROR);
    NAPI_END;
}
static napi_value TestImageDrawable003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    OH_PixelmapNativeHandle pixelMap = nullptr;
    OH_PixelmapNativeHandle pixelMap1 = nullptr;
    OH_PixelmapNativeHandle pixelMap2 = nullptr;
    OH_PixelmapNativeHandle pixelMap3 = nullptr;
    ArkUI_DrawableDescriptor *descriptorAnimated = nullptr;
    ArkUI_DrawableDescriptor_AnimationController *controller1;
    OH_PixelmapNativeHandle array[PARAM_4];
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + PARAM_1;
    }

    uint8_t data1[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data1[i] = uint8_t(0);
        data1[i + PARAM_1] = uint8_t(i + PARAM_1);
        data1[i + PARAM_2] = uint8_t(i + PARAM_2);
        data1[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data2[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data2[i] = uint8_t(0);
        data2[i + PARAM_1] = uint8_t(i + PARAM_3);
        data2[i + PARAM_2] = uint8_t(PARAM_255);
        data2[i + PARAM_3] = uint8_t(i + PARAM_4);
    }

    uint8_t data3[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data3[i] = uint8_t(0);
        data3[i + PARAM_1] = uint8_t(PARAM_255);
        data3[i + PARAM_1] = uint8_t(i + PARAM_5);
        data3[i + PARAM_3] = uint8_t(i + PARAM_6);
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, SIZE_200);
    OH_PixelmapInitializationOptions_SetHeight(options, SIZE_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative_Rotate(pixelMap, PARAM_90_POINT_0);
    OH_PixelmapNative_Opacity(pixelMap, PARAM_0_POINT_2);
    OH_PixelmapNative_Scale(pixelMap, PARAM_0_POINT_8, PARAM_1_POINT_0);
    OH_PixelmapNative_Flip(pixelMap, true, true);
    OH_PixelmapNative_Rotate(pixelMap2, PARAM_180_POINT_0);
    OH_PixelmapNative_Rotate(pixelMap3, PARAM_270_POINT_0);
    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelMap);
    OH_PixelmapNative_CreatePixelmap(data1, dataSize, options, &pixelMap1);
    OH_PixelmapNative_CreatePixelmap(data2, dataSize, options, &pixelMap2);
    OH_PixelmapNative_CreatePixelmap(data3, dataSize, options, &pixelMap3);

    auto descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);

    array[PARAM_0] = pixelMap;
    array[PARAM_1] = pixelMap1;
    array[PARAM_2] = pixelMap2;
    array[PARAM_3] = pixelMap3;

    descriptorAnimated = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, PARAM_4);
    auto ret_error = OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated, image, nullptr);
    ASSERT_EQ(ret_error, PARAM_ERROR);
    NAPI_END;
}
static napi_value TestImageDrawable004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_DrawableDescriptor *descriptorAnimated = nullptr;
    OH_PixelmapNativeHandle pixelMap = nullptr;
    OH_PixelmapNativeHandle pixelMap1 = nullptr;
    OH_PixelmapNativeHandle pixelMap2 = nullptr;
    OH_PixelmapNativeHandle pixelMap3 = nullptr;

    OH_PixelmapNativeHandle array[PARAM_4];
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + PARAM_1;
    }

    uint8_t data1[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data1[i] = uint8_t(0);
        data1[i + PARAM_1] = uint8_t(i + PARAM_1);
        data1[i + PARAM_2] = uint8_t(i + PARAM_2);
        data1[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data2[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data2[i] = uint8_t(0);
        data2[i + PARAM_1] = uint8_t(i + PARAM_3);
        data2[i + PARAM_2] = uint8_t(PARAM_255);
        data2[i + PARAM_3] = uint8_t(i + PARAM_4);
    }

    uint8_t data3[dataSize];
    for (auto i = PARAM_0; i < PARAM_960000; i = i + PARAM_4) {
        data3[i] = uint8_t(0);
        data3[i + PARAM_1] = uint8_t(PARAM_255);
        data3[i + PARAM_1] = uint8_t(i + PARAM_5);
        data3[i + PARAM_3] = uint8_t(i + PARAM_6);
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, SIZE_200);
    OH_PixelmapInitializationOptions_SetHeight(options, SIZE_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative_Rotate(pixelMap, PARAM_90_POINT_0);
    OH_PixelmapNative_Opacity(pixelMap, PARAM_0_POINT_2);
    OH_PixelmapNative_Scale(pixelMap, PARAM_0_POINT_8, PARAM_1_POINT_0);
    OH_PixelmapNative_Flip(pixelMap, true, true);
    OH_PixelmapNative_Rotate(pixelMap2, PARAM_180_POINT_0);
    OH_PixelmapNative_Rotate(pixelMap3, PARAM_270_POINT_0);
    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelMap);
    OH_PixelmapNative_CreatePixelmap(data1, dataSize, options, &pixelMap1);
    OH_PixelmapNative_CreatePixelmap(data2, dataSize, options, &pixelMap2);
    OH_PixelmapNative_CreatePixelmap(data3, dataSize, options, &pixelMap3);

    auto descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);

    array[PARAM_0] = pixelMap;
    array[PARAM_1] = pixelMap1;
    array[PARAM_2] = pixelMap2;
    array[PARAM_3] = pixelMap3;

    descriptorAnimated = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, PARAM_4);
    auto ret = OH_ArkUI_DrawableDescriptor_CreateAnimationController(descriptorAnimated, image, nullptr);
    auto start = OH_ArkUI_DrawableDescriptor_StartAnimation(nullptr);
    auto stop = OH_ArkUI_DrawableDescriptor_StopAnimation(nullptr);
    auto pause = OH_ArkUI_DrawableDescriptor_PauseAnimation(nullptr);
    auto resume = OH_ArkUI_DrawableDescriptor_ResumeAnimation(nullptr);
    auto retGetStatus = OH_ArkUI_DrawableDescriptor_GetAnimationStatus(nullptr, nullptr);
    
    ASSERT_EQ(start, PARAM_ERROR);
    ASSERT_EQ(stop, PARAM_ERROR);
    ASSERT_EQ(pause, PARAM_ERROR);
    ASSERT_EQ(resume, PARAM_ERROR);
    ASSERT_EQ(retGetStatus, PARAM_ERROR);
    NAPI_END;
}
} // namespace ArkUICapiTest