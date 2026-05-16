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

static napi_value TestCustomComponentConstraintSize001(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float maxWidth = SIZE_100;
    float maxHeight = SIZE_100;
    float minWidth = PARAM_0;
    float minHeight = PARAM_0;
    ArkUI_NumberValue value[PARAM_4] = {{.f32 = minWidth}, {.f32 = maxWidth}, {.f32 = minHeight}, {.f32 = maxHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_CONSTRAINT_SIZE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_0].f32, minWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_1].f32, maxWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_2].f32, minHeight);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_3].f32, maxHeight);
    NAPI_END;
}

static napi_value TestCustomComponentConstraintSize002(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float maxWidth = PARAM_0;
    float maxHeight = PARAM_0;
    float minWidth = SIZE_100;
    float minHeight = SIZE_100;
    ArkUI_NumberValue value[PARAM_4] = {{.f32 = minWidth}, {.f32 = maxWidth}, {.f32 = minHeight}, {.f32 = maxHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_CONSTRAINT_SIZE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_0].f32, minWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_1].f32, maxWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_2].f32, minHeight);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_3].f32, maxHeight);
    NAPI_END;
}

static napi_value TestCustomComponentConstraintSize003(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float maxWidth = PARAM_NEGATIVE_100;
    float maxHeight = PARAM_NEGATIVE_100;
    float minWidth = PARAM_NEGATIVE_10;
    float minHeight = PARAM_NEGATIVE_10;
    ArkUI_NumberValue value[PARAM_4] = {{.f32 = minWidth}, {.f32 = maxWidth}, {.f32 = minHeight}, {.f32 = maxHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_CONSTRAINT_SIZE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_0].f32, minWidth);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_1].f32, maxWidth);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_2].f32, minHeight);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_3].f32, maxHeight);
    NAPI_END;
}

static napi_value TestCustomComponentConstraintSize004(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float maxWidth = PARAM_NEGATIVE_10;
    float maxHeight = PARAM_NEGATIVE_10;
    float minWidth = PARAM_NEGATIVE_100;
    float minHeight = PARAM_NEGATIVE_100;
    ArkUI_NumberValue value[PARAM_4] = {{.f32 = minWidth}, {.f32 = maxWidth}, {.f32 = minHeight}, {.f32 = maxHeight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_CONSTRAINT_SIZE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_0].f32, minWidth);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_1].f32, maxWidth);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_2].f32, minHeight);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_CONSTRAINT_SIZE)->value[PARAM_3].f32, maxHeight);
    NAPI_END;
}
} // namespace ArkUICapiTest
