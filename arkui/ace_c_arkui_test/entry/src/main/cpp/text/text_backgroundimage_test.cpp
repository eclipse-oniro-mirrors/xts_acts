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

static napi_value TestTextBackgroundImage001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem srcItem = {};
    srcItem.string = "resource://media/icon.png";
    auto ret = nodeAPI->setAttribute(text, NODE_BACKGROUND_IMAGE, &srcItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->string, "resource://media/icon.png");
    NAPI_END;
}

static napi_value TestTextBackgroundImage002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_IMAGE_REPEAT_NONE}};
    ArkUI_AttributeItem srcItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    srcItem.string = "resource://media/icon.png";
    auto ret = nodeAPI->setAttribute(text, NODE_BACKGROUND_IMAGE, &srcItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->string, "resource://media/icon.png");
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, ARKUI_IMAGE_REPEAT_NONE);
    NAPI_END;
}

static napi_value TestTextBackgroundImage003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_IMAGE_REPEAT_X}};
    ArkUI_AttributeItem srcItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    srcItem.string = "resource://media/icon.png";
    auto ret = nodeAPI->setAttribute(text, NODE_BACKGROUND_IMAGE, &srcItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->string, "resource://media/icon.png");
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, ARKUI_IMAGE_REPEAT_X);
    NAPI_END;
}

static napi_value TestTextBackgroundImage004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_IMAGE_REPEAT_Y}};
    ArkUI_AttributeItem srcItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    srcItem.string = "resource://media/icon.png";
    auto ret = nodeAPI->setAttribute(text, NODE_BACKGROUND_IMAGE, &srcItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->string, "resource://media/icon.png");
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, ARKUI_IMAGE_REPEAT_Y);
    NAPI_END;
}

static napi_value TestTextBackgroundImage005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_IMAGE_REPEAT_XY}};
    ArkUI_AttributeItem srcItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    srcItem.string = "resource://media/icon.png";
    auto ret = nodeAPI->setAttribute(text, NODE_BACKGROUND_IMAGE, &srcItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->string, "resource://media/icon.png");
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, ARKUI_IMAGE_REPEAT_XY);
    NAPI_END;
}

static napi_value TestTextBackgroundImage006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem srcItem = {};
    srcItem.string = "nullptr";
    auto ret = nodeAPI->setAttribute(text, NODE_BACKGROUND_IMAGE, &srcItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->string, "nullptr");
    NAPI_END;
}

static napi_value TestTextBackgroundImage007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t exception = -1;
    ArkUI_NumberValue value[] = {{.i32 = exception}};
    ArkUI_AttributeItem srcItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    srcItem.string = "resource://media/icon.png";
    auto ret = nodeAPI->setAttribute(text, NODE_BACKGROUND_IMAGE, &srcItem);
    if (nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, exception);
    }
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUICapiTest
