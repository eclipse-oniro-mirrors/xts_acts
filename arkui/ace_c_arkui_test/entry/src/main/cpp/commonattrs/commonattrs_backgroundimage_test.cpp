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

static napi_value TestCommonAttrsBackgroundImage001(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "resource://media/icon.png";
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue), backgroundImage};
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->string, backgroundImage);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImage002(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "resource://media/icon.png";
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue red_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem red_color_item = {red_color_value, sizeof(red_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &red_color_item);
    ArkUI_AttributeItem imageStr_item = {};
    imageStr_item.string = backgroundImage;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &imageStr_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->string, backgroundImage);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImage003(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "";
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem imageStr_item = {};
    imageStr_item.string = backgroundImage;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &imageStr_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->string, backgroundImage);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImage004(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "abcdefg";
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem imageStr_item = {};
    imageStr_item.string = backgroundImage;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &imageStr_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->string, backgroundImage);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImage005(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "resource://media/icon.png";
    uint32_t imageRepeat = PARAM_NEGATIVE_100;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue repeat_value[] = {{.u32 = imageRepeat}};
    ArkUI_AttributeItem repeat_value_item = {repeat_value, sizeof(repeat_value) / sizeof(ArkUI_NumberValue)};
    repeat_value_item.string = backgroundImage;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &repeat_value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImage006(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "resource://media/icon.png";
    uint32_t imageRepeat = ARKUI_IMAGE_REPEAT_NONE;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue repeat_value[] = {{.u32 = imageRepeat}};
    ArkUI_AttributeItem repeat_value_item = {repeat_value, sizeof(repeat_value) / sizeof(ArkUI_NumberValue)};
    repeat_value_item.string = backgroundImage;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &repeat_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->string, backgroundImage);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->value[PARAM_0].u32, imageRepeat);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImage007(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "resource://media/icon.png";
    uint32_t imageRepeat = ARKUI_IMAGE_REPEAT_X;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue repeat_value[] = {{.u32 = imageRepeat}};
    ArkUI_AttributeItem repeat_value_item = {repeat_value, sizeof(repeat_value) / sizeof(ArkUI_NumberValue)};
    repeat_value_item.string = backgroundImage;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &repeat_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->string, backgroundImage);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->value[PARAM_0].u32, imageRepeat);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImage008(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "resource://media/icon.png";
    uint32_t imageRepeat = ARKUI_IMAGE_REPEAT_Y;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue repeat_value[] = {{.u32 = imageRepeat}};
    ArkUI_AttributeItem repeat_value_item = {repeat_value, sizeof(repeat_value) / sizeof(ArkUI_NumberValue)};
    repeat_value_item.string = backgroundImage;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &repeat_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->string, backgroundImage);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->value[PARAM_0].u32, imageRepeat);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImage009(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "resource://media/icon.png";
    uint32_t imageRepeat = ARKUI_IMAGE_REPEAT_XY;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue repeat_value[] = {{.u32 = imageRepeat}};
    ArkUI_AttributeItem repeat_value_item = {repeat_value, sizeof(repeat_value) / sizeof(ArkUI_NumberValue)};
    repeat_value_item.string = backgroundImage;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &repeat_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->string, backgroundImage);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->value[PARAM_0].u32, imageRepeat);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImage010(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "resource://media/icon.png";
    uint32_t imageRepeat = ARKUI_IMAGE_REPEAT_XY;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue red_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem red_color_item = {red_color_value, sizeof(red_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &red_color_item);
    ArkUI_NumberValue repeat_value[] = {{.u32 = imageRepeat}};
    ArkUI_AttributeItem repeat_value_item = {repeat_value, sizeof(repeat_value) / sizeof(ArkUI_NumberValue)};
    repeat_value_item.string = backgroundImage;
    auto ret = nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &repeat_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->string, backgroundImage);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->value[PARAM_0].u32, imageRepeat);
    NAPI_END;
}

static napi_value TestCommonAttrsBackgroundImage011(napi_env env, napi_callback_info info)
{
    const char *backgroundImage = "resource://media/icon.png";
    uint32_t imageRepeat = ARKUI_IMAGE_REPEAT_XY;
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue red_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem red_color_item = {red_color_value, sizeof(red_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &red_color_item);
    ArkUI_NumberValue repeat_value[] = {{.u32 = imageRepeat}};
    ArkUI_AttributeItem repeat_value_item = {repeat_value, sizeof(repeat_value) / sizeof(ArkUI_NumberValue)};
    repeat_value_item.string = backgroundImage;
    nodeAPI->setAttribute(column, NODE_BACKGROUND_IMAGE, &repeat_value_item);
    auto ret = nodeAPI->resetAttribute(column, NODE_BACKGROUND_IMAGE);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKGROUND_IMAGE)->value[PARAM_0].u32, ARKUI_IMAGE_REPEAT_NONE);
    NAPI_END;
}
} // namespace ArkUICapiTest