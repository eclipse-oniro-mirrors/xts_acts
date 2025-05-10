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

static napi_value TestTextEllipsisMode001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ELLIPSIS_MODE_END } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ELLIPSIS_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ELLIPSIS_MODE)->value[PARAM_0].i32, ARKUI_ELLIPSIS_MODE_END);

    NAPI_END;
}

static napi_value TestTextEllipsisMode002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ELLIPSIS_MODE_START } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ELLIPSIS_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ELLIPSIS_MODE)->value[PARAM_0].i32, ARKUI_ELLIPSIS_MODE_START);

    NAPI_END;
}

static napi_value TestTextEllipsisMode003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ELLIPSIS_MODE_CENTER } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ELLIPSIS_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ELLIPSIS_MODE)->value[PARAM_0].i32, ARKUI_ELLIPSIS_MODE_CENTER);

    NAPI_END;
}

static napi_value TestTextEllipsisMode004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ELLIPSIS_MODE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);

    NAPI_END;
}

static napi_value TestTextEllipsisMode005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ELLIPSIS_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ELLIPSIS_MODE)->value[PARAM_0].i32, ARKUI_ELLIPSIS_MODE_END);

    NAPI_END;
}

static napi_value TestTextEllipsisMode006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_4 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ELLIPSIS_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ELLIPSIS_MODE)->value[PARAM_0].i32, ARKUI_ELLIPSIS_MODE_END);

    NAPI_END;
}

static napi_value TestTextEllipsisMode007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_4 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_ELLIPSIS_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(text, NODE_TEXT_ELLIPSIS_MODE);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_ELLIPSIS_MODE)->value[PARAM_0].i32, ARKUI_ELLIPSIS_MODE_END);

    NAPI_END;
}

} // namespace ArkUICapiTest