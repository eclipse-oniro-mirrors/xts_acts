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
#define STR_TEXT "HarmonyOS Sans"
#define STR_PARAM "HarmonyOS Sans,STR_AREA"

namespace ArkUICapiTest {

static napi_value TestTextAreaFontFamily001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem value_item = {};
    value_item.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_FAMILY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(textArea, NODE_FONT_FAMILY)->string, STR_TEXT);
    NAPI_END;
}

static napi_value TestTextAreaFontFamily002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem value_item = {};
    value_item.string = STR_PARAM;
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_FAMILY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(textArea, NODE_FONT_FAMILY)->string, STR_PARAM);
    NAPI_END;
}

static napi_value TestTextAreaFontFamily003(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem value_item = {};
    value_item.string = "";
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_FAMILY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(textArea, NODE_FONT_FAMILY)->string, "");
    NAPI_END;
}
} // namespace ArkUICapiTest
