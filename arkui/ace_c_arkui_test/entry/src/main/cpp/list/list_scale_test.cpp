/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance scale the License.
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

static napi_value TestListScale001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float scaleX = PARAM_0_POINT_5;
    float scaleY = PARAM_0_POINT_5;
    ArkUI_NumberValue value[PARAM_2] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static napi_value TestListScale002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float scaleX = PARAM_0_POINT_5;
    float scaleY = PARAM_1;
    ArkUI_NumberValue value[PARAM_2] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static napi_value TestListScale003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float scaleX = PARAM_2;
    float scaleY = PARAM_2;
    ArkUI_NumberValue value[PARAM_2] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static napi_value TestListScale004(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float scaleX = PARAM_2;
    float scaleY = PARAM_1;
    ArkUI_NumberValue value[PARAM_2] = {{.f32 = scaleX}, {.f32 = scaleY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

static napi_value TestListScale005(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float scaleX = PARAM_1;
    float scaleY = PARAM_1;
    auto listDefault = nodeAPI->createNode(ARKUI_NODE_LIST);
    ASSERT_EQ(nodeAPI->getAttribute(listDefault, NODE_SCALE)->value[PARAM_0].f32, scaleX);
    ASSERT_EQ(nodeAPI->getAttribute(listDefault, NODE_SCALE)->value[PARAM_1].f32, scaleY);
    NAPI_END;
}

} // namespace ArkUICapiTest
