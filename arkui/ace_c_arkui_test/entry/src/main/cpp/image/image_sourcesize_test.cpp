/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

static napi_value TestImageSourceSize001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = PARAM_20}, {.i32 = PARAM_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SOURCE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_SOURCE_SIZE)->value[PARAM_0].i32, PARAM_20);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_SOURCE_SIZE)->value[PARAM_1].i32, PARAM_10);
    NAPI_END;
}

static napi_value TestImageSourceSize002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = PARAM_NEGATIVE_30}, {.i32 = PARAM_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SOURCE_SIZE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_SOURCE_SIZE)->value[PARAM_0].i32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_SOURCE_SIZE)->value[PARAM_1].i32, PARAM_0);
    NAPI_END;
}

static napi_value TestImageSourceSize003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = PARAM_20}, {.i32 = PARAM_NEGATIVE_30}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SOURCE_SIZE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_SOURCE_SIZE)->value[PARAM_0].i32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_SOURCE_SIZE)->value[PARAM_1].i32, PARAM_0);
    NAPI_END;
}

static napi_value TestImageSourceSize004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SOURCE_SIZE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageSourceSize005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = PARAM_20}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SOURCE_SIZE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageSourceSize006(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {{.i32 = PARAM_20}, {.i32 = PARAM_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SOURCE_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(image, NODE_IMAGE_SOURCE_SIZE);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_SOURCE_SIZE)->value[PARAM_0].i32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_SOURCE_SIZE)->value[PARAM_1].i32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUICapiTest
