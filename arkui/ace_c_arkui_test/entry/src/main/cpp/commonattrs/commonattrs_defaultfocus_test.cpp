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

static napi_value TestCommonAttrsDefaultFocus001(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t defaultfocus = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = defaultfocus}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_DEFAULT_FOCUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_DEFAULT_FOCUS)->value[PARAM_0].i32, defaultfocus);
    NAPI_END;
}

static napi_value TestCommonAttrsDefaultFocus002(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t defaultfocus = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = defaultfocus}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_DEFAULT_FOCUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_DEFAULT_FOCUS)->value[PARAM_0].i32, defaultfocus);
    NAPI_END;
}

static napi_value TestCommonAttrsDefaultFocus003(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t defaultfocus = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = defaultfocus}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_DEFAULT_FOCUS, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsDefaultFocus004(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t defaultfocus = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = defaultfocus}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_DEFAULT_FOCUS, &valueItem);
    auto ret = nodeAPI->resetAttribute(button, NODE_DEFAULT_FOCUS);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_DEFAULT_FOCUS)->value[PARAM_0].i32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUICapiTest