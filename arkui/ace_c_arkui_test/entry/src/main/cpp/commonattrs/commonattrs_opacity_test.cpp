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

#define DEFAULT_VALUE (1.0)
#define MIN_VALUE (0.0)
#define MIN_ABNORMAL_VALUE (-1.0)
#define MAX_ABNORMAL_VALUE (2.0)

namespace ArkUICapiTest {

static napi_value TestCommonAttrsOpacity001(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    ArkUI_NumberValue value[] = {{.f32 = MIN_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_OPACITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_OPACITY)->value[PARAM_0].f32, MIN_VALUE);
    NAPI_END;
}

static napi_value TestCommonAttrsOpacity002(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    float opacity = 0.5;
    ArkUI_NumberValue value[] = {{.f32 = opacity}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_OPACITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_OPACITY)->value[PARAM_0].f32, opacity);
    NAPI_END;
}

static napi_value TestCommonAttrsOpacity003(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    float opacity = 0.8;
    ArkUI_NumberValue value[] = {{.f32 = opacity}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_OPACITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_OPACITY)->value[PARAM_0].f32, opacity);
    NAPI_END;
}

static napi_value TestCommonAttrsOpacity004(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_OPACITY)->value[PARAM_0].f32, DEFAULT_VALUE);
    NAPI_END;
}

static napi_value TestCommonAttrsOpacity005(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    ArkUI_NumberValue value[] = {{.f32 = MIN_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_OPACITY, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(checkbox, NODE_OPACITY) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(checkbox, NODE_OPACITY)->value[PARAM_0].f32, MIN_ABNORMAL_VALUE);
    }

    NAPI_END;
}

static napi_value TestCommonAttrsOpacity006(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    ArkUI_NumberValue value[] = {{.f32 = MAX_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_OPACITY, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(checkbox, NODE_OPACITY) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(checkbox, NODE_OPACITY)->value[PARAM_0].f32, MAX_ABNORMAL_VALUE);
    }

    NAPI_END;
}

} // namespace ArkUICapiTest
