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

static napi_value TestCustomComponentAlignSelf001(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_AUTO}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_AUTO);
    NAPI_END;
}

static napi_value TestCustomComponentAlignSelf002(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_START}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_START);
    NAPI_END;
}

static napi_value TestCustomComponentAlignSelf003(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestCustomComponentAlignSelf004(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_END}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_END);
    NAPI_END;
}

static napi_value TestCustomComponentAlignSelf005(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_STRETCH}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_STRETCH);
    NAPI_END;
}

static napi_value TestCustomComponentAlignSelf006(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_BASELINE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_BASELINE);
    NAPI_END;
}
} // namespace ArkUICapiTest
