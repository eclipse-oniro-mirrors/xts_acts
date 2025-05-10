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

#define FIRST_MIDDLE_VALUE "./resources/base/media/icon.png"
#define SECOND_MIDDLE_VALUE                                                                                            \
    "https://gitee.com/openharmony/docs/raw/master/zh-cn/application-dev/"                                             \
    "reference/apis-arkui/arkui-ts/figures/edgewidths.png"

namespace ArkUICapiTest {

static napi_value TestTextInputBackgroundImage001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    const char *src = FIRST_MIDDLE_VALUE;
    int32_t imageRepeat = ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_NONE;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = src;
    auto ret = nodeAPI->setAttribute(textInput, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->string, src);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, imageRepeat);
    NAPI_END;
}

static napi_value TestTextInputBackgroundImage002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    const char *src = FIRST_MIDDLE_VALUE;
    int32_t imageRepeat = ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_X;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = src;
    auto ret = nodeAPI->setAttribute(textInput, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->string, src);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, imageRepeat);
    NAPI_END;
}

static napi_value TestTextInputBackgroundImage003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    const char *src = FIRST_MIDDLE_VALUE;
    int32_t imageRepeat = ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_Y;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = src;
    auto ret = nodeAPI->setAttribute(textInput, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->string, src);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, imageRepeat);
    NAPI_END;
}

static napi_value TestTextInputBackgroundImage004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    const char *src = FIRST_MIDDLE_VALUE;
    int32_t imageRepeat = ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_XY;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = src;
    auto ret = nodeAPI->setAttribute(textInput, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->string, src);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, imageRepeat);
    NAPI_END;
}

static napi_value TestTextInputBackgroundImage005(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    const char *src = SECOND_MIDDLE_VALUE;
    int32_t imageRepeat = ArkUI_ImageRepeat::ARKUI_IMAGE_REPEAT_NONE;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = src;
    auto ret = nodeAPI->setAttribute(textInput, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->string, src);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, imageRepeat);
    NAPI_END;
}

static napi_value TestTextInputBackgroundImage006(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    const char *src = FIRST_MIDDLE_VALUE;
    int32_t imageRepeat = PARAM_NEGATIVE_100;
    ArkUI_NumberValue value[] = {{.i32 = imageRepeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = src;
    auto ret = nodeAPI->setAttribute(textInput, NODE_BACKGROUND_IMAGE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE) != nullptr) {
        ASSERT_STRNE(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->string, src);
        ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, imageRepeat);
    }

    NAPI_END;
}

} // namespace ArkUICapiTest
