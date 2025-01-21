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
#include <cfloat>

namespace ArkUICapiTest {

static napi_value TestListSaturate001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float saturate = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

static napi_value TestListSaturate002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float saturate = PARAM_0_POINT_5;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

static napi_value TestListSaturate003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float saturate = SIZE_50;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

static napi_value TestListSaturate004(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float saturate = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

static napi_value TestListSaturate005(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float saturate = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(list, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

static napi_value TestListSaturate006(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float saturate = SIZE_50 + PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(list, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

static napi_value TestListSaturate007(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float saturate = PARAM_1;
    auto listDefault = nodeAPI->createNode(ARKUI_NODE_LIST);
    ASSERT_EQ(nodeAPI->getAttribute(listDefault, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}
} // namespace ArkUICapiTest
