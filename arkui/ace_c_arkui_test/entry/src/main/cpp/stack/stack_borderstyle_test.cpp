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

#define ABNORMAL_VALUE (-1)

namespace ArkUICapiTest {

static napi_value TestStackBorderStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue borderStyle_value[] = {{.i32 = ARKUI_BORDER_STYLE_SOLID}};
    ArkUI_AttributeItem borderStyle_item = {borderStyle_value, sizeof(borderStyle_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_STYLE, &borderStyle_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_0].i32, ARKUI_BORDER_STYLE_SOLID);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_1].i32, ARKUI_BORDER_STYLE_SOLID);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_2].i32, ARKUI_BORDER_STYLE_SOLID);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_3].i32, ARKUI_BORDER_STYLE_SOLID);
    NAPI_END;
}

static napi_value TestStackBorderStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue borderStyle_value[] = {{.i32 = ARKUI_BORDER_STYLE_DASHED}};
    ArkUI_AttributeItem borderStyle_item = {borderStyle_value, sizeof(borderStyle_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_STYLE, &borderStyle_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_0].i32, ARKUI_BORDER_STYLE_DASHED);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_1].i32, ARKUI_BORDER_STYLE_DASHED);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_2].i32, ARKUI_BORDER_STYLE_DASHED);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_3].i32, ARKUI_BORDER_STYLE_DASHED);
    NAPI_END;
}

static napi_value TestStackBorderStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue borderStyle_value[] = {{.i32 = ARKUI_BORDER_STYLE_DOTTED}};
    ArkUI_AttributeItem borderStyle_item = {borderStyle_value, sizeof(borderStyle_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_STYLE, &borderStyle_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_0].i32, ARKUI_BORDER_STYLE_DOTTED);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_1].i32, ARKUI_BORDER_STYLE_DOTTED);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_2].i32, ARKUI_BORDER_STYLE_DOTTED);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_3].i32, ARKUI_BORDER_STYLE_DOTTED);
    NAPI_END;
}

static napi_value TestStackBorderStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue borderStyle_value[] = {{.i32 = ABNORMAL_VALUE}};
    ArkUI_AttributeItem borderStyle_item = {borderStyle_value, sizeof(borderStyle_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_STYLE, &borderStyle_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_BORDER_STYLE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_0].i32, ABNORMAL_VALUE);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_1].i32, ABNORMAL_VALUE);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_2].i32, ABNORMAL_VALUE);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_3].i32, ABNORMAL_VALUE);
    }
    NAPI_END;
}

static napi_value TestStackBorderStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue borderStyle_value[] = {{.i32 = ARKUI_BORDER_STYLE_SOLID},
                                             {.i32 = ARKUI_BORDER_STYLE_DASHED},
                                             {.i32 = ARKUI_BORDER_STYLE_DOTTED},
                                             {.i32 = ARKUI_BORDER_STYLE_SOLID}};
    ArkUI_AttributeItem borderStyle_item = {borderStyle_value, sizeof(borderStyle_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_STYLE, &borderStyle_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_0].i32, ARKUI_BORDER_STYLE_SOLID);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_1].i32, ARKUI_BORDER_STYLE_DASHED);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_2].i32, ARKUI_BORDER_STYLE_DOTTED);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_3].i32, ARKUI_BORDER_STYLE_SOLID);
    NAPI_END;
}

static napi_value TestStackBorderStyle006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue borderStyle_value[] = {
        {.i32 = ABNORMAL_VALUE}, {.i32 = ABNORMAL_VALUE}, {.i32 = ABNORMAL_VALUE}, {.i32 = ABNORMAL_VALUE}};
    ArkUI_AttributeItem borderStyle_item = {borderStyle_value, sizeof(borderStyle_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_STYLE, &borderStyle_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_BORDER_STYLE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_0].i32, ABNORMAL_VALUE);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_1].i32, ABNORMAL_VALUE);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_2].i32, ABNORMAL_VALUE);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_STYLE)->value[PARAM_3].i32, ABNORMAL_VALUE);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
