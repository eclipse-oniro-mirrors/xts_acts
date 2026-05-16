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

static napi_value TestImageMatrix001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value16[] = {{.f32 = 1.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f} };
    ArkUI_AttributeItem value_item = {value16, sizeof(value16) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_IMAGE_MATRIX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_0].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_1].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_2].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_3].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_4].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_5].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_6].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_7].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_8].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_9].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_10].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_11].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_12].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_13].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_14].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_15].f32, 0.0f);
    NAPI_END;
}

static napi_value TestImageMatrix002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value17[] = {{.f32 = 1.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f} };
    ArkUI_AttributeItem value_item = {value17, sizeof(value17) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_IMAGE_MATRIX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_0].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_1].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_2].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_3].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_4].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_5].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_6].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_7].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_8].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_9].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_10].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_11].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_12].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_13].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_14].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_15].f32, 0.0f);
    NAPI_END;
}

static napi_value TestImageMatrix003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value15[] = {{.f32 = 1.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f} };
    ArkUI_AttributeItem value_item = {value15, sizeof(value15) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_IMAGE_MATRIX, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageMatrix004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_IMAGE_MATRIX, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageMatrix005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value16[] = {{.f32 = 1.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f},
        {.f32 = 0.0f}, {.f32 = 1.0f}, {.f32 = 0.0f}, {.f32 = 0.0f}, {.f32 = 0.0f} };
    ArkUI_AttributeItem value_item = {value16, sizeof(value16) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_IMAGE_MATRIX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ret = nodeAPI->resetAttribute(image, NODE_IMAGE_IMAGE_MATRIX);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_0].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_1].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_2].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_3].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_4].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_5].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_6].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_7].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_8].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_9].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_10].f32, 1.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_11].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_12].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_13].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_14].f32, 0.0f);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_IMAGE_MATRIX)->value[PARAM_15].f32, 1.0f);
    NAPI_END;
}
} // namespace ArkUICapiTest
