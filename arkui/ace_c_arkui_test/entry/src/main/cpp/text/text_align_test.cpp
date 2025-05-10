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

static napi_value TestTextAlign001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_TOP_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestTextAlign002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_TOP;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestTextAlign003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_TOP_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestTextAlign004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestTextAlign005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_CENTER;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestTextAlign006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestTextAlign007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestTextAlign008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestTextAlign009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestTextAlign010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_CENTER;
    auto textDefault = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ASSERT_EQ(nodeAPI->getAttribute(textDefault, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

} // namespace ArkUICapiTest
