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

static napi_value TestToggleBackgroundColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    uint32_t backgroundColor = 0xFFFF0000;
    ArkUI_NumberValue value[] = {{.u32 = backgroundColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_BACKGROUND_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_BACKGROUND_COLOR)->value[PARAM_0].u32, backgroundColor);
    NAPI_END;
}

static napi_value TestToggleBackgroundColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    uint32_t backgroundColor = 0x00000000;
    ArkUI_NumberValue value[] = {{.u32 = backgroundColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_BACKGROUND_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_BACKGROUND_COLOR)->value[PARAM_0].u32, backgroundColor);
    NAPI_END;
}

static napi_value TestToggleBackgroundColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    uint32_t backgroundColor = 0xFFFFFFFF;
    ArkUI_NumberValue value[] = {{.u32 = backgroundColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_BACKGROUND_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_BACKGROUND_COLOR)->value[PARAM_0].u32, backgroundColor);
    NAPI_END;
}

} // namespace ArkUICapiTest
