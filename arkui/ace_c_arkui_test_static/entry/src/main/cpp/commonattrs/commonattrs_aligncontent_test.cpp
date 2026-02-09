/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestCommonAttrsAlignContent001(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_TOP_START}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_START);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignContent002(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_TOP}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignContent003(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_TOP_END}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_END);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignContent004(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_START}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_START);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignContent005(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_CENTER);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignContent006(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_END}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_END);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignContent007(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM_START}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM_START);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignContent008(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignContent009(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM_END}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_STACK_ALIGN_CONTENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_STACK_ALIGN_CONTENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM_END);
    NAPI_END;
}
} // namespace ArkUIAniTest
