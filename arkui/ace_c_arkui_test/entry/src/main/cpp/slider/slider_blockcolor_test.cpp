/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

static napi_value TestSliderBlockColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_COLOR)->value[PARAM_0].u32, 0xFFFFFFFF);
    NAPI_END;
}

static napi_value TestSliderBlockColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ArkUI_NumberValue value[] = {{.u32 = 0xFFFF0000}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_COLOR)->value[PARAM_0].u32, 0xFFFF0000);
    NAPI_END;
}

static napi_value TestSliderBlockColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ArkUI_NumberValue value[] = {{.u32 = 0xFF000000}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_COLOR)->value[PARAM_0].u32, 0xFF000000);
    NAPI_END;
}

static napi_value TestSliderBlockColor004(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ArkUI_NumberValue value[] = {{.u32 = 0xFFFFFFFF}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_COLOR)->value[PARAM_0].u32, 0xFFFFFFFF);
    NAPI_END;
}

static napi_value TestSliderBlockColor005(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ArkUI_NumberValue value[] = {{.u32 = 0x00FFFFFF}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_COLOR)->value[PARAM_0].u32, 0x00FFFFFF);
    NAPI_END;
}

static napi_value TestSliderBlockColor006(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ArkUI_NumberValue value[] = {{.u32 = 0x80FFFFFF}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_COLOR)->value[PARAM_0].u32, 0x80FFFFFF);
    NAPI_END;
}

static napi_value TestSliderBlockColor007(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ArkUI_NumberValue value[] = {{.u32 = 0x00000000}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_COLOR)->value[PARAM_0].u32, 0x00000000);
    NAPI_END;
}

static napi_value TestSliderBlockColor008(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    uint32_t colors[] = {0xFFFFFFFF, 0xFF0000FF, 0xFF000000};
    float stops[] = {0.3, 0.5, 1};
    int colorSize = sizeof(colors) / sizeof(colors[0]);
    ArkUI_ColorStop colorStop[] = {{colors, stops, colorSize}};
    ArkUI_AttributeItem value_item = {nullptr, 0, nullptr, colorStop};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_BLOCK_LINEAR_GRADIENT_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto attrItem = nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_LINEAR_GRADIENT_COLOR);
    ASSERT_NOTNULL(attrItem);
    auto gradients = static_cast<ArkUI_ColorStop*>(attrItem->object);
    ASSERT_NOTNULL(gradients);
    auto size = gradients->size;
    ASSERT_EQ(size, colorSize);
    for (int i = 0; i < size; ++i) {
        ASSERT_EQ(gradients->colors[i], colors[i]);
        ASSERT_FLOATEQ(gradients->stops[i], stops[i]);
    }
    ret = nodeAPI->resetAttribute(slider, NODE_SLIDER_BLOCK_LINEAR_GRADIENT_COLOR);
    ASSERT_EQ(ret, SUCCESS);
    attrItem = nodeAPI->getAttribute(slider, NODE_SLIDER_BLOCK_LINEAR_GRADIENT_COLOR);
    if (!attrItem) {
        napi_value errorResult = nullptr;
        return errorResult;
    }
    gradients = static_cast<ArkUI_ColorStop*>(attrItem->object);
    if (!gradients) {
        napi_value errorResult = nullptr;
        return errorResult;
    }
    size = gradients->size;
    ASSERT_EQ(size, SIZE_2);
    NAPI_END;
}
} // namespace ArkUICapiTest
