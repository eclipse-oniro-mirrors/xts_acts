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

namespace ArkUICapiTest {

static napi_value TestTextMask001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t color = 0xFF000000;
    float widthValue = 5;
    float sizeValue = 40;
    float filletSizeValue = 10;
    ArkUI_NumberValue value[] = {
        {.u32 = color},     {.u32 = color},     {.f32 = widthValue},      {.i32 = ARKUI_MASK_TYPE_RECTANGLE},
        {.f32 = sizeValue}, {.f32 = sizeValue}, {.f32 = filletSizeValue}, {.f32 = filletSizeValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_MASK, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_0].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_1].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_2].f32, widthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_3].i32, ARKUI_MASK_TYPE_RECTANGLE);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_4].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_5].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_6].f32, filletSizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_7].f32, filletSizeValue);
    NAPI_END;
}

static napi_value TestTextMask002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t color = 0xFF000000;
    float widthValue = 5;
    float sizeValue = 40;
    ArkUI_NumberValue value[] = {{.u32 = color},      {.u32 = color},
                                 {.f32 = widthValue}, {.i32 = ARKUI_MASK_TYPE_CIRCLE},
                                 {.f32 = sizeValue},  {.f32 = sizeValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_MASK, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_0].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_1].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_2].f32, widthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_3].i32, ARKUI_MASK_TYPE_CIRCLE);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_4].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_5].f32, sizeValue);
    NAPI_END;
}

static napi_value TestTextMask003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t color = 0xFF000000;
    float widthValue = 5;
    float sizeValue = 40;
    ArkUI_NumberValue value[] = {{.u32 = color},      {.u32 = color},
                                 {.f32 = widthValue}, {.i32 = ARKUI_MASK_TYPE_ELLIPSE},
                                 {.f32 = sizeValue},  {.f32 = sizeValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_MASK, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_0].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_1].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_2].f32, widthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_3].i32, ARKUI_MASK_TYPE_ELLIPSE);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_4].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_5].f32, sizeValue);
    NAPI_END;
}

static napi_value TestTextMask004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t color = 0xFF000000;
    float widthValue = 5;
    float sizeValue = 40;
    ArkUI_NumberValue value[] = {{.u32 = color},      {.u32 = color},
                                 {.f32 = widthValue}, {.i32 = ARKUI_MASK_TYPE_PATH},
                                 {.f32 = sizeValue},  {.f32 = sizeValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "M0 10 L80 0";
    auto ret = nodeAPI->setAttribute(text, NODE_MASK, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_0].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_1].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_2].f32, widthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_3].i32, ARKUI_MASK_TYPE_PATH);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_4].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_5].f32, sizeValue);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_MASK)->string, "M0 10 L80 0");
    NAPI_END;
}

static napi_value TestTextMask005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t color = 0xFF000000;
    float sizeValue = 40;
    ArkUI_NumberValue value[] = {
        {.i32 = ARKUI_MASK_TYPE_PROGRESS}, {.f32 = sizeValue}, {.f32 = sizeValue}, {.u32 = color}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_MASK, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(text, NODE_MASK) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_0].i32, ARKUI_MASK_TYPE_PROGRESS);
        ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_1].f32, sizeValue);
        ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_2].f32, sizeValue);
        ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_3].u32, color);
    }
    NAPI_END;
}

static napi_value TestTextMask006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t color = 0xFF000000;
    float widthValue = 100;
    float sizeValue = 1000;
    ArkUI_NumberValue value[] = {{.u32 = color},      {.u32 = color},
                                 {.f32 = widthValue}, {.i32 = ARKUI_MASK_TYPE_CIRCLE},
                                 {.f32 = sizeValue},  {.f32 = sizeValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_MASK, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_0].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_1].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_2].f32, widthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_3].i32, ARKUI_MASK_TYPE_CIRCLE);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_4].f32, sizeValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_5].f32, sizeValue);
    NAPI_END;
}

static napi_value TestTextMask007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t color = 0xFF000000;
    float exceptionWidthValue = -5;
    float exceptionSizeValue = -40;
    int32_t exceptionValue = -1;
    ArkUI_NumberValue value[] = {{.u32 = color},
                                 {.u32 = color},
                                 {.f32 = exceptionWidthValue},
                                 {.i32 = exceptionValue},
                                 {.f32 = exceptionSizeValue},
                                 {.f32 = exceptionSizeValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_MASK, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(text, NODE_MASK) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_2].f32, exceptionWidthValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_3].i32, exceptionValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_4].f32, exceptionSizeValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_MASK)->value[PARAM_5].f32, exceptionSizeValue);
    };

    NAPI_END;
}
} // namespace ArkUICapiTest
