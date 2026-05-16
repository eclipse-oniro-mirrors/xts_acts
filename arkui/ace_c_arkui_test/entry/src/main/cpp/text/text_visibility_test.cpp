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

static napi_value TestTextVisibility001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_VISIBILITY)->value[PARAM_1].i32, ARKUI_VISIBILITY_VISIBLE);
    NAPI_END;
}

static napi_value TestTextVisibility002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_VISIBILITY_HIDDEN}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_VISIBILITY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_VISIBILITY)->value[PARAM_0].i32, ARKUI_VISIBILITY_HIDDEN);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextVisibility003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_VISIBILITY_NONE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_VISIBILITY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_VISIBILITY)->value[PARAM_0].i32, ARKUI_VISIBILITY_NONE);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextVisibility004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t exception = -10;
    ArkUI_NumberValue value[] = {{.i32 = exception}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_VISIBILITY, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_VISIBILITY) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_VISIBILITY)->value[PARAM_0].i32, exception);
    };
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUICapiTest
