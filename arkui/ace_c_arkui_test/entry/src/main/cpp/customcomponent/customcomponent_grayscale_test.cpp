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

#define DEFAULT_VALUE (0.0)
#define MAX_VALUE (1.0)
#define MIN_ABNORMAL_VALUE (-1.0)
#define MAX_ABNORMAL_VALUE (2.0)

namespace ArkUICapiTest {

static napi_value TestCustomComponentGrayscale001(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_GRAY_SCALE)->value[PARAM_0].f32, DEFAULT_VALUE);
    NAPI_END;
}

static napi_value TestCustomComponentGrayscale002(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float grayScale = 0.5;
    ArkUI_NumberValue value[] = {{.f32 = grayScale}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_GRAY_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_GRAY_SCALE)->value[PARAM_0].f32, grayScale);
    NAPI_END;
}

static napi_value TestCustomComponentGrayscale003(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float grayScale = 0.8;
    ArkUI_NumberValue value[] = {{.f32 = grayScale}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_GRAY_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_GRAY_SCALE)->value[PARAM_0].f32, grayScale);
    NAPI_END;
}

static napi_value TestCustomComponentGrayscale004(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.f32 = MAX_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_GRAY_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_GRAY_SCALE)->value[PARAM_0].f32, MAX_VALUE);
    NAPI_END;
}

static napi_value TestCustomComponentGrayscale005(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.f32 = MIN_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_GRAY_SCALE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_GRAY_SCALE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_GRAY_SCALE)->value[PARAM_0].f32, MIN_ABNORMAL_VALUE);
    }

    NAPI_END;
}

static napi_value TestCustomComponentGrayscale006(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.f32 = MAX_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_GRAY_SCALE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_GRAY_SCALE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_GRAY_SCALE)->value[PARAM_0].f32, MAX_ABNORMAL_VALUE);
    }

    NAPI_END;
}

} // namespace ArkUICapiTest
