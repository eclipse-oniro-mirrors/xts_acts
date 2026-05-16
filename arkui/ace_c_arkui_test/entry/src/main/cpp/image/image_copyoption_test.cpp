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

static napi_value TestImageCopyOption001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_COPY_OPTIONS_IN_APP } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_COPY_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(image, NODE_IMAGE_COPY_OPTION)->value[PARAM_0].i32, ARKUI_COPY_OPTIONS_IN_APP);
    NAPI_END;
}

static napi_value TestImageCopyOption002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_COPY_OPTIONS_LOCAL_DEVICE } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_COPY_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(image, NODE_IMAGE_COPY_OPTION)->value[PARAM_0].i32, ARKUI_COPY_OPTIONS_LOCAL_DEVICE);
    NAPI_END;
}

static napi_value TestImageCopyOption003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_COPY_OPTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageCopyOption004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_10 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_COPY_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(image, NODE_IMAGE_COPY_OPTION)->value[PARAM_0].i32, ARKUI_COPY_OPTIONS_NONE);
    NAPI_END;
}

static napi_value TestImageCopyOption005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);

    ArkUI_NumberValue value[] = { { .i32 = ARKUI_COPY_OPTIONS_IN_APP } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_COPY_OPTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(image, NODE_IMAGE_COPY_OPTION);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_EQ(
        nodeAPI->getAttribute(image, NODE_IMAGE_COPY_OPTION)->value[PARAM_0].i32, ARKUI_COPY_OPTIONS_NONE);
    NAPI_END;
}
} // namespace ArkUICapiTest
