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

#define COLOR_RED 0xFFFF0000

namespace ArkUICapiTest {

static napi_value TestTextAreaPlaceHolderColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_COLOR)->value[PARAM_0].u32, COLOR_RED);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_BLACK}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_COLOR)->value[PARAM_0].u32, COLOR_BLACK);
    NAPI_END;
}

static napi_value TestTextAreaPlaceHolderColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_WHITE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_PLACEHOLDER_COLOR)->value[PARAM_0].u32, COLOR_WHITE);
    NAPI_END;
}

} // namespace ArkUICapiTest
