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

static napi_value TestTextScale001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t defaultValue = 1;
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SCALE)->value[PARAM_0].f32, defaultValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SCALE)->value[PARAM_1].f32, defaultValue);
    NAPI_END;
}

static napi_value TestTextScale002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float narrowValue = 0.5;
    ArkUI_NumberValue value[] = {{.f32 = narrowValue}, {.f32 = narrowValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SCALE, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SCALE)->value[PARAM_0].f32, narrowValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SCALE)->value[PARAM_1].f32, narrowValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextScale003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float boundaryValue = 0;
    ArkUI_NumberValue value[] = {{.f32 = boundaryValue}, {.f32 = boundaryValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SCALE, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SCALE)->value[PARAM_0].f32, boundaryValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SCALE)->value[PARAM_1].f32, boundaryValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
