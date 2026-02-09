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

static napi_value TestCommonAttrsCustomShadow001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float blurRadius = PARAM_NEGATIVE_30;
    int32_t strategy = PARAM_0;
    float offsetX = PARAM_20;
    float offsetY = PARAM_20;
    int32_t shadowType = ARKUI_SHADOW_TYPE_COLOR;
    uint32_t shadowColor = 0xFFFF0000;
    uint32_t fillShadow = SIZE_0;
    ArkUI_NumberValue value[] = {{.f32 = blurRadius}, {.i32 = strategy}, {.f32 = offsetX}, {.f32 = offsetY},
                                 {.i32 = shadowType}, {.u32 = shadowColor}, {.u32 = fillShadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CUSTOM_SHADOW, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsCustomShadow002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float blurRadius = PARAM_0;
    int32_t strategy = PARAM_0;
    float offsetX = PARAM_20;
    float offsetY = PARAM_20;
    int32_t shadowType = ARKUI_SHADOW_TYPE_COLOR;
    uint32_t shadowColor = 0xFFFF0000;
    uint32_t fillShadow = SIZE_0;
    ArkUI_NumberValue value[] = {{.f32 = blurRadius}, {.i32 = strategy}, {.f32 = offsetX}, {.f32 = offsetY},
                                 {.i32 = shadowType}, {.u32 = shadowColor}, {.u32 = fillShadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CUSTOM_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_0].f32, blurRadius);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_1].i32, strategy);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_2].f32, offsetX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_3].f32, offsetY);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_4].i32, shadowType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_5].u32, shadowColor);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_6].u32, fillShadow);
    NAPI_END;
}

static napi_value TestCommonAttrsCustomShadow003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float blurRadius = PARAM_30;
    int32_t strategy = PARAM_0;
    float offsetX = PARAM_20;
    float offsetY = PARAM_20;
    int32_t shadowType = ARKUI_SHADOW_TYPE_COLOR;
    uint32_t shadowColor = 0xFFFF0000;
    uint32_t fillShadow = SIZE_0;
    ArkUI_NumberValue value[] = {{.f32 = blurRadius}, {.i32 = strategy}, {.f32 = offsetX}, {.f32 = offsetY},
                                 {.i32 = shadowType}, {.u32 = shadowColor}, {.u32 = fillShadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CUSTOM_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_0].f32, blurRadius);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_1].i32, strategy);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_2].f32, offsetX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_3].f32, offsetY);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_4].i32, shadowType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_5].u32, shadowColor);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_6].u32, fillShadow);
    NAPI_END;
}

static napi_value TestCommonAttrsCustomShadow004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float blurRadius = PARAM_0;
    int32_t strategy = PARAM_1;
    float offsetX = PARAM_20;
    float offsetY = PARAM_20;
    int32_t shadowType = ARKUI_SHADOW_TYPE_COLOR;
    uint32_t shadowColor = 0xFFFF0000;
    uint32_t fillShadow = SIZE_0;
    ArkUI_NumberValue value[] = {{.f32 = blurRadius}, {.i32 = strategy}, {.f32 = offsetX}, {.f32 = offsetY},
                                 {.i32 = shadowType}, {.u32 = shadowColor}, {.u32 = fillShadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CUSTOM_SHADOW, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsCustomShadow005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float blurRadius = PARAM_0;
    int32_t strategy = PARAM_0;
    float offsetX = PARAM_NEGATIVE_5;
    float offsetY = PARAM_NEGATIVE_5;
    int32_t shadowType = ARKUI_SHADOW_TYPE_COLOR;
    uint32_t shadowColor = 0xFFFF0000;
    uint32_t fillShadow = SIZE_0;
    ArkUI_NumberValue value[] = {{.f32 = blurRadius}, {.i32 = strategy}, {.f32 = offsetX}, {.f32 = offsetY},
                                 {.i32 = shadowType}, {.u32 = shadowColor}, {.u32 = fillShadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CUSTOM_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_0].f32, blurRadius);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_1].i32, strategy);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_2].f32, offsetX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_3].f32, offsetY);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_4].i32, shadowType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_5].u32, shadowColor);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_6].u32, fillShadow);
    NAPI_END;
}

static napi_value TestCommonAttrsCustomShadow006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float blurRadius = PARAM_0;
    int32_t strategy = PARAM_0;
    float offsetX = PARAM_NEGATIVE_5;
    float offsetY = PARAM_NEGATIVE_5;
    int32_t shadowType = PARAM_NEGATIVE_1;
    uint32_t shadowColor = 0xFFFF0000;
    uint32_t fillShadow = SIZE_0;
    ArkUI_NumberValue value[] = {{.f32 = blurRadius}, {.i32 = strategy}, {.f32 = offsetX}, {.f32 = offsetY},
                                 {.i32 = shadowType}, {.u32 = shadowColor}, {.u32 = fillShadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CUSTOM_SHADOW, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsCustomShadow007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float blurRadius = PARAM_0;
    int32_t strategy = PARAM_0;
    float offsetX = PARAM_NEGATIVE_5;
    float offsetY = PARAM_NEGATIVE_5;
    int32_t shadowType = PARAM_2;
    uint32_t shadowColor = 0xFFFF0000;
    uint32_t fillShadow = SIZE_0;
    ArkUI_NumberValue value[] = {{.f32 = blurRadius}, {.i32 = strategy}, {.f32 = offsetX}, {.f32 = offsetY},
                                 {.i32 = shadowType}, {.u32 = shadowColor}, {.u32 = fillShadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CUSTOM_SHADOW, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsCustomShadow008(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float blurRadius = PARAM_0;
    int32_t strategy = PARAM_0;
    float offsetX = PARAM_20;
    float offsetY = PARAM_20;
    int32_t shadowType = ARKUI_SHADOW_TYPE_COLOR;
    uint32_t shadowColor = 0xFFFF0000;
    uint32_t fillShadow = PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = blurRadius}, {.i32 = strategy}, {.f32 = offsetX}, {.f32 = offsetY},
                                 {.i32 = shadowType}, {.u32 = shadowColor}, {.u32 = fillShadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_CUSTOM_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_0].f32, blurRadius);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_1].i32, strategy);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_2].f32, offsetX);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_3].f32, offsetY);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_4].i32, shadowType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_5].u32, shadowColor);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_6].u32, fillShadow);
    NAPI_END;
}

static napi_value TestCommonAttrsCustomShadow009(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float blurRadius = PARAM_0;
    int32_t strategy = PARAM_0;
    float offsetX = PARAM_20;
    float offsetY = PARAM_20;
    int32_t shadowType = ARKUI_SHADOW_TYPE_COLOR;
    uint32_t shadowColor = 0xFFFF0000;
    uint32_t fillShadow = PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = blurRadius}, {.i32 = strategy}, {.f32 = offsetX}, {.f32 = offsetY},
                                 {.i32 = shadowType}, {.u32 = shadowColor}, {.u32 = fillShadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_CUSTOM_SHADOW, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_CUSTOM_SHADOW);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_CUSTOM_SHADOW)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUICapiTest