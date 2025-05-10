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

#define MIN_VALUE (0.0)
#define MIN_ABNORMAL_VALUE (-1.0)
#define MAX_ABNORMAL_VALUE (2.0)

namespace ArkUICapiTest {

static napi_value TestCustomComponentInvert001(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.f32 = MIN_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_INVERT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_INVERT)->value[PARAM_0].f32, MIN_VALUE);
    NAPI_END;
}

static napi_value TestCustomComponentInvert002(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float invert = 0.5;
    ArkUI_NumberValue value[] = {{.f32 = invert}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_INVERT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_INVERT)->value[PARAM_0].f32, invert);
    NAPI_END;
}

static napi_value TestCustomComponentInvert003(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float invert = 0.8;
    ArkUI_NumberValue value[] = {{.f32 = invert}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_INVERT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_INVERT)->value[PARAM_0].f32, invert);
    NAPI_END;
}

static napi_value TestCustomComponentInvert004(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float invert = 1.0;
    ArkUI_NumberValue value[] = {{.f32 = invert}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_INVERT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_INVERT)->value[PARAM_0].f32, invert);
    NAPI_END;
}

static napi_value TestCustomComponentInvert005(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.f32 = MIN_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_INVERT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_INVERT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_INVERT)->value[PARAM_0].f32, MIN_ABNORMAL_VALUE);
    }

    NAPI_END;
}

static napi_value TestCustomComponentInvert006(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.f32 = MAX_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_INVERT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_INVERT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_INVERT)->value[PARAM_0].f32, MAX_ABNORMAL_VALUE);
    }

    NAPI_END;
}

} // namespace ArkUICapiTest
