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

#include <arkui/native_interface.h>

#include "../manager/plugin_manager.h"
#include "arkui/native_node.h"
#include "common/common.h"

namespace ArkUICapiTest {
static auto SetNestedScroll(ArkUI_NodeHandle list, int32_t nested)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue value[] = { { .i32 = nested }, { .i32 = nested } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_NESTED_SCROLL, &item);
    return ret;
}

static napi_value TestListNestedScroll001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t nested = ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
    auto ret = SetNestedScroll(list, nested);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32, nested);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32, nested);
    NAPI_END;
}

static napi_value TestListNestedScroll002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t nested = ARKUI_SCROLL_NESTED_MODE_SELF_FIRST;
    auto ret = SetNestedScroll(list, nested);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32, nested);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32, nested);
    NAPI_END;
}

static napi_value TestListNestedScroll003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t nested = ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST;
    auto ret = SetNestedScroll(list, nested);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32, nested);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32, nested);
    NAPI_END;
}

static napi_value TestListNestedScroll004(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t nested = ARKUI_SCROLL_NESTED_MODE_PARALLEL;
    auto ret = SetNestedScroll(list, nested);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32, nested);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32, nested);
    NAPI_END;
}

static napi_value TestListNestedScroll005(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t nested = PARAM_NEGATIVE_1;
    auto ret = SetNestedScroll(list, nested);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32,
        ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32,
        ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    NAPI_END;
}

static napi_value TestListNestedScroll006(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t nested = PARAM_4;
    auto ret = SetNestedScroll(list, nested);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32,
        ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32,
        ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    NAPI_END;
}

static napi_value TestListNestedScroll007(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret = nodeAPI->resetAttribute(list, NODE_SCROLL_NESTED_SCROLL);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_0].i32,
        ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_NESTED_SCROLL)->value[PARAM_1].i32,
        ARKUI_SCROLL_NESTED_MODE_SELF_ONLY);
    NAPI_END;
}
} // namespace ArkUICapiTest