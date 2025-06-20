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

static napi_value TestStackBackgroundImageSize001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float imageWidth = 10;
    float imageHeight = 5;

    ArkUI_NumberValue value[] = {{.f32 = imageWidth}, {.f32 = imageHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_0].f32, imageWidth);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_1].f32, imageHeight);
    NAPI_END;
}

static napi_value TestStackBackgroundImageSize002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float imageWidth = 20000;
    float imageHeight = 10000;

    ArkUI_NumberValue value[] = {{.f32 = imageWidth}, {.f32 = imageHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_0].f32, imageWidth);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_1].f32, imageHeight);
    NAPI_END;
}

static napi_value TestStackBackgroundImageSize003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float imageWidth = -10;
    float imageHeight = -5;
    float defaultValue = 0;

    ArkUI_NumberValue value[] = {{.f32 = imageWidth}, {.f32 = imageHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BACKGROUND_IMAGE_SIZE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE_SIZE) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_0].f32, defaultValue);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BACKGROUND_IMAGE_SIZE)->value[PARAM_1].f32, defaultValue);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
