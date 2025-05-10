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

static napi_value TestStackBackgroundImage001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    const char *imageUrl = "./resources/base/media/icon.png";

    ArkUI_NumberValue background_image_value[] = {{.i32 = ARKUI_IMAGE_REPEAT_NONE}};
    ArkUI_AttributeItem background_image_value_item = {
        background_image_value, sizeof(background_image_value) / sizeof(ArkUI_NumberValue), imageUrl};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_IMAGE, &background_image_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->string, imageUrl);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, ARKUI_IMAGE_REPEAT_NONE);
    NAPI_END;
}

static napi_value TestStackBackgroundImage002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    const char *imageUrl = "./resources/base/media/icon.png";

    ArkUI_NumberValue background_image_value[] = {{.i32 = ARKUI_IMAGE_REPEAT_X}};
    ArkUI_AttributeItem background_image_value_item = {
        background_image_value, sizeof(background_image_value) / sizeof(ArkUI_NumberValue), imageUrl};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_IMAGE, &background_image_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->string, imageUrl);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, ARKUI_IMAGE_REPEAT_X);
    NAPI_END;
}

static napi_value TestStackBackgroundImage003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    const char *imageUrl = "./resources/base/media/icon.png";

    ArkUI_NumberValue background_image_value[] = {{.i32 = ARKUI_IMAGE_REPEAT_Y}};
    ArkUI_AttributeItem background_image_value_item = {
        background_image_value, sizeof(background_image_value) / sizeof(ArkUI_NumberValue), imageUrl};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_IMAGE, &background_image_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->string, imageUrl);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, ARKUI_IMAGE_REPEAT_Y);
    NAPI_END;
}

static napi_value TestStackBackgroundImage004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    const char *imageUrl = "./resources/base/media/icon.png";

    ArkUI_NumberValue background_image_value[] = {{.i32 = ARKUI_IMAGE_REPEAT_XY}};
    ArkUI_AttributeItem background_image_value_item = {
        background_image_value, sizeof(background_image_value) / sizeof(ArkUI_NumberValue), imageUrl};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_IMAGE, &background_image_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->string, imageUrl);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, ARKUI_IMAGE_REPEAT_XY);
    NAPI_END;
}

static napi_value TestStackBackgroundImage005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    int32_t repeatValue = -1;
    const char *imageUrl = "./resources/base/media/icon.png";

    ArkUI_NumberValue background_image_value[] = {{.i32 = repeatValue}};
    ArkUI_AttributeItem background_image_value_item = {
        background_image_value, sizeof(background_image_value) / sizeof(ArkUI_NumberValue), imageUrl};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_IMAGE, &background_image_value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE) != nullptr) {
        ASSERT_STRNE(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->string, imageUrl);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, repeatValue);
    }
    NAPI_END;
}

static napi_value TestStackBackgroundImage006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    int32_t repeatValue = -1;
    const char *imageUrl = "abcdefg";

    ArkUI_NumberValue background_image_value[] = {{.i32 = repeatValue}};
    ArkUI_AttributeItem background_image_value_item = {
        background_image_value, sizeof(background_image_value) / sizeof(ArkUI_NumberValue), imageUrl};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_IMAGE, &background_image_value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE) != nullptr) {
        ASSERT_STRNE(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->string, imageUrl);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, repeatValue);
    }
    NAPI_END;
}

static napi_value TestStackBackgroundImage007(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);

    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE)->value[PARAM_0].i32, ARKUI_IMAGE_REPEAT_NONE);
    NAPI_END;
}

} // namespace ArkUICapiTest
