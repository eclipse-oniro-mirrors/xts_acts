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

namespace ArkUICapiTest {

static napi_value TestCommonAttrsBackgroundImagePixelMap001(napi_env env, napi_callback_info info)
{
    OH_PixelmapNativeHandle pixelMap = nullptr;
    ArkUI_DrawableDescriptor* descriptor = nullptr;

    uint8_t data[PARAM_96];
    for (auto i = 0; i < PARAM_96; i = i + PARAM_4) {
        data[i] = uint8_t(0);
        data[i + PARAM_1] = uint8_t(0);
        data[i + PARAM_2] = uint8_t(0);
        data[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data1[PARAM_96];
    for (auto j = 0; j < PARAM_96; j++) {
        data1[j] = uint8_t(j);
    }
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_6);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PARAM_0);
    OH_PixelmapNative_CreatePixelmap(data, PARAM_96, options, &pixelMap);
    descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);

    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageRepeat = ARKUI_IMAGE_REPEAT_NONE;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = descriptor;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, imageRepeat);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePixelMap002(napi_env env, napi_callback_info info)
{
    OH_PixelmapNativeHandle pixelMap = nullptr;
    ArkUI_DrawableDescriptor* descriptor = nullptr;

    uint8_t data[PARAM_96];
    for (auto i = 0; i < PARAM_96; i = i + PARAM_4) {
        data[i] = uint8_t(0);
        data[i + PARAM_1] = uint8_t(0);
        data[i + PARAM_2] = uint8_t(0);
        data[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data1[PARAM_96];
    for (auto j = 0; j < PARAM_96; j++) {
        data1[j] = uint8_t(j);
    }
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_6);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PARAM_0);
    OH_PixelmapNative_CreatePixelmap(data, PARAM_96, options, &pixelMap);
    descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);

    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageRepeat = ARKUI_IMAGE_REPEAT_X;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = descriptor;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, imageRepeat);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePixelMap003(napi_env env, napi_callback_info info)
{
    OH_PixelmapNativeHandle pixelMap = nullptr;
    ArkUI_DrawableDescriptor* descriptor = nullptr;

    uint8_t data[PARAM_96];
    for (auto i = 0; i < PARAM_96; i = i + PARAM_4) {
        data[i] = uint8_t(0);
        data[i + PARAM_1] = uint8_t(0);
        data[i + PARAM_2] = uint8_t(0);
        data[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data1[PARAM_96];
    for (auto j = 0; j < PARAM_96; j++) {
        data1[j] = uint8_t(j);
    }
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_6);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PARAM_0);
    OH_PixelmapNative_CreatePixelmap(data, PARAM_96, options, &pixelMap);
    descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);

    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageRepeat = ARKUI_IMAGE_REPEAT_Y;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = descriptor;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, imageRepeat);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePixelMap004(napi_env env, napi_callback_info info)
{
    OH_PixelmapNativeHandle pixelMap = nullptr;
    ArkUI_DrawableDescriptor* descriptor = nullptr;

    uint8_t data[PARAM_96];
    for (auto i = 0; i < PARAM_96; i = i + PARAM_4) {
        data[i] = uint8_t(0);
        data[i + PARAM_1] = uint8_t(0);
        data[i + PARAM_2] = uint8_t(0);
        data[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data1[PARAM_96];
    for (auto j = 0; j < PARAM_96; j++) {
        data1[j] = uint8_t(j);
    }
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_6);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PARAM_0);
    OH_PixelmapNative_CreatePixelmap(data, PARAM_96, options, &pixelMap);
    descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);
    
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageRepeat = ARKUI_IMAGE_REPEAT_XY;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = descriptor;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, imageRepeat);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePixelMap005(napi_env env, napi_callback_info info)
{
    OH_PixelmapNativeHandle pixelMap = nullptr;
    ArkUI_DrawableDescriptor* descriptor = nullptr;

    uint8_t data[PARAM_96];
    for (auto i = 0; i < PARAM_96; i = i + PARAM_4) {
        data[i] = uint8_t(0);
        data[i + PARAM_1] = uint8_t(0);
        data[i + PARAM_2] = uint8_t(0);
        data[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data1[PARAM_96];
    for (auto j = 0; j < PARAM_96; j++) {
        data1[j] = uint8_t(j);
    }
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_6);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PARAM_0);
    OH_PixelmapNative_CreatePixelmap(data, PARAM_96, options, &pixelMap);
    descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);

    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageRepeat = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = descriptor;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePixelMap006(napi_env env, napi_callback_info info)
{
    OH_PixelmapNativeHandle pixelMap = nullptr;
    ArkUI_DrawableDescriptor* descriptor = nullptr;

    uint8_t data[PARAM_96];
    for (auto i = 0; i < PARAM_96; i = i + PARAM_4) {
        data[i] = uint8_t(0);
        data[i + PARAM_1] = uint8_t(0);
        data[i + PARAM_2] = uint8_t(0);
        data[i + PARAM_3] = uint8_t(PARAM_255);
    }

    uint8_t data1[PARAM_96];
    for (auto j = 0; j < PARAM_96; j++) {
        data1[j] = uint8_t(j);
    }
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_6);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PARAM_4);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PARAM_0);
    OH_PixelmapNative_CreatePixelmap(data, PARAM_96, options, &pixelMap);
    descriptor = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);

    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageRepeat = PARAM_4;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = descriptor;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImagePixelMap007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t imageRepeat = ARKUI_IMAGE_REPEAT_X;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = nullptr;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUICapiTest
