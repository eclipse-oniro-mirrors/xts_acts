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

static napi_value TestTextFontSize001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "TEXT";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_SIZE)->value[PARAM_0].f32, size);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontSize002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "TEXT";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 0;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_SIZE)->value[PARAM_0].f32, size);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontSize003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "TEXT";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = 1000;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_SIZE)->value[PARAM_0].f32, size);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextFontSize004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "TEXT";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = -10;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_FONT_SIZE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_FONT_SIZE)->value[PARAM_0].f32, size);
    };

    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUICapiTest
