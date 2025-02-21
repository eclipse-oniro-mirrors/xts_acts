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

static napi_value TestToggleMargin001(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    float margin = 10;
    ArkUI_NumberValue value[] = {{.f32 = margin}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_MARGIN, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_0].f32, margin);
    NAPI_END;
}

static napi_value TestToggleMargin002(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    float margin = -10;
    int expectCode = 0;
    ArkUI_NumberValue value[] = {{.f32 = margin}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_MARGIN, &value_item);
    ASSERT_EQ(ret, expectCode);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_0].f32, margin);
    NAPI_END;
}

static napi_value TestToggleMargin003(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    float margin = 100;
    ArkUI_NumberValue value[] = {{.f32 = margin}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_MARGIN, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_0].f32, margin);
    NAPI_END;
}

static napi_value TestToggleMargin004(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    float marginTop = 10;
    float marginRight = 20;
    float marginButton = 30;
    float marginLeft = 40;
    ArkUI_NumberValue value[] = {{.f32 = marginTop}, {.f32 = marginRight}, {.f32 = marginButton}, {.f32 = marginLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_MARGIN, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_0].f32, marginTop);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_1].f32, marginRight);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_2].f32, marginButton);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_3].f32, marginLeft);
    NAPI_END;
}

static napi_value TestToggleMargin005(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    float marginTop = -10;
    float marginRight = -20;
    float marginButton = -30;
    float marginLeft = -40;
    ArkUI_NumberValue value[] = {{.f32 = marginTop}, {.f32 = marginRight}, {.f32 = marginButton}, {.f32 = marginLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_MARGIN, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_0].f32, marginTop);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_1].f32, marginRight);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_2].f32, marginButton);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_3].f32, marginLeft);
    NAPI_END;
}

static napi_value TestToggleMargin006(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    float marginTop = 100;
    float marginRight = 101;
    float marginButton = 102;
    float marginLeft = 103;
    ArkUI_NumberValue value[] = {{.f32 = marginTop}, {.f32 = marginRight}, {.f32 = marginButton}, {.f32 = marginLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_MARGIN, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_0].f32, marginTop);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_1].f32, marginRight);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_2].f32, marginButton);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_MARGIN)->value[PARAM_3].f32, marginLeft);
    NAPI_END;
}

} // namespace ArkUICapiTest
