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

#include "common/common.h"
#include <arkui/native_node_napi.h>
#include "multimedia/image_framework/image/pixelmap_native.h"
#define NUM_0 0
#define NUM_1 1
#define NUM_2 2
#define NUM_3 3
#define NUM_4 4
#define NUM_5 5
#define NUM_6 6
#define NUM_92 92
#define NUM_96 96
#define NUM_100 100
#define NUM_255 255

namespace ArkUICapiTest {

static napi_value TestDrawableDescriptorCreate001(napi_env env, napi_callback_info info)
{
    OH_PixelmapNativeHandle pixelMap = nullptr;
    OH_PixelmapNativeHandle pixelMap1 = nullptr;
    ArkUI_DrawableDescriptor* descriptorAnimated = nullptr;
    OH_PixelmapNativeHandle array[NUM_2];

    uint8_t data[NUM_96];
    for (auto i = 0; i < NUM_92; i = i + NUM_4) {
        data[i] = uint8_t(0);
        data[i+NUM_1] = uint8_t(0);
        data[i+NUM_2] = uint8_t(0);
        data[i+NUM_3] = uint8_t(NUM_255);
    }

    uint8_t data1[NUM_96];
    for (auto j = 0; j < NUM_96; j++) {
        data1[j] = uint8_t(j);
    }
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, NUM_4);
    OH_PixelmapInitializationOptions_SetHeight(options, NUM_6);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, NUM_4);
    OH_PixelmapInitializationOptions_SetAlphaType(options, NUM_0);
    OH_PixelmapNative_CreatePixelmap(data, NUM_96, options, &pixelMap);
    OH_PixelmapNative_CreatePixelmap(data1, NUM_96, options, &pixelMap1);
    array[NUM_0] = pixelMap;
    array[NUM_1] = pixelMap1;

    auto descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);
    auto descriptor1 = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap1);
    descriptorAnimated = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, NUM_2);

    if (OH_ArkUI_DrawableDescriptor_GetStaticPixelMap(descriptor) == nullptr) {
        ASSERT_EQ(NUM_1, NUM_0);
    }
    
    if (OH_ArkUI_DrawableDescriptor_GetAnimatedPixelMapArray(descriptorAnimated) == nullptr) {
        ASSERT_EQ(NUM_1, NUM_0);
    }
    
    ASSERT_EQ(OH_ArkUI_DrawableDescriptor_GetAnimatedPixelMapArraySize(descriptorAnimated), NUM_2);

    OH_ArkUI_DrawableDescriptor_Dispose(descriptor);
    OH_ArkUI_DrawableDescriptor_Dispose(descriptor1);
    OH_ArkUI_DrawableDescriptor_Dispose(descriptorAnimated);

    NAPI_END;
}

static napi_value TestDrawableDescriptorCreate002(napi_env env, napi_callback_info info)
{
    OH_PixelmapNativeHandle pixelMap = nullptr;
    OH_PixelmapNativeHandle pixelMap1 = nullptr;
    ArkUI_DrawableDescriptor* descriptorAnimated = nullptr;
    OH_PixelmapNativeHandle array[NUM_2];

    uint8_t data[NUM_96];
    for (auto i = 0; i < NUM_92; i = i + NUM_4) {
        data[i] = uint8_t(0);
        data[i+NUM_1] = uint8_t(0);
        data[i+NUM_2] = uint8_t(0);
        data[i+NUM_3] = uint8_t(NUM_255);
    }

    uint8_t data1[NUM_96];
    for (auto j = 0; j < NUM_96; j++) {
        data1[j] = uint8_t(j);
    }
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, NUM_4);
    OH_PixelmapInitializationOptions_SetHeight(options, NUM_6);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, NUM_4);
    OH_PixelmapInitializationOptions_SetAlphaType(options, NUM_0);
    OH_PixelmapNative_CreatePixelmap(data, NUM_96, options, &pixelMap);
    OH_PixelmapNative_CreatePixelmap(data1, NUM_96, options, &pixelMap1);
    array[NUM_0] = pixelMap;
    array[NUM_1] = pixelMap1;

    auto descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);
    auto descriptor1 = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap1);
    descriptorAnimated = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, NUM_2);
    
    OH_ArkUI_DrawableDescriptor_SetAnimationDuration(descriptorAnimated, NUM_100);
    OH_ArkUI_DrawableDescriptor_SetAnimationIteration(descriptorAnimated, NUM_5);
    
    ASSERT_EQ(OH_ArkUI_DrawableDescriptor_GetAnimationDuration(descriptorAnimated), NUM_100);
    ASSERT_EQ(OH_ArkUI_DrawableDescriptor_GetAnimationIteration(descriptorAnimated), NUM_5);

    OH_ArkUI_DrawableDescriptor_Dispose(descriptor);
    OH_ArkUI_DrawableDescriptor_Dispose(descriptor1);
    OH_ArkUI_DrawableDescriptor_Dispose(descriptorAnimated);

    NAPI_END;
}

static napi_value TestDrawableDescriptorCreate003(napi_env env, napi_callback_info info)
{
    ArkUI_DrawableDescriptor *drawable = nullptr;
    napi_value args = nullptr;

    ASSERT_EQ(OH_ArkUI_GetDrawableDescriptorFromNapiValue(env, args, &drawable), ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(OH_ArkUI_GetDrawableDescriptorFromResourceNapiValue(env, args, &drawable), ARKUI_ERROR_CODE_NO_ERROR);

    NAPI_END;
}

} // namespace ArkUICapiTest
