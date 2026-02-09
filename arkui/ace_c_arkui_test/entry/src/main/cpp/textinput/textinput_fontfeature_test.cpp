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

#include <cstring>
#include <string>

#include "common/common.h"

#define DEFAULT_TEXT "textinput"
#define SS01_OFF "\"ss01\" off"
#define SS01_ON "\"ss01\" on"
#define SS04_OFF "\"ss04\" off"
namespace ArkUICapiTest {

static napi_value TestTextInputFontFeature001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem value_item = {};
    value_item.string = DEFAULT_TEXT;
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &value_item);
    value_item.string = SS04_OFF;
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_FEATURE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputFontFeature",
        "TestTextInputFontFeature001 ret: %{public}d", ret);
    auto str = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TEXT)->string;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputFontFeature",
        "TestTextInputFontFeature001 tmp: %{public}s", str);
    ASSERT_EQ(std::strcmp(str, DEFAULT_TEXT), SUCCESS);
    NAPI_END;
}
static napi_value TestTextInputFontFeature002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem value_item = {};
    value_item.string = DEFAULT_TEXT;
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &value_item);
    value_item.string = SS01_ON;
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_FEATURE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputFontFeature",
        "TestTextInputFontFeature002 ret: %{public}d", ret);
    auto str = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_TEXT)->string;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputFontFeature",
        "TestTextInputFontFeature002 tmp: %{public}s", str);
    ASSERT_EQ(std::strcmp(str, DEFAULT_TEXT), SUCCESS);
    NAPI_END;
}
static napi_value TestTextInputFontFeature003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem value_item = {};
    value_item.string = nullptr;
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_FEATURE, &value_item);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
} // namespace ArkUICapiTest