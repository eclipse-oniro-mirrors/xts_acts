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

static napi_value TestCommonAttrsShadow001(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t shadow = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS;
    ArkUI_NumberValue value[] = {{.i32 = shadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SHADOW)->value[PARAM_0].i32, shadow);
    NAPI_END;
}

static napi_value TestCommonAttrsShadow002(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t shadow = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_SM;
    ArkUI_NumberValue value[] = {{.i32 = shadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SHADOW)->value[PARAM_0].i32, shadow);
    NAPI_END;
}

static napi_value TestCommonAttrsShadow003(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t shadow = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_MD;
    ArkUI_NumberValue value[] = {{.i32 = shadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SHADOW)->value[PARAM_0].i32, shadow);
    NAPI_END;
}

static napi_value TestCommonAttrsShadow004(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t shadow = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG;
    ArkUI_NumberValue value[] = {{.i32 = shadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SHADOW)->value[PARAM_0].i32, shadow);
    NAPI_END;
}

static napi_value TestCommonAttrsShadow005(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t shadow = ARKUI_SHADOW_STYLE_OUTER_FLOATING_SM;
    ArkUI_NumberValue value[] = {{.i32 = shadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SHADOW)->value[PARAM_0].i32, shadow);
    NAPI_END;
}

static napi_value TestCommonAttrsShadow006(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    int32_t shadow = ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD;
    ArkUI_NumberValue value[] = {{.i32 = shadow}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_SHADOW)->value[PARAM_0].i32, shadow);
    NAPI_END;
}

} // namespace ArkUICapiTest
