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

static napi_value TestTextAreaType001(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    int32_t type = ARKUI_TEXTAREA_TYPE_NORMAL;
    ArkUI_NumberValue value[] = {{.i32 = type}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_TYPE)->value[PARAM_0].i32, type);
    NAPI_END;
}

static napi_value TestTextAreaType002(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    int32_t type = ARKUI_TEXTAREA_TYPE_NUMBER;
    ArkUI_NumberValue value[] = {{.i32 = type}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_TYPE)->value[PARAM_0].i32, type);
    NAPI_END;
}

static napi_value TestTextAreaType003(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    int32_t type = ARKUI_TEXTAREA_TYPE_PHONE_NUMBER;
    ArkUI_NumberValue value[] = {{.i32 = type}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_TYPE)->value[PARAM_0].i32, type);
    NAPI_END;
}

static napi_value TestTextAreaType004(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    int32_t type = ARKUI_TEXTAREA_TYPE_EMAIL;
    ArkUI_NumberValue value[] = {{.i32 = type}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_TYPE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_TYPE)->value[PARAM_0].i32, type);
    NAPI_END;
}

static napi_value TestTextAreaType005(napi_env env, napi_callback_info info)
{
    NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);
    int32_t type = -100;
    ArkUI_NumberValue value[] = {{.i32 = type}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_TYPE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_TYPE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_TYPE)->value[PARAM_0].i32, type);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
