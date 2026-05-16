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

static napi_value TestTextAreaEnterKeyType001(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ENTER_KEY_TYPE_GO } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value[PARAM_0].i32, ARKUI_ENTER_KEY_TYPE_GO);
    NAPI_END;
}
static napi_value TestTextAreaEnterKeyType002(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ENTER_KEY_TYPE_SEARCH } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value[PARAM_0].i32,
        ARKUI_ENTER_KEY_TYPE_SEARCH);
    NAPI_END;
}
static napi_value TestTextAreaEnterKeyType003(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ENTER_KEY_TYPE_SEND } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value[PARAM_0].i32, ARKUI_ENTER_KEY_TYPE_SEND);
    NAPI_END;
}
static napi_value TestTextAreaEnterKeyType004(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ENTER_KEY_TYPE_NEXT } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value[PARAM_0].i32, ARKUI_ENTER_KEY_TYPE_NEXT);
    NAPI_END;
}
static napi_value TestTextAreaEnterKeyType005(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ENTER_KEY_TYPE_DONE } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value[PARAM_0].i32, ARKUI_ENTER_KEY_TYPE_DONE);
    NAPI_END;
}
static napi_value TestTextAreaEnterKeyType006(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ENTER_KEY_TYPE_PREVIOUS } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value[PARAM_0].i32,
        ARKUI_ENTER_KEY_TYPE_PREVIOUS);
    NAPI_END;
}
static napi_value TestTextAreaEnterKeyType007(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ENTER_KEY_TYPE_NEW_LINE } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value[PARAM_0].i32,
        ARKUI_ENTER_KEY_TYPE_NEW_LINE);
    NAPI_END;
}
static napi_value TestTextAreaEnterKeyType008(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue value[] = { { .i32 = -1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE, &value_item);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value TestTextAreaEnterKeyType009(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue value[] = { { .i32 = 9 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE, &value_item);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value TestTextAreaEnterKeyType010(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_ENTER_KEY_TYPE_DONE } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    nodeAPI->resetAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE);
    auto tmp = nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value[PARAM_0].i32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextAreaEnterKeyType ",
        "TestTextAreaEnterKeyType010 PARAM_0 = %{public}d", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value[PARAM_0].i32,
        ARKUI_ENTER_KEY_TYPE_DONE);
    NAPI_END;
}
} // namespace ArkUICapiTest