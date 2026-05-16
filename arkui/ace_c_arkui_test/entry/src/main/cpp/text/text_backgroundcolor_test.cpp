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

static napi_value TestTextBackgroundColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_COLOR)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextBackgroundColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_BLACK}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_COLOR)->value[PARAM_0].u32, COLOR_BLACK);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextBackgroundColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_WHITE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_COLOR)->value[PARAM_0].u32, COLOR_WHITE);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
