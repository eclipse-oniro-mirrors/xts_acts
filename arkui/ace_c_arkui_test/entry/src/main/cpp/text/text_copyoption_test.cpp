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

static napi_value TestTextCopyOption001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_COPY_OPTION)->value[PARAM_0].i32, ARKUI_COPY_OPTIONS_NONE);
    NAPI_END;
}

static napi_value TestTextCopyOption002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_COPY_OPTIONS_IN_APP}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_COPY_OPTION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_COPY_OPTION)->value[PARAM_0].i32, ARKUI_COPY_OPTIONS_IN_APP);
    NAPI_END;
}

static napi_value TestTextCopyOption003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_COPY_OPTIONS_LOCAL_DEVICE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_COPY_OPTION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_COPY_OPTION)->value[PARAM_0].i32, ARKUI_COPY_OPTIONS_LOCAL_DEVICE);
    NAPI_END;
}

static napi_value TestTextCopyOption004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_COPY_OPTIONS_CROSS_DEVICE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_COPY_OPTION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_COPY_OPTION)->value[PARAM_0].i32, ARKUI_COPY_OPTIONS_CROSS_DEVICE);
    NAPI_END;
}

static napi_value TestTextCopyOption005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t exceptionValue = -1;
    ArkUI_NumberValue value[] = {{.i32 = exceptionValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_TEXT_SHADOW, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_TEXT_COPY_OPTION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_TEXT_COPY_OPTION)->value[PARAM_0].i32, exceptionValue);
    };
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
} // namespace ArkUICapiTest
