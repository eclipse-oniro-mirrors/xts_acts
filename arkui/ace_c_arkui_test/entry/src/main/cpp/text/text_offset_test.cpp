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

static napi_value TestTextOffset001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float xOffsetValue = 25;
    float yOffsetValue = 50;
    ArkUI_NumberValue value[] = {{.f32 = xOffsetValue}, {.f32 = yOffsetValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_OFFSET, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OFFSET)->value[PARAM_0].f32, xOffsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OFFSET)->value[PARAM_1].f32, yOffsetValue);
    NAPI_END;
}

static napi_value TestTextOffset002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float xOffsetValue = 1000;
    float yOffsetValue = 1000;
    ArkUI_NumberValue value[] = {{.f32 = xOffsetValue}, {.f32 = yOffsetValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_OFFSET, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OFFSET)->value[PARAM_0].f32, xOffsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OFFSET)->value[PARAM_1].f32, yOffsetValue);
    NAPI_END;
}

static napi_value TestTextOffset003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float xOffsetValue = -25;
    float yOffsetValue = -50;
    ArkUI_NumberValue value[] = {{.f32 = xOffsetValue}, {.f32 = yOffsetValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_OFFSET, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OFFSET)->value[PARAM_0].f32, xOffsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OFFSET)->value[PARAM_1].f32, yOffsetValue);
    NAPI_END;
}

} // namespace ArkUICapiTest
