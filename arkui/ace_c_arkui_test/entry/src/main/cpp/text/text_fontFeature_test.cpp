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

static napi_value TestTextFontFeature001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = "\"ss01\" on";
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_FEATURE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_FONT_FEATURE)->string, "\"ss01\" 1");
    NAPI_END;
}

static napi_value TestTextFontFeature002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = "\"sups\" on";
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_FEATURE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_FONT_FEATURE)->string, "\"sups\" 1");
    NAPI_END;
}

static napi_value TestTextFontFeature003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem valueItem = {};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_FEATURE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestTextFontFeature004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = "\"ss01\" on";
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_FEATURE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(text, NODE_FONT_FEATURE);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_FONT_FEATURE)->string, "");
    NAPI_END;
}
} // namespace ArkUICapiTest
