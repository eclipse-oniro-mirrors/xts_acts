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

static napi_value TestScrollPageEnable001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = false}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_PAGING, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING)->value[PARAM_0].i32, false);
    NAPI_END;
}

static napi_value TestScrollPageEnable002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = true}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_PAGING, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING)->value[PARAM_0].i32, true);
    NAPI_END;
}

static napi_value TestScrollPageEnable003(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_PAGING, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING)->value[PARAM_0].i32, PARAM_NEGATIVE_1);
    }
    NAPI_END;
}

static napi_value TestScrollPageEnable004(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_AttributeItem value_item = {};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_PAGING, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING)->value[PARAM_0].i32, true);
    }
    NAPI_END;
}

static napi_value TestScrollPageEnable005(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = true}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_ENABLE_PAGING, &value_item);
    auto ret = nodeAPI->resetAttribute(scroll, NODE_SCROLL_ENABLE_PAGING);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_ENABLE_PAGING)->value[PARAM_0].i32, false);
    NAPI_END;
}
} // namespace ArkUICapiTest
