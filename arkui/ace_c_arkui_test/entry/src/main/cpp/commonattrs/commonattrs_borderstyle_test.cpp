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

static napi_value TestCommonAttrsBorderStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_BORDER_STYLE_SOLID}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_BORDER_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_0].i32, ARKUI_BORDER_STYLE_SOLID);
    NAPI_END;
}

static napi_value TestCommonAttrsBorderStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_BORDER_STYLE_DASHED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_BORDER_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_0].i32, ARKUI_BORDER_STYLE_DASHED);
    NAPI_END;
}

static napi_value TestCommonAttrsBorderStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_BORDER_STYLE_DOTTED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_BORDER_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_0].i32, ARKUI_BORDER_STYLE_DOTTED);
    NAPI_END;
}

static napi_value TestCommonAttrsBorderStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_BORDER_STYLE_SOLID},
                                 {.i32 = ARKUI_BORDER_STYLE_SOLID},
                                 {.i32 = ARKUI_BORDER_STYLE_SOLID},
                                 {.i32 = ARKUI_BORDER_STYLE_SOLID}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_BORDER_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_0].i32, ARKUI_BORDER_STYLE_SOLID);
    NAPI_END;
}

static napi_value TestCommonAttrsBorderStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_BORDER_STYLE_DASHED},
                                 {.i32 = ARKUI_BORDER_STYLE_DASHED},
                                 {.i32 = ARKUI_BORDER_STYLE_DASHED},
                                 {.i32 = ARKUI_BORDER_STYLE_DASHED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_BORDER_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_0].i32, ARKUI_BORDER_STYLE_DASHED);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_1].i32, ARKUI_BORDER_STYLE_DASHED);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_2].i32, ARKUI_BORDER_STYLE_DASHED);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_3].i32, ARKUI_BORDER_STYLE_DASHED);
    NAPI_END;
}

static napi_value TestCommonAttrsBorderStyle006(napi_env env, napi_callback_info info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_BORDER_STYLE_DOTTED},
                                 {.i32 = ARKUI_BORDER_STYLE_DOTTED},
                                 {.i32 = ARKUI_BORDER_STYLE_DOTTED},
                                 {.i32 = ARKUI_BORDER_STYLE_DOTTED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_BORDER_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_0].i32, ARKUI_BORDER_STYLE_DOTTED);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_1].i32, ARKUI_BORDER_STYLE_DOTTED);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_2].i32, ARKUI_BORDER_STYLE_DOTTED);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_BORDER_STYLE)->value[PARAM_3].i32, ARKUI_BORDER_STYLE_DOTTED);
    NAPI_END;
}

} // namespace ArkUICapiTest