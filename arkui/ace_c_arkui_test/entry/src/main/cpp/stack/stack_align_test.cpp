/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestStackAlign001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue align_value[] = {{.i32 = ARKUI_ALIGNMENT_TOP_START}};
    ArkUI_AttributeItem align_value_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_START);
    NAPI_END;
}

static napi_value TestStackAlign002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue align_value[] = {{.i32 = ARKUI_ALIGNMENT_TOP}};
    ArkUI_AttributeItem align_value_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP);
    NAPI_END;
}

static napi_value TestStackAlign003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue align_value[] = {{.i32 = ARKUI_ALIGNMENT_TOP_END}};
    ArkUI_AttributeItem align_value_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_END);
    NAPI_END;
}

static napi_value TestStackAlign004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue align_value[] = {{.i32 = ARKUI_ALIGNMENT_START}};
    ArkUI_AttributeItem align_value_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_START);
    NAPI_END;
}

static napi_value TestStackAlign005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue align_value[] = {{.i32 = ARKUI_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem align_value_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestStackAlign006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue align_value[] = {{.i32 = ARKUI_ALIGNMENT_END}};
    ArkUI_AttributeItem align_value_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_END);
    NAPI_END;
}

static napi_value TestStackAlign007(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue align_value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM_START}};
    ArkUI_AttributeItem align_value_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM_START);
    NAPI_END;
}

static napi_value TestStackAlign008(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue align_value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM}};
    ArkUI_AttributeItem align_value_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM);
    NAPI_END;
}

static napi_value TestStackAlign009(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue align_value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM_END}};
    ArkUI_AttributeItem align_value_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM_END);
    NAPI_END;
}

static napi_value TestStackAlign010(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    int32_t align = -1;

    ArkUI_NumberValue align_value[] = {{.i32 = align}};
    ArkUI_AttributeItem align_value_item = {align_value, sizeof(align_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &align_value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, align);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
