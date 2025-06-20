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
#include <multimedia/image_framework/image/pixelmap_native.h>
#include "imagespan_component.h"
#define FIRST_MIDDLE_VALUE "./resources/base/media/icon.png"
#define SECOND_MIDDLE_VALUE                                                                                            \
    "https://gitee.com/openharmony/docs/raw/master/zh-cn/application-dev/"                                             \
    "reference/apis-arkui/arkui-ts/figures/edgewidths.png"

namespace ArkUICapiTest {

static napi_value TestImageSpanSrc001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    const char *value = FIRST_MIDDLE_VALUE;
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = value;

    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SPAN_SRC, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(image, NODE_IMAGE_SPAN_SRC)->string, value);
    NAPI_END;
}

static napi_value TestImageSpanSrc002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    const char *value = SECOND_MIDDLE_VALUE;
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = value;

    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SPAN_SRC, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(image, NODE_IMAGE_SPAN_SRC)->string, value);
    NAPI_END;
}

static napi_value TestImageSpanSrc003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    OH_PixelmapNativeHandle pixelMap = nullptr;
    OH_PixelmapNativeHandle pixelMap1 = nullptr;
    ArkUI_DrawableDescriptor *descriptorAnimated = nullptr;
    OH_PixelmapNativeHandle array[PARAM_2];

    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];

    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_200);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelMap);
    OH_PixelmapNative_Rotate(pixelMap, PARAM_90_POINT_0);
    OH_PixelmapNative_Opacity(pixelMap, PARAM_0_POINT_2);
    OH_PixelmapNative_Scale(pixelMap, PARAM_0_POINT_8, PARAM_1_POINT_0);
    OH_PixelmapNative_Flip(pixelMap, true, true);
    auto descriptors = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);
    ArkUI_AttributeItem item = {.object = descriptors};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SPAN_SRC, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getAttribute(image, NODE_IMAGE_SPAN_SRC)->object, descriptors);

    NAPI_END;
}

static napi_value TestImageSpanSrc004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    OH_PixelmapNativeHandle pixelMap = nullptr;
    OH_PixelmapNativeHandle pixelMap1 = nullptr;
    ArkUI_DrawableDescriptor *descriptorAnimated = nullptr;
    OH_PixelmapNativeHandle array[PARAM_2];
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];

    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }

    uint8_t data1[dataSize];
    for (auto i = 0; i < PARAM_960000; i = i + PARAM_4) {
        data1[i] = uint8_t(0);
        data1[i + PARAM_1] = uint8_t(i + PARAM_1);
        data1[i + PARAM_2] = uint8_t(i + PARAM_2);
        data1[i + PARAM_3] = uint8_t(PARAM_255);
    }

    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_200);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelMap);
    OH_PixelmapNative_Rotate(pixelMap, PARAM_90_POINT_0);
    OH_PixelmapNative_Opacity(pixelMap, PARAM_0_POINT_2);
    OH_PixelmapNative_Scale(pixelMap, PARAM_0_POINT_8, PARAM_1_POINT_0);
    OH_PixelmapNative_Flip(pixelMap, true, true);
    auto descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);

    OH_PixelmapNative_CreatePixelmap(data1, dataSize, options, &pixelMap1);

    array[0] = pixelMap1;
    array[1] = pixelMap;
    descriptorAnimated = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(array, PARAM_2);

    OH_ArkUI_DrawableDescriptor_SetAnimationDuration(descriptorAnimated, PARAM_200);
    OH_ArkUI_DrawableDescriptor_SetAnimationIteration(descriptorAnimated, PARAM_5);

    ArkUI_AttributeItem item = {.object = descriptorAnimated};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SPAN_SRC, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getAttribute(image, NODE_IMAGE_SPAN_SRC)->object, descriptorAnimated);

    NAPI_END;
}

static napi_value TestImageSpanSrc005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_AttributeItem valueItem = {};

    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SPAN_SRC, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
} // namespace ArkUICapiTest
