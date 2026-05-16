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

namespace ArkUICapiTest {
static napi_value TestImageSpanAlt001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    const char *value = FIRST_MIDDLE_VALUE;
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = value;

    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SPAN_ALT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(image, NODE_IMAGE_SPAN_ALT)->string, value);
    NAPI_END;
}
static napi_value TestImageSpanAlt002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    OH_PixelmapNativeHandle pixelMap = nullptr;
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];

    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, SIZE_200);
    OH_PixelmapInitializationOptions_SetHeight(options, SIZE_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelMap);
    OH_PixelmapNative_Rotate(pixelMap, PARAM_90_POINT_0);
    OH_PixelmapNative_Opacity(pixelMap, PARAM_0_POINT_2);
    OH_PixelmapNative_Scale(pixelMap, PARAM_0_POINT_8, PARAM_1_POINT_0);
    OH_PixelmapNative_Flip(pixelMap, true, true);
    auto descriptors = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);
    ArkUI_AttributeItem item = {.object = descriptors};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SPAN_ALT, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getAttribute(image, NODE_IMAGE_SPAN_ALT)->object, descriptors);

    NAPI_END;
}

static napi_value TestImageSpanAlt003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_AttributeItem valueItem = {};

    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SPAN_ALT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageSpanAlt004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    OH_PixelmapNativeHandle pixelMap = nullptr;
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];

    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, SIZE_200);
    OH_PixelmapInitializationOptions_SetHeight(options, SIZE_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelMap);
    OH_PixelmapNative_Rotate(pixelMap, PARAM_90_POINT_0);
    OH_PixelmapNative_Opacity(pixelMap, PARAM_0_POINT_2);
    OH_PixelmapNative_Scale(pixelMap, PARAM_0_POINT_8, PARAM_1_POINT_0);
    OH_PixelmapNative_Flip(pixelMap, true, true);
    auto descriptors = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);
    ArkUI_AttributeItem item = {.object = descriptors};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SPAN_ALT, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(image, NODE_IMAGE_SPAN_ALT);
    ASSERT_EQ(ret1, SUCCESS);

    NAPI_END;
}

static napi_value TestImageSpanAlt005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    const char *value = FIRST_MIDDLE_VALUE;
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = value;

    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SPAN_ALT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(image, NODE_IMAGE_SPAN_ALT);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(image, NODE_IMAGE_SPAN_ALT)->string, "");
    NAPI_END;
}
} // namespace ArkUICapiTest
